import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/PropertyActionServlet")
public class PropertyActionServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String propertyName = request.getParameter("property_name");

        String dbURL = "jdbc:mysql://localhost:3306/apnapg";
        String dbUser = "root";
        String dbPass = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

            String query = "";

            if ("approve".equals(action)) {
                // Approve action logic (e.g., setting a flag or status)
                query = "UPDATE property SET status = 'approved' WHERE Property_Name = ?";
            } else if ("delete".equals(action)) {
                // Delete action
                query = "DELETE FROM property WHERE Property_Name = ?";
            }

            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, propertyName);
            stmt.executeUpdate();

            stmt.close();
            conn.close();

            // Redirect to the property listing page after action
            response.sendRedirect("Admin_admin_pro.jsp");

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("Admin_admin_pro.jsp?error=" + e.getMessage());
        }
    }
}
