package dao;

import java.util.ArrayList;
import java.util.List;
import model.Payment;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;

public class PaymentDAO extends DBContext {

    // Xóa tiền của người thuê
    public void deleteMoney(int renterID) {
        int n = 0;
        String sql = "DELETE FROM payments WHERE userId = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, renterID);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
    }

    // Lấy tất cả thanh toán
    public ArrayList<Payment> findAll() {
        ArrayList<Payment> payments = new ArrayList<>();
        try {
            String sql = "SELECT * FROM payments"; // Sửa lại không cần [dbo].
            PreparedStatement ps;
            ResultSet rs;
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                payments.add(toPayment(rs));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PaymentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return payments;
    }

    // Lấy thanh toán theo userId
    public ArrayList<Payment> findByUserId(int userId) {
        ArrayList<Payment> payments = new ArrayList<>();
        try {
            String sql = "SELECT * FROM payments WHERE userId = ?"; // Sửa lại không cần [dbo].
            PreparedStatement ps;
            ResultSet rs;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, userId);
            rs = ps.executeQuery();

            while (rs.next()) {
                payments.add(toPayment(rs));
            }
        } catch (SQLException ex) {
            Logger.getLogger(PaymentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return payments;
    }

    // Thêm thanh toán mới
    public int insert(Payment model) {
        try {
            String sql = "INSERT INTO payments(money, userId, status, createdAt, updatedAt) VALUES (?, ?, ?, ?, ?)"; // Sửa lại không cần [dbo].
            PreparedStatement ps;
            ps = connection.prepareStatement(sql);
            ps.setDouble(1, model.getMoney());
            ps.setInt(2, model.getUserId());
            ps.setInt(3, model.getStatus());

            java.util.Date utilTodayDate = Calendar.getInstance().getTime();
            java.sql.Date sqlTodayDate = new java.sql.Date(utilTodayDate.getTime());

            ps.setDate(4, sqlTodayDate);
            ps.setDate(5, sqlTodayDate);
            ps.executeUpdate();
            return 1;
        } catch (SQLException ex) {
            Logger.getLogger(PaymentDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    // Chuyển đổi từ ResultSet thành đối tượng Payment
    private Payment toPayment(ResultSet rs) throws SQLException {
        Payment payment = new Payment();
        payment.setId(rs.getInt("id"));
        payment.setUserId(rs.getInt("userId"));
        payment.setMoney(rs.getDouble("money"));
        payment.setStatus(rs.getInt("status"));
        payment.setCreatedAt(rs.getDate("createdAt"));
        payment.setUpdatedAt(rs.getDate("updatedAt"));
        return payment;
    }

    // Cập nhật số tiền của người thuê
    public int addMoney(double money, int renterID) {
        int n = 0;
        String sql = "UPDATE renter SET balance = balance + ? WHERE renterID = ?"; // Sửa lại không cần [dbo].
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setDouble(1, money);
            pre.setInt(2, renterID);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    // Cập nhật trạng thái thanh toán
    public int updatePaymentStatus(int id) {
        int n = 0;
        String sql = "UPDATE payments SET status = 1 WHERE id = ?"; // Sửa lại không cần [dbo].
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, id);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    // Hiển thị số tiền của người thuê
    public int displayMoney(int renterID) {
        int balance = 0;
        String sql = "SELECT balance FROM renter WHERE renterID = ?"; // Sửa lại không cần [dbo].
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, renterID);
            ResultSet rs = pre.executeQuery();
            if (rs.next()) {
                balance = rs.getInt("balance");
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return balance;
    }

    // Cập nhật số tiền của người thuê
    public int updateRenterMoney(int renterID, double balance) {
        int n = 0;
        String sql = "UPDATE renter SET balance = ? WHERE renterID = ?"; // Sửa lại không cần [dbo].
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setDouble(1, balance);
            pre.setInt(2, renterID);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    public static void main(String[] args) {
        PaymentDAO dao = new PaymentDAO();
        // Test việc hiển thị số tiền của người thuê
        int displayMoney = dao.displayMoney(602);
        System.out.println(displayMoney);
    }
}
