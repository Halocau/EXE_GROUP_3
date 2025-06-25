package controller.Owner;

import dao.RenterDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.RenterList;
import model.Statistics;
import dao.RoomDAO;
import model.Rooms;

/**
 *
 * @author quocp
 */
@WebServlet(name="ListRenterController", urlPatterns={"/ListRenterController"})
public class ListRenterController extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        RenterDAO renterDAO = new RenterDAO();
        RoomDAO roomDAO = new RoomDAO();
        
        // Lấy danh sách người thuê
        List<RenterList> renters = renterDAO.getListRenters();
        request.setAttribute("listRenters", renters);
        
        // Lấy thông tin thống kê
        Statistics stats = renterDAO.getStatistics();
        request.setAttribute("statistics", stats);

        // --- Xử lý filter và phân trang cho danh sách phòng ---
        int page = 1;
        int pageSize = 6;
        String pageParam = request.getParameter("page");
        if (pageParam != null) {
            try { page = Integer.parseInt(pageParam); } catch (Exception e) { page = 1; }
        }
        String searchRoomNumber = request.getParameter("searchRoomNumber");
        String status = request.getParameter("status"); // "all", "occupied", "empty"
        String minPriceStr = request.getParameter("minPrice");
        String maxPriceStr = request.getParameter("maxPrice");
        Integer minPrice = null, maxPrice = null;
        try { if (minPriceStr != null && !minPriceStr.isEmpty()) minPrice = Integer.parseInt(minPriceStr); } catch(Exception e){}
        try { if (maxPriceStr != null && !maxPriceStr.isEmpty()) maxPrice = Integer.parseInt(maxPriceStr); } catch(Exception e){}

        // Lấy danh sách phòng đã filter và phân trang
        List<Rooms> filteredRooms = roomDAO.getFilteredRooms(searchRoomNumber, status, minPrice, maxPrice, page, pageSize);
        int totalRooms = roomDAO.countFilteredRooms(searchRoomNumber, status, minPrice, maxPrice);
        int totalPages = (int) Math.ceil((double) totalRooms / pageSize);

        request.setAttribute("filteredRooms", filteredRooms);
        request.setAttribute("currentPage", page);
        request.setAttribute("totalPages", totalPages);
        request.setAttribute("searchRoomNumber", searchRoomNumber);
        request.setAttribute("status", status);
        request.setAttribute("minPrice", minPriceStr);
        request.setAttribute("maxPrice", maxPriceStr);
        // --- End filter & paging ---

        request.getRequestDispatcher("Owner/listRenter.jsp").forward(request, response);
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
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
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        processRequest(request, response);
    }

    /** 
     * Returns a short description of the servlet.
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
