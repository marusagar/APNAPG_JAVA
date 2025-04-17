<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Detail | ApnaPG</title>
    <link rel="stylesheet" href="add_detail.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" />
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
                
                <li><a href="owner_login.jsp"><i class="fas fa-sign-in-alt"></i> Login</a></li>
                <li><a href="guest.jsp"><i class="fas fa-user"></i> Guest</a></li>
                <li><a href="owner_regi.jsp"><i class="fas fa-user-tie"></i> Owner</a></li>
            </ul>
        </nav>
    </header>

<div class="form-container">
    <h2 class="form-title">Add Detail</h2>
    <div class="form-card">
        <form action="GuestDetailServlet" method="POST" enctype="multipart/form-data">
            <div class="form-group">
                <label>Profession</label>
                <input type="text" name="profession" placeholder="Enter your profession" required>
            </div>
            <div class="form-group">
                <label>Age</label>
                <input type="number" name="age" placeholder="Enter your age" required>
            </div>
            <div class="form-group">
                <label>Select Government Proof</label>
                <input type="file" name="image" accept="image/*" required>
            </div>
            <div class="form-buttons">
                <button type="submit" class="btn add-btn">Add Detail</button>
                <a href="profile.jsp"><button type="button" class="cancel-btn">Cancel</button></a>
            </div>
        </form>
    </div>
</div>
</body>
</html>
