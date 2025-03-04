<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TheenBuild - Admin Tasks</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css">
    <style>
        /* Reuse styles from admin-dashboard.jsp */
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg fixed-top">
        <div class="container-fluid">
            <a class="navbar-brand" href="/"><i class="fas fa-building"></i> TheenBuild</a>
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
        © 2025 TheenBuild. All rights reserved.
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>