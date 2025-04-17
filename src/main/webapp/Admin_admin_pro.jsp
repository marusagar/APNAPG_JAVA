<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Properties - ApnaPG</title>
    <link rel="stylesheet" href="Admin_admin_pro.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
</head>
<body>

<header>
    <div class="logo">
        <img src="images/ApnaPG-removebg-preview.png" class="landing_logo" alt="APNAPG Logo">
    </div>
    <nav>
        <ul>
            <li><a href="Admin.jsp"><i class="fas fa-home"></i> Home</a></li>
            <li><a href="Admin_about.jsp"><i class="fas fa-info-circle"></i> About Us</a></li>
            <li><a href="Admin_contact.jsp"><i class="fas fa-envelope"></i> Contact Us</a></li>
            <li><a href="Admin_add_location.jsp"><i class="fa-solid fa-location-pin"></i> Location</a></li>
            <li><a href="Admin_admin_pro.jsp"><i class="fa-solid fa-building"></i> Properties</a></li>
            <li><a href="Admin_view_book.jsp"><i class="fa-solid fa-calendar-check"></i> Bookings</a></li>
            <li><a href="index.jsp"><i class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
        </ul>
    </nav>
</header>

<!-- Properties Table -->
<div class="table-container">
    <h2 class="table-header">All Properties</h2>

    <table>
        <thead>
            <tr>
                <th>Image</th>
                <th>Property Name</th>
                <th>Description</th>
                <th>Location</th>
                <th>Address</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                String url = "jdbc:mysql://localhost:3306/apnapg";
                String user = "root";
                String pass = "";

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection(url, user, pass);
                    String query = "SELECT * FROM property";
                    PreparedStatement stmt = conn.prepareStatement(query);
                    ResultSet rs = stmt.executeQuery();

                    while (rs.next()) {
                        String name = rs.getString("Property_Name");
                        String desc = rs.getString("Property_Description");
                        String location = rs.getString("Property_Location");
                        String address = rs.getString("Address");
                        String image = rs.getString("Image");
            %>
            <tr>
                <td><img src="<%= image %>" alt="Property Image" class="property-img" style="width: 100px; height: auto;"></td>
                <td><%= name %></td>
                <td><%= desc %></td>
                <td><%= location %></td>
                <td><%= address %></td>
                <td>
                    <form action="PropertyActionServlet" method="post" style="display:inline;">
                        <input type="hidden" name="property_name" value="<%= name %>">
              
                    </form>
                    <form action="PropertyActionServlet" method="post" style="display:inline;">
                        <input type="hidden" name="property_name" value="<%= name %>">
                        <input type="hidden" name="action" value="delete">
                        <button type="submit" class="reject-btn">Delete</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (Exception e) {
                    out.println("<tr><td colspan='6'>Error fetching data: " + e.getMessage() + "</td></tr>");
                }
            %>
        </tbody>
    </table>
</div>

</body>
</html>
