import java.io.IOException;
import java.sql.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/bookRoomServlet")
public class BookRoomServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve booking form data
        String startMonth = request.getParameter("start_month");
        String startYear = request.getParameter("start_year");
        String endMonth = request.getParameter("end_month");
        String endYear = request.getParameter("end_year");

        int propertyId = Integer.parseInt(request.getParameter("property_id"));
        String roomNumber = request.getParameter("room_id"); // this is room_number string from form

        // Retrieve guest_id from session
        HttpSession session = request.getSession();
        Integer guestId = (Integer) session.getAttribute("guest_id");

        if (guestId == null) {
            response.sendRedirect("wallet.jsp");
            return;
        }

        try {
            // Connect to database
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnapg", "root", "");

            // Get room_id from room_number
            int roomId = 0;
            PreparedStatement psRoom = con.prepareStatement("SELECT room_id FROM rooms WHERE room_number = ? AND property_id = ?");
            psRoom.setString(1, roomNumber);
            psRoom.setInt(2, propertyId);
            ResultSet rsRoom = psRoom.executeQuery();
            if (rsRoom.next()) {
                roomId = rsRoom.getInt("room_id");
            } else {
                response.getWriter().write("Invalid room number.");
                return;
            }
            rsRoom.close();
            psRoom.close();

            // Insert booking
            PreparedStatement ps = con.prepareStatement("INSERT INTO booking (start_month, start_year, end_month, end_year, guest_id, property_id, room_id) VALUES (?, ?, ?, ?, ?, ?, ?)");
            ps.setString(1, startMonth);
            ps.setString(2, startYear);
            ps.setString(3, endMonth);
            ps.setString(4, endYear);
            ps.setInt(5, guestId);
            ps.setInt(6, propertyId);
            ps.setInt(7, roomId);

            int rows = ps.executeUpdate();
            ps.close();
            con.close();

            if (rows > 0) {
                response.sendRedirect("booking_success.jsp");
            } else {
                response.getWriter().write("Booking failed!");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().write("Database error occurred.");
        }
    }
}
