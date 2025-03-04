package com.theena.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import jakarta.mail.internet.MimeMessage;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Service
public class EmailService {

    private static final Logger logger = LoggerFactory.getLogger(EmailService.class);

    @Autowired
    private JavaMailSender mailSender;

    private static final String FROM_EMAIL = "theenaxz@gmail.com";

    // Order Confirmation Email
    public void sendOrderConfirmation(String to, String customerName, Long orderId, String packageType) {
        MimeMessage message = mailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setTo(to);
            helper.setFrom(FROM_EMAIL);
            helper.setSubject("Order Confirmation - Order #" + orderId);
            helper.setText(
                "<h2>Dear " + customerName + ",</h2>" +
                "<p>Thank you for your order with TheenBuild!</p>" +
                "<p><strong>Order ID:</strong> " + orderId + "</p>" +
                "<p><strong>Package:</strong> " + packageType + "</p>" +
                "<p>We’ve received your request and will get started soon. You’ll hear from us shortly.</p>" +
                "<p>Best regards,<br>TheenBuild Team</p>",
                true
            );
            mailSender.send(message);
            logger.info("Order confirmation email sent to: {}", to);
        } catch (Exception e) {
            logger.error("Failed to send order confirmation email to {}: {}", to, e.getMessage(), e);
            throw new RuntimeException("Failed to send email", e);
        }
    }

    // Contact Form Confirmation Email
    public void sendContactConfirmation(String to, String name, String messageContent) {
        MimeMessage message = mailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setTo(to);
            helper.setFrom(FROM_EMAIL);
            helper.setSubject("Message Received - TheenBuild");
            helper.setText(
                "<h2>Dear " + name + ",</h2>" +
                "<p>We’ve received your message:</p>" +
                "<blockquote>" + messageContent + "</blockquote>" +
                "<p>Our team will respond to you soon. Thank you for reaching out!</p>" +
                "<p>Best regards,<br>TheenBuild Team</p>",
                true
            );
            mailSender.send(message);
            logger.info("Contact confirmation email sent to: {}", to);
        } catch (Exception e) {
            logger.error("Failed to send contact confirmation email to {}: {}", to, e.getMessage(), e);
            throw new RuntimeException("Failed to send email", e);
        }
    }

    // Send Contact Message to Admin
    public void sendContactToAdmin(String customerName, String customerEmail, String messageContent) {
        MimeMessage message = mailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setTo("dinakarselvam2002@gmail.com");
            helper.setFrom(FROM_EMAIL);
            helper.setSubject("New Contact Form Submission - TheenBuild");
            helper.setText(
                "<h2>New Customer Message</h2>" +
                "<p><strong>From:</strong> " + customerName + " (" + customerEmail + ")</p>" +
                "<p><strong>Message:</strong></p>" +
                "<blockquote>" + messageContent + "</blockquote>" +
                "<p>Please respond to the customer at your earliest convenience.</p>" +
                "<p>Best regards,<br>TheenBuild System</p>",
                true
            );
            mailSender.send(message);
            logger.info("Contact message sent to admin: theenaxz@gmail.com");
        } catch (Exception e) {
            logger.error("Failed to send contact message to admin: {}", e.getMessage(), e);
            throw new RuntimeException("Failed to send email", e);
        }
    }

    // Employee Registration Confirmation Email
    public void sendRegistrationConfirmation(String to, String name) {
        MimeMessage message = mailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setTo(to);
            helper.setFrom(FROM_EMAIL);
            helper.setSubject("Registration Submitted - TheenBuild");
            helper.setText(
                "<h2>Dear " + name + ",</h2>" +
                "<p>Your registration with TheenBuild has been submitted successfully.</p>" +
                "<p>We’re awaiting admin verification. You’ll be notified once your account is active.</p>" +
                "<p>Best regards,<br>TheenBuild Team</p>",
                true
            );
            mailSender.send(message);
            logger.info("Registration confirmation email sent to: {}", to);
        } catch (Exception e) {
            logger.error("Failed to send registration confirmation email to {}: {}", to, e.getMessage(), e);
            throw new RuntimeException("Failed to send email", e);
        }
    }

    // Employee Verification Confirmation Email
    public void sendVerificationConfirmation(String to, String name) {
        MimeMessage message = mailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setTo(to);
            helper.setFrom(FROM_EMAIL);
            helper.setSubject("Account Verified - TheenBuild");
            helper.setText(
                "<h2>Dear " + name + ",</h2>" +
                "<p>Congratulations! Your account has been verified by our admin team.</p>" +
                "<p>You can now log in to your employee dashboard.</p>" +
                "<p>Best regards,<br>TheenBuild Team</p>",
                true
            );
            mailSender.send(message);
            logger.info("Verification confirmation email sent to: {}", to);
        } catch (Exception e) {
            logger.error("Failed to send verification confirmation email to {}: {}", to, e.getMessage(), e);
            throw new RuntimeException("Failed to send email", e);
        }
    }

    // Order Status Update Email
    public void sendOrderStatusUpdate(String to, String customerName, Long orderId, String status) {
        MimeMessage message = mailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setTo(to);
            helper.setFrom(FROM_EMAIL);
            helper.setSubject("Order Update - Order #" + orderId);
            helper.setText(
                "<h2>Dear " + customerName + ",</h2>" +
                "<p>Your order status has been updated.</p>" +
                "<p><strong>Order ID:</strong> " + orderId + "</p>" +
                "<p><strong>New Status:</strong> " + status + "</p>" +
                "<p>We’ll keep you posted on further progress.</p>" +
                "<p>Best regards,<br>TheenBuild Team</p>",
                true
            );
            mailSender.send(message);
            logger.info("Order status update email sent to: {}", to);
        } catch (Exception e) {
            logger.error("Failed to send order status update email to {}: {}", to, e.getMessage(), e);
            throw new RuntimeException("Failed to send email", e);
        }
    }

    // Task Assignment Email
    public void sendTaskAssignment(String to, String employeeName, Long orderId, String packageType) {
        MimeMessage message = mailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setTo(to);
            helper.setFrom(FROM_EMAIL);
            helper.setSubject("New Task Assignment - TheenBuild");
            helper.setText(
                "<h2>Dear " + employeeName + ",</h2>" +
                "<p>You have been assigned a new task.</p>" +
                "<p><strong>Order ID:</strong> " + orderId + "</p>" +
                "<p><strong>Package:</strong> " + packageType + "</p>" +
                "<p>Please check your dashboard for details and start working on it.</p>" +
                "<p>Best regards,<br>TheenBuild Admin</p>",
                true
            );
            mailSender.send(message);
            logger.info("Task assignment email sent to: {}", to);
        } catch (Exception e) {
            logger.error("Failed to send task assignment email to {}: {}", to, e.getMessage(), e);
            throw new RuntimeException("Failed to send email", e);
        }
    }
    
    
    
 // New method for Razorpay payment request
    public void sendPaymentRequest(String to, String customerName, Long orderId, String packageType, String paymentLink, String amount) {
        MimeMessage message = mailSender.createMimeMessage();
        try {
            MimeMessageHelper helper = new MimeMessageHelper(message, true);
            helper.setTo(to);
            helper.setFrom(FROM_EMAIL);
            helper.setSubject("Payment Request for Order #" + orderId + " - TheenBuild");
            helper.setText(
                "<h2>Dear " + customerName + ",</h2>" +
                "<p>Thank you for your order with TheenBuild! To proceed, please complete your payment.</p>" +
                "<p><strong>Order ID:</strong> " + orderId + "</p>" +
                "<p><strong>Package:</strong> " + packageType + "</p>" +
                "<p><strong>Amount:</strong> " + amount + "</p>" +
                "<p><a href='" + paymentLink + "' style='display: inline-block; padding: 10px 20px; background-color: #3498db; color: white; text-decoration: none; border-radius: 5px;'>Pay Now</a></p>" +
                "<p>If you have any questions, feel free to reach out to us at <a href='mailto:support@theenbuild.com'>support@theenbuild.com</a>.</p>" +
                "<p>Best regards,<br>TheenBuild Team</p>",
                true
            );
            mailSender.send(message);
            logger.info("Payment request email sent to: {}", to);
        } catch (Exception e) {
            logger.error("Failed to send payment request email to {}: {}", to, e.getMessage(), e);
            throw new RuntimeException("Failed to send payment email", e);
        }
    }
    
    
    
    
}