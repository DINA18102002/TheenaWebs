<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { font-family: 'Roboto', sans-serif; background: #f4f7fa; height: 100vh; display: flex; justify-content: center; align-items: center; }
        .login-container { max-width: 400px; padding: 30px; background: white; border-radius: 10px; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); }
    </style>
</head>
<body>
    <div class="login-container">
        <h2 class="text-center">Admin Login</h2>
        <form action="/admin" method="post">
            <div class="mb-3">
                <label for="username" class="form-label">Username</label>
                <input type="text" class="form-control" id="username" name="username" required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" required>
            </div>
            <button type="submit" class="btn btn-primary w-100">Login</button>
            <c:if test="${not empty error}">
                <div class="alert alert-danger mt-3">${error}</div>
            </c:if>
        </form>
    </div>
</body>
</html>