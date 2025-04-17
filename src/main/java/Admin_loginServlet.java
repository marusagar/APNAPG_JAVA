import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@WebServlet("/Admin_loginServlet")
public class Admin_loginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            request.setAttribute("loginError", "Email and password cannot be empty!");
            RequestDispatcher rd = request.getRequestDispatcher("/Admin_Login.jsp");
            rd.forward(request, response);
            return;
        }

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnapg", "root", "");

            String query = "SELECT * FROM admin WHERE email = ? AND password = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password); // Change this if using password hashing

            rs = ps.executeQuery();

            if (rs.next()) {
                request.getSession().setAttribute("adminEmail", email);
                response.sendRedirect("Admin.jsp"); // Redirect to admin dashboard
            } else {
                request.setAttribute("loginError", "Invalid admin email or password.");
                RequestDispatcher rd = request.getRequestDispatcher("/Admin_Login.jsp");
                rd.forward(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("loginError", "Database error occurred: " + e.getMessage());
            RequestDispatcher rd = request.getRequestDispatcher("/Admin_Login.jsp");
            rd.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("loginError", "Exception occurred: " + e.getMessage());
            RequestDispatcher rd = request.getRequestDispatcher("/Admin_Login.jsp");
            rd.forward(request, response);
        } finally {
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
