

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Collection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet("/AddPropertyServlet")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2, // 2MB
    maxFileSize = 1024 * 1024 * 10, // 10MB
    maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class AddPropertyServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIRECTORY = "property_images"; // Folder to store images

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        System.out.println("Request received in AddPropertyServlet");

        String propertyName = request.getParameter("Property_Name");
        String propertyDescription = request.getParameter("Property_Description");
        String propertyLocation = request.getParameter("Property_Location");
        String address = request.getParameter("Address");

        if (propertyName == null || propertyName.isEmpty() ||
            propertyDescription == null || propertyDescription.isEmpty() ||
            propertyLocation == null || propertyLocation.isEmpty() ||
            address == null || address.isEmpty()) {
            out.println("<script>alert('Error: All fields are required!'); window.history.back();</script>");
            return;
        }

        String imagePath = "";
        try {
            // Create directory if it doesn't exist
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }

            // Process uploaded file
            Collection<Part> parts = request.getParts();
            for (Part part : parts) {
                if (part.getContentType() != null) { // Check if it's a file
                    String fileName = System.currentTimeMillis() + "_" + part.getSubmittedFileName();
                    String filePath = uploadPath + File.separator + fileName;
                    part.write(filePath);
                    imagePath = UPLOAD_DIRECTORY + "/" + fileName; // Relative path to store in DB
                }
            }

            // Insert data into the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnapg", "root", "");

            String query = "INSERT INTO property (Property_Name, Property_Description, Property_Location, Address, Image) VALUES (?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, propertyName);
            ps.setString(2, propertyDescription);
            ps.setString(3, propertyLocation);
            ps.setString(4, address);
            ps.setString(5, imagePath);

            int result = ps.executeUpdate();

            if (result > 0) {
                out.println("<script>alert('Property added successfully!'); window.location='owner_pro_view.jsp';</script>");
            } else {
                out.println("<script>alert('Error adding property!'); window.history.back();</script>");
            }

            ps.close();
            con.close();
        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('Database error: " + e.getMessage() + "'); window.history.back();</script>");
        }
    }
}
