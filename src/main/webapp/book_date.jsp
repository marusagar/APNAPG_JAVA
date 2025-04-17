<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>

<%
    String propertyIdStr = request.getParameter("property");
    int propertyId = 0;

    String propertyName = "", propertyDesc = "", location = "", address = "", image = "";
    String ownerName = "", ownerContact = "", ownerEmail = "";
    String roomNumber = "", roomFor = "", roomDesc = "", roomType = "", roomPrice = "";

    try {
        if (propertyIdStr != null) {
            propertyId = Integer.parseInt(propertyIdStr);

            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnapg", "root", "");

            // Fetch property
            PreparedStatement ps = con.prepareStatement("SELECT * FROM property WHERE id = ?");
            ps.setInt(1, propertyId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                propertyName = rs.getString("Property_Name");
                propertyDesc = rs.getString("Property_Description");
                location = rs.getString("Property_Location");
                address = rs.getString("Address");
                image = rs.getString("Image");
            }
            rs.close();
            ps.close();

            // Fetch owner
            PreparedStatement ps2 = con.prepareStatement("SELECT u.firstName, u.contact, u.email FROM user u JOIN property p ON u.id = p.id WHERE p.id = ?");
            ps2.setInt(1, propertyId);
            ResultSet rs2 = ps2.executeQuery();
            if (rs2.next()) {
                ownerName = rs2.getString("firstName");
                ownerContact = rs2.getString("contact");
                ownerEmail = rs2.getString("email");
            }
            rs2.close();
            ps2.close();

            // Fetch one room for now
            PreparedStatement ps3 = con.prepareStatement("SELECT * FROM rooms WHERE room_id = ? ");
            ps3.setInt(1, propertyId);
            ResultSet rs3 = ps3.executeQuery();
            if (rs3.next()) {
                roomNumber = rs3.getString("room_number");
                roomFor = rs3.getString("room_for");
                roomDesc = rs3.getString("room_desc");
                roomType = rs3.getString("room_type");
                roomPrice = rs3.getString("room_price");
            }
            rs3.close();
            ps3.close();

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
    <title>Room Booking Page</title>
    <link rel="stylesheet" href="book_date.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
</head>
<body>
    <header>
        <!-- Optional: Add your site header -->
    </header>

    <div class="container">
        <h2 class="title">Room Booking Page</h2>

        <div class="property-details">
            <img src="<%= image %>" alt="Property Image" class="property-img" width="300">

            <div class="details">
                <h3 class="property-name"><%= propertyName %></h3>
                <p class="property-desc"><%= propertyDesc %></p>
                <p class="location">
                    <span><img src="images/hotel.png" height="25" width="25"> <%= location %></span>
                </p>
                <p class="address"><strong>Property Address:</strong> <%= address %></p>

                <div class="owner-info">
                    <p><strong>Owner Name:</strong> <%= ownerName %></p>
                    <p><strong>Contact No.:</strong> <%= ownerContact %></p>
                    <p><strong>Email Id:</strong> <%= ownerEmail %></p>
                </div>
            </div>
        </div>

        <div class="room_details">
            <div class="room-info">
                <h3>Room No: <%= roomNumber %> (<%= roomType %>)</h3>
                <p><strong>Room For:</strong> <%= roomFor %></p>
                <p><strong>Description:</strong> <%= roomDesc %></p>
                <p><strong>Room Price:</strong> ₹<%= roomPrice %></p>
            </div>

            <div class="booking-details">
                <h3>Booking Detail</h3>
                <form action="bookRoomServlet" method="post" class="booking-form">
                    <input type="hidden" name="property_id" value="<%= propertyId %>">
                    <input type="hidden" name="room_id" value="<%= roomNumber %>">

                    <div class="form-group">
                        <label>Start Month</label>
                        <select name="start_month" required>
                            <option value="">Select Month</option>
                            <option>January</option>
                            <option>February</option>
                            <option>March</option>
                            <option>April</option>
                            <option>May</option>
                            <option>June</option>
                            <option>July</option>
                            <option>August</option>
                            <option>September</option>
                            <option>October</option>
                            <option>November</option>
                            <option>December</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>Start Year</label>
                        <select name="start_year" required>
                            <option value="">Select Year</option>
                            <option>2024</option>
                            <option>2025</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>End Month</label>
                        <select name="end_month" required>
                            <option value="">Select Month</option>
                            <option>January</option>
                            <option>February</option>
                            <option>March</option>
                            <option>April</option>
                            <option>May</option>
                            <option>June</option>
                            <option>July</option>
                            <option>August</option>
                            <option>September</option>
                            <option>October</option>
                            <option>November</option>
                            <option>December</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label>End Year</label>
                        <select name="end_year" required>
                            <option value="">Select Year</option>
                            <option>2024</option>
                            <option>2025</option>
                        </select>
                    </div>

                    <div class="buttons">
                    <a href= "wallet.jsp">    <button type="submit" class="btn book-room">Book Room</button></a>
                       
                    </div>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
