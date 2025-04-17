<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment | ApnaPG</title>
    <link rel="stylesheet" href="payment.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

    <header>
        <div class="logo">
            <img src="images/ApnaPG-removebg-preview.png" class="landing_logo" alt="APNAPG Logo">
        </div>
        <nav>
            <ul>
                <li><a href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
                <li><a href="about.jsp"><i class="fas fa-info-circle"></i> About Us</a></li>
                <li><a href="contact.jsp"><i class="fas fa-envelope"></i> Contact Us</a></li>
                <li><a href="paid.jsp"><i class="fas fa-calendar-check"></i>Booking</a></li>
                <li><a href="wallet.jsp"><img src="icons/wallet.png" height="20rem" width="20rem" alt=""></a></li>
                <li><a href="profile.jsp"><i class="fa-solid fa-user"></i></a></li>
                <li><a href="index.jsp"><img src="icons/logout.png" height="20rem" width="20rem"> Logout</a></li>
            </ul>
        </nav>
    </header>
    <!-- Payment Section -->
    <div class="payment-container">
        <h2 class="payment-title">Payment Options</h2>

        <h3 class="upi-title">UPI QR</h3>
        <div class="upi-qr">
            <img src="images/qr.png" alt="UPI QR Code">
            <p>Scan With Any App</p>
            <div class="upi-icons">
                <img src="images/options.png" class="options_payment" alt="">
            </div>
        </div>

        <div class="upi-input">
            <label>UPI ID / Number</label>
            <input type="text" id="upiId" placeholder="Enter UPI ID or Mobile Number">
        </div>

        <button class="btn verify-btn" onclick="verifyPayment()">Verify and Pay</button>
    </div>

    <script>
        function verifyPayment() {
            let upiId = document.getElementById("upiId").value;
            if (upiId.trim() !== "") {
                alert("Payment Verified! Proceeding...");
            } else {
                alert("Please enter a valid UPI ID or Mobile Number.");
            }
        }
    </script>

</body>
</html>
