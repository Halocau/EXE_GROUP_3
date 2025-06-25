package controller.Renter;

import dao.UserDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import model.User;

@WebServlet(name = "WalletController", urlPatterns = {"/WalletController"})
public class WalletController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        Integer userID = (Integer) session.getAttribute("userID");
        if (userID != null) {
            // Retrieve full User information
            UserDAO userDao = new UserDAO();
            User currentUser = userDao.getUserById(userID);
            session.setAttribute("currentUser", currentUser);
        }
        request.getRequestDispatcher("Renter/wallet.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Optional: handle POST if required
    }

    @Override
    public String getServletInfo() {
        return "Wallet Controller";
    }
}
