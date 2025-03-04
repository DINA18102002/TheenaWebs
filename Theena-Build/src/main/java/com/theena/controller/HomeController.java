package com.theena.controller;

import java.util.List;
import java.util.Optional;

import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
import com.theena.model.Employee;
import com.theena.model.Order;
import com.theena.repository.EmployeeRepository;
import com.theena.repository.OrderRepository;
import com.theena.service.EmailService;

@Controller
public class HomeController {
	
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
    @Autowired
    private OrderRepository orderRepository;

    @Autowired
    private EmployeeRepository employeeRepository;

    @Autowired
    private EmailService emailService;
    
    
    @Value("${razorpay.key.id}")
    private String razorpayKeyId;
    
    @Value("${razorpay.key.secret}")
    private String razorpayKeySecret;

    // Home Page
    @GetMapping("/")
    public String homePage() {
        return "index";
    }

    // Admin Login Page
    @GetMapping("/admin")
    public String adminLoginPage() {
        return "admin-login";
    }
    	
    // Admin Login Post
    @PostMapping("/admin")
    public String adminLogin(@RequestParam String username, @RequestParam String password, Model model) {
        // Hardcoded for simplicity; use Spring Security in production
        if ("admin".equals(username) && "admin123".equals(password)) {
            return "redirect:/admin/dashboard";
        } else {
            model.addAttribute("error", "Invalid credentials");
            return "admin-login";
        }
    }

 // Admin Dashboard
    @GetMapping("/admin/dashboard")
    public String adminDashboard(Model model) {
        model.addAttribute("employees", employeeRepository.findByVerifiedFalse());
        model.addAttribute("newOrders", orderRepository.findByStatus("New"));
        return "admin-dashboard";
    }

    // Admin Tasks Page
    @GetMapping("/admin/tasks")
    public String adminTasks(@RequestParam(required = false) String status, Model model) {
        List<Order> orders = (status == null || status.isEmpty()) 
            ? orderRepository.findAll() 
            : orderRepository.findByStatus(status);
        model.addAttribute("orders", orders);
        model.addAttribute("employees", employeeRepository.findByVerifiedTrue());
        return "admin-tasks";
    }

    // Assign Task to Employee
    @PostMapping("/admin/assign-task")
    public String assignTask(@RequestParam Long orderId, @RequestParam Long employeeId, Model model) {
        Optional<Order> orderOpt = orderRepository.findById(orderId);
        if (orderOpt.isPresent()) {
            Order order = orderOpt.get();
            order.setAssignedEmployeeId(employeeId);
            order.setStatus("Assigned");
            orderRepository.save(order);

            Optional<Employee> employeeOpt = employeeRepository.findById(employeeId);
            if (employeeOpt.isPresent()) {
                try {
                    emailService.sendTaskAssignment(employeeOpt.get().getEmail(), employeeOpt.get().getName(), order.getId(), order.getPackageType());
                } catch (Exception e) {
                    model.addAttribute("error", "Task assigned, but failed to send email notification.");
                }
            }
        }
        return "redirect:/admin/tasks";
    }

    // Admin Verify Employee
    @PostMapping("/admin/verify-employee")
    public String verifyEmployee(@RequestParam Long id, Model model) {
        Optional<Employee> employeeOpt = employeeRepository.findById(id);
        if (employeeOpt.isPresent()) {
            Employee employee = employeeOpt.get();
            employee.setVerified(true);
            employeeRepository.save(employee);
            try {
                emailService.sendVerificationConfirmation(employee.getEmail(), employee.getName());
            } catch (Exception e) {
                model.addAttribute("message", "Employee verified, but failed to send email.");
            }
        }
        return "redirect:/admin/dashboard";
    }

    // Employee Login Page
    @GetMapping("/employee")
    public String employeeLoginPage(Model model) {
        model.addAttribute("employee", new Employee());
        return "employee-login";
    }

