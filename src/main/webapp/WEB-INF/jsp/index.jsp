<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Welcome to TheenaWebs</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif; /* Professional font */
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
            font-size: clamp(1.2rem, 3vw, 1.5rem); /* Responsive brand size */
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

        /* Hero Section */
        .hero {
            background: linear-gradient(135deg, #1a2a44, #e74c3c, #f1c40f);
            color: white;
            padding: clamp(60px, 15vh, 120px) 15px; /* Responsive padding */
            text-align: center;
            position: relative;
            overflow: hidden;
        }
        .hero h1 {
            font-size: clamp(1.8rem, 6vw, 4rem); /* Responsive heading */
            font-weight: 700;
            text-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
            margin-bottom: 20px;
        }
        .hero p {
            font-size: clamp(0.9rem, 3vw, 1.4rem); /* Responsive paragraph */
            font-weight: 400;
            margin: 0 auto 25px;
            max-width: 800px;
        }
        .hero .btn {
            padding: clamp(8px, 2vw, 12px) clamp(20px, 3vw, 30px); /* Responsive button */
            font-size: clamp(0.85rem, 2.5vw, 1.1rem);
            border-radius: 30px;
            background: #fff;
            color: #1a2a44;
            font-weight: 600;
            transition: all 0.4s ease;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }
        .hero .btn:hover { transform: scale(1.1); background: #3498db; color: white; }

        /* Content Section */
        .content-section {
            padding: 60px 10px;
            background: white;
        }
        .content-section h2 {
            color: #1a2a44;
            font-weight: 700;
            margin-bottom: 30px;
            font-size: clamp(1.5rem, 5vw, 2.5rem);
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 1.2px;
        }
        .feature-card, .pricing-card {
            background: #fff;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            transition: all 0.4s ease;
            margin-bottom: 25px;
            position: relative;
        }
        .feature-card:hover, .pricing-card:hover { transform: translateY(-10px); box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15); }
        .icon-box { 
            font-size: clamp(2rem, 6vw, 3rem); 
            color: #1a2a44; 
            margin-bottom: 15px; 
            transition: transform 0.3s ease; 
        }
        .feature-card:hover .icon-box { transform: rotate(360deg); }

        /* Pricing Section */
        .pricing-card { cursor: pointer; overflow: hidden; }
        .pricing-card.active { border: 3px solid #1a2a44; background: #f9f9f9; }
        .pricing-card h4 { 
            color: #1a2a44; 
            font-weight: 600; 
            font-size: clamp(1.2rem, 3vw, 1.5rem); 
        }
        .pricing-card .price { 
            font-size: clamp(1.2rem, 4vw, 1.7rem); 
            color: #e74c3c; 
            font-weight: 700; 
        }
        .pricing-card .btn { 
            width: 100%; 
            margin-top: 15px; 
            font-size: clamp(0.85rem, 2.5vw, 1rem); 
            border-radius: 25px; 
            transition: all 0.3s ease; 
        }
        .pricing-card:hover .btn { background: #3498db; color: white; }

        /* Order Section */
        .order-preview, .form-container {
            max-width: 100%;
            width: 800px;
            margin: 40px auto;
            padding: 30px;
            background: #fff;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            transition: all 0.4s ease;
        }
        .order-preview:hover, .form-container:hover { box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15); }
        .order-preview h3, .form-container h3 { 
            color: #1a2a44; 
            font-weight: 700; 
            font-size: clamp(1.3rem, 3vw, 1.8rem); 
        }
        .order-details { 
            margin-top: 20px; 
            padding: 15px; 
            background: #f9f9f9; 
            border-radius: 10px; 
            font-size: clamp(0.9rem, 2.5vw, 1rem); 
        }
        .form-label { 
            font-weight: 500; 
            color: #1a2a44; 
            font-size: clamp(0.85rem, 2.5vw, 1rem); 
        }

        /* Contact Section */
        .contact-section {
            padding: 60px 10px;
            background: #f4f7fa;
        }
        .contact-card {
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            transition: all 0.4s ease;
        }
        .contact-card:hover { transform: scale(1.02); box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15); }

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

        /* Advanced Animations */
        .animate__fadeInDown, .animate__fadeInUp, .animate__zoomIn, .animate__slideInLeft, .animate__slideInRight {
            animation-duration: 1.5s;
        }
        .animate__pulse { animation: pulse 2s infinite; }
        .animate__bounceIn { animation-duration: 1s; }
        .animate__rotateIn { animation-duration: 1s; }
        @keyframes glow {
            0% { box-shadow: 0 0 5px rgba(52, 152, 219, 0.5); }
            50% { box-shadow: 0 0 20px rgba(52, 152, 219, 0.8); }
            100% { box-shadow: 0 0 5px rgba(52, 152, 219, 0.5); }
        }
        .glow-effect:hover { animation: glow 1.5s infinite; }

        /* Enhanced Responsive Adjustments */
        @media (max-width: 1200px) {
            .order-preview, .form-container { width: 90%; }
        }
        @media (max-width: 992px) {
            .navbar-nav { text-align: center; padding: 15px 0; }
            .nav-link { padding: 10px; font-size: 1rem; }
            .hero { padding: clamp(50px, 12vh, 100px) 10px; }
            .feature-card, .pricing-card, .contact-card { margin: 15px 0; padding: 20px; }
            .content-section, .contact-section { padding: 50px 10px; }
            footer .row > div { margin-bottom: 25px; text-align: center; }
        }
        @media (max-width: 768px) {
            .navbar { padding: 0.8rem 1rem; }
            .navbar-brand { font-size: 1.3rem; }
            .nav-link { font-size: 0.95rem; padding: 8px; }
            .hero h1 { font-size: clamp(1.6rem, 5vw, 2.8rem); }
            .hero p { font-size: clamp(0.85rem, 2.5vw, 1.2rem); max-width: 90%; }
            .hero .btn { padding: 8px 20px; }
            .feature-card, .pricing-card { text-align: center; padding: 15px; }
            .content-section h2, .contact-section h2 { font-size: clamp(1.3rem, 4vw, 2rem); }
            .order-preview, .form-container { padding: 20px 15px; margin: 30px 10px; }
            .pricing-card ul { padding-left: 0; }
        }
        @media (max-width: 576px) {
            .navbar { padding: 0.7rem 0.8rem; }
            .navbar-brand { font-size: 1.2rem; }
            .nav-link { font-size: 0.9rem; padding: 6px; }
            .hero { padding: clamp(40px, 10vh, 80px) 8px; }
            .hero h1 { font-size: clamp(1.4rem, 4.5vw, 2.5rem); }
            .hero p { font-size: clamp(0.8rem, 2vw, 1rem); }
            .hero .btn { padding: 7px 15px; font-size: 0.9rem; }
            .content-section, .contact-section { padding: 40px 5px; }
            .feature-card, .pricing-card, .contact-card { padding: 15px 10px; }
            .order-preview, .form-container { margin: 20px 5px; padding: 15px 10px; }
            .form-control, .btn { font-size: clamp(0.75rem, 2vw, 0.9rem); }
            .pricing-card .price { font-size: clamp(1rem, 3.5vw, 1.3rem); }
            footer { padding: 25px 5px; }
            footer .social-icons i { margin: 0 8px; }
        }
        @media (max-width: 375px) {
            .navbar-brand { font-size: 1.1rem; }
            .nav-link { font-size: 0.85rem; padding: 5px; }
            .hero h1 { font-size: clamp(1.2rem, 4vw, 2rem); }
            .hero p { font-size: 0.85rem; }
            .hero .btn { padding: 6px 12px; font-size: 0.8rem; }
            .content-section h2 { font-size: clamp(1.1rem, 3.5vw, 1.8rem); }
            .feature-card h4, .pricing-card h4 { font-size: 1.1rem; }
            .pricing-card .btn { padding: 6px 10px; }
        }
    </style>
</head>
<body>
		
	
	<!-- Success Modal -->
    <div class="modal fade" id="successModal" tabindex="-1" aria-labelledby="successModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header bg-success text-white">
                    <h5 class="modal-title" id="successModalLabel">Success</h5>
                    <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <c:if test="${not empty message}">${message}</c:if>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" data-bs-dismiss="modal">OK</button>
                </div>
            </div>
        </div>
    </div>	
	
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
                    <li class="nav-item"><a class="nav-link" href="#contact">Contact</a></li>
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

    <!-- Hero Section -->
    <section class="hero animate__animated animate__fadeInDown">
        <div class="container">
            <h1 class="animate__animated animate__bounceIn">Shape Your Digital Future</h1>
            <p>At TheenaWebs, we craft custom websites that drive success—fast, affordable, and tailored to your vision.</p>
            <a href="#order" class="btn btn-light animate__animated animate__zoomIn glow-effect">Start Your Journey</a>
        </div>
    </section>

    <!-- Main Content -->
    <section class="content-section">
        <div class="container">
            <h2 class="animate__animated animate__fadeInUp">Why Choose TheenaWebs?</h2>
            <div class="row">
                <div class="col-md-4 col-sm-6 animate__animated animate__slideInLeft">
                    <div class="feature-card text-center glow-effect">
                        <div class="icon-box"><i class="fas fa-rocket"></i></div>
                        <h4>Fast Delivery</h4>
                        <p>Get your website live in record time with our streamlined process.</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 animate__animated animate__zoomIn" style="animation-delay: 0.2s;">
                    <div class="feature-card text-center glow-effect">
                        <div class="icon-box"><i class="fas fa-dollar-sign"></i></div>
                        <h4>Affordable Excellence</h4>
                        <p>High-quality websites at prices that fit your budget.</p>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6 animate__animated animate__slideInRight" style="animation-delay: 0.4s;">
                    <div class="feature-card text-center glow-effect">
                        <div class="icon-box"><i class="fas fa-users"></i></div>
                        <h4>Expert Team</h4>
                        <p>Our professionals are dedicated to bringing your vision to life.</p>
                    </div>
                </div>
            </div>

            <!-- Our Services -->
            <div class="mt-5">
                <h2 class="animate__animated animate__fadeInUp">Our Services</h2>
                <p class="text-center">We offer a wide range of solutions to elevate your online presence.</p>
                <div class="row">
                    <div class="col-md-6 animate__animated animate__slideInLeft">
                        <div class="feature-card glow-effect">
                            <h4>Custom Web Development</h4>
                            <p>Unique, scalable websites designed to meet your specific business goals.</p>
                        </div>
                    </div>
                    <div class="col-md-6 animate__animated animate__slideInRight">
                        <div class="feature-card glow-effect">
                            <h4>E-commerce Solutions</h4>
                            <p>Launch your online store with secure, user-friendly platforms.</p>
                        </div>
                    </div>
	                    <div class="col-md-6 animate__animated animate__slideInRight">
						    <div class="feature-card glow-effect">
						        <h4>Blockchain Solutions</h4>
						        <p>Enhance security and transparency with decentralized blockchain technology.</p>
						    </div>
						</div>
                </div>
            </div>

            <!-- Pricing Section -->
            <div id="pricing" class="mt-5">
                <h2 class="animate__animated animate__fadeInUp">Choose Your Website Package</h2>
                <p class="text-center">Select a package that fits your needs and budget.</p>
                <div class="row">
                    <div class="col-md-4 col-sm-6 animate__animated animate__rotateIn" style="animation-delay: 0.2s;">
                        <div class="pricing-card text-center glow-effect" onclick="selectPackage('Basic', '$299', ['1-3 Pages', 'Responsive Design', 'Basic SEO'])">
                            <h4>Basic</h4>
                            <p class="price">$299</p>
                            <p>Perfect for startups and personal sites.</p>
                            <ul class="list-unstyled">
                                <li>1-3 Pages</li>
                                <li>Responsive Design</li>
                                <li>Basic SEO</li>
                            </ul>
                            <button class="btn btn-outline-primary">Select</button>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6 animate__animated animate__rotateIn" style="animation-delay: 0.4s;">
                        <div class="pricing-card text-center glow-effect" onclick="selectPackage('Business', '$599', ['5-10 Pages', 'Custom Design', 'Advanced SEO', '1 Month Support'])">
                            <h4>Business</h4>
                            <p class="price">$599</p>
                            <p>Ideal for growing businesses.</p>
                            <ul class="list-unstyled">
                                <li>5-10 Pages</li>
                                <li>Custom Design</li>
                                <li>Advanced SEO</li>
                                <li>1 Month Support</li>
                            </ul>
                            <button class="btn btn-outline-primary">Select</button>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6 animate__animated animate__rotateIn" style="animation-delay: 0.6s;">
                        <div class="pricing-card text-center glow-effect" onclick="selectPackage('E-commerce', '$999', ['10+ Pages', 'Product Listings', 'Payment Integration', '3 Months Support'])">
                            <h4>E-commerce</h4>
                            <p class="price">$999</p>
                            <p>Launch your online store with ease.</p>
                            <ul class="list-unstyled">
                                <li>10+ Pages</li>
                                <li>Product Listings</li>
                                <li>Payment Integration</li>
                                <li>3 Months Support</li>
                            </ul>
                            <button class="btn btn-outline-primary">Select</button>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Order Preview Section -->
            <div id="order" class="order-preview mt-5 animate__animated animate__fadeInUp">
                <h3>Review Your Selection</h3>
                <div id="orderDetails" class="order-details">
                    <p><strong>Package:</strong> <span id="selectedPackage">None selected</span></p>
                    <p><strong>Price:</strong> <span id="selectedPrice">$0</span></p>
                    <p><strong>Features:</strong></p>
                    <ul id="selectedFeatures" class="list-unstyled">
                        <li>Select a package above to see details.</li>
                    </ul>
                </div>
                <button class="btn btn-primary w-100 mt-3 animate__animated animate__pulse" onclick="showOrderForm()">One Step Away!</button>
            </div>

            <!-- Order Form (Hidden Initially) -->
            <div id="orderForm" class="form-container mt-5 animate__animated animate__fadeInUp" style="display: none;">
                <h3>Complete Your Order</h3>
                <form action="/order" method="post">
                    <div class="mb-3">
                        <label for="customerName" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="customerName" name="customerName" required>
                    </div>
                    <div class="mb-3">
                        <label for="customerEmail" class="form-label">Email Address</label>
                        <input type="email" class="form-control" id="customerEmail" name="customerEmail" required>
                    </div>
                    <div class="mb-3">
                        <label for="packageType" class="form-label">Selected Package</label>
                        <input type="text" class="form-control" id="packageType" name="packageType" readonly>
                    </div>
                    <div class="mb-3">
                        <label for="details" class="form-label">Additional Details</label>
                        <textarea class="form-control" id="details" name="details" rows="4" required placeholder="Tell us more about your website needs..."></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary w-100 glow-effect">Submit Your Order</button>
                </form>
                <c:if test="${not empty message}">
                    <div class="alert alert-success mt-3">${message}</div>
                </c:if>
            </div>

            <!-- How We Work -->
            <div class="mt-5">
                <h2 class="animate__animated animate__fadeInUp">How We Work</h2>
                <p class="text-center">Our process is simple, collaborative, and results-driven.</p>
                <ul class="list-group list-group-flush">
				    <li class="list-group-item animate__animated animate__fadeInUp" style="animation-delay: 0.2s;">Step 1: Choose a package and review your selection.</li>
				    <li class="list-group-item animate__animated animate__fadeInUp" style="animation-delay: 0.4s;">Step 2: Complete the order form with your details.</li>
				    <li class="list-group-item animate__animated animate__fadeInUp" style="animation-delay: 0.6s;">Step 3: Make a secure payment to confirm your order.</li>
				    <li class="list-group-item animate__animated animate__fadeInUp" style="animation-delay: 0.8s;">Step 4: Collaborate with us to launch your website.</li>
				</ul>
            </div>
        </div>
    </section>

    <!-- Contact Section -->
    <!-- Contact Section -->
<section id="contact" class="contact-section animate__animated animate__fadeInUp">
    <div class="container">
        <h2>Contact Our Team</h2>
        <p class="text-center">We’re here to assist you! Reach out for support, feedback, or inquiries.</p>
        <div class="row">
            <div class="col-md-6 animate__animated animate__slideInLeft">
                <div class="contact-card glow-effect">
                    <h4>Get in Touch</h4>
                    <p><i class="fas fa-envelope"></i> Email: <a href="mailto:support@theenbuild.com">support@theenawebs.com</a></p>
                    <p><i class="fas fa-phone"></i> Phone: +1 (800) 123-4567</p>
                    <p><i class="fas fa-map-marker-alt"></i> Address: 123 Innovation Drive, Tech City, USA</p>
                </div>
            </div>
            <div class="col-md-6 animate__animated animate__slideInRight">
                <div class="contact-card glow-effect">
                    <h4>Send Us a Message</h4>
                    <form action="/contact" method="post">
                        <div class="mb-3">
                            <input type="text" class="form-control" name="name" placeholder="Your Name" required>
                        </div>
                        <div class="mb-3">
                            <input type="email" class="form-control" name="email" placeholder="Your Email" required>
                        </div>
                        <div class="mb-3">
                            <textarea class="form-control" name="message" rows="3" placeholder="Your Message" required></textarea>
                        </div>
                        <button type="submit" class="btn btn-primary w-100 glow-effect">Send Message</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

    <!-- Footer -->
    <footer class="animate__animated animate__fadeInUp">
        <div class="container">
            <div class="row justify-content-between align-items-start">
                <div class="col-md-4">
                    <h5>About TheenaWebs</h5>
                    <p>We’re a passionate team dedicated to delivering cutting-edge web solutions that empower businesses worldwide.</p>
                </div>
                <div class="col-md-3">
                    <h5>Quick Links</h5>
                    <ul class="list-unstyled">
                        <li><a href="/products">Products</a></li>
                        <li><a href="/pricing">Pricing</a></li>
                        <li><a href="#contact">Contact Us</a></li>
                        <li><a href="/admin">Admin Login</a></li>
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
                        <button type="submit" class="btn btn-light w-100 glow-effect">Subscribe</button>
                    </form>
                </div>
            </div>
            <div class="footer-bottom text-center mt-4">
                <p>© 2025 TheenaWebs. All Rights Reserved. | <a href="/privacy-policy">Privacy Policy</a> | <a href="/terms-of-service">Terms of Service</a></p>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        let currentPackage = null;

        function selectPackage(packageName, price, features) {
            const cards = document.querySelectorAll('.pricing-card');
            cards.forEach(card => card.classList.remove('active'));
            event.currentTarget.classList.add('active');

            currentPackage = { name: packageName, price: price, features: features };

            document.getElementById('selectedPackage').textContent = packageName;
            document.getElementById('selectedPrice').textContent = price;
            const featuresList = document.getElementById('selectedFeatures');
            featuresList.innerHTML = '';
            features.forEach(feature => {
                const li = document.createElement('li');
                li.textContent = feature;
                featuresList.appendChild(li);
            });
        }

        function showOrderForm() {
            if (!currentPackage) {
                alert('Please select a package first!');
                return;
            }
            const orderForm = document.getElementById('orderForm');
            orderForm.style.display = 'block';
            document.getElementById('packageType').value = currentPackage.name;
            document.getElementById('order').scrollIntoView({ behavior: 'smooth' });
        }
        
        
     // Show success modal if message is present
        <c:if test="${not empty message}">
            var successModal = new bootstrap.Modal(document.getElementById('successModal'), {});
            successModal.show();
        </c:if>
    </script>
</body>
</html>