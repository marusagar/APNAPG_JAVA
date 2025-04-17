<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <link rel="stylesheet" href="login.css">
    
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

    <div class="container">
        <div class="login-box">
            
        <a href="Admin_Login.jsp"><h1>Login</h1></a>
        
        <form action="Guest_loginServlet" method="POST">
        
            <label for="email">Email</label>
            <input type="text" id="email" name= "email" placeholder="Enter Your Email">

            <label for="password">Password</label>
            <input type="password" id="password" name ="password" placeholder="Enter Your Password">

            <button class="submit-btn">Login</button></a>
            </form>
        </div>
    </div>
</body>
</html>

  
    