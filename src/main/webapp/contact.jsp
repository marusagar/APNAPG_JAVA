<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Us</title>
    <link rel="stylesheet" href="contact.css">
    
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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
                
                <li><a href="login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a></li>
                <li><a href="guest.jsp"><i class="fas fa-user"></i> Guest</a></li>
                <li><a href="owner.jsp"><i class="fas fa-user-tie"></i> Owner</a></li>
            </ul>
        </nav>
    </header>
    <div class="contact-container">
        <h2><span class="icon">👤</span> Contact Us</h2>
        <p class="description">
            Have questions or need assistance? We're here to help. Whether you're a property owner with queries about listing your property or a guest needing assistance with bookings, feel free to reach out to us. Our support team is always ready to assist you.
        </p>
        <div class="form-container">
            <form>
                <label for="name">Name</label>
                <input type="text" id="name" name="name" placeholder="Enter Your Name" required>

                <label for="email">Email</label>
                <input type="email" id="email" name="email" placeholder="Enter Your Email" required>

                <label for="message">Message</label>
                <textarea id="message" name="message" rows="4" placeholder="Enter Your Message" required></textarea>

                <button type="submit">Submit</button>
            </form>
        </div>
    </div>
</body>
</html>
    