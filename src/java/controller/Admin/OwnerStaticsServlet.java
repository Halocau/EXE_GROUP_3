package controller.Admin;

import dao.UserDAO;
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
import com.google.gson.Gson;
import java.util.ArrayList;

@WebServlet(name="OwnerStaticsServlet", urlPatterns={"/owner-statics"})
public class OwnerStaticsServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        UserDAO userDAO = new UserDAO();
        List<User> owners = userDAO.getOwner();
        Map<Integer, Double> revenueMap = new HashMap<>();
        double totalRevenue = 0;
        
        List<String> ownerNames = new ArrayList<>();
        List<Double> ownerRevenues = new ArrayList<>();

        for (User owner : owners) {
            double revenue = 5000000 + (owner.getUserID() * 1000000 % 15000000);
            revenueMap.put(owner.getUserID(), revenue);
            totalRevenue += revenue;
            
            ownerNames.add(owner.getUserName());
            ownerRevenues.add(revenue);
        }
        
        int ownerCount = owners.size();
        
        Gson gson = new Gson();
        request.setAttribute("ownerNamesJson", gson.toJson(ownerNames));
        request.setAttribute("ownerRevenuesJson", gson.toJson(ownerRevenues));
        
        request.setAttribute("owners", owners);
        request.setAttribute("revenueMap", revenueMap);
        request.setAttribute("ownerCount", ownerCount);
        request.setAttribute("totalRevenue", totalRevenue);
        request.getRequestDispatcher("Admin/OwnerStatics.jsp").forward(request, response);
    }
} 