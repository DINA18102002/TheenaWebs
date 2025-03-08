<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TheenaWebs - Admin Tasks</title>
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
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="/"><i class="fas fa-building"></i> TheenaWebs</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="/">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="/admin/dashboard">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link active" href="/admin/tasks">Tasks</a></li>
                    <li class="nav-item"><a class="nav-link" href="/admin/employees">Workforce</a></li>
                    <li class="nav-item"><a class="nav-link" href="/logout">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="dashboard-container">
        <div class="section-card">
            <h2 class="section-title"><i class="fas fa-tasks"></i> All Tasks</h2>
            <div class="mb-3">
                <a href="/admin/tasks" class="btn btn-outline-primary btn-sm me-2">All</a>
                <a href="/admin/tasks?status=New" class="btn btn-outline-primary btn-sm me-2">New</a>
                <a href="/admin/tasks?status=Assigned" class="btn btn-outline-primary btn-sm me-2">Assigned</a>
                <a href="/admin/tasks?status=In Process" class="btn btn-outline-primary btn-sm me-2">In Process</a>
                <a href="/admin/tasks?status=Completed" class="btn btn-outline-primary btn-sm">Completed</a>
            </div>
            <div class="table-responsive">
                <table class="table">
                    <thead>
                        <tr>
                            <th>Order ID</th>
                            <th>Customer</th>
                            <th>Package</th>
                            <th>Status</th>
                            <th>Assigned To</th>
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
                                        <td>
                                            <span class="badge ${order.status == 'Completed' ? 'bg-success' : order.status == 'In Process' ? 'bg-warning' : 'bg-secondary'}">
                                                ${order.status}
                                            </span>
                                        </td>
                                        <td>
                                            <c:choose>
                                                <c:when test="${order.assignedEmployeeId != null}">
                                                    <c:forEach var="emp" items="${employees}">
                                                        <c:if test="${emp.id == order.assignedEmployeeId}">${emp.name}</c:if>
                                                    </c:forEach>
                                                </c:when>
                                                <c:otherwise>Not Assigned</c:otherwise>
                                            </c:choose>
                                        </td>
                                        <td>
                                            <c:if test="${order.assignedEmployeeId == null}">
                                                <form action="/admin/assign-task" method="post" class="d-inline">
                                                    <input type="hidden" name="orderId" value="${order.id}">
                                                    <select name="employeeId" class="form-select d-inline w-auto me-2">
                                                        <c:forEach var="emp" items="${employees}">
                                                            <option value="${emp.id}">${emp.name}</option>
                                                        </c:forEach>
                                                    </select>
                                                    <button type="submit" class="btn btn-primary btn-action">Assign</button>
                                                </form>
                                            </c:if>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </c:when>
                            <c:otherwise>
                                <tr>
                                    <td colspan="6" class="text-center py-4 text-muted">
                                        <i class="fas fa-info-circle me-2"></i>No tasks available
                                    </td>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <footer>
        © 2025 TheenaWebs. All rights reserved.
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>