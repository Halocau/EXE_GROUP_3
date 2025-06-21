package dao;

import java.math.BigDecimal;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import model.*;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

/**
 *
 * @author ASUS
 */
public class BillDAO extends MyDAO {

    // Lấy danh sách hóa đơn theo roomID
    public List<Bill> getBillByRoomID(int id) {
        List<Bill> list = new ArrayList<>();
        String sql
                = "SELECT "
                + "    billID,"
                + "    roomID,"
                + "    service,"
                + "    electric,"
                + "    water,"
                + "    roomFee,"
                + "    other,"
                + "    penMoney,"
                + "    createAt,"
                + "    deadline,"
                + "    payAt,"
                + "    (service + electric + water + roomFee + other + penMoney) AS total "
                + "FROM "
                + "    bill "
                + "WHERE roomID = ? "
                + "ORDER BY createAt DESC;";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Bill bill = new Bill(rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getDouble(4),
                        rs.getDouble(5), rs.getDouble(6), rs.getDouble(7), rs.getDouble(8),
                        rs.getDouble(12), rs.getString(9), rs.getString(10), rs.getString(11));
                list.add(bill);
            }
        } catch (SQLException e) {
            // Handle exception as needed
            System.out.println("Fail: " + e.getMessage());
        }
        return list;
    }

    // Lấy thông tin hóa đơn theo billID
    public Bill getBillBybillID(int id) {
        String sql
                = "SELECT "
                + "    billID,"
                + "    roomID,"
                + "    service,"
                + "    electric,"
                + "    water,"
                + "    roomFee,"
                + "    other,"
                + "    penMoney,"
                + "    createAt,"
                + "    deadline,"
                + "    payAt,"
                + "    (service + electric + water + roomFee + other + penMoney) AS total "
                + "FROM "
                + "    bill "
                + "WHERE billID = ? "
                + "ORDER BY createAt DESC;";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Bill bill = new Bill(rs.getInt(1), rs.getInt(2), rs.getDouble(3), rs.getDouble(4),
                        rs.getDouble(5), rs.getDouble(6), rs.getDouble(7), rs.getDouble(8),
                        rs.getDouble(12), rs.getString(9), rs.getString(10), rs.getString(11));
                return bill;
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return null;
    }

    // Thêm hóa đơn mới
    public boolean addFeeById(int roomID, double service, double electric, double water, BigDecimal roomFee, double other, double penMoney, String createAt,
            String deadline, String payAt) {
        String sql = "INSERT INTO bill "
                + "(roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, roomID);
            ps.setDouble(2, service);
            ps.setDouble(3, electric);
            ps.setDouble(4, water);
            ps.setBigDecimal(5, roomFee);
            ps.setDouble(6, other);
            ps.setDouble(7, penMoney);
            ps.setString(8, createAt);
            ps.setString(9, deadline);
            ps.setString(10, payAt);
            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Request inserted successfully.");
                return true;
            } else {
                System.out.println("Failed to insert request.");
                return false;
            }

        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
            return false;
        }

    }

    // Cập nhật hóa đơn theo billID
    public boolean updateFeeById(int billID, double service, double electric, double water, BigDecimal roomFee, double other, double penMoney,
            String deadline, String payAt) {
        String sql = "UPDATE bill "
                + "SET service = ?, electric = ?, water = ?, roomFee = ?, "
                + "other = ?, penMoney = ?, deadline = ?, payAt = ? "
                + "WHERE billID = ?;";

        try {
            ps = con.prepareStatement(sql);
            ps.setDouble(1, service);
            ps.setDouble(2, electric);
            ps.setDouble(3, water);
            ps.setBigDecimal(4, roomFee);
            ps.setDouble(5, other);
            ps.setDouble(6, penMoney);
            ps.setString(7, deadline);
            ps.setString(8, payAt);
            ps.setInt(9, billID);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Request updated successfully.");
                return true;
            } else {
                System.out.println("Failed to update request. Room ID may not exist.");
                return false;
            }

        } catch (SQLException e) {
            System.out.println("Failed to update request: " + e.getMessage());
            return false;
        }
    }

    // Lấy thông tin giá điện, nước từ bảng usagePrice
    public UsagePrice getEWPrice() {
        String sql = "SELECT Electric_Price, Water_Block_Price FROM usagePrice";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                UsagePrice up = new UsagePrice(rs.getDouble(1), rs.getDouble(2));
                return up;
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return null;
    }

    // Lấy thông tin roomID từ roomNumber
    public int getRoomIDByRoomNumber(int roomNumber) {
        String sql = "SELECT roomID FROM Room WHERE roomNumber = ?";
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, roomNumber);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("roomID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    // Thêm hóa đơn từ Excel
    public boolean insertBillFromExcel(int roomNumber, double service, double electric, double water, BigDecimal roomFee, double other, double penMoney) {
        int roomID = getRoomIDByRoomNumber(roomNumber);
        if (roomID == -1) {
            System.out.println("Invalid room number: " + roomNumber);
            return false;
        }

        String sql = "INSERT INTO bill "
                + "(roomID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, NOW(), DATE_ADD(NOW(), INTERVAL 1 MONTH), NULL);";

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, roomID);
            ps.setDouble(2, service);
            ps.setDouble(3, electric);
            ps.setDouble(4, water);
            ps.setBigDecimal(5, roomFee);
            ps.setDouble(6, other);
            ps.setDouble(7, penMoney);

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                System.out.println("Bill inserted successfully for room number: " + roomNumber);
                return true;
            } else {
                System.out.println("Failed to insert bill for room number: " + roomNumber);
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Error inserting bill: " + e.getMessage());
            return false;
        }
    }

    // Lấy thông tin chi tiết hóa đơn theo roomID
    public Bill getBillDetailByRoomID(int roomId) {
        double total = 0;
        double service = 0;
        double electric = 0;
        double water = 0;
        double other = 0;
        double penMoney = 0;
        Bill bill = null;
        String sql
                = "SELECT "
                + "    billID,"
                + "    roomID,"
                + "    service,"
                + "    electric,"
                + "    water,"
                + "    other,"
                + "    penMoney,"
                + "    createAt,"
                + "    deadline,"
                + "    payAt,"
                + "    ((electric + water + other + penMoney + service) * 1000) AS total "
                + "FROM "
                + "    bill "
                + "WHERE roomID = ? "
                + "ORDER BY createAt DESC;";

        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, roomId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int billID = rs.getInt("billID");
                int roomID = rs.getInt("roomID");
                service += rs.getDouble("service");
                electric += rs.getDouble("electric");
                water += rs.getDouble("water");
                other += rs.getDouble("other");
                penMoney += rs.getDouble("penMoney");
                String createAt = rs.getString("createAt");
                String deadline = rs.getString("deadline");
                String payAt = rs.getString("payAt");
                total += rs.getDouble("total");

                bill = new Bill(billID, roomID, service, electric, water, other, penMoney, createAt, deadline, payAt, total);
            }

            return bill;
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return null;
    }

    // Cập nhật hóa đơn sau khi thanh toán
    public int updateBillAfterPayment(int roomID) {
        int n = 0;
        String sql = "UPDATE bill "
                + "SET service = 0, electric = 0, water = 0, other = 0, penMoney = 0, payAt = NOW() "
                + "WHERE roomID = ?;";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setInt(1, roomID);
            n = pre.executeUpdate();
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return n;
    }

    // Xóa hóa đơn
    public int deleteBill(int billID) {
        int result = 0;
        String query = "DELETE FROM bill WHERE billID = ?;";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, billID);
            result = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }


    
