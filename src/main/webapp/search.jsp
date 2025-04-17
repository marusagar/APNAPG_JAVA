<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>APNAPG</title>
    <link rel="stylesheet" href="search.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

    <!-- Header -->
    <header>
        <div class="logo">
            <img src="images/ApnaPG-removebg-preview.png" alt="APNAPG Logo">
        </div>
        <nav>
            <ul>
                <li><a href="index.jsp"><i class="fas fa-home"></i> Home</a></li>
                <li><a href="about.jsp"><i class="fas fa-info-circle"></i> About Us</a></li>
                <li><a href="contact.jsp"><i class="fas fa-envelope"></i> Contact Us</a></li>
                <li><a href="paid.jsp"><i class="fas fa-calendar-check"></i> Booking</a></li>
                <li><a href="wallet.jsp"><img src="icons/wallet.png" height="20" width="20" alt=""></a></li>
                <li><a href="profile.jsp"><i class="fa-solid fa-user"></i></a></li>
                <li><a href="index.jsp"><img src="icons/logout.png" height="20" width="20"> Logout</a></li>
            </ul>
        </nav>
    </header>

    <!-- Search bar -->
    <section class="search-bar">
        <input type="text" placeholder="Search for locality">
        <button>Search</button>
    </section>

    <!-- Property Cards -->
    <section class="property-cards">
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnapg", "root", "");
                String query = "SELECT * FROM property"; // No status filter
                PreparedStatement ps = con.prepareStatement(query);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    String propertyName = rs.getString("Property_Name");
                    String propertyLocation = rs.getString("Property_Location");
                    String propertyDescription = rs.getString("Property_Description");
                    String imagePath = rs.getString("Image");
                    Integer ownerId = rs.getInt("id");
        %>
           <div class="card" style="height: 350px;" onclick="window.location.href='guset_pro_detail.jsp?property=<%= ownerId %>';">

                <img src="<%= imagePath %>" class="card_img" alt="<%= propertyLocation %>">
                <h3><img src="images/hotel.png" style="height: 1.2rem;width: 1.2rem;" alt=""> <%= propertyLocation %></h3>
                <h4><%= propertyName %></h4>
                <p><%= propertyDescription %></p>
            </div>
        <%
                }
                rs.close();
                ps.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
        %>
            <p style="color: red; text-align: center;">Error loading properties. Please try again later.</p>
        <%
            }
        %>
    </section>

    <!-- Scripts -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</body>
</html>
