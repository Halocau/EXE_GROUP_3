/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller.Admin;

import dao.AccountDAO;
import dao.DAO;
import dao.UserDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.util.List;
import model.Account;
import dao.BillDAO;

/**
 *
 * @author pc
 */
@WebServlet(name = "Manage", urlPatterns = {"/manage"})
public class Manage extends HttpServlet {

    // Helper method để kiểm tra quyền admin
    private boolean isAdmin(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session == null) {
            return false;
        }
        Account user = (Account) session.getAttribute("user");
        return user != null && user.getUserRole() == 4;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //check admin
        // Nếu không phải admin, redirect về trang login
        if (!isAdmin(request)) {
            response.sendRedirect("login.jsp");
            return;
        }
      DAO dao = new DAO();
     List<Account> accounts = dao.getAccounts();
        AccountDAO accountDAO = new AccountDAO();
 //       List<Account> accounts = accountDAO.getAccountsWithUser();
        request.setAttribute("account", accounts);

 //        Thống kê số lượng chủ trọ (role = 'owner')
       int ownerCount = dao.countAccountByRole("owner");
       request.setAttribute("ownerCount", ownerCount);

        // Thống kê tổng doanh thu toàn hệ thống
        BillDAO billDAO = new BillDAO();
        double totalRevenue = billDAO.getTotalRevenue();
        request.setAttribute("totalRevenue", totalRevenue);

        request.getRequestDispatcher("Admin/Tables.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Cũng check admin trước khi thực thi
        if (!isAdmin(request)) {
            response.sendRedirect("login.jsp");
            return;
        }
        // Lấy email và role mới từ form
        String email = request.getParameter("email");
    // 1) update role if present
        String roleStr = request.getParameter("role");
        if (roleStr != null) {
            int newRole = Integer.parseInt(roleStr);
            new AccountDAO().updateUserRole(email, newRole);
        }
        // 2) Cập nhật vip nếu có
        String vipStr = request.getParameter("vipId");
        if (vipStr != null) {
            int newVip = Integer.parseInt(vipStr);
            new AccountDAO().updateUserVip(email, newVip);
        }

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
        return "Manage accounts servlet";
    }// </editor-fold>

}
