<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Room Booking Page | ApnaPG</title>
    <link rel="stylesheet" href="room_shared.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
                <li><a href="paid.jsp"><i class="fas fa-calendar-check"></i>Booking</a></li>
                <li><a href="wallet.jsp"><img src="icons/wallet.png" height="20rem" width="20rem" alt=""></a></li>
                <li><a href="profile.jsp"><i class="fa-solid fa-user"></i></a></li>
                <li><a href="index.jsp"><img src="icons/logout.png" height="20rem" width="20rem"> Logout</a></li>
            </ul>
        </nav>
    </header>


    <!-- Main Container -->
    <div class="container">
        <h2 class="title">Room Booking Page</h2>

        <div class="property-details">
            <img src="images/search3.jpg" alt="Property Image" class="property-img">

            <div class="details">
                <h3 class="property-name">Prime Comfort Hub</h3>
                <p class="property-desc">
                    Experience modern, affordable, and comfortable living tailored for urban professionals and students. 
                    Stay Smart Space PG offers a perfect blend of convenience, security, and community, ensuring you feel right at home.
                </p>
                <p class="location"><span><img src="images/hotel.png" width="25rem" height="25rem" alt=""> Mumbai</span></p>
                <p class="address"><strong>Property Address:</strong> Demo Street, Thane West, Pincode 123456</p>

                <div class="owner-info">
                    <p><strong>Owner Name:</strong> Sagar</p>
                    <p><strong>Last Name:</strong> Maru</p>
                    <p><strong>Contact No.:</strong> 8980366196</p>
                    <p><strong>Email Id:</strong> smaru254@rku.ac.in</p>
                </div>
            </div>
        </div>


    <div class="room_details">
        <!-- Room Information -->
        <div class="room-info">
            <h3>Room No: 102 (Shared Room)</h3>
            <p><strong>Room For:</strong> Boys</p>
            <p><strong>Description:</strong> 102 is shared with 3 beds and 3 lockers for personal use.</p>
            <p><strong>Room Price:</strong> 9999</p>

            <!-- Shared Bed Selection -->
            <div class="form-group">
                <label><strong>Shared Bed:</strong></label>
                <select>
                    <option>Select Bed</option>
                    <option>Bed 1</option>
                    <option>Bed 2</option>
                    <option>Bed 3</option>
                </select>
            </div>
        </div>

        <!-- Booking Details -->
        <div class="booking-details">
            <h3>Booking Detail</h3>
            <div class="booking-form">
                <div class="form-group">
                    <label>Start Month</label>
                    <select>
                        <option>Select Month</option>
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
                    <select>
                        <option>Select Year</option>
                        <option>2024</option>
                        <option>2025</option>
                        <option>2026</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>End Month</label>
                    <select>
                        <option>Select Month</option>
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
                    <select>
                        <option>Select Year</option>
                        <option>2024</option>
                        <option>2025</option>
                        <option>2026</option>
                    </select>
                </div>
            </div>
            <div class="buttons">
                <button class="btn book-room">Book Room</button>
                <button class="btn check-availability">Check Room Availability</button>
            </div>
    </div>
    </div>
        

            
        </div>

</body>
</html>
    