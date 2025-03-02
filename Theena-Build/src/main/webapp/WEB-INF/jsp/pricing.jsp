<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pricing Packages - TheenBuild</title>
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

        /* Navbar (same as products page) */
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
            margin-bottom: 20px;
        }

        /* Pricing Section */
        .pricing-section {
            margin-bottom: 50px;
        }
        .pricing-section h2 {
            font-size: 2rem;
            font-weight: 700;
            color: #1a2a44;
            margin-bottom: 20px;
            text-align: center;
        }
        .pricing-table {
            background: white;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            padding: 20px;
            transition: all 0.3s ease;
        }
        .pricing-table:hover {
            transform: translateY(-10px);
            box-shadow: 0 12px 30px rgba(0, 0, 0, 0.15);
        }
        .pricing-table th {
            background: #1a2a44;
            color: white;
            font-weight: 700;
            padding: 15px;
            border-radius: 10px 10px 0 0;
        }
        .pricing-table td {
            padding: 15px;
            border-bottom: 1px solid #eee;
            text-align: center;
        }
        .pricing-table .price {
            font-size: 1.5rem;
            font-weight: 700;
            color: #e74c3c;
        }
        .pricing-btn {
            width: 100%;
            padding: 10px;
            border-radius: 30px;
            font-weight: 600;
            transition: all 0.3s ease;
        }
        .pricing-btn:hover {
            background: #3498db;
            color: white;
            transform: scale(1.05);
        }

        /* Custom Quote */
        .custom-quote {
            background: white;
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
            margin-top: 50px;
        }

        /* Footer (same as products page) */
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
            .pricing-table { margin-bottom: 20px; }
            .pricing-table th, .pricing-table td { font-size: 0.9rem; padding: 10px; }
        }
        @media (max-width: 768px) {
            .pricing-table { overflow-x: auto; }
            .navbar { padding: 0.8rem 1rem; }
            .navbar-brand { font-size: 1.3rem; }
            .nav-link { font-size: 0.95rem; padding: 8px; }
        }
        @media (max-width: 576px) {
            .page-header { padding: clamp(70px, 12vh, 100px) 10px 30px; }
            .pricing-section h2 { font-size: 1.5rem; }
            .pricing-table th, .pricing-table td { font-size: 0.85rem; padding: 8px; }
            .pricing-btn { font-size: 0.9rem; }
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
                    <li class="nav-item"><a class="nav-link active" href="/pricing">Pricing</a></li>
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
            <h1>Pricing Packages</h1>
            <p>Choose the perfect plan for your web development needs</p>
        </div>
    </section>

    <!-- Main Content -->
    <div class="container">
        <!-- Websites Pricing -->
        <div class="pricing-section animate__animated animate__fadeInUp">
            <h2>Websites</h2>
            <div class="pricing-table">
                <table class="table table-responsive">
                    <thead>
                        <tr>
                            <th>Package</th>
                            <th>Basic</th>
                            <th>Standard</th>
                            <th>Premium</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Price</td>
                            <td class="price">$399</td>
                            <td class="price">$599</td>
                            <td class="price">$799</td>
                        </tr>
                        <tr>
                            <td>Responsive Design</td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td><i class="fas fa-check text-success"></i></td>
                        </tr>
                        <tr>
                            <td>SEO Optimization</td>
                            <td>-</td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td><i class="fas fa-check text-success"></i></td>
                        </tr>
                        <tr>
                            <td>Contact Forms</td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td><i class="fas fa-check text-success"></i></td>
                        </tr>
                        <tr>
                            <td>Google Maps</td>
                            <td>-</td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td><i class="fas fa-check text-success"></i></td>
                        </tr>
                        <tr>
                            <td>Custom Features</td>
                            <td>-</td>
                            <td>-</td>
                            <td><i class="fas fa-check text-success"></i></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><a href="/order?product=Websites&package=Basic&price=$399" class="btn btn-outline-primary pricing-btn">Select</a></td>
							<td><a href="/order?product=Websites&package=Standard&price=$599" class="btn btn-outline-primary pricing-btn">Select</a></td>
							<td><a href="/order?product=Websites&package=Premium&price=$799" class="btn btn-outline-primary pricing-btn">Select</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- E-commerce Pricing -->
        <div class="pricing-section animate__animated animate__fadeInUp" style="animation-delay: 0.2s;">
            <h2>E-commerce</h2>
            <div class="pricing-table">
                <table class="table table-responsive">
                    <thead>
                        <tr>
                            <th>Package</th>
                            <th>Basic</th>
                            <th>Advanced</th>
                            <th>Marketplace</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Price</td>
                            <td class="price">$999</td>
                            <td class="price">$1,499</td>
                            <td class="price">$2,499</td>
                        </tr>
                        <tr>
                            <td>Product Catalog</td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td><i class="fas fa-check text-success"></i></td>
                        </tr>
                        <tr>
                            <td>Shopping Cart</td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td><i class="fas fa-check text-success"></i></td>
                        </tr>
                        <tr>
                            <td>Secure Checkout</td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td><i class="fas fa-check text-success"></i></td>
                        </tr>
                        <tr>
                            <td>Vendor Management</td>
                            <td>-</td>
                            <td>-</td>
                            <td><i class="fas fa-check text-success"></i></td>
                        </tr>
                        <tr>
                            <td>Payment Gateway</td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td><i class="fas fa-check text-success"></i></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><a href="/order?product=E-commerce&package=Basic&price=$999" class="btn btn-outline-primary pricing-btn">Select</a></td>
							<td><a href="/order?product=E-commerce&package=Advanced&price=$1499" class="btn btn-outline-primary pricing-btn">Select</a></td>
							<td><a href="/order?product=E-commerce&package=Marketplace&price=$2499" class="btn btn-outline-primary pricing-btn">Select</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Blockchain Pricing -->
        <div class="pricing-section animate__animated animate__fadeInUp" style="animation-delay: 0.4s;">
            <h2>Blockchain</h2>
            <div class="pricing-table">
                <table class="table table-responsive">
                    <thead>
                        <tr>
                            <th>Package</th>
                            <th>NFT Basic</th>
                            <th>NFT Pro</th>
                            <th>DeFi</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Price</td>
                            <td class="price">$3,999</td>
                            <td class="price">$5,999</td>
                            <td class="price">$4,999</td>
                        </tr>
                        <tr>
                            <td>Wallet Integration</td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td><i class="fas fa-check text-success"></i></td>
                        </tr>
                        <tr>
                            <td>Smart Contracts</td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td><i class="fas fa-check text-success"></i></td>
                        </tr>
                        <tr>
                            <td>Minting/Auction</td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td>-</td>
                        </tr>
                        <tr>
                            <td>Liquidity Pools</td>
                            <td>-</td>
                            <td>-</td>
                            <td><i class="fas fa-check text-success"></i></td>
                        </tr>
                        <tr>
                            <td>Security Audits</td>
                            <td>-</td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td><i class="fas fa-check text-success"></i></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><a href="/order?product=Blockchain&package=NFT Basic&price=$3999" class="btn btn-outline-primary pricing-btn">Select</a></td>
							<td><a href="/order?product=Blockchain&package=NFT Pro&price=$5999" class="btn btn-outline-primary pricing-btn">Select</a></td>
							<td><a href="/order?product=Blockchain&package=DeFi&price=$4999" class="btn btn-outline-primary pricing-btn">Select</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Maintenance Pricing -->
        <div class="pricing-section animate__animated animate__fadeInUp" style="animation-delay: 0.6s;">
            <h2>Maintenance</h2>
            <div class="pricing-table">
                <table class="table table-responsive">
                    <thead>
                        <tr>
                            <th>Package</th>
                            <th>Basic</th>
                            <th>Pro</th>
                            <th>Enterprise</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>Price</td>
                            <td class="price">$99/month</td>
                            <td class="price">$299/month</td>
                            <td class="price">$499/month</td>
                        </tr>
                        <tr>
                            <td>Regular Updates</td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td><i class="fas fa-check text-success"></i></td>
                        </tr>
                        <tr>
                            <td>Security Monitoring</td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td><i class="fas fa-check text-success"></i></td>
                        </tr>
                        <tr>
                            <td>Backup Services</td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td><i class="fas fa-check text-success"></i></td>
                        </tr>
                        <tr>
                            <td>SEO Optimization</td>
                            <td>-</td>
                            <td><i class="fas fa-check text-success"></i></td>
                            <td><i class="fas fa-check text-success"></i></td>
                        </tr>
                        <tr>
                            <td>24/7 Support</td>
                            <td>-</td>
                            <td>-</td>
                            <td><i class="fas fa-check text-success"></i></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td><a href="/order?product=Maintenance&package=Basic&price=$99/month" class="btn btn-outline-primary pricing-btn">Select</a></td>
							<td><a href="/order?product=Maintenance&package=Pro&price=$299/month" class="btn btn-outline-primary pricing-btn">Select</a></td>
							<td><a href="/order?product=Maintenance&package=Enterprise&price=$499/month" class="btn btn-outline-primary pricing-btn">Select</a></td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Custom Quote -->
        <div class="custom-quote text-center animate__animated animate__fadeInUp" style="animation-delay: 0.8s;">
            <h3>Need a Custom Solution?</h3>
            <p>Contact us for a tailored quote that fits your unique requirements.</p>
            <a href="/#contact" class="btn btn-primary btn-lg px-4 py-2">Get a Quote</a>
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