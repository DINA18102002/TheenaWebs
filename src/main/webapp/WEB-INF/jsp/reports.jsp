<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TheenaWebs - Reports</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/animate.css@4.1.1/animate.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap" rel="stylesheet">
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

        .section-card:hover {
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

        /* Report Options */
        .report-option {
            background: #fff;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 2rem 1.5rem;
            text-align: center;
            transition: var(--transition);
            height: 100%;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            border: 1px solid transparent;
        }

        .report-option:hover {
            transform: translateY(-8px);
            box-shadow: 0 12px 30px rgba(37, 99, 235, 0.1);
            border-color: var(--primary-light);
        }

        .report-option i {
            font-size: 2.5rem;
            color: var(--primary);
            margin-bottom: 1rem;
            transition: var(--transition);
        }

        .report-option:hover i {
            transform: scale(1.1);
        }

        .report-option-title {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 0.5rem;
            color: var(--secondary);
        }

        .report-option-desc {
            font-size: 0.85rem;
            color: var(--gray);
            margin-bottom: 1rem;
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

        .btn-action {
            padding: 0.5rem 1rem;
            border-radius: 6px;
            font-size: 0.9rem;
            font-weight: 500;
            transition: var(--transition);
        }

        .btn-action:hover {
            transform: translateY(-2px);
        }

        /* Custom Report Form */
        .custom-report-form {
            background: #f8fafc;
            border-radius: var(--border-radius);
            padding: 1.5rem;
            margin-top: 2rem;
            border: 1px dashed #cbd5e1;
            display: none;
        }

        /* Stats Cards */
        .stats-card {
            background: #fff;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 1.5rem;
            height: 100%;
            transition: var(--transition);
            border-left: 4px solid var(--primary);
        }

        .stats-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1);
        }

        .stats-card i {
            font-size: 2rem;
            color: var(--primary);
            margin-bottom: 1rem;
        }

        .stats-card .title {
            font-size: 0.9rem;
            color: var(--gray);
            margin-bottom: 0.25rem;
        }

        .stats-card .value {
            font-size: 1.5rem;
            font-weight: 600;
            color: var(--secondary);
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

        .pulse {
            animation: pulse 2s infinite;
        }

        @keyframes pulse {
            0% { transform: scale(1); }
            50% { transform: scale(1.05); }
            100% { transform: scale(1); }
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
            .report-option {
                margin-bottom: 1rem;
            }
            
            .table-responsive {
                margin: 0 -1rem;
                width: calc(100% + 2rem);
            }
            
            .section-title {
                font-size: 1.2rem;
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
                    <li class="nav-item"><a class="nav-link" href="/admin/finances"><i class="fas fa-dollar-sign me-1"></i> Finances</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/admin/reports"><i class="fas fa-chart-bar me-1"></i> Reports</a></li>
                    <li class="nav-item"><a class="nav-link" href="/logout"><i class="fas fa-sign-out-alt me-1"></i> Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Reports Content -->
    <div class="dashboard-container">
        <div class="row mb-4">
            <div class="col-md-8">
                <div class="section-card animate__animated animate__fadeIn">
                    <h2 class="section-title"><i class="fas fa-chart-line"></i> Reports Dashboard</h2>
                    
                    <div class="row g-4 mb-4">
                        <div class="col-md-4 col-sm-6">
                            <div class="stats-card d-flex flex-column">
                                <i class="fas fa-file-alt"></i>
                                <div class="title">Total Reports</div>
                                <div class="value">42</div>
                                <div class="text-success mt-2"><i class="fas fa-arrow-up me-1"></i> 15% from last month</div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <div class="stats-card d-flex flex-column">
                                <i class="fas fa-download"></i>
                                <div class="title">Downloaded Reports</div>
                                <div class="value">28</div>
                                <div class="text-success mt-2"><i class="fas fa-arrow-up me-1"></i> 8% from last month</div>
                            </div>
                        </div>
                        <div class="col-md-4 col-sm-6">
                            <div class="stats-card d-flex flex-column">
                                <i class="fas fa-clock"></i>
                                <div class="title">Pending Reports</div>
                                <div class="value">3</div>
                                <div class="text-warning mt-2"><i class="fas fa-exclamation-circle me-1"></i> Need attention</div>
                            </div>
                        </div>
                    </div>
                    
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h5 class="mb-0">Recent Reports</h5>
                        <div class="d-flex gap-2">
                            <div class="dropdown">
                                <button class="btn btn-outline-secondary dropdown-toggle" type="button" id="filterDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fas fa-filter me-2"></i> Filter
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="filterDropdown">
                                    <li><a class="dropdown-item" href="#">All Reports</a></li>
                                    <li><a class="dropdown-item" href="#">Financial Reports</a></li>
                                    <li><a class="dropdown-item" href="#">Workforce Reports</a></li>
                                    <li><a class="dropdown-item" href="#">Project Reports</a></li>
                                </ul>
                            </div>
                            <div class="dropdown">
                                <button class="btn btn-outline-secondary dropdown-toggle" type="button" id="sortDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="fas fa-sort me-2"></i> Sort
                                </button>
                                <ul class="dropdown-menu" aria-labelledby="sortDropdown">
                                    <li><a class="dropdown-item" href="#">Newest First</a></li>
                                    <li><a class="dropdown-item" href="#">Oldest First</a></li>
                                    <li><a class="dropdown-item" href="#">Name (A-Z)</a></li>
                                    <li><a class="dropdown-item" href="#">Name (Z-A)</a></li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>Report ID</th>
                                    <th>Type</th>
                                    <th>Generated Date</th>
                                    <th>Status</th>
                                    <th>Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="report" items="${reports}">
                                    <tr>
                                        <td>${report.id}</td>
                                        <td>${report.type}</td>
                                        <td>${report.generatedDate}</td>
                                        <td>
                                            <span class="badge ${report.status == 'Completed' ? 'bg-success' : 'bg-warning'}">
                                                ${report.status}
                                            </span>
                                        </td>
                                        <td>
                                            <a href="/admin/reports/download?id=${report.id}" class="btn btn-primary btn-action">
                                                <i class="fas fa-download me-2"></i> Download
                                            </a>
                                        </td>
                                    </tr>
                                </c:forEach>
                                
                                <!-- Sample data if no reports are available -->
                                <c:if test="${empty reports}">
                                    <tr>
                                        <td>RPT-2025-001</td>
                                        <td>Financial Report</td>
                                        <td>Mar 1, 2025</td>
                                        <td><span class="badge bg-success">Completed</span></td>
                                        <td>
                                            <a href="#" class="btn btn-primary btn-action">
                                                <i class="fas fa-download me-2"></i> Download
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>RPT-2025-002</td>
                                        <td>Workforce Report</td>
                                        <td>Feb 28, 2025</td>
                                        <td><span class="badge bg-success">Completed</span></td>
                                        <td>
                                            <a href="#" class="btn btn-primary btn-action">
                                                <i class="fas fa-download me-2"></i> Download
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>RPT-2025-003</td>
                                        <td>Project Report</td>
                                        <td>Feb 25, 2025</td>
                                        <td><span class="badge bg-warning">Processing</span></td>
                                        <td>
                                            <button class="btn btn-secondary btn-action" disabled>
                                                <i class="fas fa-spinner fa-spin me-2"></i> Processing
                                            </button>
                                        </td>
                                    </tr>
                                </c:if>
                            </tbody>
                        </table>
                    </div>
                    
                    <div class="d-flex justify-content-between align-items-center mt-4">
                        <div>Showing 1 to 10 of 42 entries</div>
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
            </div>
            
            <div class="col-md-4">
                <div class="section-card animate__animated animate__fadeIn">
                    <h2 class="section-title"><i class="fas fa-bell"></i> Notifications</h2>
                    
                    <div class="list-group">
                        <a href="#" class="list-group-item list-group-item-action">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1">Financial Report Ready</h6>
                                <small>3 hours ago</small>
                            </div>
                            <p class="mb-1">Q1 2025 Financial Report is ready for download.</p>
                            <small class="text-success"><i class="fas fa-check-circle me-1"></i> Completed</small>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1">Project Report Processing</h6>
                                <small>5 hours ago</small>
                            </div>
                            <p class="mb-1">Skyline Tower Project Report is being processed.</p>
                            <small class="text-warning"><i class="fas fa-clock me-1"></i> In Progress</small>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1">Workforce Report Ready</h6>
                                <small>1 day ago</small>
                            </div>
                            <p class="mb-1">Monthly Workforce Report is ready for download.</p>
                            <small class="text-success"><i class="fas fa-check-circle me-1"></i> Completed</small>
                        </a>
                        <a href="#" class="list-group-item list-group-item-action">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1">Custom Report Failed</h6>
                                <small>2 days ago</small>
                            </div>
                            <p class="mb-1">Custom Report generation failed. Please try again.</p>
                            <small class="text-danger"><i class="fas fa-exclamation-circle me-1"></i> Failed</small>
                        </a>
                    </div>
                    
                    <div class="d-grid gap-2 mt-3">
                        <button class="btn btn-outline-primary">View All Notifications</button>
                    </div>
                </div>
                
                <div class="section-card animate__animated animate__fadeIn">
                    <h2 class="section-title"><i class="fas fa-calendar"></i> Scheduled Reports</h2>
                    
                    <div class="list-group">
                        <div class="list-group-item">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1">Monthly Financial Report</h6>
                                <small class="text-primary">Monthly</small>
                            </div>
                            <p class="mb-1">Next generation: Apr 1, 2025</p>
                            <div class="form-check form-switch mt-2">
                                <input class="form-check-input" type="checkbox" id="financialReportSwitch" checked>
                                <label class="form-check-label" for="financialReportSwitch">Active</label>
                            </div>
                        </div>
                        <div class="list-group-item">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1">Weekly Project Progress</h6>
                                <small class="text-primary">Weekly</small>
                            </div>
                            <p class="mb-1">Next generation: Mar 8, 2025</p>
                            <div class="form-check form-switch mt-2">
                                <input class="form-check-input" type="checkbox" id="projectReportSwitch" checked>
                                <label class="form-check-label" for="projectReportSwitch">Active</label>
                            </div>
                        </div>
                        <div class="list-group-item">
                            <div class="d-flex w-100 justify-content-between">
                                <h6 class="mb-1">Quarterly Performance</h6>
                                <small class="text-primary">Quarterly</small>
                            </div>
                            <p class="mb-1">Next generation: Apr 1, 2025</p>
                            <div class="form-check form-switch mt-2">
                                <input class="form-check-input" type="checkbox" id="performanceReportSwitch" checked>
                                <label class="form-check-label" for="performanceReportSwitch">Active</label>
                            </div>
                        </div>
                    </div>
                    
                    <div class="d-grid gap-2 mt-3">
                        <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#scheduleReportModal">
                            <i class="fas fa-plus me-2"></i> Schedule New Report
                        </button>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="section-card mb-5 animate__animated animate__fadeIn">
            <h2 class="section-title"><i class="fas fa-chart-line"></i> Generate New Report</h2>
            <div class="row g-4">
                <div class="col-md-3 col-sm-6">
                    <div class="report-option" onclick="showReportForm('financial')">
                        <i class="fas fa-dollar-sign"></i>
                        <div class="report-option-title">Financial Report</div>
                        <div class="report-option-desc">Comprehensive financial analysis including revenue, expenses, and profit margins.</div>
                        <button class="btn btn-sm btn-primary">Generate</button>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="report-option" onclick="showReportForm('workforce')">
                        <i class="fas fa-users"></i>
                        <div class="report-option-title">Workforce Report</div>
                        <div class="report-option-desc">Employee performance, attendance, and productivity metrics.</div>
                        <button class="btn btn-sm btn-primary">Generate</button>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="report-option" onclick="showReportForm('project')">
                        <i class="fas fa-clipboard-list"></i>
                        <div class="report-option-title">Project Report</div>
                        <div class="report-option-desc">Project progress, timeline adherence, and resource allocation.</div>
                        <button class="btn btn-sm btn-primary">Generate</button>
                    </div>
                </div>
                <div class="col-md-3 col-sm-6">
                    <div class="report-option pulse" onclick="showReportForm('custom')">
                        <i class="fas fa-cog"></i>
                        <div class="report-option-title">Custom Report</div>
                        <div class="report-option-desc">Create a customized report with specific metrics and parameters.</div>
                        <button class="btn btn-sm btn-primary">Generate</button>
                    </div>
                </div>
            </div>
            
            <!-- Financial Report Form -->
            <div id="financial-report-form" class="custom-report-form animate__animated animate__fadeIn">
                <h5 class="mb-3"><i class="fas fa-dollar-sign me-2"></i> Financial Report Parameters</h5>
                <form>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">Report Title</label>
                            <input type="text" class="form-control" placeholder="e.g. Q1 2025 Financial Report">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Report Type</label>
                            <select class="form-select">
                                <option>Comprehensive Financial Report</option>
                                <option>Revenue Analysis</option>
                                <option>Expense Analysis</option>
                                <option>Profit & Loss Statement</option>
                                <option>Cash Flow Statement</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Date Range</label>
                            <div class="input-group">
                                <input type="date" class="form-control">
                                <span class="input-group-text">to</span>
                                <input type="date" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Projects to Include</label>
                            <select class="form-select" multiple>
                                <option selected>All Projects</option>
                                <option>Skyline Tower</option>
                                <option>Riverside Apartments</option>
                                <option>Metro Office Complex</option>
                                <option>Harbor Bridge Renovation</option>
                            </select>
                        </div>
                        <div class="col-md-12">
                            <label class="form-label">Additional Metrics</label>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="revenueByProject" checked>
                                <label class="form-check-label" for="revenueByProject">Revenue by Project</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="expenseCategories" checked>
                                <label class="form-check-label" for="expenseCategories">Expense Categories Breakdown</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="profitMargins" checked>
                                <label class="form-check-label" for="profitMargins">Profit Margins Analysis</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="cashFlow">
                                <label class="form-check-label" for="cashFlow">Cash Flow Analysis</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="budgetComparison">
                                <label class="form-check-label" for="budgetComparison">Budget vs. Actual Comparison</label>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label class="form-label">Report Format</label>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="reportFormat" id="formatPDF" checked>
                                <label class="form-check-label" for="formatPDF">PDF</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="reportFormat" id="formatExcel">
                                <label class="form-check-label" for="formatExcel">Excel</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="reportFormat" id="formatCSV">
                                <label class="form-check-label" for="formatCSV">CSV</label>
                            </div>
                        </div>
                        <div class="col-md-12 mt-4">
                            <div class="d-flex gap-2">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-file-download me-2"></i> Generate Report
                                </button>
                                <button type="button" class="btn btn-outline-secondary" onclick="hideReportForm()">
                                    Cancel
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            
            <!-- Workforce Report Form -->
            <div id="workforce-report-form" class="custom-report-form animate__animated animate__fadeIn">
                <h5 class="mb-3"><i class="fas fa-users me-2"></i> Workforce Report Parameters</h5>
                <form>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">Report Title</label>
                            <input type="text" class="form-control" placeholder="e.g. Monthly Workforce Report">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Report Type</label>
                            <select class="form-select">
                                <option>Comprehensive Workforce Report</option>
                                <option>Performance Analysis</option>
                                <option>Attendance Report</option>
                                <option>Skills Assessment</option>
                                <option>Productivity Analysis</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Date Range</label>
                            <div class="input-group">
                                <input type="date" class="form-control">
                                <span class="input-group-text">to</span>
                                <input type="date" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Departments</label>
                            <select class="form-select" multiple>
                                <option selected>All Departments</option>
                                <option>Construction</option>
                                <option>Engineering</option>
                                <option>Architecture</option>
                                <option>Administration</option>
                                <option>Finance</option>
                            </select>
                        </div>
                        <div class="col-md-12">
                            <label class="form-label">Additional Metrics</label>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="performanceMetrics" checked>
                                <label class="form-check-label" for="performanceMetrics">Performance Metrics</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="attendanceRecords" checked>
                                <label class="form-check-label" for="attendanceRecords">Attendance Records</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="skillsMatrix">
                                <label class="form-check-label" for="skillsMatrix">Skills Matrix</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="trainingNeeds">
                                <label class="form-check-label" for="trainingNeeds">Training Needs Assessment</label>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label class="form-label">Report Format</label>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="reportFormat" id="formatPDF2" checked>
                                <label class="form-check-label" for="formatPDF2">PDF</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="reportFormat" id="formatExcel2">
                                <label class="form-check-label" for="formatExcel2">Excel</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="reportFormat" id="formatCSV2">
                                <label class="form-check-label" for="formatCSV2">CSV</label>
                            </div>
                        </div>
                        <div class="col-md-12 mt-4">
                            <div class="d-flex gap-2">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-file-download me-2"></i> Generate Report
                                </button>
                                <button type="button" class="btn btn-outline-secondary" onclick="hideReportForm()">
                                    Cancel
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            
            <!-- Project Report Form -->
            <div id="project-report-form" class="custom-report-form animate__animated animate__fadeIn">
                <h5 class="mb-3"><i class="fas fa-clipboard-list me-2"></i> Project Report Parameters</h5>
                <form>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">Report Title</label>
                            <input type="text" class="form-control" placeholder="e.g. Skyline Tower Project Report">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Project</label>
                            <select class="form-select">
                                <option>All Projects</option>
                                <option>Skyline Tower</option>
                                <option>Riverside Apartments</option>
                                <option>Metro Office Complex</option>
                                <option>Harbor Bridge Renovation</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Date Range</label>
                            <div class="input-group">
                                <input type="date" class="form-control">
                                <span class="input-group-text">to</span>
                                <input type="date" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Report Type</label>
                            <select class="form-select">
                                <option>Comprehensive Project Report</option>
                                <option>Progress Report</option>
                                <option>Timeline Analysis</option>
                                <option>Resource Allocation</option>
                                <option>Budget Analysis</option>
                            </select>
                        </div>
                        <div class="col-md-12">
                            <label class="form-label">Additional Metrics</label>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="timelineAdherence" checked>
                                <label class="form-check-label" for="timelineAdherence">Timeline Adherence</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="budgetTracking" checked>
                                <label class="form-check-label" for="budgetTracking">Budget Tracking</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="resourceUtilization" checked>
                                <label class="form-check-label" for="resourceUtilization">Resource Utilization</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="qualityMetrics">
                                <label class="form-check-label" for="qualityMetrics">Quality Metrics</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="riskAssessment">
                                <label class="form-check-label" for="riskAssessment">Risk Assessment</label>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label class="form-label">Report Format</label>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="reportFormat" id="formatPDF3" checked>
                                <label class="form-check-label" for="formatPDF3">PDF</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="reportFormat" id="formatExcel3">
                                <label class="form-check-label" for="formatExcel3">Excel</label>
                            </div>
                            <div class="form-check form-check-inline">
                                <input class="form-check-input" type="radio" name="reportFormat" id="formatCSV3">
                                <label class="form-check-label" for="formatCSV3">CSV</label>
                            </div>
                        </div>
                        <div class="col-md-12 mt-4">
                            <div class="d-flex gap-2">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-file-download me-2"></i> Generate Report
                                </button>
                                <button type="button" class="btn btn-outline-secondary" onclick="hideReportForm()">
                                    Cancel
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
            
            <!-- Custom Report Form -->
            <div id="custom-report-form" class="custom-report-form animate__animated animate__fadeIn">
                <h5 class="mb-3"><i class="fas fa-cog me-2"></i> Custom Report Builder</h5>
                <form>
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label">Report Title</label>
                            <input type="text" class="form-control" placeholder="Enter custom report title">
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Date Range</label>
                            <div class="input-group">
                                <input type="date" class="form-control">
                                <span class="input-group-text">to</span>
                                <input type="date" class="form-control">
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label class="form-label">Data Sources</label>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="financialData" checked>
                                <label class="form-check-label" for="financialData">Financial Data</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="projectData" checked>
                                <label class="form-check-label" for="projectData">Project Data</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="workforceData" checked>
                                <label class="form-check-label" for="workforceData">Workforce Data</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="clientData">
                                <label class="form-check-label" for="clientData">Client Data</label>
                            </div>
                        </div>
                        <div class="col-md-12">
                            <label class="form-label">Select Metrics</label>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="revenue" checked>
                                        <label class="form-check-label" for="revenue">Revenue</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="expenses" checked>
                                        <label class="form-check-label" for="expenses">Expenses</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="profitMargin" checked>
                                        <label class="form-check-label" for="profitMargin">Profit Margin</label>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="projectProgress" checked>
                                        <label class="form-check-label" for="projectProgress">Project Progress</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="resourceAllocation">
                                        <label class="form-check-label" for="resourceAllocation">Resource Allocation</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="timeline">
                                        <label class="form-check-label" for="timeline">Timeline</label>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="employeePerformance">
                                        <label class="form-check-label" for="employeePerformance">Employee Performance</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="attendance">
                                        <label class="form-check-label" for="attendance">Attendance</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" id="productivity">
                                        <label class="form-check-label" for="productivity">Productivity</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Visualization Types</label>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="tables" checked>
                                <label class="form-check-label" for="tables">Tables</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="barCharts" checked>
                                <label class="form-check-label" for="barCharts">Bar Charts</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="lineCharts" checked>
                                <label class="form-check-label" for="lineCharts">Line Charts</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="checkbox" id="pieCharts">
                                <label class="form-check-label" for="pieCharts">Pie Charts</label>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label">Report Format</label>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="reportFormat" id="formatPDF4" checked>
                                <label class="form-check-label" for="formatPDF4">PDF</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="reportFormat" id="formatExcel4">
                                <label class="form-check-label" for="formatExcel4">Excel</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="reportFormat" id="formatCSV4">
                                <label class="form-check-label" for="formatCSV4">CSV</label>
                            </div>
                            <div class="form-check">
                                <input class="form-check-input" type="radio" name="reportFormat" id="formatDashboard">
                                <label class="form-check-label" for="formatDashboard">Interactive Dashboard</label>
                            </div>
                        </div>
                        <div class="col-md-12 mt-4">
                            <div class="d-flex gap-2">
                                <button type="submit" class="btn btn-primary">
                                    <i class="fas fa-file-download me-2"></i> Generate Report
                                </button>
                                <button type="button" class="btn btn-outline-secondary" onclick="hideReportForm()">
                                    Cancel
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <!-- Schedule Report Modal -->
    <div class="modal fade" id="scheduleReportModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title"><i class="fas fa-calendar-plus me-2"></i> Schedule New Report</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <form>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <label class="form-label">Report Title</label>
                                <input type="text" class="form-control" placeholder="Enter report title">
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Report Type</label>
                                <select class="form-select">
                                    <option>Financial Report</option>
                                    <option>Workforce Report</option>
                                    <option>Project Report</option>
                                    <option>Custom Report</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Frequency</label>
                                <select class="form-select">
                                    <option>Daily</option>
                                    <option>Weekly</option>
                                    <option>Monthly</option>
                                    <option>Quarterly</option>
                                    <option>Yearly</option>
                                </select>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label">Start Date</label>
                                <input type="date" class="form-control">
                            </div>
                            <div class="col-md-12">
                                <label class="form-label">Recipients</label>
                                <select class="form-select" multiple>
                                    <option selected>admin@theenawebs.com</option>
                                    <option>finance@theenawebs.com</option>
                                    <option>projects@theenawebs.com</option>
                                    <option>hr@theenawebs.com</option>
                                </select>
                                <small class="text-muted">Hold Ctrl/Cmd to select multiple recipients</small>
                            </div>
                            <div class="col-md-12">
                                <label class="form-label">Report Format</label>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="modalReportFormat" id="modalFormatPDF" checked>
                                    <label class="form-check-label" for="modalFormatPDF">PDF</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="modalReportFormat" id="modalFormatExcel">
                                    <label class="form-check-label" for="modalFormatExcel">Excel</label>
                                </div>
                                <div class="form-check form-check-inline">
                                    <input class="form-check-input" type="radio" name="modalReportFormat" id="modalFormatCSV">
                                    <label class="form-check-label" for="modalFormatCSV">CSV</label>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="button" class="btn btn-primary">Schedule Report</button>
                </div>
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
    <script>
        // Function to show report form
        function showReportForm(formType) {
            // Hide all forms first
            hideReportForm();
            
            // Show the selected form
            document.getElementById(formType + '-report-form').style.display = 'block';
            
            // Scroll to the form
            document.getElementById(formType + '-report-form').scrollIntoView({ behavior: 'smooth', block: 'start' });
        }
        
        // Function to hide all report forms
        function hideReportForm() {
            document.querySelectorAll('.custom-report-form').forEach(form => {
                form.style.display = 'none';
            });
        }
        
        // Add animation classes when page loads
        document.addEventListener('DOMContentLoaded', function() {
            // Add hover effect to report options
            document.querySelectorAll('.report-option').forEach(option => {
                option.addEventListener('mouseenter', function() {
                    this.querySelector('i').classList.add('animate__animated', 'animate__heartBeat');
                });
                
                option.addEventListener('mouseleave', function() {
                    this.querySelector('i').classList.remove('animate__animated', 'animate__heartBeat');
                });
            });
        });
    </script>
</body>
</html>
