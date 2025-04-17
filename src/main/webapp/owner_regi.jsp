<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Guest Registration</title>
    <link rel="stylesheet" href="owner_regi.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
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

    <div class="main">
        <div class="register-container">
            <h2 class="register-title">Register Owner</h2>
            <div class="form-container">
                <form action="Owner_Registerservlet" method="post" class="form card" id="frm" onsubmit="return validateForm()">
                    <div class="form-group">
                        <label for="firstname">First Name</label>
                        <input type="text" id="firstname" name="firstname" placeholder="Enter Your First Name" required>
                    </div>

                    <div class="form-group">
                        <label for="lastname">Last Name</label>
                        <input type="text" id="lastname" name="lastname" placeholder="Enter Your Last Name" required>
                    </div>

                    <div class="form-group">
                        <label for="email">Email</label>
                        <input type="email" id="email" name="email" placeholder="Enter Your Email" required>
                    </div>

                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" id="password" name="password" placeholder="Enter Your Password" required>
                        <small>Password must be at least 8 characters long</small>
                    </div>

                    <div class="form-group">
                        <label for="contact">Contact</label>
                        <input type="tel" id="contact" name="contact" placeholder="Enter Your Contact No." required pattern="[0-9]{10}">
                    </div>

                    <div class="form-group">
                        <label for="street">Street</label>
                        <input type="text" id="street" name="street" placeholder="Enter Your Address" required>
                    </div>

                    <div class="form-group">
                        <center>
                            <button type="submit" class="register-btn" value="Register">Register</button>
                        </center>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
    function validateForm(event) {
        event.preventDefault(); // Prevent form submission

        let firstName = document.getElementById("firstname").value.trim();
        let lastName = document.getElementById("lastname").value.trim();
        let email = document.getElementById("email").value.trim();
        let password = document.getElementById("password").value;
        let contact = document.getElementById("contact").value.trim();
        let street = document.getElementById("street").value.trim();

        // Regex for validation
        let emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        let contactRegex = /^[0-9]{10}$/;  // 10-digit phone number
        let passwordRegex = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;  // Min 8 chars, 1 letter, 1 number

        if (firstName === "" || lastName === "" || email === "" || password === "" || contact === "" || street === "") {
            alert("All fields are required!");
            return false;
        }

        if (!emailRegex.test(email)) {
            alert("Please enter a valid email address!");
            return false;
        }

        if (!passwordRegex.test(password)) {
            alert("Password must be at least 8 characters long and contain at least one letter and one number.");
            return false;
        }

        if (!contactRegex.test(contact)) {
            alert("Contact number must be 10 digits.");
            return false;
        }

        // Show success alert
        alert("Registration successful! Redirecting to login page...");

        // Submit the form after validation
        document.getElementById("frm").submit();
    }

    // Attach event listener to the form
    document.addEventListener("DOMContentLoaded", function () {
        document.getElementById("register-btn").addEventListener("click", validateForm);
    });
</script>




</body>
</html>
