<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pending Booking | ApnaPG</title>
    <link rel="stylesheet" href="paid.css">
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

    <!-- Pending Booking Section -->
    <div class="booking-container">
        <h2 class="booking-title">Pending Booking</h2>

        <table class="booking-table">
            <thead>
                <tr>
                    <th>Month</th>
                    <th>Amount</th>
                    <th>Payment Type</th>
                    <th>Payment ID</th>
                    <th>Payment Time</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>January 2025</td>
                    <td>5000</td>
                    <td>Wallet</td>
                    <td>-</td>
                    <td>2/1/2025, 12:00:00 PM</td>
                    <td><button class="pay-btn" onclick="payNow()">Pay Now</button></td>
                </tr>
            </tbody>
        </table>
    </div>

    <script>
        function payNow() {
            alert("Redirecting to payment...");
            window.location.href = "payment.jsp"; // Redirect to payment page
        }
    </script>

</body>
</html>
    