<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Dashboard - TheenaWebs</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        :root {
            --primary: #0288d1;
            --secondary: #263238;
            --success: #2e7d32;
            --warning: #f57c00;
            --light: #eceff1;
            --gray: #607d8b;
            --border-radius: 8px;
            --box-shadow: 0 2px 12px rgba(0,0,0,0.06);
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

        .profile-circle {
            width: 32px;
            height: 32px;
            background: var(--primary);
            color: #fff;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1rem;
            font-weight: 500;
        }

        .dropdown-menu {
            border: none;
            box-shadow: var(--box-shadow);
            border-radius: var(--border-radius);
        }

        /* Container */
        .dashboard-container {
            max-width: 1300px;
            margin: 5rem auto 2rem;
            padding: 0 1rem;
            flex-grow: 1;
        }

        /* Stats Cards */
        .stats-card {
            background: #fff;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 1.25rem;
            height: 100%;
        }

        .stats-card .title {
            font-size: 0.9rem;
            color: var(--gray);
            margin-bottom: 0.5rem;
            font-weight: 500;
        }

        .stats-card .value {
            font-size: 1.75rem;
            font-weight: 600;
            color: var(--secondary);
        }

        .stats-card i {
            font-size: 1.5rem;
            margin-right: 0.75rem;
        }

        /* Section Styles */
        .section-card {
            background: #fff;
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            padding: 1.5rem;
            margin-bottom: 2rem;
        }

        .section-title {
            font-size: 1.25rem;
            font-weight: 600;
            color: var(--secondary);
            margin-bottom: 1rem;
            display: flex;
            align-items: center;
            gap: 0.5rem;
        }

        /* Tasks Table */
        .table {
            margin-bottom: 0;
        }

        .table th {
            background: #f5f7fa;
            font-size: 0.85rem;
            font-weight: 600;
            text-transform: uppercase;
            padding: 0.75rem 1rem;
            color: var(--secondary);
        }

        .table td {
            padding: 0.75rem 1rem;
            vertical-align: middle;
            font-size: 0.9rem;
        }

        .badge {
            padding: 0.35rem 0.75rem;
            border-radius: 12px;
            font-size: 0.75rem;
            font-weight: 500;
        }

        /* Buttons */
        .btn-action {
            padding: 0.5rem 1.25rem;
            border-radius: 20px;
            font-size: 0.85rem;
            font-weight: 500;
        }

        /* Footer */
        footer {
            text-align: center;
            padding: 2rem 0;
            color: var(--gray);
            font-size: 0.9rem;
        }

        /* Responsive Design */
        @media (max-width: 992px) {
            .stats-card .value {
                font-size: 1.5rem;
            }
        }

        @media (max-width: 768px) {
            .table-responsive {
                margin: 0 -1rem;
                width: calc(100% + 2rem);
            }

            .stats-card {
                text-align: center;
            }

            .stats-card i {
                margin-right: 0;
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

            .btn-action {
                width: 100%;
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
                <ul class="navbar-nav ms-auto align-items-center">
                    <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/employee/dashboard?email=${employee.email}">Dashboard</a></li>
                    <li class="nav-item dropdown">
                        <div class="profile-circle" data-bs-toggle="dropdown">${employee.name.charAt(0)}</div>
                        <ul class="dropdown-menu dropdown-menu-end">
                            <li><h6 class="dropdown-header">${employee.name}</h6></li>
                            <li><a class="dropdown-item" href="/logout"><i class="fas fa-sign-out-alt me-2"></i> Logout</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Dashboard Content -->
    <div class="dashboard-container">
        <!-- Assigned Tasks -->
        <div class="section-card">
            <h2 class="section-title"><i class="fas fa-tasks"></i> Assigned Tasks</h2>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Customer</th>
                            <th>Package</th>
                            <th>Details</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty orders}">
                                <c:forEach var="order" items="${orders}">
                                    <tr>
                                        <td>${order.id}</td>
                                        <td>${order.customerName}</td>
                                        <td>${order.packageType}</td>
                                        <td>${order.details}</td>
                                        <td>
                                            <span class="badge ${order.status == 'Completed' ? 'bg-success' : order.status == 'In Process' ? 'bg-warning' : 'bg-secondary'}">
                                                ${order.status}
                                            </span>
                                        </td>
                                        <td>
                                            <form action="/employee/update-status" method="post" class="d-inline">
                                                <input type="hidden" name="orderId" value="${order.id}">
                                                <input type="hidden" name="email" value="${employee.email}">
                                                <select name="status" class="form-select d-inline w-auto me-2">
                                                    <option value="Assigned" ${order.status == 'Assigned' ? 'selected' : ''}>Assigned</option>
                                                    <option value="In Process" ${order.status == 'In Process' ? 'selected' : ''}>In Process</option>
                                                    <option value="Completed" ${order.status == 'Completed' ? 'selected' : ''}>Completed</option>
                                                </select>
                                                <button type="submit" class="btn btn-primary btn-action">Update</button>
                                            </form>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="6" class="text-center py-4 text-muted">
                                        <i class="fas fa-info-circle me-2"></i>No tasks assigned
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

        
        <!-- Recent Tasks -->
        <div class="section-card">
            <h2 class="section-title"><i class="fas fa-tasks"></i> Recent Tasks</h2>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Task</th>
                            <th>Due Date</th>
                            <th>Status</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:choose>
                            <c:when test="${not empty recentTasks}">
                                <c:forEach var="task" items="${recentTasks}">
                                    <tr>
                                        <td>${task.title}</td>
                                        <td>${task.dueDate}</td>
                                        <td>
                                            <span class="badge ${task.status == 'completed' ? 'bg-success' : task.status == 'pending' ? 'bg-warning' : 'bg-secondary'}">
                                                ${task.status == 'completed' ? 'Completed' : task.status == 'pending' ? 'Pending' : 'Not Started'}
                                            </span>
                                        </td>
                                        <td>
                                            <a href="/employee/tasks/view?id=${task.id}&email=${employee.email}" class="text-primary">View</a>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="4" class="text-center py-4 text-muted">
                                        <i class="fas fa-info-circle me-2"></i>No recent tasks
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
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