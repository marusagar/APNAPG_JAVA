<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Facility - ApnaPG</title>
    <link rel="stylesheet" href="owner_add_face.css">
</head>
<body>

<header>
    <div class="logo">
        <img src="images/ApnaPG-removebg-preview.png" class="landing_logo" alt="APNAPG Logo">
    </div>
    <nav>
        <ul>
            <li><a href="owner.jsp">Home</a></li>
            <li><a href="owner_about.jsp">About Us</a></li>
            <li><a href="owner_contact.jsp">Contact Us</a></li>
            <li><a href="owner_add_property.jsp">Properties</a></li>
            <li><a href="owner_pending.jsp">Bookings</a></li>
            <li><a href="owner_regi.jsp">Logout</a></li>
        </ul>
    </nav>
</header>

<div class="facility-container">
    <h2>Add Facility Detail</h2>

    <!-- Display message -->
    <%
        String msg = request.getParameter("msg");
        if (msg != null) {
    %>
        <p style="color: green; font-weight: bold;"><%= msg %></p>
    <%
        }
    %>

    <form action="OwnerAddFacilityServlet" method="post">
        <label for="facility-name">Facility Name</label>
        <input type="text" id="facility-name" name="facility_name" required>

        <label for="facility-desc">Description</label>
        <textarea id="facility-desc" name="facility_desc" rows="4" required></textarea>

        <label for="room-id">Room ID</label>
        <input type="number" id="room-id" name="room_id" required>

        <button type="submit" class="add-facility-btn">Add Facility</button>
    </form>
</div>

</body>
</html>
