/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dao.RoomDAO;
import dao.SliderDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.List;
import model.Rooms;
import model.Slider;

/**
 *
 * @author Admin
 */
@WebServlet(name = "HomeController", urlPatterns = {"/HomeController"})
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        RoomDAO dao = new RoomDAO();
        SliderDAO daol = new SliderDAO();
        List<Rooms> listRoomVip1 = dao.pagingRoomVip(1, 0, 1);
        List<Rooms> listRoomVip2 = dao.pagingRoomVip(1, 0, 2);
        List<Rooms> listRoomVip3 = dao.pagingRoomVip(1, 0, 3);
        List<Slider> sliders = daol.getAllSlider();
        request.setAttribute("listRoomVip1", listRoomVip1);
        request.setAttribute("listRoomVip2", listRoomVip2);
        request.setAttribute("listRoomVip3", listRoomVip3);
        request.setAttribute("slider", sliders);
        request.getRequestDispatcher("Guest/GuestHome.jsp").forward(request, response);
    } 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    }
}