//    public static void main(String[] args) {
//        BillDAO dao = new BillDAO();
//        
//        int billIDToDelete = 18; // Replace with an actual bill ID from your database
//        
//        int result = dao.deleteBill(billIDToDelete);
//        
//        if (result > 0) {
//            System.out.println("Bill with ID " + billIDToDelete + " was successfully deleted.");
//        } else {
//            System.out.println("Failed to delete bill with ID " + billIDToDelete + ". It might not exist.");
//        }
//    }
//}


    public static void main(String[] args) {
        BillDAO dao = new BillDAO();
        int billID = 1; // Example room ID
        double service = 200.0;
        double electric = 150.0;
        double water = 100.0;
        BigDecimal roomFee = new BigDecimal("9900.00");
        double other = 50.0;
        double penMoney = 25.0;
        String deadline = "2024-12-31";
        String createAt = "2024-07-08";
        String payAt = null;
//
//        //Call updateFeeById method and check the result
//        boolean result = dao.updateFeeById(billID, service, electric, water, roomFee, other, penMoney, deadline, payAt);
//     boolean result = dao.addFeeById(billID, service, electric, water, roomFee, other, penMoney, createAt, deadline, payAt);
//        if (result) {
//            System.out.println("Fee update successful.");
//        } else {
//            System.out.println("Fee update failed.");
//        }

//        Bill get = dao.getBillDetailByRoomID(1);
//        System.out.println(get.getDeadline());
    }}
