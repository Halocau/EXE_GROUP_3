package dao;

import model.News;
import dao.DBContext;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ASUS
 */
public class DAORenter extends DBContext {

    private Connection conn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;

    // Lấy tất cả các tin tức từ bảng news
    public List<News> getAllNews() {
        List<News> list = new ArrayList<>();
        String query = "SELECT * FROM news"; // Sửa lại không cần [dbo].
        try {
            conn = connection;
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                // Giả sử constructor của News nhận ba tham số: id, title, và description
                News news = new News(rs.getInt(1), rs.getString(2), rs.getString(3));
                list.add(news);
            }
        } catch (SQLException e) {
            // Xử lý lỗi SQL nếu có, ví dụ như ghi lại log hoặc ném lại ngoại lệ
            e.printStackTrace();
        } finally {
            // Đảm bảo đóng tài nguyên trong khối finally
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    // Kiểm tra người dùng có tồn tại trong bảng account không
    public int findUser(String user) throws SQLException {
        String sql = "SELECT * FROM account WHERE userMail = ?"; // Sửa lại không cần [dbo].
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, user);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                return 2; // Nếu tìm thấy tài khoản, trả về 2
            }
        } catch (SQLException e) {
            // Xử lý ngoại lệ nếu có
            e.printStackTrace();
        }
        return 1; // Nếu không tìm thấy tài khoản, trả về 1
    }

    public static void main(String[] args) {
        // Kiểm tra hoặc thử nghiệm các phương thức trong main method
    }
}
