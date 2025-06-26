package controller.Admin;

import dao.UserDAO;
import dao.BillDAO;
import model.User;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(name="OwnerStaticsServlet", urlPatterns={"/owner-statics"})
public class OwnerStaticsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        BillDAO billDAO = new BillDAO();
        List<User> owners = userDAO.getOwner();
        Map<Integer, Double> revenueMap = new HashMap<>();
        double totalRevenue = 0;
        for (User owner : owners) {
            double revenue = billDAO.getRevenueByOwner(owner.getUserID());
            revenueMap.put(owner.getUserID(), revenue);
            totalRevenue += revenue;
        }
        int ownerCount = owners.size();
        request.setAttribute("owners", owners);
        request.setAttribute("revenueMap", revenueMap);
        request.setAttribute("ownerCount", ownerCount);
        request.setAttribute("totalRevenue", totalRevenue);
        request.getRequestDispatcher("Admin/OwnerStatics.jsp").forward(request, response);
    }
} 