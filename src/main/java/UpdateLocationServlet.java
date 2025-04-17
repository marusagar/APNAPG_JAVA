import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/UpdateLocationServlet")
public class UpdateLocationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // ✅ Handle GET request: Fetch Location Data
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idParam = request.getParameter("id");

        // Validate ID before parsing
        if (idParam == null || idParam.trim().isEmpty()) {
            request.setAttribute("error", "Invalid location ID.");
            request.getRequestDispatcher("Admin_update_location.jsp").forward(request, response);
            return;
        }

        int id;
        try {
            id = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            request.setAttribute("error", "Invalid location ID format.");
            request.getRequestDispatcher("Admin_update_location.jsp").forward(request, response);
            return;
        }

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Load MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnapg", "root", "");
            String query = "SELECT id, name, city FROM location WHERE id = ?";
            ps = con.prepareStatement(query);
            ps.setInt(1, id);
            rs = ps.executeQuery();

            if (rs.next()) {
                request.setAttribute("id", rs.getInt("id"));
                request.setAttribute("name", rs.getString("name") != null ? rs.getString("name") : "");
                request.setAttribute("city", rs.getString("city") != null ? rs.getString("city") : "");
            } else {
                request.setAttribute("error", "Location not found.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        RequestDispatcher rd = request.getRequestDispatcher("Admin_update_location.jsp");
        rd.forward(request, response);
    }

    // ✅ Handle POST request: Update Location Data
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String city = request.getParameter("city");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            // Load MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to database
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnapg", "root", "");
            String updateQuery = "UPDATE location SET name = ?, city = ? WHERE id = ?";
            ps = con.prepareStatement(updateQuery);
            ps.setString(1, name);
            ps.setString(2, city);
            ps.setInt(3, id);

            int rowsUpdated = ps.executeUpdate();

            if (rowsUpdated > 0) {
                request.setAttribute("success", "Location updated successfully.");
            } else {
                request.setAttribute("error", "Failed to update location.");
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error: " + e.getMessage());
        } finally {
            // Close resources
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        // Redirect back to form
        request.getRequestDispatcher("Admin_update_location.jsp").forward(request, response);
    }
}
