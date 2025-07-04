package controller;

import dao.AccountDAO;
import model.*;
import java.io.IOException;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/forgotPassword")
public class ForgotPassword extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        request.getRequestDispatcher("forgotPassword.jsp").forward(request, response);
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");

        RequestDispatcher dispatcher = null;

        int otpvalueLength = 6;

        Random rand = new Random();

        String string = "0123456789";

        String randomOtp = "";

        HttpSession mySession = request.getSession();



        if (email != null || !email.equals("")) {
            for (int i = 0; i < otpvalueLength; i++) {
                char c = string.charAt(rand.nextInt(string.length()));
                randomOtp = randomOtp + c;
            }
            Cookie cookie = new Cookie("otpR", randomOtp);

            cookie.setMaxAge(5*60);

            response.addCookie(cookie);

            String to = email;


            // Get the session object
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.socketFactory.port", "465");
            props.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.port", "465");
            Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication("cuongntthe173555@fpt.edu.vn", "mids kchv fitq nsjo");
                }
            });
            try {
                String origin = utils.EnvLoader.get("Origin"); // Lấy giá trị từ file .env như Java thông thường
                String link = origin + "/SWP391.E.BL5.G5/enterotp.jsp";
                MimeMessage message = new MimeMessage(session);
                message.setFrom(new InternetAddress(email, "Admin"));
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                message.setSubject("Request to reset password ");
                message.setText("Please don't share OTP code with anyone, OTP code exist in 5 minute");
                message.setText("Hi, for security, please verify your account with the OPT below. "
                        + "Your OTP is ==========>" + randomOtp + " <========== Click the link to enter OTP: " + link);
                Transport.send(message);
                System.out.println("message sent successfully");
            } catch (MessagingException e) {
                e.printStackTrace();
            }

            dispatcher = request.getRequestDispatcher("forgotPassword.jsp");
            request.setAttribute("message", "OTP is sent to your email id");
            mySession.setAttribute("otp", randomOtp);
            mySession.setAttribute("email", email);
            dispatcher.forward(request, response);
        }

    }

}
