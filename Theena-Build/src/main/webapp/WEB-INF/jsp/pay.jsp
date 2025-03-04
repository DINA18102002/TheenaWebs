<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Complete Payment - TheenBuild</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { font-family: 'Roboto', sans-serif; background: #f4f7fa; padding: 50px; text-align: center; }
        .payment-container { max-width: 500px; margin: 0 auto; background: white; padding: 20px; border-radius: 10px; box-shadow: 0 8px 25px rgba(0, 0, 0, 0.1); }
        h2 { color: #1a2a44; }
    </style>
</head>
<body>
    <div class="payment-container">
        <h2>Complete Your Payment</h2>
        <p><strong>Order ID:</strong> ${order.id}</p>
        <p><strong>Package:</strong> ${order.packageType}</p>
        <p><strong>Amount:</strong> $${order.packageType == 'Basic' ? '299' : order.packageType == 'Business' ? '599' : '999'}</p>
        <button id="rzp-button" class="btn btn-primary">Pay Now</button>
    </div>

    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
    <script>
        var options = {
            "key": "${keyId}", // Razorpay Key ID passed from controller
            "amount": ${order.packageType == 'Basic' ? 29900 : order.packageType == 'Business' ? 59900 : 99900}, // Amount in paise
            "currency": "INR",
            "name": "TheenBuild",
            "description": "Payment for ${order.packageType} Package",
            "order_id": "${order.razorpayOrderId}", // Razorpay Order ID
            "handler": function (response) {
                // On successful payment, redirect to success page
                window.location.href = "/success?orderId=${order.id}";
            },
            "prefill": {
                "name": "${order.customerName}",
                "email": "${order.customerEmail}"
            },
            "theme": {
                "color": "#3498db"
            }
        };
        var rzp = new Razorpay(options);
        document.getElementById('rzp-button').onclick = function(e) {
            rzp.open();
            e.preventDefault();
        };
    </script>
</body>
</html>