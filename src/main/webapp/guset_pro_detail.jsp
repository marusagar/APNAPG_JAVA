<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*, java.util.*" %>

<%
    String propertyIdStr = request.getParameter("property");

    int propertyId = 0;
    String name = "", desc = "", location = "", address = "", image = "";
    String ownerName = "", ownerEmail = "", ownerContact = "";

    List<String> facilities = new ArrayList<>();
    List<Map<String, String>> rooms = new ArrayList<>();

    try {
        if (propertyIdStr != null) {
            propertyId = Integer.parseInt(propertyIdStr);

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnapg", "root", "");

            // Fetch property
            String propQuery = "SELECT * FROM property WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(propQuery);
            ps.setInt(1, propertyId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                name = rs.getString("Property_Name");
                desc = rs.getString("Property_Description");
                location = rs.getString("Property_Location");
                address = rs.getString("Address");
                image = rs.getString("Image");
            }

            rs.close();
            ps.close();

            // Fetch owner (same ID)
            String ownerQuery = "SELECT * FROM user WHERE id = ?";
            PreparedStatement ps2 = con.prepareStatement(ownerQuery);
            ps2.setInt(1, propertyId);
            ResultSet rs2 = ps2.executeQuery();

            if (rs2.next()) {
                ownerName = rs2.getString("firstName");
                ownerContact = rs2.getString("contact");
                ownerEmail = rs2.getString("email");
            }

            rs2.close();
            ps2.close();

            // Fetch facilities based on room_id
            String facilityQuery = "SELECT * FROM facility WHERE room_id = ?";
            PreparedStatement ps3 = con.prepareStatement(facilityQuery);
            ps3.setInt(1, propertyId);  // Match room_id with property_id
            ResultSet rs3 = ps3.executeQuery();

            while (rs3.next()) {
                facilities.add(rs3.getString("Facility_Name")); // facility name
            }

            rs3.close();
            ps3.close();

            // Fetch rooms based on property_id
            String roomQuery = "SELECT * FROM rooms WHERE room_id = ?";
            PreparedStatement ps4 = con.prepareStatement(roomQuery);
            ps4.setInt(1, propertyId);  // Match room_id with property_id
            ResultSet rs4 = ps4.executeQuery();

            while (rs4.next()) {
                Map<String, String> room = new HashMap<>();
                room.put("room_number", rs4.getString("room_number"));
                room.put("room_desc", rs4.getString("room_desc"));
                room.put("room_for", rs4.getString("room_for"));
                room.put("room_type", rs4.getString("room_type"));
                room.put("total_beds", rs4.getString("total_beds"));
                room.put("room_price", rs4.getString("room_price"));
                rooms.add(room);
            }

            rs4.close();
            ps4.close();

            con.close();
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Property Detail - ApnaPG</title>
    <link rel="stylesheet" href="guset_pro_detail.css">
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
            <li><a href="wallet.jsp"><img src="icons/wallet.png" height="20" width="20" alt=""></a></li>
            <li><a href="profile.jsp"><i class="fa-solid fa-user"></i></a></li>
            <li><a href="index.jsp"><img src="icons/logout.png" height="20" width="20"> Logout</a></li>
        </ul>
    </nav>
</header>

<div class="container">
    <div class="property-container">
        <div class="left">
            <img src="<%= image %>" alt="Property Image" style="width:100%; max-height:300px;">
        </div>
        <div class="right">
            <h2><%= name %></h2>
            <p><%= desc %></p>
            <h3><img src="images/hotel.png" height="25" width="25" alt=""> <%= location %></h3>
            <p><strong>Property Address:</strong> <%= address %></p>

            <div class="owner-details">
                <h3>Owner Details</h3>
                <p><strong>Owner Name:</strong> <%= ownerName %></p>
                <p><strong>Contact No:</strong> <%= ownerContact %></p>
                <p><strong>Email ID:</strong> <%= ownerEmail %></p>
            </div>

            <!-- Facilities -->
            <div class="facilities">
                <h3>Facilities</h3>
                <% if (!facilities.isEmpty()) {
                    for (String fac : facilities) { %>
                        <p><i class="fa fa-check-circle" style="color: green;"></i> <%= fac %></p>
                <%  }
                   } else { %>
                    <p>No facilities listed.</p>
                <% } %>
            </div>
        </div>
    </div>
</div>

<!-- Room Section -->
<h2>Room Details</h2>
<div class="rooms">
    <% if (!rooms.isEmpty()) {
        for (Map<String, String> r : rooms) { %>
            <div class="room-card">
                <h3>Room No: <%= r.get("room_number") %></h3>
                <p><strong>Description:</strong> <%= r.get("room_desc") %></p>
                <p><strong>Room For:</strong> <%= r.get("room_for") %></p>
                <p><strong>Room Type:</strong> <%= r.get("room_type") %></p>
                <p><strong>Room Price:</strong> ₹<%= r.get("room_price") %></p>
                <% if (!"Private".equalsIgnoreCase(r.get("room_type"))) { %>
                    <p><strong>Total Beds:</strong> <%= r.get("total_beds") %></p>
                <% } %>
                <button onclick="window.location.href='book_date.jsp?property=9'">View More</button>
            </div>
    <%  }
       } else { %>
        <p>No room details available.</p>
    <% } %>
</div>

</body>
</html>
