<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TheenaWebs - Executive Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        :root {
            --primary: #1976d2;
            --secondary: #263238;
            --success: #2e7d32;
            --danger: #d32f2f;
            --light: #eceff1;
            --border-radius: 8px;
            --box-shadow: 0 2px 12px rgba(0,0,0,0.08);
        }

        body {
            font-family: 'Roboto', sans-serif;
            background: var(--light);
            color: var(--secondary);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }

        /* Navbar */
        .navbar {
            background: #fff;
            box-shadow: var(--box-shadow);
            padding: 0.75rem 1rem;
        }

        .navbar-brand {
            font-weight: 700;
            color: var(--primary) !important;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        .nav-link {
            color: var(--secondary);
            font-weight: 500;
            padding: 0.5rem 1rem !important;
        }

        .nav-link:hover, .nav-link.active {
            color: var(--primary);
            background: #e3f2fd;
            border-radius: 6px;
        }

        /* Container */
        .dashboard-container {
            max-width: 1440px;
            margin: 5rem auto 2rem;
            padding: 0 1rem;
            flex-grow: 1;
        }

        /* Cards */
        .executive-card {
            background: #fff;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 1.5rem;
            height: 100%;
        }

        .executive-card .title {
            font-size: 0.95rem;
            color: #607d8b;
            margin-bottom: 0.75rem;
            font-weight: 500;
        }

        .executive-card .value {
            font-size: 2rem;
            font-weight: 600;
            color: var(--secondary);
        }

        .executive-card i {
            font-size: 2rem;
            color: var(--primary);
        }

        /* Sections */
        .section-card {
            background: #fff;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 1.5rem;
            margin-bottom: 2rem;
        }

        .section-title {
            font-size: 1.3rem;
            font-weight: 600;
            color: var(--secondary);
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        /* Table Styles */
        .table {
            margin-bottom: 0;
        }

        .table th {
            background: #f5f7fa;
            font-size: 0.85rem;
            font-weight: 600;
            text-transform: uppercase;
            padding: 1rem;
            color: var(--secondary);
        }

        .table td {
            padding: 1rem;
            vertical-align: middle;
            font-size: 0.9rem;
        }

        .badge {
            padding: 0.4rem 0.8rem;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 500;
        }

        /* Buttons */
        .btn-action {
            padding: 0.5rem 1.5rem;
            border-radius: 20px;
            font-size: 0.9rem;
            font-weight: 500;
        }

        /* Footer */
        footer {
            text-align: center;
            padding: 2rem 0;
            color: #78909c;
            font-size: 0.9rem;
        }

        /* Responsive Design */
        @media (max-width: 992px) {
            .executive-card .value {
                font-size: 1.75rem;
            }
        }

        @media (max-width: 768px) {
            .employee-row {
                flex-direction: column;
                align-items: flex-start;
                gap: 1rem;
            }

            .table-responsive {
                margin: 0 -1rem;
                width: calc(100% + 2rem);
            }

            .btn-action {
                width: 100%;
                margin-bottom: 0.5rem;
            }
        }

        @media (max-width: 576px) {
            .navbar-nav {
                padding: 0.5rem 0;
            }

            .section-title {
                font-size: 1.1rem;
            }
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="/"><i class="fas fa-building"></i> TheenaWebs</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/admin/dashboard">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="/admin/tasks">Tasks</a></li>
                    <li class="nav-item"><a class="nav-link" href="/admin/employees">Workforce</a></li>
                    <li class="nav-item"><a class="nav-link" href="/admin/finances">Finances</a></li>
                    <li class="nav-item"><a class="nav-link" href="/admin/reports">Reports</a></li>
                    <li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Dashboard Content -->
    <div class="dashboard-container">
        <!-- Executive Overview -->
        <div class="row g-4 mb-5">
            <div class="col-lg-3 col-md-6">
                <div class="executive-card d-flex align-items-center gap-3">
                    <i class="fas fa-users"></i>
                    <div>
                        <div class="title">Workforce Size</div>
                        <div class="value">${employees.size() + employeeRepository.findByVerifiedTrue().size()}</div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="executive-card d-flex align-items-center gap-3">
                    <i class="fas fa-dollar-sign"></i>
                    <div>
                        <div class="title">New Orders</div>
                        <div class="value">${newOrders.size()}</div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="executive-card d-flex align-items-center gap-3">
                    <i class="fas fa-clipboard-list"></i>
                    <div>
                        <div class="title">Active Projects</div>
                        <div class="value">25</div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-6">
                <div class="executive-card d-flex align-items-center gap-3">
                    <i class="fas fa-user-check"></i>
                    <div>
                        <div class="title">Pending Approvals</div>
                        <div class="value">${employees.size()}</div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Quick Actions -->
        <div class="section-card mb-5">
            <h2 class="section-title"><i class="fas fa-bolt"></i> Quick Actions</h2>
            <div class="row g-3">
                <div class="col-md-3 col-sm-6">
                    <a href="/admin/employees/add" class="btn btn-primary btn-action w-100">
                        <i class="fas fa-user-plus me-2"></i>Add Employee
                    </a>
                </div>
                <div class="col-md-3 col-sm-6">
                    <a href="/admin/finances/invoice" class="btn btn-primary btn-action w-100">
                        <i class="fas fa-file-invoice-dollar me-2"></i>Create Invoice
                    </a>
                </div>
                <div class="col-md-3 col-sm-6">
                    <a href="/admin/reports/generate" class="btn btn-primary btn-action w-100">
                        <i class="fas fa-chart-line me-2"></i>Generate Report
                    </a>
                </div>
                <div class="col-md-3 col-sm-6">
                    <a href="/admin/settings" class="btn btn-primary btn-action w-100">
                        <i class="fas fa-cog me-2"></i>Settings
                    </a>
                </div>
            </div>
        </div>

        <!-- Pending Approvals -->
        <div class="section-card">
            <h2 class="section-title"><i class="fas fa-user-check"></i> Pending Employee Approvals</h2>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Contact</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty employees}">
                                <c:forEach var="employee" items="${employees}">
                                    <tr class="employee-row">
                                        <td>${employee.name}</td>
                                        <td>${employee.email}</td>
                                        <td>
                                            <form action="/admin/verify-employee" method="post" class="d-inline">
                                                <input type="hidden" name="id" value="${employee.id}">
                                                <button type="submit" class="btn btn-success btn-action me-2">Approve</button>
                                            </form>
                                            <form action="/admin/reject-employee" method="post" class="d-inline">
                                                <input type="hidden" name="id" value="${employee.id}">
                                                <button type="submit" class="btn btn-danger btn-action">Reject</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="3" class="text-center py-4 text-success">
                                        <i class="fas fa-check-circle me-2"></i>No pending approvals
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
	
	
	<!-- New Orders -->
        <div class="section-card">
            <h2 class="section-title"><i class="fas fa-clipboard-list"></i> New Orders</h2>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Customer</th>
                            <th>Package</th>
                            <th>Details</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty newOrders}">
                                <c:forEach var="order" items="${newOrders}">
                                    <tr>
                                        <td>${order.id}</td>
                                        <td>${order.customerName}</td>
                                        <td>${order.packageType}</td>
                                        <td>${order.details}</td>
                                        <td>
                                            <a href="/admin/tasks" class="btn btn-primary btn-action">Assign</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="5" class="text-center py-4 text-success">
                                        <i class="fas fa-check-circle me-2"></i>No new orders
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
	
        <!-- Company Compliance -->
        <div class="section-card">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h2 class="section-title"><i class="fas fa-shield-alt"></i> Company Compliance</h2>
                <a href="/admin/requirements/upload" class="btn btn-outline-primary btn-sm">
                    <i class="fas fa-upload me-1"></i> Upload Document
                </a>
            </div>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Document</th>
                            <th>Status</th>
                            <th>Due Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="req" items="${requirements}">
                            <tr>
                                <td>${req.title}</td>
                                <td>
                                    <span class="badge ${req.status == 'verified' ? 'bg-success' : req.status == 'pending' ? 'bg-warning' : 'bg-secondary'}">
                                        ${req.status == 'verified' ? 'Verified' : req.status == 'pending' ? 'Pending' : 'Not Submitted'}
                                    </span>
                                </td>
                                <td>${req.dueDate}</td> <!-- Assuming dueDate is available -->
                                <td>
                                    <a href="/admin/requirements/view?id=${req.id}" class="text-primary">View</a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Footer -->
        <footer>
            © 2025 TheenaWebs. All rights reserved.
        </footer>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>