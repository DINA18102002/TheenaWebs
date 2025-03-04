<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Order Your Package - TheenBuild</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background: #f4f7fa;
            color: #333;
            overflow-x: hidden;
            margin: 0;
            line-height: 1.6;
        }

        /* Navbar (consistent with previous pages) */
        .navbar {
            background: linear-gradient(90deg, #1a2a44, #2c3e50);
            padding: 1rem 1.5rem;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
            transition: all 0.3s ease;
        }
        .navbar-brand {
            color: white !important;
            font-weight: 700;
            font-size: clamp(1.2rem, 3vw, 1.5rem);
        }
        .nav-link {
            color: white !important;
            font-weight: 500;
            font-size: clamp(0.9rem, 2.5vw, 1.1rem);
            padding: 0.5rem 1rem;
            transition: all 0.3s ease;
        }
        .nav-link:hover { color: #3498db !important; transform: scale(1.05); }
        .dropdown-menu {
            background: #2c3e50;
            border: none;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
        .dropdown-item { color: white; font-weight: 500; }
        .dropdown-item:hover { background: #3498db; color: #fff; }

        /* Page Header */
        .page-header {
            background: linear-gradient(135deg, #1a2a44, #2c3e50);
            color: white;
            padding: clamp(80px, 15vh, 120px) 15px 40px;
            text-align: center;
            margin-bottom: 40px;
        }
        .page-header h1 {
            font-size: clamp(1.8rem, 6vw, 3rem);
            font-weight: 700;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
            margin-bottom: 10px;
        }
        .page-header p {
            font-size: clamp(1rem, 3vw, 1.2rem);
            opacity: 0.9;
        }

        /* Order Section */
        .order-section {
            background: white;
            border-radius: 20px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            padding: 30px;
            margin-bottom: 40px;
            transition: all 0.4s ease;
        }
        .order-section:hover {
            transform: translateY(-10px);
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.15);
        }
        .order-header {
            background: linear-gradient(135deg, #3498db, #1a2a44);
            color: white;
            padding: 20px;
            border-radius: 15px 15px 0 0;
            text-align: center;
        }
        .order-header h2 {
            font-size: clamp(1.5rem, 4vw, 2rem);
            font-weight: 700;
            margin: 0;
        }
        .order-header .price {
            font-size: 1.8rem;
            font-weight: 700;
            color: #e74c3c;
            margin-top: 10px;
        }
        .order-details {
            padding: 20px;
        }
        .order-details ul {
            list-style: none;
            padding: 0;
            margin-bottom: 20px;
        }
        .order-details li {
            margin-bottom: 10px;
            font-size: 0.95rem;
            display: flex;
            align-items: center;
        }
        .order-details li i {
            color: #27ae60;
            margin-right: 10px;
        }
        .order-form label {
            font-weight: 500;
            margin-bottom: 5px;
        }
        .order-form input, .order-form textarea {
            border-radius: 8px;
            border: 1px solid #ddd;
            padding: 10px;
            width: 100%;
            margin-bottom: 15px;
            transition: border-color 0.3s ease;
        }
        .order-form input:focus, .order-form textarea:focus {
            border-color: #3498db;
            outline: none;
            box-shadow: 0 0 5px rgba(52, 152, 219, 0.3);
        }
        .submit-btn {
            width: 100%;
            padding: 12px;
            background: #e74c3c;
            color: white;
            border: none;
            border-radius: 30px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .submit-btn:hover {
            background: #c0392b;
            transform: scale(1.05);
        }

        /* Footer (consistent with previous pages) */
        footer {
            background: linear-gradient(90deg, #1a2a44, #2c3e50);
            color: white;
            padding: 40px 10px;
            font-size: clamp(0.85rem, 2vw, 1rem);
            box-shadow: 0 -4px 15px rgba(0, 0, 0, 0.2);
            margin-top: 60px;
        }
        footer a { color: #3498db; text-decoration: none; transition: all 0.3s ease; }
        footer a:hover { color: #f1c40f; transform: scale(1.05); }
        footer .social-icons i {
            font-size: clamp(1.2rem, 3vw, 1.8rem);
            margin: 0 12px;
            transition: all 0.4s ease;
        }
        footer .social-icons i:hover { color: #f1c40f; transform: rotate(360deg) scale(1.2); }
        .footer-bottom { border-top: 1px solid rgba(255, 255, 255, 0.2); padding-top: 20px; }

        /* Responsive Adjustments */
        @media (max-width: 992px) {
            .order-section { padding: 20px; }
            .order-header h2 { font-size: 1.5rem; }
            .order-header .price { font-size: 1.6rem; }
        }
        @media (max-width: 768px) {
            .navbar { padding: 0.8rem 1rem; }
            .navbar-brand { font-size: 1.3rem; }
            .nav-link { font-size: 0.95rem; padding: 8px; }
            .order-details li { font-size: 0.9rem; }
            .order-form input, .order-form textarea { font-size: 0.9rem; }
        }
        @media (max-width: 576px) {
            .page-header { padding: clamp(60px, 12vh, 80px) 10px 30px; }
            .order-header h2 { font-size: 1.3rem; }
            .order-header .price { font-size: 1.4rem; }
            .order-details li { font-size: 0.85rem; }
            .submit-btn { font-size: 0.9rem; }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top animate__animated animate__fadeInDown">
        <div class="container">
            <a class="navbar-brand" href="/">TheenBuild</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="/products">Products</a></li>
                    <li class="nav-item"><a class="nav-link" href="/pricing">Pricing</a></li>
                    <li class="nav-item"><a class="nav-link" href="/#contact">Contact</a></li>
                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="loginDropdown" data-bs-toggle="dropdown">
                            Login
                        </a>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><a class="dropdown-item" href="/admin">Admin Login</a></li>
                            <li><a class="dropdown-item" href="/employee">Employee Login</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Page Header -->
    <section class="page-header animate__animated animate__fadeInDown">
        <div class="container">
            <h1>Order Your Package</h1>
            <p>Complete the form below to get started with your selected plan</p>
        </div>
    </section>

    <!-- Order Section -->
    <div class="container">
        <div class="order-section animate__animated animate__zoomIn">
            <div class="order-header">
                <h2><c:out value="${param.product}"/> - <c:out value="${param.package}"/></h2>
                <div class="price"><c:out value="${param.price}"/></div>
            </div>
            <div class="order-details">
                <!-- Dynamically populated features (example for demonstration) -->
                <ul>
                    <c:choose>
                        <c:when test="${param.product == 'Websites' && param.package == 'Basic'}">
                            <li><i class="fas fa-check"></i> Responsive Design</li>
                            <li><i class="fas fa-check"></i> Contact Forms</li>
                        </c:when>
                        <c:when test="${param.product == 'E-commerce' && param.package == 'Advanced'}">
                            <li><i class="fas fa-check"></i> Product Catalog</li>
                            <li><i class="fas fa-check"></i> Shopping Cart</li>
                            <li><i class="fas fa-check"></i> Secure Checkout</li>
                            <li><i class="fas fa-check"></i> Payment Gateway</li>
                        </c:when>
                        <!-- Add more conditions for other products/packages -->
                        <c:otherwise>
                            <li><i class="fas fa-check"></i> Custom Features (Based on Selection)</li>
                        </c:otherwise>
                    </c:choose>
                </ul>

                <!-- Order Form -->
                <form class="order-form" action="/submit-order" method="POST">
                    <input type="hidden" name="product" value="${param.product}">
                    <input type="hidden" name="package" value="${param.package}">
                    <input type="hidden" name="price" value="${param.price}">

                    <div class="mb-3">
                        <label for="name">Full Name</label>
                        <input type="text" id="name" name="name" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="email">Email Address</label>
                        <input type="email" id="email" name="email" class="form-control" required>
                    </div>
                    <div class="mb-3">
                        <label for="phone">Phone Number</label>
                        <input type="tel" id="phone" name="phone" class="form-control">
                    </div>
                    <div class="mb-3">
                        <label for="requirements">Additional Requirements</label>
                        <textarea id="requirements" name="requirements" class="form-control" rows="4" placeholder="Let us know any specific needs or questions"></textarea>
                    </div>
                    <button type="submit" class="submit-btn">Submit Order</button>
                </form>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="animate__animated animate__fadeInUp">
        <div class="container">
            <div class="row justify-content-between align-items-start">
                <div class="col-md-4">
                    <h5>About TheenBuild</h5>
                    <p>We're a passionate team dedicated to delivering cutting-edge web solutions that empower businesses worldwide.</p>
                </div>
                <div class="col-md-3">
                    <h5>Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="/products">Products</a></li>
                        <li><a href="/pricing">Pricing</a></li>
                        <li><a href="/#contact">Contact Us</a></li>
                        <li><a href="/privacy-policy">Privacy Policy</a></li>
                        <li><a href="/terms-of-service">Terms of Service</a></li>
                    </ul>
                </div>
                <div class="col-md-4">
                    <h5>Stay Connected</h5>
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-linkedin"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                    <form class="mt-3">
                        <input type="email" placeholder="Join Our Newsletter" class="form-control mb-2" required>
                        <button type="submit" class="btn btn-light w-100">Subscribe</button>
                    </form>
                </div>
            </div>
            <div class="footer-bottom text-center mt-4">
                <p>© 2025 TheenBuild. All Rights Reserved. | <a href="/privacy-policy">Privacy Policy</a> | <a href="/terms-of-service">Terms of Service</a></p>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>