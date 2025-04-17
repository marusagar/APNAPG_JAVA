import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/OwnerAddFacilityServlet")
public class OwnerAddFacilityServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String facilityName = request.getParameter("facility_name");
        String facilityDesc = request.getParameter("facility_desc");
        String roomIdStr = request.getParameter("room_id");

        // Validate room ID
        int roomId;
        try {
            roomId = Integer.parseInt(roomIdStr);
        } catch (NumberFormatException e) {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<script type='text/javascript'>");
            out.println("alert('Invalid Room ID!');");
            out.println("window.location='owner_add_face.jsp';");
            out.println("</script>");
            return;
        }

        String dbURL = "jdbc:mysql://localhost:3306/apnapg";
        String dbUsername = "root";
        String dbPassword = "";

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load the JDBC driver
            Connection conn = DriverManager.getConnection(dbURL, dbUsername, dbPassword);

            String sql = "INSERT INTO facility (Facility_Name, Description, room_id) VALUES (?, ?, ?)";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setString(1, facilityName);
            stmt.setString(2, facilityDesc);
            stmt.setInt(3, roomId);

            int result = stmt.executeUpdate();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();

            if (result > 0) {
                out.println("<script type='text/javascript'>");
                out.println("alert('Facility added successfully!');");
                out.println("window.location='owner_pro_view.jsp';");
                out.println("</script>");
            } else {
                out.println("<script type='text/javascript'>");
                out.println("alert('Failed to add facility!');");
                out.println("window.location='owner_add_face.jsp';");
                out.println("</script>");
            }

            stmt.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<script type='text/javascript'>");
            out.println("alert('Database error: " + e.getMessage().replace("'", "\\'") + "');");
            out.println("window.location='owner_add_face.jsp';");
            out.println("</script>");
        }
    }
}
