<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Terms of Service - TheenBuild</title>
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
            <h1>Terms of Service</h1>
            <p>Please read these terms carefully before using our services</p>
        </div>
    </section>

    <!-- Main Content -->
    <div class="container">
        <div class="content-section animate__animated animate__fadeInUp">
            <h2>Agreement to Terms</h2>
            <p>These Terms of Service ("Terms") constitute a legally binding agreement made between you and TheenBuild ("we," "us," or "our") concerning your use of our website and services. By accessing or using our website and services, you agree to be bound by these Terms. If you disagree with any part of these Terms, you may not access our website or use our services.</p>
            
            <h2>Intellectual Property Rights</h2>
            <p>Unless otherwise indicated, the website and all its content, features, and functionality (including but not limited to all information, software, text, displays, images, video, and audio) are owned by TheenBuild, its licensors, or other providers of such material.</p>
            <p>You may not:</p>
            <ul>
                <li>Modify copies of any materials from this site</li>
                <li>Use any illustrations, photographs, video or audio sequences, or any graphics separately from the accompanying text</li>
                <li>Delete or alter any copyright, trademark, or other proprietary rights notices from copies of materials from this site</li>
                <li>Access or use for any commercial purposes any part of the website or any services or materials available through the website</li>
            </ul>
            
            <h2>User Representations</h2>
            <p>By using our website and services, you represent and warrant that:</p>
            <ul>
                <li>You have the legal capacity to enter into these Terms</li>
                <li>You are at least 18 years old</li>
                <li>You will not access the website through automated or non-human means</li>
                <li>You will not use the website for any illegal or unauthorized purpose</li>
                <li>Your use of the website will not violate any applicable law or regulation</li>
            </ul>
            
            <h2>Products and Services</h2>
            <p>We make every effort to display as accurately as possible the colors, features, specifications, and details of the products and services available on our website. However, we do not guarantee that the colors, features, specifications, and details of the products and services will be accurate, complete, reliable, current, or free of other errors.</p>
            <p>All products and services are subject to availability, and we reserve the right to discontinue any products or services at any time.</p>
            
            <h2>Purchases and Payment</h2>
            <p>You agree to provide current, complete, and accurate purchase and account information for all purchases made on our website. You further agree to promptly update account and payment information, including email address, payment method, and payment card expiration date, so that we can complete your transactions and contact you as needed.</p>
            <p>We reserve the right to refuse any order placed through our website. We may, in our sole discretion, limit or cancel quantities purchased per person, per household, or per order.</p>
            
            <h2>Refunds and Cancellations</h2>
            <p>All sales are final and no refunds will be issued once a project has commenced. However, we understand that circumstances may change, and we are committed to customer satisfaction. If you are not satisfied with our services, please contact us to discuss potential solutions.</p>
            <p>If you wish to cancel a project before work has begun, you may be eligible for a partial refund, less any administrative fees. Please contact our customer service team for more information.</p>
            
            <h2>Website Management</h2>
            <p>We reserve the right, but not the obligation, to:</p>
            <ul>
                <li>Monitor the website for violations of these Terms</li>
                <li>Take appropriate legal action against anyone who, in our sole discretion, violates the law or these Terms</li>
                <li>Refuse, restrict access to, limit the availability of, or disable any of your contributions or any portion thereof</li>
                <li>Remove from the website or otherwise disable all files and content that are excessive in size or are in any way burdensome to our systems</li>
                <li>Otherwise manage the website in a manner designed to protect our rights and property and to facilitate the proper functioning of the website</li>
            </ul>
            
            <h2>Privacy Policy</h2>
            <p>We care about data privacy and security. Please review our <a href="/privacy-policy">Privacy Policy</a>. By using the website, you agree to be bound by our Privacy Policy, which is incorporated into these  By using the website, you agree to be bound by our Privacy Policy, which is incorporated into these Terms.</p>
            
            <h2>Term and Termination</h2>
            <p>These Terms shall remain in full force and effect while you use the website. We may terminate your access to the website, without cause or notice, which may result in the forfeiture and destruction of all information associated with your account. All provisions of these Terms which by their nature should survive termination shall survive termination, including, without limitation, ownership provisions, warranty disclaimers, indemnity, and limitations of liability.</p>
            
            <h2>Modifications and Interruptions</h2>
            <p>We reserve the right to change, modify, or remove the contents of the website at any time or for any reason at our sole discretion without notice. We also reserve the right to modify or discontinue all or part of the website without notice at any time.</p>
            <p>We cannot guarantee the website will be available at all times. We may experience hardware, software, or other problems or need to perform maintenance related to the website, resulting in interruptions, delays, or errors. We reserve the right to change, revise, update, suspend, discontinue, or otherwise modify the website at any time or for any reason without notice to you.</p>
            
            <h2>Governing Law</h2>
            <p>These Terms shall be governed by and defined following the laws of the United States. TheenBuild and yourself irrevocably consent that the courts of the United States shall have exclusive jurisdiction to resolve any dispute which may arise in connection with these Terms.</p>
            
            <h2>Dispute Resolution</h2>
            <p>You agree to irrevocably submit all disputes related to these Terms or the relationship established by these Terms to the jurisdiction of the United States courts. TheenBuild shall also maintain the right to bring proceedings as to the substance of the matter in the courts of the country where you reside or, if these Terms are entered into in the course of your trade or profession, the state of your principal place of business.</p>
            
            <h2>Corrections</h2>
            <p>There may be information on the website that contains typographical errors, inaccuracies, or omissions, including descriptions, pricing, availability, and various other information. We reserve the right to correct any errors, inaccuracies, or omissions and to change or update the information on the website at any time, without prior notice.</p>
            
            <h2>Disclaimer</h2>
            <p>THE WEBSITE IS PROVIDED ON AN "AS-IS" AND "AS AVAILABLE" BASIS. YOU AGREE THAT YOUR USE OF THE WEBSITE AND OUR SERVICES WILL BE AT YOUR SOLE RISK. TO THE FULLEST EXTENT PERMITTED BY LAW, WE DISCLAIM ALL WARRANTIES, EXPRESS OR IMPLIED, IN CONNECTION WITH THE WEBSITE AND YOUR USE THEREOF.</p>
            
            <h2>Limitation of Liability</h2>
            <p>IN NO EVENT WILL WE OR OUR DIRECTORS, EMPLOYEES, OR AGENTS BE LIABLE TO YOU OR ANY THIRD PARTY FOR ANY DIRECT, INDIRECT, CONSEQUENTIAL, EXEMPLARY, INCIDENTAL, SPECIAL, OR PUNITIVE DAMAGES, INCLUDING LOST PROFIT, LOST REVENUE, LOSS OF DATA, OR OTHER DAMAGES ARISING FROM YOUR USE OF THE WEBSITE, EVEN IF WE HAVE BEEN ADVISED OF THE POSSIBILITY OF SUCH DAMAGES.</p>
            
            <h2>Indemnification</h2>
            <p>You agree to defend, indemnify, and hold us harmless, including our subsidiaries, affiliates, and all of our respective officers, agents, partners, and employees, from and against any loss, damage, liability, claim, or demand, including reasonable attorneys' fees and expenses, made by any third party due to or arising out of your use of the website, your breach of these Terms, or your violation of any law or the rights of a third party.</p>
            
            <h2>Contact Us</h2>
            <p>If you have any questions about these Terms, please contact us at:</p>
            <p>Email: legal@theenbuild.com<br>
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
