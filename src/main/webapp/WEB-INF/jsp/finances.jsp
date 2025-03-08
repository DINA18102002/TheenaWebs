<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TheenaWebs - Finances</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/animate.css@4.1.1/animate.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/apexcharts/dist/apexcharts.css">
    <style>
        :root {
            --primary: #2563eb;
            --primary-light: #dbeafe;
            --primary-dark: #1e40af;
            --secondary: #1e293b;
            --success: #16a34a;
            --success-light: #dcfce7;
            --warning: #eab308;
            --warning-light: #fef9c3;
            --danger: #dc2626;
            --danger-light: #fee2e2;
            --light: #f1f5f9;
            --dark: #0f172a;
            --gray: #64748b;
            --border-radius: 10px;
            --box-shadow: 0 4px 20px rgba(0, 0, 0, 0.05);
            --transition: all 0.3s ease;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: var(--light);
            color: var(--secondary);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
            padding-top: 70px;
        }

        /* Navbar Styles */
        .navbar {
            background: #fff;
            box-shadow: var(--box-shadow);
            padding: 0.75rem 1rem;
            z-index: 1030;
        }

        .navbar-brand {
            font-weight: 700;
            color: var(--primary) !important;
            display: flex;
            align-items: center;
            gap: 0.5rem;
            font-size: 1.3rem;
        }

        .navbar-brand i {
            font-size: 1.5rem;
        }

        .nav-link {
            color: var(--secondary);
            font-weight: 500;
            padding: 0.5rem 1rem !important;
            transition: var(--transition);
            border-radius: 8px;
            margin: 0 0.2rem;
        }

        .nav-link:hover, .nav-link.active {
            color: var(--primary);
            background: var(--primary-light);
        }

        /* Main Container */
        .dashboard-container {
            max-width: 1440px;
            margin: 1.5rem auto 2rem;
            padding: 0 1rem;
            flex-grow: 1;
        }

        /* Cards */
        .section-card {
            background: #fff;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 1.5rem;
            margin-bottom: 2rem;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            overflow: hidden;
        }

        .hover-scale:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        }

        .section-title {
            font-size: 1.4rem;
            font-weight: 600;
            color: var(--secondary);
            margin-bottom: 1.5rem;
            display: flex;
            align-items: center;
            gap: 0.75rem;
            border-bottom: 1px solid rgba(0, 0, 0, 0.05);
            padding-bottom: 1rem;
        }

        .section-title i {
            color: var(--primary);
        }

        /* Executive Cards */
        .executive-card {
            background: #fff;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 1.5rem;
            height: 100%;
            transition: var(--transition);
            border-left: 4px solid var(--primary);
        }

        .executive-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        }

        .executive-card i {
            font-size: 2rem;
            color: var(--primary);
        }

        .executive-card .title {
            font-size: 0.9rem;
            color: var(--gray);
            margin-bottom: 0.25rem;
        }

        .executive-card .value {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--secondary);
        }

        /* Table Styles */
        .table {
            margin-bottom: 0;
        }

        .table th {
            background: #f8fafc;
            font-size: 0.85rem;
            font-weight: 600;
            text-transform: uppercase;
            padding: 1rem;
            color: var(--gray);
            border-bottom: 2px solid #e2e8f0;
        }

        .table td {
            padding: 1rem;
            vertical-align: middle;
            font-size: 0.9rem;
            border-bottom: 1px solid #f1f5f9;
            transition: background 0.2s ease;
        }

        .table tr:hover td {
            background: #f8fafc;
        }

        .table tr:last-child td {
            border-bottom: none;
        }

        /* Badges */
        .badge {
            padding: 0.5rem 0.75rem;
            font-weight: 500;
            border-radius: 6px;
        }

        .bg-success {
            background-color: var(--success-light) !important;
            color: var(--success) !important;
        }

        .bg-warning {
            background-color: var(--warning-light) !important;
            color: var(--warning) !important;
        }

        /* Buttons */
        .btn {
            font-weight: 500;
            padding: 0.5rem 1.25rem;
            border-radius: 8px;
            transition: all 0.3s ease;
        }

        .btn-sm {
            padding: 0.25rem 0.75rem;
            font-size: 0.85rem;
        }

        .btn-primary {
            background-color: var(--primary);
            border-color: var(--primary);
        }

        .btn-primary:hover {
            background-color: var(--primary-dark);
            border-color: var(--primary-dark);
            transform: translateY(-2px);
            box-shadow: 0 4px 12px rgba(37, 99, 235, 0.2);
        }

        /* Charts */
        .chart-container {
            height: 300px;
            margin-top: 1rem;
        }

        /* Tabs */
        .finance-tabs {
            display: flex;
            gap: 1rem;
            margin-bottom: 1.5rem;
            border-bottom: 1px solid #e2e8f0;
            padding-bottom: 1rem;
        }

        .finance-tab {
            padding: 0.5rem 1.25rem;
            border-radius: 8px;
            font-weight: 500;
            cursor: pointer;
            transition: var(--transition);
            background: #f8fafc;
            color: var(--gray);
        }

        .finance-tab.active {
            background: var(--primary);
            color: white;
        }

        .finance-tab:hover:not(.active) {
            background: #e2e8f0;
        }

        /* Footer */
        footer {
            text-align: center;
            padding: 2rem 0;
            color: var(--gray);
            font-size: 0.9rem;
            background: white;
            box-shadow: 0 -4px 20px rgba(0, 0, 0, 0.03);
        }

        /* Animations */
        .fade-in {
            animation: fadeIn 0.5s ease-in-out;
        }

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(20px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Responsive */
        @media (max-width: 992px) {
            .navbar-collapse {
                background: white;
                padding: 1rem;
                border-radius: 10px;
                box-shadow: var(--box-shadow);
                margin-top: 0.5rem;
            }
        }

        @media (max-width: 768px) {
            .executive-card {
                margin-bottom: 1rem;
            }
            
            .table-responsive {
                margin: 0 -1rem;
                width: calc(100% + 2rem);
            }
            
            .section-title {
                font-size: 1.2rem;
            }
            
            .executive-card .value {
                font-size: 1.3rem;
            }
        }

        /* Custom Scrollbar */
        ::-webkit-scrollbar {
            width: 8px;
            height: 8px;
        }

        ::-webkit-scrollbar-track {
            background: #f1f5f9;
        }

        ::-webkit-scrollbar-thumb {
            background: #cbd5e1;
            border-radius: 4px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: #94a3b8;
        }

        /* Utility Classes */
        .text-primary { color: var(--primary) !important; }
        .text-success { color: var(--success) !important; }
        .text-warning { color: var(--warning) !important; }
        .text-danger { color: var(--danger) !important; }
        .bg-light-primary { background-color: var(--primary-light) !important; }
        .bg-light-success { background-color: var(--success-light) !important; }
        .bg-light-warning { background-color: var(--warning-light) !important; }
        .bg-light-danger { background-color: var(--danger-light) !important; }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg fixed-top animate__animated animate__fadeInDown">
        <div class="container-fluid">
            <a class="navbar-brand" href="/"><i class="fas fa-building"></i> TheenaWebs</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="/"><i class="fas fa-home me-1"></i> Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="/admin/dashboard"><i class="fas fa-tachometer-alt me-1"></i> Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="/admin/tasks"><i class="fas fa-tasks me-1"></i> Tasks</a></li>
                    <li class="nav-item"><a class="nav-link" href="/admin/employees"><i class="fas fa-users me-1"></i> Workforce</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/admin/finances"><i class="fas fa-dollar-sign me-1"></i> Finances</a></li>
                    <li class="nav-item"><a class="nav-link" href="/admin/reports"><i class="fas fa-chart-bar me-1"></i> Reports</a></li>
                    <li class="nav-item"><a class="nav-link" href="/logout"><i class="fas fa-sign-out-alt me-1"></i> Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Finances Content -->
    <div class="dashboard-container">
        <div class="section-card hover-scale animate__animated animate__fadeIn">
            <h2 class="section-title"><i class="fas fa-dollar-sign"></i> Financial Overview</h2>
            
            <div class="finance-tabs">
                <div class="finance-tab active" onclick="switchTab('overview')">Overview</div>
                <div class="finance-tab" onclick="switchTab('invoices')">Invoices</div>
                <div class="finance-tab" onclick="switchTab('expenses')">Expenses</div>
                <div class="finance-tab" onclick="switchTab('projections')">Projections</div>
            </div>
            
            <div id="overview-tab" class="tab-content">
                <div class="row g-4 mb-4">
                    <div class="col-md-4 col-sm-6">
                        <div class="executive-card d-flex align-items-center gap-3">
                            <i class="fas fa-wallet"></i>
                            <div>
                                <div class="title">Total Revenue</div>
                                <div class="value">$250,000</div>
                                <div class="text-success"><i class="fas fa-arrow-up me-1"></i> 12% from last month</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6">
                        <div class="executive-card d-flex align-items-center gap-3">
                            <i class="fas fa-money-bill-wave"></i>
                            <div>
                                <div class="title">Pending Payments</div>
                                <div class="value">$45,000</div>
                                <div class="text-warning"><i class="fas fa-exclamation-circle me-1"></i> 5 invoices due</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6">
                        <div class="executive-card d-flex align-items-center gap-3">
                            <i class="fas fa-chart-line"></i>
                            <div>
                                <div class="title">Profit Margin</div>
                                <div class="value">18%</div>
                                <div class="text-success"><i class="fas fa-arrow-up me-1"></i> 3% from last quarter</div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="row g-4 mb-4">
                    <div class="col-md-8">
                        <div class="section-card mb-0">
                            <h5 class="mb-3">Revenue Trends</h5>
                            <div id="revenue-chart" class="chart-container"></div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="section-card mb-0">
                            <h5 class="mb-3">Revenue Distribution</h5>
                            <div id="distribution-chart" class="chart-container"></div>
                        </div>
                    </div>
                </div>
                
                <div class="row mt-4">
                    <div class="col-12">
                        <h5 class="mb-3">Recent Transactions</h5>
                        <div class="table-responsive">
                            <table class="table">
                                <thead>
                                    <tr>
                                        <th>Transaction ID</th>
                                        <th>Date</th>
                                        <th>Description</th>
                                        <th>Amount</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>TRX-2023-001</td>
                                        <td>Mar 1, 2025</td>
                                        <td>Project Payment - Skyline Tower</td>
                                        <td class="text-success">+$15,000</td>
                                        <td><span class="badge bg-success">Completed</span></td>
                                    </tr>
                                    <tr>
                                        <td>TRX-2023-002</td>
                                        <td>Feb 28, 2025</td>
                                        <td>Equipment Purchase - Excavator</td>
                                        <td class="text-danger">-$8,500</td>
                                        <td><span class="badge bg-success">Completed</span></td>
                                    </tr>
                                    <tr>
                                        <td>TRX-2023-003</td>
                                        <td>Feb 25, 2025</td>
                                        <td>Project Payment - Riverside Apartments</td>
                                        <td class="text-success">+$22,000</td>
                                        <td><span class="badge bg-success">Completed</span></td>
                                    </tr>
                                    <tr>
                                        <td>TRX-2023-004</td>
                                        <td>Feb 22, 2025</td>
                                        <td>Material Purchase - Steel</td>
                                        <td class="text-danger">-$12,300</td>
                                        <td><span class="badge bg-success">Completed</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
            
            <div id="invoices-tab" class="tab-content" style="display: none;">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h5 class="mb-0">All Invoices</h5>
                    <div>
                        <button class="btn btn-primary"><i class="fas fa-plus me-2"></i> Create Invoice</button>
                    </div>
                </div>
                
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Invoice ID</th>
                                <th>Client</th>
                                <th>Amount</th>
                                <th>Issue Date</th>
                                <th>Due Date</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="invoice" items="${invoices}">
                                <tr>
                                    <td>${invoice.id}</td>
                                    <td>${invoice.client}</td>
                                    <td>${invoice.amount}</td>
                                    <td>${invoice.issueDate}</td>
                                    <td>${invoice.dueDate}</td>
                                    <td>
                                        <span class="badge ${invoice.status == 'Paid' ? 'bg-success' : 'bg-warning'}">
                                            ${invoice.status}
                                        </span>
                                    </td>
                                    <td>
                                        <div class="d-flex gap-2">
                                            <a href="/admin/finances/invoice/view?id=${invoice.id}" class="btn btn-sm btn-primary">
                                                <i class="fas fa-eye"></i>
                                            </a>
                                            <a href="/admin/finances/invoice/edit?id=${invoice.id}" class="btn btn-sm btn-warning">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <a href="/admin/finances/invoice/download?id=${invoice.id}" class="btn btn-sm btn-secondary">
                                                <i class="fas fa-download"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            
                            <!-- Sample data if no invoices are available -->
                            <c:if test="${empty invoices}">
                                <tr>
                                    <td>INV-2025-001</td>
                                    <td>Skyline Developers</td>
                                    <td>$25,000</td>
                                    <td>Feb 15, 2025</td>
                                    <td>Mar 15, 2025</td>
                                    <td><span class="badge bg-warning">Pending</span></td>
                                    <td>
                                        <div class="d-flex gap-2">
                                            <a href="#" class="btn btn-sm btn-primary">
                                                <i class="fas fa-eye"></i>
                                            </a>
                                            <a href="#" class="btn btn-sm btn-warning">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <a href="#" class="btn btn-sm btn-secondary">
                                                <i class="fas fa-download"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>INV-2025-002</td>
                                    <td>Riverside Properties</td>
                                    <td>$18,500</td>
                                    <td>Feb 10, 2025</td>
                                    <td>Mar 10, 2025</td>
                                    <td><span class="badge bg-success">Paid</span></td>
                                    <td>
                                        <div class="d-flex gap-2">
                                            <a href="#" class="btn btn-sm btn-primary">
                                                <i class="fas fa-eye"></i>
                                            </a>
                                            <a href="#" class="btn btn-sm btn-warning">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <a href="#" class="btn btn-sm btn-secondary">
                                                <i class="fas fa-download"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>INV-2025-003</td>
                                    <td>Metro Construction</td>
                                    <td>$32,000</td>
                                    <td>Feb 5, 2025</td>
                                    <td>Mar 5, 2025</td>
                                    <td><span class="badge bg-warning">Pending</span></td>
                                    <td>
                                        <div class="d-flex gap-2">
                                            <a href="#" class="btn btn-sm btn-primary">
                                                <i class="fas fa-eye"></i>
                                            </a>
                                            <a href="#" class="btn btn-sm btn-warning">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <a href="#" class="btn btn-sm btn-secondary">
                                                <i class="fas fa-download"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>
                
                <div class="d-flex justify-content-between align-items-center mt-4">
                    <div>Showing 1 to 10 of 24 entries</div>
                    <nav>
                        <ul class="pagination">
                            <li class="page-item disabled"><a class="page-link" href="#">Previous</a></li>
                            <li class="page-item active"><a class="page-link" href="#">1</a></li>
                            <li class="page-item"><a class="page-link" href="#">2</a></li>
                            <li class="page-item"><a class="page-link" href="#">3</a></li>
                            <li class="page-item"><a class="page-link" href="#">Next</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
            
            <div id="expenses-tab" class="tab-content" style="display: none;">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h5 class="mb-0">Expense Management</h5>
                    <div>
                        <button class="btn btn-primary"><i class="fas fa-plus me-2"></i> Add Expense</button>
                    </div>
                </div>
                
                <div class="row g-4 mb-4">
                    <div class="col-md-4 col-sm-6">
                        <div class="executive-card d-flex align-items-center gap-3">
                            <i class="fas fa-file-invoice-dollar"></i>
                            <div>
                                <div class="title">Total Expenses</div>
                                <div class="value">$175,000</div>
                                <div class="text-danger"><i class="fas fa-arrow-up me-1"></i> 8% from last month</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6">
                        <div class="executive-card d-flex align-items-center gap-3">
                            <i class="fas fa-tools"></i>
                            <div>
                                <div class="title">Equipment Costs</div>
                                <div class="value">$65,000</div>
                                <div class="text-success"><i class="fas fa-arrow-down me-1"></i> 5% from last month</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4 col-sm-6">
                        <div class="executive-card d-flex align-items-center gap-3">
                            <i class="fas fa-hard-hat"></i>
                            <div>
                                <div class="title">Labor Costs</div>
                                <div class="value">$85,000</div>
                                <div class="text-danger"><i class="fas fa-arrow-up me-1"></i> 10% from last month</div>
                            </div>
                        </div>
                    </div>
                </div>
                
                <div class="section-card mb-4">
                    <h5 class="mb-3">Expense Categories</h5>
                    <div id="expense-chart" class="chart-container"></div>
                </div>
                
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Expense ID</th>
                                <th>Category</th>
                                <th>Description</th>
                                <th>Date</th>
                                <th>Amount</th>
                                <th>Project</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>EXP-2025-001</td>
                                <td>Materials</td>
                                <td>Concrete Supply</td>
                                <td>Mar 1, 2025</td>
                                <td>$12,500</td>
                                <td>Skyline Tower</td>
                                <td>
                                    <div class="d-flex gap-2">
                                        <a href="#" class="btn btn-sm btn-primary">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="#" class="btn btn-sm btn-warning">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>EXP-2025-002</td>
                                <td>Equipment</td>
                                <td>Crane Rental</td>
                                <td>Feb 28, 2025</td>
                                <td>$8,000</td>
                                <td>Riverside Apartments</td>
                                <td>
                                    <div class="d-flex gap-2">
                                        <a href="#" class="btn btn-sm btn-primary">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="#" class="btn btn-sm btn-warning">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>EXP-2025-003</td>
                                <td>Labor</td>
                                <td>Contractor Payment</td>
                                <td>Feb 25, 2025</td>
                                <td>$15,000</td>
                                <td>Metro Office Complex</td>
                                <td>
                                    <div class="d-flex gap-2">
                                        <a href="#" class="btn btn-sm btn-primary">
                                            <i class="fas fa-eye"></i>
                                        </a>
                                        <a href="#" class="btn btn-sm btn-warning">
                                            <i class="fas fa-edit"></i>
                                        </a>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            
            <div id="projections-tab" class="tab-content" style="display: none;">
                <div class="row g-4 mb-4">
                    <div class="col-md-6">
                        <div class="section-card mb-0">
                            <h5 class="mb-3">Revenue Forecast</h5>
                            <div id="forecast-chart" class="chart-container"></div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="section-card mb-0">
                            <h5 class="mb-3">Cash Flow Projection</h5>
                            <div id="cashflow-chart" class="chart-container"></div>
                        </div>
                    </div>
                </div>
                
                <div class="section-card mt-4">
                    <h5 class="mb-3">Financial Projections</h5>
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Quarter</th>
                                    <th>Projected Revenue</th>
                                    <th>Projected Expenses</th>
                                    <th>Projected Profit</th>
                                    <th>Profit Margin</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Q2 2025</td>
                                    <td>$320,000</td>
                                    <td>$260,000</td>
                                    <td>$60,000</td>
                                    <td>18.75%</td>
                                </tr>
                                <tr>
                                    <td>Q3 2025</td>
                                    <td>$380,000</td>
                                    <td>$300,000</td>
                                    <td>$80,000</td>
                                    <td>21.05%</td>
                                </tr>
                                <tr>
                                    <td>Q4 2025</td>
                                    <td>$420,000</td>
                                    <td>$330,000</td>
                                    <td>$90,000</td>
                                    <td>21.43%</td>
                                </tr>
                                <tr>
                                    <td>Q1 2026</td>
                                    <td>$350,000</td>
                                    <td>$280,000</td>
                                    <td>$70,000</td>
                                    <td>20.00%</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="section-card hover-scale animate__animated animate__fadeIn">
            <h2 class="section-title"><i class="fas fa-file-invoice"></i> Payment Schedule</h2>
            <div class="row mb-4">
                <div class="col-md-6">
                    <div class="input-group">
                        <span class="input-group-text"><i class="fas fa-search"></i></span>
                        <input type="text" class="form-control" placeholder="Search payments...">
                    </div>
                </div>
                <div class="col-md-6 d-flex justify-content-md-end mt-3 mt-md-0">
                    <div class="btn-group">
                        <button class="btn btn-outline-primary">This Week</button>
                        <button class="btn btn-outline-primary">This Month</button>
                        <button class="btn btn-outline-primary">This Quarter</button>
                    </div>
                </div>
            </div>
            
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Payment ID</th>
                            <th>Project</th>
                            <th>Client</th>
                            <th>Amount</th>
                            <th>Due Date</th>
                            <th>Status</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>PMT-2025-001</td>
                            <td>Skyline Tower</td>
                            <td>Skyline Developers</td>
                            <td>$25,000</td>
                            <td>Mar 15, 2025</td>
                            <td><span class="badge bg-warning">Pending</span></td>
                            <td>
                                <div class="d-flex gap-2">
                                    <button class="btn btn-sm btn-success">Mark Paid</button>
                                    <button class="btn btn-sm btn-primary">Send Reminder</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>PMT-2025-002</td>
                            <td>Riverside Apartments</td>
                            <td>Riverside Properties</td>
                            <td>$18,500</td>
                            <td>Mar 10, 2025</td>
                            <td><span class="badge bg-success">Paid</span></td>
                            <td>
                                <div class="d-flex gap-2">
                                    <button class="btn btn-sm btn-secondary">View Receipt</button>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td>PMT-2025-003</td>
                            <td>Metro Office Complex</td>
                            <td>Metro Construction</td>
                            <td>$32,000</td>
                            <td>Mar 5, 2025</td>
                            <td><span class="badge bg-warning">Pending</span></td>
                            <td>
                                <div class="d-flex gap-2">
                                    <button class="btn btn-sm btn-success">Mark Paid</button>
                                    <button class="btn btn-sm btn-primary">Send Reminder</button>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="animate__animated animate__fadeInUp">
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-center text-md-start">
                    © 2025 TheenaWebs. All rights reserved.
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <a href="#" class="text-decoration-none text-secondary me-3">Privacy Policy</a>
                    <a href="#" class="text-decoration-none text-secondary me-3">Terms of Service</a>
                    <a href="#" class="text-decoration-none text-secondary">Contact Us</a>
                </div>
            </div>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
    <script>
        // Tab switching functionality
        function switchTab(tabName) {
            // Hide all tab contents
            document.querySelectorAll('.tab-content').forEach(tab => {
                tab.style.display = 'none';
            });
            
            // Remove active class from all tabs
            document.querySelectorAll('.finance-tab').forEach(tab => {
                tab.classList.remove('active');
            });
            
            // Show the selected tab content
            document.getElementById(tabName + '-tab').style.display = 'block';
            
            // Add active class to the clicked tab
            document.querySelectorAll('.finance-tab').forEach(tab => {
                if (tab.textContent.toLowerCase().includes(tabName)) {
                    tab.classList.add('active');
                }
            });
        }
        
        // Initialize charts when the page loads
        document.addEventListener('DOMContentLoaded', function() {
            // Revenue Chart
            var revenueOptions = {
                series: [{
                    name: 'Revenue',
                    data: [30000, 40000, 35000, 50000, 49000, 60000, 70000, 91000, 125000]
                }],
                chart: {
                    height: 300,
                    type: 'area',
                    toolbar: {
                        show: false
                    }
                },
                colors: ['#2563eb'],
                dataLabels: {
                    enabled: false
                },
                stroke: {
                    curve: 'smooth'
                },
                xaxis: {
                    categories: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep'],
                },
                tooltip: {
                    y: {
                        formatter: function (val) {
                            return "$" + val.toLocaleString()
                        }
                    }
                }
            };

            var revenueChart = new ApexCharts(document.querySelector("#revenue-chart"), revenueOptions);
            revenueChart.render();
            
            // Distribution Chart
            var distributionOptions = {
                series: [44, 55, 13, 33],
                chart: {
                    height: 300,
                    type: 'donut',
                },
                labels: ['Commercial', 'Residential', 'Industrial', 'Infrastructure'],
                colors: ['#2563eb', '#16a34a', '#eab308', '#64748b'],
                responsive: [{
                    breakpoint: 480,
                    options: {
                        chart: {
                            width: 200
                        },
                        legend: {
                            position: 'bottom'
                        }
                    }
                }]
            };

            var distributionChart = new ApexCharts(document.querySelector("#distribution-chart"), distributionOptions);
            distributionChart.render();
            
            // Expense Chart
            var expenseOptions = {
                series: [{
                    data: [65000, 85000, 25000, 15000, 10000]
                }],
                chart: {
                    type: 'bar',
                    height: 300,
                    toolbar: {
                        show: false
                    }
                },
                colors: ['#2563eb'],
                plotOptions: {
                    bar: {
                        borderRadius: 4,
                        horizontal: true,
                    }
                },
                dataLabels: {
                    enabled: false
                },
                xaxis: {
                    categories: ['Equipment', 'Labor', 'Materials', 'Permits', 'Miscellaneous'],
                },
                tooltip: {
                    y: {
                        formatter: function (val) {
                            return "$" + val.toLocaleString()
                        }
                    }
                }
            };

            var expenseChart = new ApexCharts(document.querySelector("#expense-chart"), expenseOptions);
            expenseChart.render();
            
            // Forecast Chart
            var forecastOptions = {
                series: [{
                    name: 'Projected Revenue',
                    data: [320000, 380000, 420000, 350000]
                }],
                chart: {
                    height: 300,
                    type: 'line',
                    toolbar: {
                        show: false
                    }
                },
                colors: ['#2563eb'],
                dataLabels: {
                    enabled: false
                },
                stroke: {
                    curve: 'straight',
                    width: 3
                },
                grid: {
                    row: {
                        colors: ['#f3f3f3', 'transparent'],
                        opacity: 0.5
                    },
                },
                markers: {
                    size: 6
                },
                xaxis: {
                    categories: ['Q2 2025', 'Q3 2025', 'Q4 2025', 'Q1 2026'],
                },
                tooltip: {
                    y: {
                        formatter: function (val) {
                            return "$" + val.toLocaleString()
                        }
                    }
                }
            };

            var forecastChart = new ApexCharts(document.querySelector("#forecast-chart"), forecastOptions);
            forecastChart.render();
            
            // Cash Flow Chart
            var cashflowOptions = {
                series: [{
                    name: 'Income',
                    data: [320000, 380000, 420000, 350000]
                }, {
                    name: 'Expenses',
                    data: [260000, 300000, 330000, 280000]
                }],
                chart: {
                    type: 'bar',
                    height: 300,
                    stacked: true,
                    toolbar: {
                        show: false
                    }
                },
                colors: ['#16a34a', '#dc2626'],
                plotOptions: {
                    bar: {
                        horizontal: false,
                        borderRadius: 4,
                    },
                },
                xaxis: {
                    categories: ['Q2 2025', 'Q3 2025', 'Q4 2025', 'Q1 2026'],
                },
                legend: {
                    position: 'top'
                },
                fill: {
                    opacity: 1
                },
                tooltip: {
                    y: {
                        formatter: function (val) {
                            return "$" + val.toLocaleString()
                        }
                    }
                }
            };

            var cashflowChart = new ApexCharts(document.querySelector("#cashflow-chart"), cashflowOptions);
            cashflowChart.render();
        });
    </script>
</body>
</html>

