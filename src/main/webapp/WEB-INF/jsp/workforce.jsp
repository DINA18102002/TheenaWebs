<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TheenBuild - Workforce</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css">
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

        /* Responsive */
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
        }
    </style>
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg fixed-top animate__animated animate__fadeInDown">
        <div class="container-fluid">
            <a class="navbar-brand" href="/"><i class="fas fa-building"></i> TheenBuild</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="/"><i class="fas fa-home me-1"></i> Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="/admin/dashboard"><i class="fas fa-tachometer-alt me-1"></i> Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="/admin/tasks"><i class="fas fa-tasks me-1"></i> Tasks</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/admin/employees"><i class="fas fa-users me-1"></i> Workforce</a></li>
                    <li class="nav-item"><a class="nav-link" href="/admin/finances"><i class="fas fa-dollar-sign me-1"></i> Finances</a></li>
                    <li class="nav-item"><a class="nav-link" href="/admin/reports"><i class="fas fa-chart-bar me-1"></i> Reports</a></li>
                    <li class="nav-item"><a class="nav-link" href="/logout"><i class="fas fa-sign-out-alt me-1"></i> Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Workforce Content -->
    <div class="dashboard-container">
        <!-- Workforce Overview -->
        <div class="section-card hover-scale animate__animated animate__fadeIn">
            <h2 class="section-title"><i class="fas fa-users"></i> Workforce Overview</h2>
            
            <div class="row g-4 mb-4">
                <div class="col-md-4 col-sm-6">
                    <div class="executive-card d-flex align-items-center gap-3">
                        <i class="fas fa-users"></i>
                        <div>
                            <div class="title">Total Employees</div>
                            <div class="value">45</div>
                            <div class="text-success"><i class="fas fa-arrow-up me-1"></i> 3 new this month</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="executive-card d-flex align-items-center gap-3">
                        <i class="fas fa-user-check"></i>
                        <div>
                            <div class="title">Active Workers</div>
                            <div class="value">42</div>
                            <div class="text-success"><i class="fas fa-check-circle me-1"></i> 93% active rate</div>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-6">
                    <div class="executive-card d-flex align-items-center gap-3">
                        <i class="fas fa-user-clock"></i>
                        <div>
                            <div class="title">On Leave</div>
                            <div class="value">3</div>
                            <div class="text-warning"><i class="fas fa-exclamation-circle me-1"></i> 2 pending approvals</div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Employee List -->
            <div class="mt-4">
                <div class="d-flex justify-content-between align-items-center mb-4">
                    <h5 class="mb-0">Employee Directory</h5>
                    <div>
                        <button class="btn btn-primary" onclick="location.href='/admin/employees/add'">
                            <i class="fas fa-user-plus me-2"></i> Add Employee
                        </button>
                    </div>
                </div>

                <div class="row mb-4">
                    <div class="col-md-6">
                        <div class="input-group">
                            <span class="input-group-text"><i class="fas fa-search"></i></span>
                            <input type="text" class="form-control" placeholder="Search employees...">
                        </div>
                    </div>
                    <div class="col-md-6 d-flex justify-content-md-end mt-3 mt-md-0">
                        <div class="btn-group">
                            <button class="btn btn-outline-primary">Full-Time</button>
                            <button class="btn btn-outline-primary">Part-Time</button>
                            <button class="btn btn-outline-primary">Contract</button>
                        </div>
                    </div>
                </div>

                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Role</th>
                                <th>Email</th>
                                <th>Department</th>
                                <th>Status</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="employee" items="${employeeRepository.findAll()}">
                                <tr>
                                    <td>${employee.id}</td>
                                    <td>${employee.name}</td>
                                    <td>${employee.role}</td>
                                    <td>${employee.email}</td>
                                    <td>${employee.department}</td>
                                    <td>
                                        <span class="badge ${employee.verified ? 'bg-success' : 'bg-warning'}">
                                            ${employee.verified ? 'Active' : 'Pending'}
                                        </span>
                                    </td>
                                    <td>
                                        <div class="d-flex gap-2">
                                            <a href="/admin/employees/view?id=${employee.id}" class="btn btn-sm btn-primary">
                                                <i class="fas fa-eye"></i>
                                            </a>
                                            <a href="/admin/employees/edit?id=${employee.id}" class="btn btn-sm btn-warning">
                                                <i class="fas fa-edit"></i>
                                            </a>
                                            <form action="/admin/employees/delete" method="post" class="d-inline">
                                                <input type="hidden" name="id" value="${employee.id}">
                                                <button type="submit" class="btn btn-sm btn-danger">
                                                    <i class="fas fa-trash"></i>
                                                </button>
                                            </form>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            
                            <!-- Sample data if no employees are available -->
                            <c:if test="${empty employeeRepository.findAll()}">
                                <tr>
                                    <td>EMP-001</td>
                                    <td>John Doe</td>
                                    <td>Project Manager</td>
                                    <td>john.doe@theenbuild.com</td>
                                    <td>Construction</td>
                                    <td><span class="badge bg-success">Active</span></td>
                                    <td>
                                        <div class="d-flex gap-2">
                                            <a href="#" class="btn btn-sm btn-primary"><i class="fas fa-eye"></i></a>
                                            <a href="#" class="btn btn-sm btn-warning"><i class="fas fa-edit"></i></a>
                                            <a href="#" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></a>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>EMP-002</td>
                                    <td>Jane Smith</td>
                                    <td>Architect</td>
                                    <td>jane.smith@theenbuild.com</td>
                                    <td>Design</td>
                                    <td><span class="badge bg-success">Active</span></td>
                                    <td>
                                        <div class="d-flex gap-2">
                                            <a href="#" class="btn btn-sm btn-primary"><i class="fas fa-eye"></i></a>
                                            <a href="#" class="btn btn-sm btn-warning"><i class="fas fa-edit"></i></a>
                                            <a href="#" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></a>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>EMP-003</td>
                                    <td>Mike Johnson</td>
                                    <td>Site Engineer</td>
                                    <td>mike.johnson@theenbuild.com</td>
                                    <td>Construction</td>
                                    <td><span class="badge bg-warning">Pending</span></td>
                                    <td>
                                        <div class="d-flex gap-2">
                                            <a href="#" class="btn btn-sm btn-primary"><i class="fas fa-eye"></i></a>
                                            <a href="#" class="btn btn-sm btn-warning"><i class="fas fa-edit"></i></a>
                                            <a href="#" class="btn btn-sm btn-danger"><i class="fas fa-trash"></i></a>
                                        </div>
                                    </td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                </div>

                <div class="d-flex justify-content-between align-items-center mt-4">
                    <div>Showing 1 to 10 of 45 entries</div>
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
    </div>

    <!-- Footer -->
    <footer class="animate__animated animate__fadeInUp">
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-center text-md-start">
                    © 2025 TheenBuild. All rights reserved.
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
</body>
</html>