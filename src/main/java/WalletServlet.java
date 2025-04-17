import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.*;

@WebServlet("/WalletServlet")
public class WalletServlet extends HttpServlet {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/apnapg";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String paymentId = request.getParameter("payment_id");
        int amount = Integer.parseInt(request.getParameter("amount"));

        // You should fetch this from session in real app
        int guestId = 1;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {

                // Save payment
                String insert = "INSERT INTO wallet_transactions (guest_id, payment_id, amount) VALUES (?, ?, ?)";
                try (PreparedStatement ps = conn.prepareStatement(insert)) {
                    ps.setInt(1, guestId);
                    ps.setString(2, paymentId);
                    ps.setInt(3, amount);
                    ps.executeUpdate();
                }

                // Update wallet balance
                String update = "UPDATE guests SET wallet_balance = wallet_balance + ? WHERE id = ?";
                try (PreparedStatement ps2 = conn.prepareStatement(update)) {
                    ps2.setInt(1, amount);
                    ps2.setInt(2, guestId);
                    ps2.executeUpdate();
                }

                response.sendRedirect("payment-success.jsp");
            }
        } catch (Exception e) {
            throw new ServletException("Database error", e);
        }
    }
}
