package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.User;
import model.UserDetail;

/**
 *
 * @author pc
 */
public class DAOUser extends DBContext {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // Lấy tất cả người dùng
    public List<User> getUsers() {
        List<User> user = new ArrayList<>();

        try {
            // Truy vấn dữ liệu từ bảng Accounts
            String query = "SELECT * FROM user"; // Sửa lại không cần [dbo].
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                int userID = rs.getInt("userID");
                String userName = rs.getString("userName");
                String userGender = rs.getString("userGender");
                String userBirth = rs.getString("userBirth");
                String userAddress = rs.getString("userAddress");
                String userPhone = rs.getString("userPhone");
                String userAvatar = rs.getString("userAvatar");

                User users = new User(userID, userName, userGender, userBirth, userAddress, userPhone, userAvatar);
                user.add(users);
            }

            rs.close();
            statement.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return user;
    }

    // Lấy chi tiết người dùng theo userID
    public UserDetail getUsersByUserID(int userID) {
        UserDetail userDetail = null;
        try {
            // Truy vấn dữ liệu từ bảng Accounts
            String query = "SELECT u.userName, u.userGender, u.userBirth, u.userAddress, u.userPhone, a.userMail, u.userAvatar "
                    + "FROM user u "
                    + "JOIN account a ON u.userID = a.userID "
                    + "WHERE u.userID = ?";
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, userID);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                String userName = rs.getString("userName");
                String userGender = rs.getString("userGender");
                String userBirth = rs.getString("userBirth");
                String userAddress = rs.getString("userAddress");
                String userPhone = rs.getString("userPhone");
                String userMail = rs.getString("userMail");
                String userAvatar = rs.getString("userAvatar");

                userDetail = new UserDetail(userName, userGender, userBirth, userAddress, userPhone, userMail, userAvatar);
            }

        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return userDetail;
    }

    // Thêm người dùng mới
    public void insertUser(String name, String gender, String Dob, String address, String Phone, String avatar) {
        String query = "INSERT INTO user (userName, userGender, userBirth, userAddress, userPhone, userAvatar) "
                + "VALUES (?, ?, ?, ?, ?, ?)";
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, name);
            ps.setString(2, gender);
            ps.setString(3, Dob);
            ps.setString(4, address);
            ps.setString(5, Phone);
            ps.setString(6, avatar);

            int affectedRows = ps.executeUpdate();
            if (affectedRows > 0) {
                try (ResultSet generatedKeys = ps.getGeneratedKeys()) {
                    if (generatedKeys.next()) {
                        int userId = generatedKeys.getInt(1);
                        System.out.println("Inserted user with ID: " + userId);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // Cập nhật thông tin người dùng
    public void updateUser(int userId, String userName, String gender, String dob, String address, String phone, String avatar) {
        String query = "UPDATE user "
                + "SET userName = ?, "
                + "    userGender = ?, "
                + "    userBirth = ?, "
                + "    userAddress = ?, "
                + "    userPhone = ?, "
                + "    userAvatar = ? "
                + "WHERE userID = ?";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, userName);
            ps.setString(2, gender);
            ps.setString(3, dob);
            ps.setString(4, address);
            ps.setString(5, phone);
            ps.setString(6, avatar);
            ps.setInt(7, userId);

            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Cập nhật ảnh đại diện của người dùng
    public int updateAvatarUser(int userID, String avatar) {
        String query = "UPDATE user SET userAvatar = ? WHERE userID = ?";
        
        int n = 0;
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setString(1, avatar);
            ps.setInt(2, userID);            

            n = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return n;
    }

    public static void main(String args[]) {
        DAOUser dao = new DAOUser();
        UserDetail basic = dao.getUsersByUserID(2);
        System.out.println(basic.getUserID());
    }
}
