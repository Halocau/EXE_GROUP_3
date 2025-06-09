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
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

/**
 *
 * @author Admin
 */
@WebServlet(urlPatterns = {"/sendemail"})
public class SendEmailServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/chat-widget/sendEmail.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String to = request.getParameter("to");
        String action = request.getParameter("action");

        String subject = "";
        String content = "";

        switch (action) {
            case "vip-confirm":
                String vipCode = request.getParameter("vipCode");
                subject = getVipConfirmSubject();
                content = getVipConfirmContent(vipCode);
                break;

            case "request-success":
                String roomCode = request.getParameter("roomCode");
                subject = getRequestSuccessSubject();
                content = getRequestSuccessContent(roomCode);
                break;

            case "host-register":   
                String emailAccount = request.getParameter("emailAccount");
                subject = getHostRegisterSubject();
                content = getHostRegisterContent(emailAccount);
                break;

            case "feedback":
                subject = getFeedbackSubject();
                content = getFeedbackContent();
                break;

            default:
                subject = "[StayNow] Thông báo";
                content = "<p>Email tự động từ hệ thống.</p>" + getContactInfo();
                break;
        }

        final String from = "holastaynow@gmail.com";
        final String password = "fdvwbpmeewqmzzti";

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");

        Session session = Session.getInstance(props, new Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(from, password);
            }
        });

        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(from));
            message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to));
            message.setSubject(MimeUtility.encodeText(subject, "UTF-8", "B"));
            message.setContent(content, "text/html; charset=utf-8");

            Transport.send(message);
            response.getWriter().println("Email đã được gửi thành công!");

        } catch (MessagingException e) {
            e.printStackTrace();
            response.getWriter().println("Lỗi khi gửi email: " + e.getMessage());
        }
    }

    // ================== Các hàm riêng cho từng loại email =====================

    private String getVipConfirmSubject() {
        return "[StayNow] Xác nhận đăng ký tin VIP thành công";
    }

    private String getVipConfirmContent(String vipCode) {
        return "<h3>Kính chào quý khách,</h3>"
                + "<p>Cảm ơn quý khách đã tin tưởng và lựa chọn dịch vụ <strong>Tin VIP</strong> của StayNow.</p>"
                + "<p>Chúng tôi xin xác nhận rằng tin đăng của quý khách đã được nâng cấp lên <strong>" + vipCode + "</strong> thành công. Tin của quý khách sẽ được ưu tiên hiển thị nổi bật, giúp tiếp cận được nhiều khách thuê hơn.</p>"
                + "<p>Nếu cần hỗ trợ thêm, vui lòng liên hệ bộ phận CSKH của chúng tôi qua hotline hoặc qua email phản hồi.</p>"
                + "<p>Trân trọng,<br><strong>Đội ngũ StayNow</strong></p>"
                + getContactInfo();
    }


    private String getRequestSuccessSubject() {
        return "[StayNow] Yêu cầu thuê phòng thành công!";
    }

    private String getRequestSuccessContent(String roomCode) {
        return "<h3>Chào bạn,</h3>"
                + "<p>StayNow xin chân thành cảm ơn bạn đã gửi yêu cầu thuê phòng qua hệ thống.</p>"
                + "<p>Chúng tôi xin thông báo rằng yêu cầu của bạn đã được xác nhận thành công cho phòng có mã <strong>" + roomCode + "</strong>. "
                + "Chủ trọ sẽ liên hệ với bạn trong thời gian sớm nhất để trao đổi thêm chi tiết.</p>"
                + "<p>Nếu bạn cần thay đổi thông tin hoặc hỗ trợ thêm, đừng ngần ngại liên hệ lại với chúng tôi.</p>"
                + "<p>Trân trọng,<br><strong>StayNow - Kết nối chỗ ở dễ dàng</strong></p>"
                + getContactInfo();
    }

    private String getHostRegisterSubject() {
        return "[StayNow] Đăng ký làm chủ trọ thành công";
    }

    private String getHostRegisterContent(String emailAccount) {
        return "<h3>Kính gửi quý đối tác,</h3>"
                + "<p>Chúng tôi xin thông báo rằng tài khoản email <strong>" + emailAccount + "</strong> của quý khách đã được xác nhận là <strong>Chủ trọ</strong> trên hệ thống StayNow.</p>"
                + "<p>Quý khách có thể bắt đầu đăng tin cho thuê, quản lý các yêu cầu thuê phòng, và kết nối trực tiếp với khách hàng tiềm năng ngay hôm nay.</p>"
                + "<p>Chúng tôi cam kết đồng hành cùng quý khách để mang lại trải nghiệm đăng tin hiệu quả và uy tín.</p>"
                + "<p>Trân trọng,<br><strong>Đội ngũ StayNow</strong></p>"
                + getContactInfo();
    }

    private String getFeedbackSubject() {
        return "[StayNow] Cảm ơn bạn đã góp ý!";
    }

    private String getFeedbackContent() {
        return "<h3>Chào bạn,</h3>"
                + "<p>StayNow đã nhận được phản hồi từ bạn và xin gửi lời cảm ơn chân thành.</p>"
                + "<p>Ý kiến đóng góp của bạn là cơ sở để chúng tôi cải thiện chất lượng dịch vụ ngày càng tốt hơn. Đội ngũ StayNow sẽ xem xét và phản hồi lại nếu cần thiết.</p>"
                + "<p>Một lần nữa, cảm ơn bạn đã đồng hành cùng StayNow!</p>"
                + "<p>Trân trọng,<br><strong>StayNow Team</strong></p>"
                + getContactInfo();
    }

    private String getContactInfo() {
        return "<p style='font-size:13px; color:#555; margin-top:20px'>"
                + "Nếu bạn có bất kỳ thắc mắc nào, vui lòng liên hệ chúng tôi qua email: "
                + "<a href='mailto:holastaynow@gmail.com'>holastaynow@gmail.com</a>.</p>";
    }
}
