import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

@WebServlet("/Guest_loginServlet")
public class Guest_loginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Check if email or password is null or empty
        if (email == null || email.trim().isEmpty() || password == null || password.trim().isEmpty()) {
            out.println("<h3 style='color:red'>Email and password cannot be empty!</h3>");
            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.include(request, response);
            return;  // Stop processing if email or password is empty
        }

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            // Load JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Creating connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/apnapg", "root", "");

            // Hash the input password before comparing it to the stored hashed password
            String hashedPassword = hashPassword(password);

            // SQL query to check if the email and password match
            String query = "SELECT * FROM guest WHERE email = ? AND password = ?";
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, hashedPassword);

            rs = ps.executeQuery();

            if (rs.next()) {
            	 HttpSession session = request.getSession();
                 session.setAttribute("guestEmail", email);
                 session.setAttribute("guestName", rs.getString("firstName"));
                // User found, login successful
                out.println("<h3 style='color:green'>Login successful!</h3>");
                RequestDispatcher rd = request.getRequestDispatcher("/search.jsp");  // Redirect to a welcome page
                rd.forward(request, response);
            } else {
                // Invalid credentials
                out.println("<h3 style='color:red'>Invalid email or password.</h3>");
                RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");  // Redirect to login page
                rd.include(request, response);
            }

        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<h3 style='color:red'>Database error occurred: " + e.getMessage() + "</h3>");
            RequestDispatcher rd = request.getRequestDispatcher("/guest.jsp");
            rd.include(request, response);

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3 style='color:red'>Exception occurred: " + e.getMessage() + "</h3>");
            RequestDispatcher rd = request.getRequestDispatcher("/login.jsp");
            rd.include(request, response);

        } finally {
            // Close resources
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (con != null) {
                    con.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Method to hash the password using SHA-256
    private String hashPassword(String password) throws NoSuchAlgorithmException {
        // Ensure the password is not null
        if (password == null || password.trim().isEmpty()) {
            throw new IllegalArgumentException("Password cannot be null or empty");
        }

        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hashedBytes = md.digest(password.getBytes());
        StringBuilder hexString = new StringBuilder();
        for (byte b : hashedBytes) {
            hexString.append(String.format("%02x", b));
        }
        return hexString.toString();
    }
}
