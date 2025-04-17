<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>APNAPG</title>
    <link rel="stylesheet" href="Admin.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" integrity="sha512-Evv84Mr4kqVGRNSgIGL/F/aIDqQb7xQ2vcrdIwxfjThSH8CSR7PBEakCr51Ck+w+/U6swU2Im1vVX0SVk9ABhg==" crossorigin="anonymous" referrerpolicy="no-referrer" />
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
    <main>
        <h1 class="parent_main"><img src="images/hotel.png" class="main_text" height="40px" width="40px">Your Comfort is Our Top Priority</h1>
        <h2 class="parent_slogan">Find Your Perfect PG Accommodation</h2>
    
        <!-- <div class="search-bar">
            <img src="magnifying-glass.png" alt="" height="40px">
            <input type="text" placeholder="Search for locality">
            <button>Search</button>
        </div> -->
        <section class="search-bar">
            <input type="text" placeholder="Search for locality">
            <button>Search</button>
        </section>
        <img src="images/erasebg-transformed.png" class="landing_img" alt="City Skyline">
    
        </main>
        <section class="features">

        <div class="header-content">
            <div class="feature">
                <img src="images/aa.png" alt="Easy Property Listing">
                <h3>Easy Property Listing</h3>
                <p>Property owners can effortlessly list their properties and manage bookings with ease.</p>
            </div>
            <div class="feature">
                <img src="images/home2.png_" alt="Convenient Room Booking">
                <h3>Convenient Room Booking</h3>
                <p>Guests can browse and book rooms that suit their preferences without any hassle.</p>
            </div>
            <div class="feature">
                <img src="images/bb.png" alt="Secure Payment">
                <h3>Secure Payment</h3>
                <p>Experience secure transactions with our integrated payment gateway for seamless bookings.</p>
            </div>
        </div>
        
    </section>
        <section class="say">
            <h2>What Our Customers Say</h2>
            <div class="say">
                <p>“PG Management made it incredibly easy to find a room that fits my budget and location preferences!”</p>
                <span>Guest 1</span>
            </div>
            <div class="say">
                <p>“Listing my property was quick and straightforward. I've received so many bookings already!”</p>
                <span>Owner 1</span>
            </div>
          
        </section>
        <footer>
        <div class="footer-content">
            
            <p>Copyright © 2025. ApnaPG</p>
            <img src="images/ApnaPG-removebg-preview.png" alt="ApnaPG Logo">
            <div class="social-icons">
                <a href="#"><i class="fab fa-facebook-f"></i></a>
                <a href="#"><i class="fab fa-twitter"></i></a>
                <a href="#"><i class="fab fa-linkedin-in"></i></a>
                <a href="#"><i class="fab fa-instagram"></i></a>
            </div>
        </footer>
    </body>
</html>
