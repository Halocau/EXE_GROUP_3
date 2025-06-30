/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Admin;

import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import model.UserDetail;

/**
 *
 * @author Admin
 */
@WebServlet(name = "updatewallet", urlPatterns = {"/updatewallet"})
public class updatewallet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String amountStr = request.getParameter("amount");

        try {
            BigDecimal amount = new BigDecimal(amountStr);
            UserDAO dao = new UserDAO();
            dao.addMoneyToWallet(email, amount);

            // Cập nhật session với thông tin mới từ database
            UserDetail updatedUser = dao.getUserDetailByEmail(email);
            request.getSession().setAttribute("userDetail", updatedUser); // <== RẤT QUAN TRỌNG

            response.sendRedirect("profile.jsp?walletUpdated=true");
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("profile.jsp?walletError=true");
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Update wallet by admin";
    }// </editor-fold>

}
