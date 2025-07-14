package controller;


/*
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import org.json.JSONObject;

/**
 *
 * @author Admin
 */
@WebServlet(urlPatterns = {"/chatbot"})
public class ChatServlet extends HttpServlet {
    // Lưu lịch sử chat tạm thời trong RAM
    static final java.util.Map<String, java.util.List<String>> chatHistoryMap = new java.util.concurrent.ConcurrentHashMap<>();
    static final java.util.Map<String, Long> chatHistoryTimeMap = new java.util.concurrent.ConcurrentHashMap<>();
    private static final long CHAT_HISTORY_TIMEOUT = 10 * 60 * 1000; // 10 phút
    // Import RoomDAO, RoomDetailSe nếu chưa có
    // import dao.RoomDAO;
    // import model.RoomDetailSe;

    private static final String API_KEY = "AIzaSyDkzxbTZLJsHq_p2A_VjuFqTRmd7rvSl8E";
    private static final String API_URL = "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.0-flash:generateContent?key=" + API_KEY;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Nếu là yêu cầu lấy lịch sử chat (AJAX fetch)
        String action = request.getParameter("action");
        if ("history".equals(action)) {
            jakarta.servlet.http.HttpSession session = request.getSession();
            Object userIdObj = session.getAttribute("userID");
            String chatKey = (userIdObj != null) ? ("USER_" + userIdObj) : ("SESSION_" + session.getId());
            java.util.List<String> history = chatHistoryMap.getOrDefault(chatKey, new java.util.ArrayList<>());
            response.setContentType("application/json");
            response.setCharacterEncoding("UTF-8");
            org.json.JSONArray arr = new org.json.JSONArray(history);
            response.getWriter().write(arr.toString());
            return;
        }
        // Nếu không có chat.jsp thì trả về 404 hoặc thông báo
        response.setContentType("text/plain");
        response.setStatus(404);
        response.getWriter().write("Không tìm thấy trang chat.jsp. Hãy tích hợp widget chat vào trang web của bạn!");
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String userMessage = request.getParameter("message");
        jakarta.servlet.http.HttpSession session = request.getSession();
        Object userIdObj = session.getAttribute("userID");
        String chatKey;
        if (userIdObj != null) {
            chatKey = "USER_" + userIdObj;
        } else {
            chatKey = "SESSION_" + session.getId();
        }

        // Xóa lịch sử chat nếu quá hạn với khách chưa login
        if (userIdObj == null) {
            Long lastTime = chatHistoryTimeMap.get(chatKey);
            if (lastTime != null && System.currentTimeMillis() - lastTime > CHAT_HISTORY_TIMEOUT) {
                chatHistoryMap.remove(chatKey);
                chatHistoryTimeMap.remove(chatKey);
            }
        }

        // Lấy lịch sử chat hiện tại
        List<String> history = chatHistoryMap.getOrDefault(chatKey, new java.util.ArrayList<>());
        // Thêm tin nhắn mới vào lịch sử
        history.add("Người dùng: " + userMessage);
        // Mặc định lấy từ request (nếu có)
        String roomName = request.getParameter("roomName");
        String roomFee = request.getParameter("roomFee");
        String roomDescription = request.getParameter("roomDescription");
        String address = request.getParameter("address");
        String roomNumber = request.getParameter("roomNumber");
        String roomSize = request.getParameter("roomSize");
        String roomFloor = request.getParameter("roomFloor");
        String roomImg = request.getParameter("roomImg");
        String roomOccupant = request.getParameter("roomOccupant");
        String roomStatus = request.getParameter("roomStatus");
        String amenities = request.getParameter("amenities");

