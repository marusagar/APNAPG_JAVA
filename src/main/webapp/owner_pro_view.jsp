<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Owner Property View - ApnaPG</title>
    <link rel="stylesheet" href="owner_pro_view.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
</head>
<body>

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
                <li><a href="owner_login.jsp"><i class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
            </ul>
        </nav>
    </header>

    <div class="properties-container">
        <h2 class="section-header">Your Properties</h2>




        <table>
            <thead>
                <tr>
                    <th>Property Image</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Location</th>
                    <th>Address</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection con = null;
                    PreparedStatement ps = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.cj.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnapg", "root", "");

                        String query = "SELECT * FROM property";
                        ps = con.prepareStatement(query);
                        rs = ps.executeQuery();

                        while (rs.next()) {
                            String propertyName = rs.getString("Property_Name");
                            String propertyDesc = rs.getString("Property_Description");
                            String propertyLocation = rs.getString("Property_Location");
                            String address = rs.getString("Address");
                            String imagePath = rs.getString("Image");
                %>
                <tr>
                    <td>
                        <% if (imagePath != null && !imagePath.isEmpty()) { %>
                            <img src="<%= imagePath %>" alt="Property Image" style="width:100px; height:auto;">
                        <% } else { %>
                            <img src="images/default-property.jpg" alt="No Image" style="width:100px; height:auto;">
                        <% } %>
                    </td>
                    <td><%= propertyName %></td>
                    <td><%= propertyDesc %></td>
                    <td><%= propertyLocation %></td>
                    <td><%= address %></td>
                    
                    <td>
                        <a href="owner_add_room.jsp?propertyName=<%= propertyName %>">
                            <button class="add-room">Add Room</button>
                            
                        </a>
                        <a href="owner_add_face.jsp?propertyName=<%= propertyName %>">
                            <button class="add-facility">Add Facility</button>
                        </a>
                            <%
    String msg = (String) request.getAttribute("message");
    if (msg != null) {
%>
    <div style="color: green; font-weight: bold; margin-bottom: 15px;"><%= msg %></div>
<%
    }
%>
                    </td>
                </tr>
                <%
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        if (rs != null) rs.close();
                        if (ps != null) ps.close();
                        if (con != null) con.close();
                    }
                %>
            </tbody>
        </table>
    </div>

</body>
</html>
