<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Location - ApnaPG</title>
    <link rel="stylesheet" href="Admin_add_location.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
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

    <!-- Add Location Form -->
    <div class="form-container">
        <h2 class="form-header">Add Location</h2>

        <form action="AddLocationServlet" method="post">
            <label for="location-name">Location Name</label>
            <input type="text" name="location_name" id="location-name" placeholder="Enter name" required>

            <label for="location-city">Location City</label>
            <input type="text" name="location_city" id="location-city" placeholder="Enter City" required>

            <div class="button-group">
                <button type="submit" class="register-btn">Add Location</button>
                <a href="Admin_view_loc.jsp"><button type="button" class="view-btn">View Locations</button></a>
            </div>
        </form>
    </div>

</body>
</html>
