<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pending Properties - ApnaPG</title>
    <link rel="stylesheet" href="owner_pending.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

    <!-- Navigation Bar -->
    <header>
        <div class="logo">
            <img src="images/ApnaPG-removebg-preview.png" class="landing_logo" alt="APNAPG Logo">
        </div>
        <nav>
            <ul>
                    <li><a href="owner.jsp"><i class="fas fa-home"></i> Home</a></li>
                <li><a href="owner_about.jsp"><i class="fas fa-info-circle"></i> About Us</a></li>
                <li><a href="owner_contact.jsp"><i class="fas fa-envelope"></i> Contact Us</a></li>
                
                <li><a href="owner_add_property.jsp"><i class="fa-solid fa-building"></i> Properties</a></li>
                <li><a href="owner_pending.jsp"><i class="fa-solid fa-calendar-check"></i> Bookings</a></li>
                <li><a href="owner_regi.jsp"><i class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
            </ul>
        </nav>
    </header>
    <!-- Pending Properties Table -->
    <div class="pending-container">
        <h2 class="pending-header">Pending Properties</h2>
        
        <table>
            <thead>
                <tr>
                    <th>Month</th>
                    <th>Amount</th>
                    <th>Payment Type</th>
                    <th>Payment ID</th>
                    <th>Payment Time</th>
                    <th>Payment Status</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>January 2025</td>
                    <td>5000</td>
                    <td>Wallet</td>
                    <td>-</td>
                    <td>2/1/2025, 12:00:00 PM</td>
                    <td class="pending-status">Pending</td>
                </tr>
            </tbody>
        </table>

        <button class="close-btn">Close</button>
    </div>

</body>
</html>
