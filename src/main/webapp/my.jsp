<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, jakarta.servlet.*, jakarta.servlet.http.*" %>
<%@ page session="true" %>

<%
    String email = (String) session.getAttribute("guestEmail");
    String firstName = "", lastName = "", profession = "", contact = "", address = "", role = "Guest", age = "", imagePath = "";
    int walletAmount = 0;

    if (email == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnapg", "root", ""); // change as needed
        PreparedStatement stmt = conn.prepareStatement("SELECT * FROM guest WHERE email = ?");
        stmt.setString(1, email);
        ResultSet rs = stmt.executeQuery();

        if (rs.next()) {
            firstName = rs.getString("firstName");
            lastName = rs.getString("lastName");
            profession = rs.getString("Profession");
            contact = rs.getString("contact");
            address = rs.getString("street");
            age = rs.getString("Age");
            imagePath = rs.getString("image");
        }

        rs.close();
        stmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile | ApnaPG</title>
    <link rel="stylesheet" href="my.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
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
            <li><a href="paid.jsp"><i class="fas fa-calendar-check"></i> Booking</a></li>
            <li><a href="wallet.jsp"><img src="icons/wallet.png" height="20rem" width="20rem" alt=""></a></li>
            <li><a href="profile.jsp"><i class="fa-solid fa-user"></i></a></li>
            <li><a href="logout.jsp"><img src="icons/logout.png" height="20rem" width="20rem"> Logout</a></li>
        </ul>
    </nav>
</header>

<!-- Profile Section -->
<div class="profile-container">
    <h2 class="profile-title">My Profile</h2>

    <div class="profile-card">
        <div class="profile-row">
            <div class="profile-group">
                <label>First Name</label>
                <input type="text" value="<%= firstName %>" readonly>
            </div>
            <div class="profile-group">
                <label>Last Name</label>
                <input type="text" value="<%= lastName %>" readonly>
            </div>
            <div class="profile-group">
                <label>Profession</label>
                <input type="text" value="<%= profession %>" readonly>
            </div>
        </div>

        <div class="profile-row">
            <div class="profile-group">
                <label>Email</label>
                <input type="text" value="<%= email %>" readonly>
            </div>
            <div class="profile-group">
                <label>Wallet Amount</label>
                <input type="text" value="<%= walletAmount %>" readonly>
            </div>
            <div class="profile-group">
                <label>Age</label>
                <input type="text" value="<%= age %>" readonly>
            </div>
        </div>

        <div class="profile-row">
            <div class="profile-group">
                <label>Contact</label>
                <input type="text" value="<%= contact %>" readonly>
            </div>
            <div class="profile-group">
                <label>Address</label>
                <input type="text" value="<%= address %>" readonly>
            </div>
            <div class="profile-group">
                <label>Role</label>
                <input type="text" value="<%= role %>" readonly>
            </div>
        </div>

        <h3 class="sub-title">User Government Proof Details</h3>
        <div class="proof-container">
            <% if (imagePath != null && !imagePath.equals("")) { %>
                <img src="<%= imagePath %>" alt="Government Proof" height="150px">
            <% } else { %>
                <p>No proof uploaded.</p>
            <% } %>
        </div>
    </div>
</div>

</body>
</html>