        // Nếu user hỏi về phòng cụ thể, ví dụ "phòng 403"
        Pattern p = Pattern.compile("phòng\\s*(\\d+)", Pattern.CASE_INSENSITIVE);
        Matcher m = p.matcher(userMessage);
        if (m.find()) {
            String searchRoomNumber = m.group(1);
            try {
                dao.RoomDAO roomDAO = new dao.RoomDAO();
                model.RoomDetailSe room = roomDAO.getRoomDetailByNumber(searchRoomNumber);
                if (room != null) {
                    roomName = room.getRoomName();
                    roomFee = String.valueOf(room.getRoomFee());
                    roomDescription = room.getRoomDescription();
                    address = room.getAddress();
                    roomNumber = String.valueOf(room.getRoomNumber());
                    roomSize = String.valueOf(room.getRoomSize());
                    roomFloor = String.valueOf(room.getRoomFloor());
                    roomImg = room.getRoomImg();
                    roomOccupant = String.valueOf(room.getRoomOccupant());
                    roomStatus = String.valueOf(room.getRoomStatus());
                    amenities = room.getAmenitiesString(); // phương thức trả về tiện ích dạng chuỗi
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        String botReply = callGeminiAPI(userMessage, roomName, roomFee, roomDescription, address, roomNumber, roomSize, roomFloor, roomImg, roomOccupant, roomStatus, amenities, history);
        // Lưu cả phản hồi của bot vào lịch sử
        history.add("Bot: " + botReply);
        chatHistoryMap.put(chatKey, history);
        chatHistoryTimeMap.put(chatKey, System.currentTimeMillis());

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        JSONObject jsonResponse = new JSONObject();
        jsonResponse.put("reply", botReply);

        response.getWriter().write(jsonResponse.toString());
    }

    private String callGeminiAPI(String userMessage, String roomName, String roomFee, String roomDescription, String address,
            String roomNumber, String roomSize, String roomFloor, String roomImg, String roomOccupant, String roomStatus, String amenities, java.util.List<String> history) {
        try {
            URL url = new URL(API_URL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);
            conn.setRequestProperty("Content-Type", "application/json");

            // Prompt có đầy đủ thông tin phòng và lịch sử chat
            StringBuilder historyBuilder = new StringBuilder();
            if (history != null && !history.isEmpty()) {
                historyBuilder.append("Lịch sử trò chuyện trước đó:\n");
                for (String msg : history) {
                    historyBuilder.append(msg).append("\n");
                }
            }
            String systemPrompt = "Bạn là một trợ lý AI thân thiện cho website HoLa StayNow - nền tảng đặt và quản lý phòng trọ tại khu vực Hòa Lạc, Hà Nội.\n"
                    + historyBuilder.toString()
                    + "Thông tin phòng hiện tại:\n"
                    + "- Tên phòng: " + (roomName != null ? roomName : "Không rõ") + "\n"
                    + "- Số phòng: " + (roomNumber != null ? roomNumber : "Không rõ") + "\n"
                    + "- Diện tích: " + (roomSize != null ? roomSize : "Không rõ") + " m2\n"
                    + "- Tầng: " + (roomFloor != null ? roomFloor : "Không rõ") + "\n"
                    + "- Giá phòng: " + (roomFee != null ? roomFee : "Không rõ") + " VND/tháng\n"
                    + "- Số người ở: " + (roomOccupant != null ? roomOccupant : "Không rõ") + "\n"
                    + "- Trạng thái phòng: " + (roomStatus != null ? roomStatus : "Không rõ") + "\n"
                    + "- Tiện ích: " + (amenities != null ? amenities : "Không rõ") + "\n"
                    + "- Mô tả: " + (roomDescription != null ? roomDescription : "Không rõ") + "\n"
                    + "- Địa chỉ: " + (address != null ? address : "Không rõ") + "\n"
                    + "- Hình ảnh: " + (roomImg != null ? roomImg : "Không rõ") + "\n"
                    + "Website cung cấp thông tin về các loại phòng, giá cả, tiện ích và hỗ trợ người dùng đặt phòng online.\n"
                    + "Nếu người dùng hỏi về dịch vụ, vị trí, cách đặt phòng, hoặc giá – hãy trả lời ngắn gọn, dễ hiểu và lịch sự.\n"
                    + "Nếu bạn không chắc chắn về câu hỏi, hãy nói: 'Xin lỗi, tôi không chắc chắn về thông tin này. Bạn có thể liên hệ quản lý để biết thêm chi tiết.'";

            String fullPrompt = systemPrompt + "\nKhách: " + userMessage;

            String jsonInput = "{ \"contents\": [ { \"parts\": [ { \"text\": \"" + fullPrompt.replace("\"", "\\\"") + "\" } ] } ] }";

            try (OutputStream os = conn.getOutputStream()) {
                os.write(jsonInput.getBytes(StandardCharsets.UTF_8));
            }

            BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream(), StandardCharsets.UTF_8));
            StringBuilder sb = new StringBuilder();
            String line;
            while ((line = reader.readLine()) != null) {
                sb.append(line);
            }
            reader.close();

            JSONObject responseJson = new JSONObject(sb.toString());
            return responseJson.getJSONArray("candidates")
                    .getJSONObject(0)
                    .getJSONObject("content")
                    .getJSONArray("parts")
                    .getJSONObject(0)
                    .getString("text");

        } catch (Exception e) {
            e.printStackTrace();
            return "Xin lỗi, hệ thống đang gặp sự cố!";
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
