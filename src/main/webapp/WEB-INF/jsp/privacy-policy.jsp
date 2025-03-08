<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Privacy Policy - TheenaWebs</title>
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

        /* Navbar */
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
            transition: all 0.3s ease;
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
            position: relative;
            margin-bottom: 40px;
        }
        .page-header h1 {
            font-size: clamp(1.8rem, 6vw, 3rem);
            font-weight: 700;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
            margin-bottom: 20px;
        }
        
        /* Content Section */
        .content-section {
            padding: 40px 20px 60px;
            background: white;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            margin-bottom: 60px;
        }
        .content-section h2 {
            color: #1a2a44;
            font-weight: 700;
            margin: 30px 0 20px;
            font-size: clamp(1.3rem, 4vw, 1.8rem);
        }
        .content-section h3 {
            color: #2c3e50;
            font-weight: 600;
            margin: 25px 0 15px;
            font-size: clamp(1.1rem, 3vw, 1.5rem);
        }
        .content-section p, .content-section li {
            margin-bottom: 15px;
            font-size: clamp(0.9rem, 2.5vw, 1rem);
        }
        .content-section ul, .content-section ol {
            margin-bottom: 20px;
            padding-left: 20px;
        }
        .last-updated {
            font-style: italic;
            color: #6c757d;
            margin-top: 40px;
            font-size: 0.9rem;
        }

        /* Footer */
        footer {
            background: linear-gradient(90deg, #1a2a44, #2c3e50);
            color: white;
            padding: 40px 10px;
            font-size: clamp(0.85rem, 2vw, 1rem);
            box-shadow: 0 -4px 15px rgba(0, 0, 0, 0.2);
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
            .navbar-nav { text-align: center; padding: 15px 0; }
            .nav-link { padding: 10px; font-size: 1rem; }
            footer .row > div { margin-bottom: 25px; text-align: center; }
        }
        @media (max-width: 768px) {
            .navbar { padding: 0.8rem 1rem; }
            .navbar-brand { font-size: 1.3rem; }
            .nav-link { font-size: 0.95rem; padding: 8px; }
            .content-section { padding: 30px 15px 50px; }
        }
        @media (max-width: 576px) {
            .navbar { padding: 0.7rem 0.8rem; }
            .navbar-brand { font-size: 1.2rem; }
            .nav-link { font-size: 0.9rem; padding: 6px; }
            .page-header { padding: clamp(70px, 12vh, 100px) 10px 30px; }
            .content-section { padding: 25px 12px 40px; }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top animate__animated animate__fadeInDown">
        <div class="container">
            <a class="navbar-brand" href="/">TheenaWebs</a>
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
            <h1>Privacy Policy</h1>
            <p>How we collect, use, and protect your information</p>
        </div>
    </section>

    <!-- Main Content -->
    <div class="container">
        <div class="content-section animate__animated animate__fadeInUp">
            <h2>Introduction</h2>
            <p>At TheenaWebs ("we," "our," or "us"), we respect your privacy and are committed to protecting your personal information. This Privacy Policy explains how we collect, use, disclose, and safeguard your information when you visit our website or use our services.</p>
            <p>Please read this Privacy Policy carefully. By accessing or using our website and services, you acknowledge that you have read, understood, and agree to be bound by all the terms outlined in this policy.</p>
            
            <h2>Information We Collect</h2>
            <h3>Personal Information</h3>
            <p>We may collect personal information that you voluntarily provide to us when you:</p>
            <ul>
                <li>Register for an account</li>
                <li>Express interest in obtaining information about our services</li>
                <li>Participate in activities on our website</li>
                <li>Contact us with inquiries or feedback</li>
            </ul>
            <p>Personal information may include:</p>
            <ul>
                <li>Name</li>
                <li>Email address</li>
                <li>Phone number</li>
                <li>Mailing address</li>
                <li>Billing information</li>
                <li>Other information you choose to provide</li>
            </ul>
            
            <h3>Automatically Collected Information</h3>
            <p>When you visit our website, we may automatically collect certain information about your device, including:</p>
            <ul>
                <li>IP address</li>
                <li>Browser type</li>
                <li>Operating system</li>
                <li>Pages visited</li>
                <li>Time and date of your visit</li>
                <li>Time spent on pages</li>
                <li>Referring website addresses</li>
            </ul>
            <p>This information helps us analyze trends, administer the site, track user movements, and gather demographic information.</p>
            
            <h2>How We Use Your Information</h2>
            <p>We may use the information we collect for various purposes, including to:</p>
            <ul>
                <li>Provide, operate, and maintain our website and services</li>
                <li>Improve, personalize, and expand our website and services</li>
                <li>Understand and analyze how you use our website</li>
                <li>Develop new products, services, features, and functionality</li>
                <li>Communicate with you about our services, updates, and other information</li>
                <li>Process transactions and send related information</li>
                <li>Find and prevent fraud</li>
                <li>For other purposes with your consent</li>
            </ul>
            
            <h2>Disclosure of Your Information</h2>
            <p>We may share information in the following situations:</p>
            <ul>
                <li><strong>Business Transfers:</strong> We may share or transfer your information in connection with a merger, acquisition, reorganization, or sale of assets.</li>
                <li><strong>With Affiliates:</strong> We may share your information with our affiliates, in which case we will require those affiliates to honor this Privacy Policy.</li>
                <li><strong>With Business Partners:</strong> We may share your information with our business partners to offer you certain products, services, or promotions.</li>
                <li><strong>With Service Providers:</strong> We may share your information with service providers to perform services for us or on our behalf.</li>
                <li><strong>With Your Consent:</strong> We may disclose your personal information for any other purpose with your consent.</li>
                <li><strong>Legal Requirements:</strong> We may disclose your information where required to do so by law or in response to valid requests by public authorities.</li>
            </ul>
            
            <h2>Security of Your Information</h2>
            <p>We use administrative, technical, and physical security measures to protect your personal information. While we have taken reasonable steps to secure the information you provide to us, please be aware that no security measures are perfect or impenetrable, and no method of data transmission can be guaranteed against interception or other types of misuse.</p>
            
            <h2>Cookies and Tracking Technologies</h2>
            <p>We may use cookies, web beacons, tracking pixels, and other tracking technologies to help customize our website and improve your experience. You can choose to have your computer warn you each time a cookie is being sent, or you can choose to turn off all cookies through your browser settings. If you turn cookies off, some features may be disabled.</p>
            
            <h2>Third-Party Websites</h2>
            <p>Our website may contain links to third-party websites that are not operated by us. We have no control over and assume no responsibility for the content, privacy policies, or practices of any third-party sites or services.</p>
            
            <h2>Children's Privacy</h2>
            <p>Our website and services are not intended for individuals under the age of 18. We do not knowingly collect personal information from children under 18. If you are a parent or guardian and believe your child has provided us with personal information, please contact us.</p>
            
            <h2>Changes to This Privacy Policy</h2>
            <p>We may update our Privacy Policy from time to time. We will notify you of any changes by posting the new Privacy Policy on this page and updating the "Last Updated" date. You are advised to review this Privacy Policy periodically for any changes.</p>
            
            <h2>Contact Us</h2>
            <p>If you have questions or concerns about this Privacy Policy, please contact us at:</p>
            <p>Email: privacy@theenawebs.com<br>
            Phone: +1 (800) 123-4567<br>
            Address: 123 Innovation Drive, Tech City, USA</p>
            
            <p class="last-updated">Last Updated: March 1, 2025</p>
        </div>
    </div>

    <!-- Footer -->
    <footer class="animate__animated animate__fadeInUp">
        <div class="container">
            <div class="row justify-content-between align-items-start">
                <div class="col-md-4">
                    <h5>About TheenaWebs</h5>
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
                <p>© 2025 TheenaWebs. All Rights Reserved. | <a href="/privacy-policy">Privacy Policy</a> | <a href="/terms-of-service">Terms of Service</a></p>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
