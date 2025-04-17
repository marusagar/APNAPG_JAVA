import java.io.*;
import java.nio.file.*;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.*;
import jakarta.servlet.http.*;

@WebServlet("/GuestDetailServlet") // <- THIS IS REQUIRED
@MultipartConfig
public class GuestDetailServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("guestEmail");

        if (email == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        String profession = request.getParameter("profession");
        int age = Integer.parseInt(request.getParameter("age"));
        Part imagePart = request.getPart("image");

        String imageName = Paths.get(imagePart.getSubmittedFileName()).getFileName().toString();
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();

        String imagePath = uploadPath + File.separator + imageName;
        imagePart.write(imagePath);
        String imageURL = "uploads/" + imageName;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/apnapg", "root", "");

            PreparedStatement ps = con.prepareStatement(
                "UPDATE guest SET profession=?, age=?, image=? WHERE email=?");
            ps.setString(1, profession);
            ps.setInt(2, age);
            ps.setString(3, imageURL);
            ps.setString(4, email);

            int rowsUpdated = ps.executeUpdate();
            con.close();

            if (rowsUpdated > 0) {
                response.sendRedirect("my.jsp");
            } else {
                response.getWriter().println("Failed to update details.");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