    // Employee Login Post
    @PostMapping("/employee")
    public String employeeLogin(@RequestParam String email, @RequestParam String password, Model model) {
        Optional<Employee> employeeOpt = employeeRepository.findByEmail(email);
        if (employeeOpt.isPresent()) {
            Employee employee = employeeOpt.get();
            if (password.equals(employee.getPassword())) {
                if (employee.isVerified()) {
                    return "redirect:/employee/dashboard?email=" + email;
                } else {
                    model.addAttribute("message", "Your account is pending verification.");
                    return "employee-login";
                }
            } else {
                model.addAttribute("error", "Invalid password");
                return "employee-login";
            }
        } else {
            model.addAttribute("email", email);
            model.addAttribute("password", password);
            return "employee-registration";
        }
    }

    // Employee Registration Post
    @PostMapping("/employee/register")
    public String employeeRegister(@RequestParam String name, @RequestParam String email, @RequestParam String password,
                                   @RequestParam String mobileNumber, @RequestParam String aadharNumber,
                                   @RequestParam String pan, @RequestParam String address, Model model) {
        Employee employee = new Employee();
        employee.setName(name);
        employee.setEmail(email);
        employee.setPassword(password);
        employee.setMobileNumber(mobileNumber);
        employee.setAadharNumber(aadharNumber);
        employee.setPan(pan);
        employee.setAddress(address);
        employee.setVerified(false);
        employeeRepository.save(employee);
        try {
            emailService.sendRegistrationConfirmation(email, name);
            model.addAttribute("message", "Registration submitted! Awaiting admin verification.");
        } catch (Exception e) {
            model.addAttribute("message", "Registration submitted, but failed to send email confirmation.");
        }
        return "employee-login";
    }

    // Employee Dashboard
    @GetMapping("/employee/dashboard")
    public String employeeDashboard(@RequestParam String email, Model model) {
        Optional<Employee> employeeOpt = employeeRepository.findByEmail(email);
        if (employeeOpt.isPresent() && employeeOpt.get().isVerified()) {
            Employee employee = employeeOpt.get();
            model.addAttribute("employee", employee);
            model.addAttribute("orders", orderRepository.findByAssignedEmployeeId(employee.getId()));
            return "employee-dashboard";
        } else {
            return "redirect:/employee";
        }
    }

    // Order Details (Employee)
    @GetMapping("/employee/order-details")
    public String orderDetails(@RequestParam Long id, Model model) {
        Order order = orderRepository.findById(id).orElseThrow();
        model.addAttribute("order", order);
        return "order-details";
    }

//    // Place Order (Customer)
//    @PostMapping("/order")
//    public String placeOrder(@RequestParam String customerName, @RequestParam String customerEmail,
//                             @RequestParam String packageType, @RequestParam String details, Model model) {
//        Order order = new Order();
//        order.setCustomerName(customerName);
//        order.setCustomerEmail(customerEmail);
//        order.setPackageType(packageType);
//        order.setDetails(details);
//        order.setStatus("New");
//        orderRepository.save(order);
//
//        try {
//            emailService.sendOrderConfirmation(customerEmail, customerName, order.getId(), packageType);
//            model.addAttribute("message", "Order placed successfully! Check your email for confirmation.");
//        } catch (Exception e) {
//            model.addAttribute("message", "Order placed, but failed to send email confirmation.");
//        }
//        return "index";
//    }

    // Contact Form Submission
    @PostMapping("/contact")
    public String submitContact(@RequestParam String name, @RequestParam String email,
                                @RequestParam String message, Model model) {
        StringBuilder messageBuilder = new StringBuilder();
        try {
            emailService.sendContactConfirmation(email, name, message);
            messageBuilder.append("Message sent successfully! Check your email for confirmation. ");
        } catch (Exception e) {
            logger.error("Failed to send contact confirmation to {}: {}", email, e.getMessage(), e);
            messageBuilder.append("Failed to send confirmation email to ").append(email).append(". ");
        }
        try {
            emailService.sendContactToAdmin(name, email, message);
            messageBuilder.append("Admin notified successfully.");
        } catch (Exception e) {
            logger.error("Failed to send contact notification to admin: {}", e.getMessage(), e);
            messageBuilder.append("Failed to notify admin.");
        }
        model.addAttribute("message", messageBuilder.toString());
        return "index";
    }

