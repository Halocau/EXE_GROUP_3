package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Account;

public class DAO extends DBContext {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    // Lấy danh sách tất cả tài khoản
    public List<Account> getAccounts() {
        List<Account> accounts = new ArrayList<>();

        try {
            // Truy vấn dữ liệu từ bảng Accounts
            String query = "SELECT * FROM account"; // Sửa lại không cần [dbo].
            PreparedStatement statement = connection.prepareStatement(query);
            ResultSet resultSet = statement.executeQuery();

            while (resultSet.next()) {
                int ID = resultSet.getInt("userID");
                String mail = resultSet.getString("userMail");
                String password = resultSet.getString("userPassword");
                int role = resultSet.getInt("userRole");

                // Tạo đối tượng Account và thêm vào danh sách
                Account acc = new Account(ID, mail, password, role);
                accounts.add(acc);
            }

            resultSet.close();
            statement.close();
        } catch (SQLException ex) {
            System.out.println(ex);
        }

        return accounts;
    }

    // Thêm tài khoản mới
    public int insertAcc(String mail, String password, int role) {
        int n = 0;
        String query = "INSERT INTO account (userMail, userPassword, userRole) VALUES (?, ?, ?)"; // Sửa lại không cần [dbo].
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, mail);
            ps.setString(2, password);
            ps.setInt(3, role);
            n = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return n;
    }

    // Chỉnh sửa thông tin tài khoản
    public void editAccount(String mail, String password, String role) {
        String query = "UPDATE account SET userPassword = ?, userRole = ? WHERE userMail = ?"; // Sửa lại không cần [dbo].
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, password);
            ps.setString(2, role);
            ps.setString(3, mail);
            ps.executeUpdate();
        } catch (Exception e) {
        }
    }

    // Kiểm tra xem email có tồn tại không
    public boolean isEmailExist(String email) {
        String query = "SELECT COUNT(*) AS count FROM account WHERE userMail = ?"; // Sửa lại không cần [dbo].
        boolean emailExists = false;
        try {
            ps = connection.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                int count = rs.getInt("count");
                if (count > 0) {
                    emailExists = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return emailExists;
    }

    // Lấy quyền của người dùng theo email
    public int getUserRole(String email) {
        try {
            String query = "SELECT userRole FROM account WHERE userMail = ?"; // Sửa lại không cần [dbo].
            ps = connection.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt("userRole");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    // Cập nhật quyền người dùng theo email
    public boolean updateUserRole(String email, int newRole) {
        try {
            String query = "UPDATE account SET userRole = ? WHERE userMail = ?"; // Sửa lại không cần [dbo].
            PreparedStatement statement = connection.prepareStatement(query);
            statement.setInt(1, newRole);
            statement.setString(2, email);
            int rowsUpdated = statement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    public static void main(String args[]) {
        // Demo hoặc kiểm tra các phương thức ở đây.
    }
}
