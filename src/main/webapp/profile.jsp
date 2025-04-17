<%@ page import="java.sql.*" %>
<%@ page import="javax.naming.*" %>
<%@ page session="true" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String email = (String) session.getAttribute("guestEmail");
    String firstName = "", lastName = "", contact = "", street = "", walletAmount = "0";

    if (email == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnapg", "root", "");
        PreparedStatement ps = con.prepareStatement("SELECT * FROM guest WHERE email = ?");
        ps.setString(1, email);
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            firstName = rs.getString("firstName");
            lastName = rs.getString("lastName");
            contact = rs.getString("contact");
            street = rs.getString("street");
        }

        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>My Profile | ApnaPG</title>
    <link rel="stylesheet" href="profile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
</head>
<body>

<header>
    <!-- (Same nav content as your original file) -->
</header>

<div class="profile-container">
    <h2 class="profile-title">My Profile</h2>

    <div class="profile-card">
        <div class="profile-form">
            <div class="input-group">
                <label>First Name</label>
                <input type="text" value="<%= firstName %>" readonly>
            </div>
            <div class="input-group">
                <label>Last Name</label>
                <input type="text" value="<%= lastName %>" readonly>
            </div>
            <div class="input-group">
                <label>Email</label>
                <input type="email" value="<%= email %>" readonly>
            </div>
            <div class="input-group">
                <label>Wallet Amount</label>
                <input type="text" value="<%= walletAmount %>" readonly>
            </div>
            <div class="input-group">
                <label>Contact</label>
                <input type="text" value="<%= contact %>" readonly>
            </div>
            <div class="input-group">
                <label>Address</label>
                <input type="text" value="<%= street %>" readonly>
            </div>
        </div>

        <div class="profile-buttons">
            <button class="btn add-proof" id="open">Add Proof Detail</button>
        </div>
    </div>
</div>

<script>
    document.getElementById('open').addEventListener('click', function() {
        window.location.href = "add_detail.jsp";
    });
</script>

</body>
</html>
