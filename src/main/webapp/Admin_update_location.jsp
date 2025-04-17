<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="update_location.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Update Location</title>
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
<% 
    String id = (request.getAttribute("id") != null) ? request.getAttribute("id").toString() : "";
    String name = (request.getAttribute("name") != null) ? request.getAttribute("name").toString() : "";
    String city = (request.getAttribute("city") != null) ? request.getAttribute("city").toString() : "";
%>

<h2>Update Location</h2>

<% if (request.getAttribute("error") != null) { %>
    <p style="color: red;"><%= request.getAttribute("error") %></p>
<% } %>

<% if (request.getAttribute("success") != null) { %>
    <p style="color: green;"><%= request.getAttribute("success") %></p>
<% } %>

<form action="UpdateLocationServlet" method="post">
    <input type="hidden" name="id" value="<%= id %>">

    <label for="name">Location Name:</label>
    <input type="text" id="name" name="name" value="<%= name %>" required>

    <label for="city">Location City:</label>
    <input type="text" id="city" name="city" value="<%= city %>" required>

    <button type="submit">Update Location</button>
</form>




