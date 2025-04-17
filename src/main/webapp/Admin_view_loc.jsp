<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Locations - ApnaPG</title>
    <link rel="stylesheet" href="Admin_view_loc.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
</head>
<body>

    <!-- Navigation -->
   
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

    <!-- Location List -->
    <div class="locations-container">
        <h2 class="section-header">Available Locations</h2>

        <%-- Success/Error Message Handling --%>
        <% String message = request.getParameter("message"); 
           if (message != null) { %>
            <p class="success-message"><%= message %></p>
        <% } %>

        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Location Name</th>
                    <th>City</th>
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

                        String query = "SELECT * FROM location";
                        ps = con.prepareStatement(query);
                        rs = ps.executeQuery();

                        while (rs.next()) {
                            int id = rs.getInt("id");
                            String name = rs.getString("name");
                            String city = rs.getString("city");
                %>
                <tr>
                    <td><%= id %></td>
                    <td><%= name %></td>
                    <td><%= city %></td>
                    <td>
                        <a href="UpdateLocationServlet?id=<%= id %>">
                            <button class="update-btn"><i class="fas fa-edit"></i> Update</button>
                        </a>
                        <a href="DeleteLocationServlet?id=<%= id %>" onclick="return confirm('Are you sure you want to delete this location?');">
                            <button class="delete-btn"><i class="fas fa-trash"></i> Delete</button>
                        </a>
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
