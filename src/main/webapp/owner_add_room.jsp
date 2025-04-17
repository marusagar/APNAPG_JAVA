<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Room - ApnaPG</title>
    <link rel="stylesheet" href="owner_add_room.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
                <li><a href="owner_regi.jsp"><i class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
            </ul>
        </nav>
    </header>

    <!-- Add Room Form -->
    <div class="room-container">
        <button class="back-btn">⬅</button>
        <h2 class="room-header">Add Room Details</h2>
        
        
        <!-- Updated Form with Correct Action and Method -->
        <form action="OwnerAddRoomServlet" method="post">
            <label for="room-number">Room Number</label>
            <input type="text" id="room-number" name="room_number" placeholder="Enter room number" required>

            <label for="room-desc">Description</label>
            <textarea id="room-desc" name="room_desc" placeholder="Enter description" rows="3" required></textarea>

            <label for="room-for">Room For</label>
            <select id="room-for" name="room_for">
                <option>Select</option>
                <option>Male</option>
                <option>Female</option>
                <option>Both</option>
            </select>

            <label for="room-type">Type</label>
            <select id="room-type" name="room_type">
                <option>Select</option>
                <option>Single</option>
                <option>Shared</option>
            </select>

            <label for="room-price">Shared Room One Bed Price</label>
            <select id="room-price" name="room_price">
                <option>Select</option>
                <option value="100">100</option>
                <option value="200">200</option>
                <option value="300">300</option>
            </select>

            <label for="total-beds">Total Beds</label>
            <select id="total-beds" name="total_beds">
                <option>Select</option>
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
            </select>

            <!-- Fixed the button: removed the extra </a> -->
            <button type="submit" class="add-room-btn">Add Room</button>
        </form>
    </div>

</body>
</html>
