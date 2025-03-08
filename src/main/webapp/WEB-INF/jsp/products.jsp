<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Products - TheenaWebs</title>
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
        
        /* Product Cards */
        .product-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            transition: all 0.4s ease;
            margin-bottom: 30px;
            overflow: hidden;
        }
        .product-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
        }
        .product-img {
            height: 200px;
            background-color: #f8f9fa;
            display: flex;
            align-items: center;
            justify-content: center;
            overflow: hidden;
        }
        .product-img img {
            max-width: 100%;
            max-height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }
        .product-card:hover .product-img img {
            transform: scale(1.1);
        }
        .product-content {
            padding: 20px;
        }
        .product-title {
            font-size: 1.3rem;
            font-weight: 700;
            color: #1a2a44;
            margin-bottom: 10px;
        }
        .product-description {
            color: #666;
            margin-bottom: 15px;
            font-size: 0.95rem;
        }
        .product-features {
            margin-bottom: 15px;
        }
        .product-features li {
            margin-bottom: 5px;
            font-size: 0.9rem;
        }
        .product-price {
            font-size: 1.5rem;
            font-weight: 700;
            color: #e74c3c;
            margin-bottom: 15px;
        }
        .product-btn {
            width: 100%;
            padding: 10px;
            border-radius: 30px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .product-btn:hover {
            background: #3498db;
            color: white;
            transform: scale(1.05);
        }
        
        /* Category Tabs */
        .category-tabs {
            margin-bottom: 40px;
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 10px;
        }
        .category-tab {
            padding: 10px 20px;
            background: white;
            border-radius: 30px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        .category-tab:hover, .category-tab.active {
            background: #1a2a44;
            color: white;
            transform: scale(1.05);
        }
        
        /* Footer */
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
            .navbar-nav { text-align: center; padding: 15px 0; }
            .nav-link { padding: 10px; font-size: 1rem; }
            footer .row > div { margin-bottom: 25px; text-align: center; }
        }
        @media (max-width: 768px) {
            .navbar { padding: 0.8rem 1rem; }
            .navbar-brand { font-size: 1.3rem; }
            .nav-link { font-size: 0.95rem; padding: 8px; }
            .product-card { margin-bottom: 20px; }
        }
        @media (max-width: 576px) {
            .navbar { padding: 0.7rem 0.8rem; }
            .navbar-brand { font-size: 1.2rem; }
            .nav-link { font-size: 0.9rem; padding: 6px; }
            .page-header { padding: clamp(70px, 12vh, 100px) 10px 30px; }
            .category-tab { padding: 8px 15px; font-size: 0.9rem; }
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
            <h1>Our Products</h1>
            <p>Discover our range of web development solutions tailored to your needs</p>
        </div>
    </section>

    <!-- Main Content -->
    <div class="container">
        <!-- Category Tabs -->
        <div class="category-tabs animate__animated animate__fadeInUp">
            <div class="category-tab active" onclick="filterProducts('all')">All Products</div>
            <div class="category-tab" onclick="filterProducts('websites')">Websites</div>
            <div class="category-tab" onclick="filterProducts('ecommerce')">E-commerce</div>
            <div class="category-tab" onclick="filterProducts('blockchain')">Blockchain</div>
            <div class="category-tab" onclick="filterProducts('maintenance')">Maintenance</div>
        </div>
        
        <!-- Products Grid -->
        <div class="row" id="products-container">
            <!-- Website Products -->
            <div class="col-md-6 col-lg-4 product-item websites animate__animated animate__zoomIn">
                <div class="product-card">
                    <div class="product-img">
                        <img src="https://via.placeholder.com/400x200?text=Business+Website" alt="Business Website">
                    </div>
                    <div class="product-content">
                        <h3 class="product-title">Business Website</h3>
                        <p class="product-description">Professional website designed to showcase your business and attract new customers.</p>
                        <ul class="product-features list-unstyled">
                            <li><i class="fas fa-check text-success me-2"></i> Responsive Design</li>
                            <li><i class="fas fa-check text-success me-2"></i> SEO Optimization</li>
                            <li><i class="fas fa-check text-success me-2"></i> Contact Forms</li>
                            <li><i class="fas fa-check text-success me-2"></i> Google Maps Integration</li>
                        </ul>
                        <p class="product-price">From $599</p>
                        <a href="/pricing" class="btn btn-outline-primary product-btn">View Packages</a>
                    </div>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-4 product-item websites animate__animated animate__zoomIn" style="animation-delay: 0.2s;">
                <div class="product-card">
                    <div class="product-img">
                        <img src="https://via.placeholder.com/400x200?text=Portfolio+Website" alt="Portfolio Website">
                    </div>
                    <div class="product-content">
                        <h3 class="product-title">Portfolio Website</h3>
                        <p class="product-description">Showcase your work and talents with a beautifully designed portfolio website.</p>
                        <ul class="product-features list-unstyled">
                            <li><i class="fas fa-check text-success me-2"></i> Project Gallery</li>
                            <li><i class="fas fa-check text-success me-2"></i> Testimonials Section</li>
                            <li><i class="fas fa-check text-success me-2"></i> Resume/CV Integration</li>
                            <li><i class="fas fa-check text-success me-2"></i> Social Media Links</li>
                        </ul>
                        <p class="product-price">From $399</p>
                        <a href="/pricing" class="btn btn-outline-primary product-btn">View Packages</a>
                    </div>
                </div>
            </div>
            
            <!-- E-commerce Products -->
            <div class="col-md-6 col-lg-4 product-item ecommerce animate__animated animate__zoomIn" style="animation-delay: 0.4s;">
                <div class="product-card">
                    <div class="product-img">
                        <img src="https://via.placeholder.com/400x200?text=E-commerce+Store" alt="E-commerce Store">
                    </div>
                    <div class="product-content">
                        <h3 class="product-title">E-commerce Store</h3>
                        <p class="product-description">Sell products online with a fully-featured e-commerce website.</p>
                        <ul class="product-features list-unstyled">
                            <li><i class="fas fa-check text-success me-2"></i> Product Catalog</li>
                            <li><i class="fas fa-check text-success me-2"></i> Shopping Cart</li>
                            <li><i class="fas fa-check text-success me-2"></i> Secure Checkout</li>
                            <li><i class="fas fa-check text-success me-2"></i> Payment Gateway Integration</li>
                        </ul>
                        <p class="product-price">From $999</p>
                        <a href="/pricing" class="btn btn-outline-primary product-btn">View Packages</a>
                    </div>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-4 product-item ecommerce animate__animated animate__zoomIn" style="animation-delay: 0.6s;">
                <div class="product-card">
                    <div class="product-img">
                        <img src="https://via.placeholder.com/400x200?text=Marketplace+Platform" alt="Marketplace Platform">
                    </div>
                    <div class="product-content">
                        <h3 class="product-title">Marketplace Platform</h3>
                        <p class="product-description">Create a multi-vendor marketplace where sellers can list their products.</p>
                        <ul class="product-features list-unstyled">
                            <li><i class="fas fa-check text-success me-2"></i> Vendor Management</li>
                            <li><i class="fas fa-check text-success me-2"></i> Commission System</li>
                            <li><i class="fas fa-check text-success me-2"></i> Vendor Dashboards</li>
                            <li><i class="fas fa-check text-success me-2"></i> Advanced Search Filters</li>
                        </ul>
                        <p class="product-price">From $2,499</p>
                        <a href="/pricing" class="btn btn-outline-primary product-btn">View Packages</a>
                    </div>
                </div>
            </div>
            
            <!-- Blockchain Products -->
            <div class="col-md-6 col-lg-4 product-item blockchain animate__animated animate__zoomIn" style="animation-delay: 0.8s;">
                <div class="product-card">
                    <div class="product-img">
                        <img src="https://via.placeholder.com/400x200?text=NFT+Marketplace" alt="NFT Marketplace">
                    </div>
                    <div class="product-content">
                        <h3 class="product-title">NFT Marketplace</h3>
                        <p class="product-description">Launch your own NFT marketplace for digital collectibles and art.</p>
                        <ul class="product-features list-unstyled">
                            <li><i class="fas fa-check text-success me-2"></i> Wallet Integration</li>
                            <li><i class="fas fa-check text-success me-2"></i> Smart Contract Development</li>
                            <li><i class="fas fa-check text-success me-2"></i> Minting Functionality</li>
                            <li><i class="fas fa-check text-success me-2"></i> Auction System</li>
                        </ul>
                        <p class="product-price">From $3,999</p>
                        <a href="/pricing" class="btn btn-outline-primary product-btn">View Packages</a>
                    </div>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-4 product-item blockchain animate__animated animate__zoomIn" style="animation-delay: 1s;">
                <div class="product-card">
                    <div class="product-img">
                        <img src="https://via.placeholder.com/400x200?text=DeFi+Application" alt="DeFi Application">
                    </div>
                    <div class="product-content">
                        <h3 class="product-title">DeFi Application</h3>
                        <p class="product-description">Decentralized finance applications for lending, borrowing, and trading.</p>
                        <ul class="product-features list-unstyled">
                            <li><i class="fas fa-check text-success me-2"></i> Smart Contract Development</li>
                            <li><i class="fas fa-check text-success me-2"></i> Liquidity Pools</li>
                            <li><i class="fas fa-check text-success me-2"></i> Yield Farming</li>
                            <li><i class="fas fa-check text-success me-2"></i> Security Audits</li>
                        </ul>
                        <p class="product-price">From $4,999</p>
                        <a href="/pricing" class="btn btn-outline-primary product-btn">View Packages</a>
                    </div>
                </div>
            </div>
            
            <!-- Maintenance Products -->
            <div class="col-md-6 col-lg-4 product-item maintenance animate__animated animate__zoomIn" style="animation-delay: 1.2s;">
                <div class="product-card">
                    <div class="product-img">
                        <img src="https://via.placeholder.com/400x200?text=Website+Maintenance" alt="Website Maintenance">
                    </div>
                    <div class="product-content">
                        <h3 class="product-title">Website Maintenance</h3>
                        <p class="product-description">Keep your website up-to-date, secure, and running smoothly.</p>
                        <ul class="product-features list-unstyled">
                            <li><i class="fas fa-check text-success me-2"></i> Regular Updates</li>
                            <li><i class="fas fa-check text-success me-2"></i> Security Monitoring</li>
                            <li><i class="fas fa-check text-success me-2"></i> Backup Services</li>
                            <li><i class="fas fa-check text-success me-2"></i> Performance Optimization</li>
                        </ul>
                        <p class="product-price">From $99/month</p>
                        <a href="/pricing" class="btn btn-outline-primary product-btn">View Packages</a>
                    </div>
                </div>
            </div>
            
            <div class="col-md-6 col-lg-4 product-item maintenance animate__animated animate__zoomIn" style="animation-delay: 1.4s;">
                <div class="product-card">
                    <div class="product-img">
                        <img src="https://via.placeholder.com/400x200?text=SEO+Services" alt="SEO Services">
                    </div>
                    <div class="product-content">
                        <h3 class="product-title">SEO Services</h3>
                        <p class="product-description">Improve your website's visibility in search engines and drive more traffic.</p>
                        <ul class="product-features list-unstyled">
                            <li><i class="fas fa-check text-success me-2"></i> Keyword Research</li>
                            <li><i class="fas fa-check text-success me-2"></i> On-Page Optimization</li>
                            <li><i class="fas fa-check text-success me-2"></i> Content Strategy</li>
                            <li><i class="fas fa-check text-success me-2"></i> Performance Reporting</li>
                        </ul>
                        <p class="product-price">From $299/month</p>
                        <a href="/pricing" class="btn btn-outline-primary product-btn">View Packages</a>
                    </div>
                </div>
            </div>
        </div>
        
        <!-- Call to Action -->
        <div class="text-center mt-5 mb-5 animate__animated animate__fadeInUp">
            <h2>Ready to Start Your Project?</h2>
            <p class="mb-4">Contact us today to discuss your requirements and get a custom quote.</p>
            <a href="/#contact" class="btn btn-primary btn-lg px-4 py-2">Get in Touch</a>
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
    <script>
        function filterProducts(category) {
            // Update active tab
            const tabs = document.querySelectorAll('.category-tab');
            tabs.forEach(tab => tab.classList.remove('active'));
            event.currentTarget.classList.add('active');
            
            // Filter products
            const products = document.querySelectorAll('.product-item');
            products.forEach(product => {
                if (category === 'all' || product.classList.contains(category)) {
                    product.style.display = 'block';
                } else {
                    product.style.display = 'none';
                }
            });
        }
    </script>
</body>
</html>
