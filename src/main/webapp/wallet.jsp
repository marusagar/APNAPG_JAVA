<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Wallet | ApnaPG</title>
    <link rel="stylesheet" href="wallet.css">
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</head>
<body>

<header>
    <div class="logo">
        <img src="images/ApnaPG-removebg-preview.png" class="landing_logo" alt="APNAPG Logo">
    </div>
    <nav>
        <ul>
            <li><a href="index.jsp">Home</a></li>
            <li><a href="about.jsp">About Us</a></li>
            <li><a href="contact.jsp">Contact Us</a></li>
            <li><a href="paid.jsp">Booking</a></li>
            <li><a href="wallet.jsp"><img src="icons/wallet.png" height="20" width="20"></a></li>
            <li><a href="profile.jsp"><i class="fa-solid fa-user"></i></a></li>
            <li><a href="index.jsp"><img src="icons/logout.png" height="20" width="20"> Logout</a></li>
        </ul>
    </nav>
</header>

<div class="wallet-container">
    <h2 class="wallet-title">My Wallet</h2>
    <h3 class="wallet-balance">Wallet Balance: ₹<span id="walletAmount">0</span></h3>

    <div class="wallet-input">
        <label>Amount</label>
        <input type="number" id="amountInput" placeholder="Enter Amount">
    </div>

    <button class="btn primary" id="add_money_btn">Add Money in Wallet</button>
</div>

<script>
    document.getElementById("add_money_btn").addEventListener("click", function () {
        let amount = document.getElementById("amountInput").value;
        if (amount <= 0) {
            alert("Please enter a valid amount.");
            return;
        }

        let options = {
            "key": "rzp_test_zHhNFsppG7bIjH", // ✅ Replace with your Razorpay Key
            "amount": amount * 100, // In paise
            "currency": "INR",
            "name": "ApnaPG Wallet",
            "description": "Wallet Top-up",
            "image": "images/ApnaPG-removebg-preview.png",
            "handler": function (response) {
                alert("Payment Successful: " + response.razorpay_payment_id);

                // Send payment ID and amount to backend
                const form = document.createElement("form");
                form.method = "POST";
                form.action = "WalletServlet";

                let paymentIdInput = document.createElement("input");
                paymentIdInput.type = "hidden";
                paymentIdInput.name = "payment_id";
                paymentIdInput.value = response.razorpay_payment_id;
                form.appendChild(paymentIdInput);

                let amountInput = document.createElement("input");
                amountInput.type = "hidden";
                amountInput.name = "amount";
                amountInput.value = amount;
                form.appendChild(amountInput);

                document.body.appendChild(form);
                form.submit();
            },
            "theme": {
                "color": "#3399cc"
            }
        };

        let rzp = new Razorpay(options);
        rzp.open();
    });
</script>

</body>
</html>
