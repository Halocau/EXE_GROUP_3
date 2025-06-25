/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Admin;

import dao.AccountDAO;
import dao.DAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Account;

/**
 *
 * @author pc
 */
@WebServlet(name = "Manage", urlPatterns = {"/manage"})
public class Manage extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        DAO dao = new DAO();
//        List<Account> accounts = dao.getAccounts();
        AccountDAO accountDAO = new AccountDAO();
        List<Account> accounts = accountDAO.getAccountsWithUser();
        request.setAttribute("account", accounts);

        request.getRequestDispatcher("Admin/Tables.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lấy email và role mới từ form
        String email = request.getParameter("email");
        String roleStr = request.getParameter("role");
        int newRole = 0;
        try {
            newRole = Integer.parseInt(roleStr);
        } catch (NumberFormatException e) {
            // nếu parse lỗi, giữ newRole = 0 (DeActive)
        }

        // Cập nhật vào DB
        AccountDAO dao = new AccountDAO();
        dao.updateUserRole(email, newRole);

        // Quay lại trang quản lý
        response.sendRedirect("manage");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
