/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Account;
import model.User;
import model.Room;
import java.math.BigDecimal;
import model.Renter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.UserDetail;

/**
 *
 * @author ASUS
 */
public class UserDAO extends MyDAO {

    //Table - User
    /*
    1.userID - int
    2.userName - String
    3.userGender - String
    4.userBirth - String
    5.userAddress - String
    6.userPhone - String
    7.userAvatar
     */
    //List User Data
    public List<User> getUserList() {
        List<User> list = new ArrayList<>();
        String sql = "SELECT * FROM [User]";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                list.add(user);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return list;
    }

    // trong dao/UserDAO.java
    public User getUserById(int id) {
        String sql = "SELECT userID,userName,userGender,userBirth,userAddress,userPhone,userAvatar "
                + "FROM [User] WHERE userID = ?";
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return new User(
                        rs.getInt("userID"),
                        rs.getString("userName"),
                        rs.getString("userGender"),
                        rs.getString("userBirth"),
                        rs.getString("userAddress"),
                        rs.getString("userPhone"),
                        rs.getString("userAvatar")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<User> getUserAvailable() {
        List<User> list = new ArrayList<>();
        String sql = "  select * from [user] u \n"
                + "  join account a on u.userID = a.userID \n"
                + "  where a.userRole = 1 and u.userID not in (select userID from renter)";
        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                list.add(user);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return list;
    }

//    //list Renter information detail
//    public List<User> getRenterDetail(int id) {
//        List<User> list = new ArrayList<>();
//        String sql = "SELECT DISTINCT "
//                + "    u.userID, u.userName, u.userGender, u.userBirth, u.userAddress, u.userPhone, u.userAvatar, \n"
//                + "    r.renterID, r.roomID, r.renterStatus, r.renterHaveRoom,"
//                + "    a.userMail, a.userPassword,"
//                + "    rm.roomFloor, rm.roomNumber"
//                + " FROM"
//                + "    [User] u \n"
//                + " JOIN "
//                + "    Renter r ON u.userID = r.userID"
//                + " JOIN"
//                + "    Account a ON u.userID = a.userID"
//                + " LEFT JOIN"
//                + "    Room rm ON r.roomID = rm.roomID"
//                + " WHERE"
//                + "    u.userID = ?";
//
//        try {
//            ps = con.prepareStatement(sql);
//            ps.setInt(1, id);
//            rs = ps.executeQuery();
//            while (rs.next()) {
//                int userId = rs.getInt(1);
//                String userName = rs.getString(2);
//                String userGender = rs.getString(3);
//                String userBirth = rs.getString(4);
//                String userAddress = rs.getString(5);
//                String userPhone = rs.getString(6);
//                String userAvatar = rs.getString(7);
//                int renterID = rs.getInt(8);
//                int roomID = rs.getInt(9);
//                BigDecimal roomFee = rs.getBigDecimal(10);
//                boolean renterStatus = rs.getBoolean(11);
//                boolean renterHaveRoom = rs.getBoolean(12);
//                String userMail = rs.getString(13);
//                String userPassword = rs.getString(14);
//                int roomFloor = rs.getInt(15);
//                String roomNumber = rs.getString(16);
//                Account account = new Account(userId, userMail, userPassword, 1);
//                Renter renter = new Renter(renterID, userId, roomID, renterStatus, renterHaveRoom, roomID, roomID);
//                 Room room = new Room(roomID, roomFloor, roomFloor, roomID, roomFee);
//                User user = new User(userId, userName, userGender, userBirth, userAddress, userPhone, userAvatar, account, renter, room);
//                list.add(user);
//            }
//        } catch (SQLException e) {
//
//            // Handle exception as needed
//                        System.out.println("Fail: " + e.getMessage());
//
//        }
//        return list;
//    }
//    public static void main(String[] args) {
//        UserDAO dao = new UserDAO();
//
//        // Uncomment the appropriate method call based on your needs
//        // List<User> list = dao.getUserList();
//        List<User> list = dao.getRenterDetail(5);
//        for (User user : list) {
//            System.out.println("User ID: " + user.getUserID());
//            System.out.println("User Name: " + user.getUserName());
//            System.out.println("User Gender: " + user.getUserGender());
//            System.out.println("User Birth: " + user.getUserBirth());
//            System.out.println("User Address: " + user.getUserAddress());
//            System.out.println("User Phone: " + user.getUserPhone());
//            System.out.println("User Avatar: " + user.getUserAvatar());
//
//            // Print information from Account
//            System.out.println("User Mail: " + user.getAccount().getUserMail());
//            System.out.println("User Password: " + user.getAccount().getUserPassword());
//
//            // Print information from Renter
//            System.out.println("Renter ID: " + user.getRenter().getRenterID());
//            System.out.println("Room ID: " + user.getRenter().getRoomID());
//            System.out.println("Renter Status: " + user.getRenter().isRenterStatus());
//            System.out.println("Renter Have Room: " + user.getRenter().isRenterHaveRoom());
//
//            // Print information from Room
//            System.out.println("Room Floor: " + user.getRoom().getRoomFloor());
//            System.out.println("Room Number: " + user.getRoom().getRoomNumber());
//
//            System.out.println("--------");
//        }
//    }
    public List<User> getOwner() {
        List<User> list = new ArrayList<>();
        String sql = "  SELECT [User].userID, [User].userName, [User].userGender, [User].userBirth, [User].userAddress, [User].userPhone, [User].userAvatar\n"
                + "     FROM [User]\n"
                + "     INNER JOIN Account ON [User].userID = Account.userID\n"
                + "     WHERE Account.userRole = 3";

        try {
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                User user = new User(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7));
                list.add(user);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return list;
    }

    public int isRenter(int userID) {
        int recordNumber = 0;
        String sql = "select count(*) as [recordNumber]\n"
                + "from [user] u \n"
                + "join renter r\n"
                + "on u.userID = r.userID\n"
                + "where u.userID = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, userID);
            rs = ps.executeQuery();
            if (rs.next()) {
                recordNumber = rs.getInt("recordNumber");
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return recordNumber;
    }

    public int getUserRoleByEmailAndPassword(String email, String password) {
        String sql = "select userRole from account where userMail = ? and userPassword = ?";

        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, email);
            ps.setString(2, password);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            System.out.println("Fail: " + e.getMessage());
        }
        return -1;
    }

    public static void main(String[] args) {
        UserDAO userDAO = new UserDAO();

        // Thay đổi thông tin email và số tiền nạp phù hợp với DB của bạn
        String testEmail = "1@1"; // Email phải tồn tại trong bảng Account
        BigDecimal amountToAdd = new BigDecimal("100000");

        userDAO.addMoneyToWallet(testEmail, amountToAdd);

        System.out.println("✅ Đã nạp " + amountToAdd + " VND vào tài khoản " + testEmail);
    }

    public void addMoneyToWallet(String email, BigDecimal amountToAdd) {
        String sql = "UPDATE [User] SET wallet = ISNULL(wallet, 0) + ? WHERE userID = (SELECT userID FROM Account WHERE userMail = ?)";
        try {
            ps = con.prepareStatement(sql);
            ps.setBigDecimal(1, amountToAdd);
            ps.setString(2, email);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public BigDecimal getWalletByUserId(int userId) {
        String sql = "SELECT wallet FROM [User] WHERE userID = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return rs.getBigDecimal("wallet");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return BigDecimal.ZERO;
    }

    public UserDetail getUserDetailByEmail(String userEmail) {
        String sql = "SELECT u.userID, u.userName, u.userGender, u.userBirth, u.userAddress, u.userPhone, u.userAvatar, u.wallet, a.userMail "
                + "FROM [User] u JOIN Account a ON u.userID = a.userID "
                + "WHERE a.userMail = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, userEmail);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    UserDetail userDetail = new UserDetail();
                    userDetail.setUserID(rs.getInt("userID"));
                    userDetail.setUserName(rs.getString("userName"));
                    userDetail.setUserGender(rs.getString("userGender"));
                    userDetail.setUserBirth(rs.getString("userBirth"));
                    userDetail.setUserAddress(rs.getString("userAddress"));
                    userDetail.setUserPhone(rs.getString("userPhone"));
                    userDetail.setUserAvatar(rs.getString("userAvatar"));
                    userDetail.setWallet(rs.getBigDecimal("wallet"));
                    userDetail.setUserMail(rs.getString("userMail"));
                    return userDetail;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public UserDetail getUserDetailByID(int userID) {
        UserDetail userDetail = null;
        String sql = "SELECT \n"
                + "u.userID, \n"
                + "u.userName, \n"
                + "u.userGender, \n"
                + "u.userBirth, \n"
                + "u.userAddress, \n"
                + "u.userPhone, \n"
                + "u.userAvatar, \n"
                + "a.userMail, \n"
                + "a.userPassword, \n"
                + "a.userRole, \n"
                + "u.wallet \n"
                + "FROM [User] u \n"
                + "JOIN Account a ON u.userID = a.userID \n"
                + "WHERE u.userID = ?";

        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setInt(1, userID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    userDetail = new UserDetail(
                            rs.getInt("userID"),
                            rs.getString("userName"),
                            rs.getString("userGender"),
                            rs.getString("userBirth"),
                            rs.getString("userAddress"),
                            rs.getString("userPhone"),
                            rs.getString("userAvatar"),
                            rs.getString("userMail"),
                            rs.getString("userPassword"),
                            rs.getInt("userRole")
                    );
                    userDetail.setWallet(rs.getBigDecimal("wallet"));
                }
            }
        } catch (SQLException e) {
            System.out.println("Fail (getUserDetailByID): " + e.getMessage());
        }

        return userDetail;
    }

    public boolean updateWallet(int userID, BigDecimal newBalance) {
        String sql = "UPDATE [User] SET wallet = ? WHERE userID = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setBigDecimal(1, newBalance);
            ps.setInt(2, userID);
            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
