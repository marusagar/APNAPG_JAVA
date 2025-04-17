import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/AddLocationServlet")
public class AddLocationServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String locationName = request.getParameter("location_name");
        String locationCity = request.getParameter("location_city");

        // Debugging: Print received values
        System.out.println("Received Location Name: " + locationName);
        System.out.println("Received Location City: " + locationCity);

        // Check if inputs are empty
        if (locationName == null || locationName.trim().isEmpty() || locationCity == null || locationCity.trim().isEmpty()) {
            request.setAttribute("message", "Location name and city cannot be empty!");
            request.getRequestDispatcher("Admin_add_location.jsp").forward(request, response);
            return;
        }

        Connection con = null;
        PreparedStatement ps = null;

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish Database Connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnapg", "root", "");
            con.setAutoCommit(false); // Ensure transaction handling

            // SQL Query
            String query = "INSERT INTO location (name,city) VALUES (?, ?)";
            ps = con.prepareStatement(query);

            ps.setString(1, locationName);
            ps.setString(2, locationCity);

            // Execute Update
            int rowsInserted = ps.executeUpdate();
            con.commit(); // Commit transaction

            System.out.println("Rows inserted: " + rowsInserted);

            if (rowsInserted > 0) {
                response.sendRedirect("Admin_view_loc.jsp"); // Redirect to view locations
            } else {
                request.setAttribute("message", "Failed to add location. Try again!");
                request.getRequestDispatcher("Admin_add_location.jsp").forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
            try { if (con != null) con.rollback(); } catch (Exception ex) { ex.printStackTrace(); } // Rollback in case of failure
            request.setAttribute("message", "Error: " + e.getMessage());
            request.getRequestDispatcher("Admin_add_location.jsp").forward(request, response);

        } finally {
            try { if (ps != null) ps.close(); if (con != null) con.close(); } catch (Exception e) { e.printStackTrace(); }
        }
    }
}