    // Update Order Status (Employee)
    @PostMapping("/employee/update-status")
    public String updateOrderStatus(@RequestParam Long orderId, @RequestParam String status, @RequestParam String email, Model model) {
        Optional<Order> orderOpt = orderRepository.findById(orderId);
        if (orderOpt.isPresent()) {
            Order order = orderOpt.get();
            order.setStatus(status);
            orderRepository.save(order);
            try {
                emailService.sendOrderStatusUpdate(order.getCustomerEmail(), order.getCustomerName(), order.getId(), status);
            } catch (Exception e) {
                model.addAttribute("message", "Status updated, but failed to send email to customer.");
            }
        }
        return "redirect:/employee/dashboard?email=" + email;
    }
    
    
    @GetMapping("/products")
    public String products() {
        return "products"; // Maps to /WEB-INF/views/products.jsp
    }

    @GetMapping("/pricing")
    public String pricing() {
        return "pricing"; // Maps to /WEB-INF/views/pricing.jsp
    }
    
    @GetMapping("/privacy-policy")
    public String privacyPolicy() {
        return "privacy-policy"; // Maps to /WEB-INF/views/privacy-policy.jsp
    }

    @GetMapping("/terms-of-service")
    public String termsOfService() {
        return "terms-of-service"; // Maps to /WEB-INF/views/terms-of-service.jsp
    }
    
 // Place Order (Customer)
    @PostMapping("/order")
    public String placeOrder(@RequestParam String customerName, @RequestParam String customerEmail,
                             @RequestParam String packageType, @RequestParam String details, Model model) {
        try {
            // Initialize Razorpay client
            RazorpayClient razorpay = new RazorpayClient(razorpayKeyId, razorpayKeySecret);

            // Create Razorpay order
            JSONObject orderRequest = new JSONObject();
            orderRequest.put("amount", convertToPaise(getPackagePrice(packageType))); // Amount in paise
            orderRequest.put("currency", "INR");
            orderRequest.put("receipt", "order_rcptid_" + System.currentTimeMillis());

            com.razorpay.Order razorpayOrder = razorpay.orders.create(orderRequest); // Explicitly use com.razorpay.Order

            // Extract Razorpay order ID from the JSON response
            String razorpayOrderId = razorpayOrder.toJson().getString("id");

            // Save order to database
            Order order = new Order(); // Your custom Order model
            order.setCustomerName(customerName);
            order.setCustomerEmail(customerEmail);
            order.setPackageType(packageType);
            order.setDetails(details);
            order.setStatus("Pending Payment");
            order.setRazorpayOrderId(razorpayOrderId); // Set the extracted ID
            orderRepository.save(order);

            // Generate payment link (custom URL to trigger Razorpay Checkout)
            String paymentLink = "http://localhost:8080/pay?orderId=" + order.getId();

            // Send payment email
            emailService.sendPaymentRequest(customerEmail, customerName, order.getId(), packageType, paymentLink, getPackagePrice(packageType));

            model.addAttribute("message", "Order placed successfully! Please check your email for payment instructions.");
        } catch (RazorpayException e) {
            logger.error("Failed to create Razorpay order for {}: {}", customerEmail, e.getMessage(), e);
            model.addAttribute("message", "Order placed, but failed to process payment. Contact support.");
        }
        return "index";
    }

    // Payment Page
    @GetMapping("/pay")
    public String paymentPage(@RequestParam Long orderId, Model model) {
        Order order = orderRepository.findById(orderId).orElseThrow();
        model.addAttribute("order", order);
        model.addAttribute("keyId", razorpayKeyId); // Pass Key ID to frontend
        return "pay"; // Maps to pay.jsp
    }

    // Success Callback (simplified for now)
    @GetMapping("/success")
    public String paymentSuccess(@RequestParam Long orderId, Model model) {
        Order order = orderRepository.findById(orderId).orElseThrow();
        order.setStatus("Paid");
        orderRepository.save(order);
        model.addAttribute("message", "Payment successful! Your order #" + orderId + " is confirmed.");
        return "index";
    }

    // Helper method to get package price
    private String getPackagePrice(String packageType) {
        switch (packageType) {
            case "Basic": return "$299";
            case "Business": return "$599";
            case "E-commerce": return "$999";
            default: return "$0";
        }
    }

    // Helper method to convert price to paise (Razorpay uses paise, 1 INR = 100 paise)
    private int convertToPaise(String price) {
        return Integer.parseInt(price.replace("$", "").replace(",", "")) * 100;
    }
    
    
    
    
    
}