/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controller;

import dao.RoomDAO;
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
@WebServlet(name = "PayOnlineController", urlPatterns = {"/PayOnlineController"})
public class PayOnlineController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet PayOnlineController</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet PayOnlineController at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int userID = Integer.parseInt(request.getParameter("userID"));
        int roomID = Integer.parseInt(request.getParameter("roomID"));
        BigDecimal amount = new BigDecimal(request.getParameter("amount")); // số tiền cần trừ

        UserDAO userDAO = new UserDAO();

        // 1. Lấy thông tin user
        UserDetail user = userDAO.getUserDetailByID(userID);

        if (user != null) {
            BigDecimal wallet = user.getWallet();

            if (wallet.compareTo(amount) >= 0) {
                // 2. Đủ tiền → Trừ tiền
                BigDecimal newWallet = wallet.subtract(amount);

                boolean updated = userDAO.updateWallet(userID, newWallet);

                if (updated) {
                    RoomDAO roomDAO = new RoomDAO();
                    boolean roomUpdated = roomDAO.updateRoomStatusWallet(roomID, 4); // Cập nhật trạng thái phòng

                    if (roomUpdated) {
                        // ✅ Cập nhật ví và trạng thái phòng thành công
                        response.sendRedirect("RenterRoomController?service=listRoom&index=1");
                    } else {
                        // ❌ Cập nhật ví thành công nhưng lỗi cập nhật phòng
                        request.setAttribute("error", "Cập nhật trạng thái phòng thất bại");
                        request.getRequestDispatcher("error.jsp").forward(request, response);
                    }
                } else {
                    // ❌ Lỗi cập nhật
                    request.setAttribute("error", "Cập nhật ví thất bại");
                    request.getRequestDispatcher("error.jsp").forward(request, response);
                }

            } else {
                // ❌ Không đủ tiền
                request.setAttribute("error", "Số dư không đủ để thanh toán");
                request.getRequestDispatcher("error.jsp").forward(request, response);
            }
        } else {
            response.sendRedirect("login.jsp");
        }
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
