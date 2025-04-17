<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Property</title>
    <link rel="stylesheet" href="owner_add_property.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>

    <!-- Navigation Bar -->
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
                <li><a href="owner_login.jsp"><i class="fa-solid fa-right-from-bracket"></i> Logout</a></li>
            </ul>
        </nav>
    </header>

    <!-- Add Property Form -->
    <div class="form-container">
        <h2 style="background-color: #0808F361;">Add Property</h2>
        <form action="AddPropertyServlet" method="POST" id="propertyForm" enctype="multipart/form-data">
            <div class="form-group">
                <label>Property Name</label>
                <input type="text" name="Property_Name" id="Property_Name" placeholder="Enter Property Name" required>
            </div>
            <div class="form-group">
                <label>Property Description</label>
                <input type="text" name="Property_Description" id="Property_Description" placeholder="Enter Description" required>
            </div>
            <div class="form-group">
                <label>Property Location</label>
                <select name="Property_Location" id="Property_Location" required>
                    <option value="">Select Location</option>
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnapg", "root", "");
                            String query = "SELECT name FROM location"; 
                            PreparedStatement ps = con.prepareStatement(query);
                            ResultSet rs = ps.executeQuery();
                            while (rs.next()) {
                    %>
                                <option value="<%= rs.getString("name") %>"><%= rs.getString("name") %></option>
                    <%
                            }
                            rs.close();
                            ps.close();
                            con.close();
                        } catch (Exception e) {
                            e.printStackTrace();
                        }
                    %>
                </select>
            </div>
            <div class="form-group">
                <label>Address</label>
                <textarea name="Address" id="Address" placeholder="Enter Address" required></textarea>
            </div>

            <!-- Image Upload -->
            <div class="form-group">
                <label>Upload Property Image</label>
                <input type="file" name="image" id="image" accept="image/*" required>
                <img id="previewImage" src="#" alt="Image Preview" style="display: none; width: 100px; height: auto; margin-top: 10px;">
            </div>

            <button type="submit" class="submit-btn">Add Property</button>
         <a href="owner_pro_view.jsp">
    <button type="button" style="background-color: blue; color: white; padding: 10px 20px; border: none; border-radius:; cursor: pointer;">
        View Property
    </button>
</a>

        </form>

        <!-- Button to View Properties -->
        
    </div>

    <!-- JavaScript Validation & Image Preview -->
    <script>
        document.getElementById("propertyForm").addEventListener("submit", function (e) {
            let propertyName = document.getElementById("Property_Name").value.trim();
            let propertyDescription = document.getElementById("Property_Description").value.trim();
            let propertyLocation = document.getElementById("Property_Location").value; // No .trim() for <select>
            let address = document.getElementById("Address").value.trim();
            let imageFile = document.getElementById("image").files.length; // Check if an image is selected

            // Log values before submitting
            console.log("🚀 Before submitting to Servlet:");
            console.log("Property Name:", propertyName);
            console.log("Property Description:", propertyDescription);
            console.log("Property Location:", propertyLocation);
            console.log("Address:", address);
            console.log("Image Selected:", imageFile > 0);

            if (propertyName === "" || propertyDescription === "" || propertyLocation === "" || address === "" || imageFile === 0) {
                e.preventDefault();
                alert("Error: All fields and an image are required!");
            }
        });

        // Image Preview Functionality
        document.getElementById("image").addEventListener("change", function (event) {
            let reader = new FileReader();
            reader.onload = function () {
                let output = document.getElementById("previewImage");
                output.src = reader.result;
                output.style.display = "block";
            };
            reader.readAsDataURL(event.target.files[0]);
        });
    </script>

</body>
</html>
