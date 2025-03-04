<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Employee Registration</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { font-family: 'Roboto', sans-serif; background: #f4f7fa; padding: 20px; }
        .registration-container { max-width: 600px; margin: auto; padding: 30px; background: white; border-radius: 10px; box-shadow: 0 4px 15px rgba(0, 0, 0, 0.1); }
    </style>
</head>
<body>
    <div class="registration-container">
        <h2 class="text-center">Employee Registration</h2>
        <form action="/employee/register" method="post">
            <div class="mb-3">
                <label for="name" class="form-label">Full Name</label>
                <input type="text" class="form-control" id="name" name="name" required>
            </div>
            <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" value="${email}" readonly required>
            </div>
            <div class="mb-3">
                <label for="password" class="form-label">Password</label>
                <input type="password" class="form-control" id="password" name="password" value="${password}" readonly required>
            </div>
            <div class="mb-3">
                <label for="mobileNumber" class="form-label">Mobile Number</label>
                <input type="text" class="form-control" id="mobileNumber" name="mobileNumber" required>
            </div>
            <div class="mb-3">
                <label for="aadharNumber" class="form-label">Aadhar Number</label>
                <input type="text" class="form-control" id="aadharNumber" name="aadharNumber" required>
            </div>
            <div class="mb-3">
                <label for="pan" class="form-label">PAN</label>
                <input type="text" class="form-control" id="pan" name="pan" required>
            </div>
            <div class="mb-3">
                <label for="address" class="form-label">Address</label>
                <textarea class="form-control" id="address" name="address" rows="3" required></textarea>
            </div>
            <button type="submit" class="btn btn-primary w-100">Register</button>
        </form>
    </div>
</body>
</html>