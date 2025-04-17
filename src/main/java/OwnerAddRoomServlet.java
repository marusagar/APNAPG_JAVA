import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.*;
import java.sql.*;

@WebServlet("/OwnerAddRoomServlet")
public class OwnerAddRoomServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get data from the form
        String roomNumber = request.getParameter("room_number");
        String roomDesc = request.getParameter("room_desc");
        String roomFor = request.getParameter("room_for");
        String roomType = request.getParameter("room_type");
        String roomPrice = request.getParameter("room_price");
        String totalBeds = request.getParameter("total_beds");
        String propertyName = request.getParameter("propertyName"); // Get property name

        // DB connection variables
        Connection conn = null;
        PreparedStatement stmt = null;

        // DB details
        String dbURL = "jdbc:mysql://localhost:3306/apnapg";
        String dbUsername = "root";
        String dbPassword = "";

        PrintWriter out = response.getWriter(); // Get the response writer

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Connect to DB
            conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

            // SQL insert query
            String sql = "INSERT INTO rooms (room_number, room_desc, room_for, room_type, room_price, total_beds) VALUES (?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, roomNumber);
            stmt.setString(2, roomDesc);
            stmt.setString(3, roomFor);
            stmt.setString(4, roomType);
            stmt.setString(5, roomPrice);
            stmt.setString(6, totalBeds);

            // Execute the insert query
            int rowsInserted = stmt.executeUpdate();

            if (rowsInserted > 0) {
                // Room added successfully, show success message and redirect
                out.println("<script>alert('Room added successfully!'); window.location='owner_pro_view.jsp?addedProperty=" + propertyName + "';</script>");
            } else {
                // Insertion failed, show error message
                out.println("<script>alert('Failed to add room.'); window.history.back();</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<script>alert('Database error: " + e.getMessage() + "'); window.history.back();</script>");
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
