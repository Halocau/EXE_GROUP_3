package controller.Owner;

import java.util.UUID;
import controller.ImageServlet;
import java.io.IOException;
import java.io.File;
import java.math.BigDecimal;
import java.nio.file.Paths;
import java.io.File;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import jakarta.servlet.http.Part;

import dao.RoomDAO;
import dao.VipDAO;
import java.util.List;
import model.Room;
import model.Vip;
import model.Account;

@WebServlet(name = "AddRoomController", urlPatterns = {"/addroom"})
@MultipartConfig // Bắt buộc để upload ảnh
public class AddRoomController extends HttpServlet {

    VipDAO vipDAO = new VipDAO();
    RoomDAO roomDAO = new RoomDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String service = request.getParameter("service");
        if (service == null || service.equals("addRoom")) {

            // Xử lý các logic chuẩn bị cho trang nếu cần (ví dụ: load dữ liệu từ DB)
            request.getRequestDispatcher("Owner/addRoom.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        try {
            HttpSession session = request.getSession(false);
            Account account = (Account) session.getAttribute("user");

            if (account == null || account.getUser() == null) {
                response.sendRedirect("login.jsp");
                return;
            }

            int ownerId = account.getUser().getUserID();
            Integer vipId = account.getUser().getVipId(); 

            // 🔸 Get form inputs
            int roomFloor = Integer.parseInt(request.getParameter("roomFloor"));
            int roomNumber = Integer.parseInt(request.getParameter("roomNumber"));
            int roomSize = Integer.parseInt(request.getParameter("roomSize"));
            BigDecimal roomFee = new BigDecimal(request.getParameter("roomFee"));
            int roomOccupant = Integer.parseInt(request.getParameter("roomOccupant"));
            String paymentCode = "0";
            String description = request.getParameter("description");
            String roomName = request.getParameter("roomName");

            int roomStatus = 2;

            Part part = request.getPart("roomImg");
String imageBase64 = null;

if (part != null && part.getSize() > 0) {
    byte[] imageBytes = part.getInputStream().readAllBytes();
    imageBase64 = java.util.Base64.getEncoder().encodeToString(imageBytes);
}

            Room room = new Room();
            room.setRoomFloor(roomFloor);
            room.setRoomNumber(roomNumber);
            room.setRoomSize(roomSize);
            room.setRoomFee(roomFee);
            room.setRoomOccupant(roomOccupant);
            room.setVipId(vipId);
            room.setPaymentCode(paymentCode);
            room.setRoomStatus(roomStatus);
            room.setRoomImg(imageBase64);
            room.setOwnerID(ownerId); 
            room.setDescription(description);
            room.setRoomName(roomName);
            roomDAO.addRoom(room);

            response.sendRedirect(request.getContextPath() + "/OwnerController");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "An error occurred while adding the room.");
            request.getRequestDispatcher("Owner/addRoom.jsp").forward(request, response);
        }
    }

    @Override
    public String getServletInfo() {
        return "AddRoomController handles room creation.";
    }
}
