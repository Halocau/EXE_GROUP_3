package dao;

import model.Guideline;
import model.Rule;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

public class GuideAndRuleDAO extends DBContext {

    // Lấy danh sách các guideline
    public List<Guideline> getGuide() {
        List<Guideline> list = new ArrayList<>();
        String sql = "SELECT * FROM guideline"; // Không cần [dbo].
        // Khai báo các biến cho kết nối, statement và result set
        try (Connection conn = connection;
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            // Lặp qua result set và thêm vào danh sách
            while (rs.next()) {
                // Tạo đối tượng Guideline và thêm vào danh sách
                Guideline guideline = new Guideline(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3)
                );
                list.add(guideline);
            }
        } catch (SQLException ex) {
            // Log các ngoại lệ SQL
            Logger.getLogger(GuideAndRuleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Trả về danh sách các guideline
        return list;
    }

    // Lấy danh sách các rule
    public List<Rule> getRule() {
        List<Rule> list = new ArrayList<>();
        String sql = "SELECT * FROM rule"; // Sửa lại không cần [dbo].
        // Khai báo các biến cho kết nối, statement và result set
        try (Connection conn = connection;
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            // Lặp qua result set và thêm vào danh sách
            while (rs.next()) {
                // Tạo đối tượng Rule và thêm vào danh sách
                Rule rule = new Rule(
                        rs.getInt(1),
                        rs.getString(2),
                        rs.getString(3),
                        rs.getInt(4),
                        rs.getDouble(5)
                );
                list.add(rule);
            }
        } catch (SQLException ex) {
            // Log các ngoại lệ SQL
            Logger.getLogger(GuideAndRuleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        // Trả về danh sách các rule
        return list;
    }

    public static void main(String[] args) {
        GuideAndRuleDAO dao = new GuideAndRuleDAO();

        // Gọi phương thức cần thiết tùy theo yêu cầu
        // List<User> list = dao.getUserList();
        List<Rule> list = dao.getRule();
        for (Rule rule : list) {
            System.out.println("Rule Name: " + rule.getRuleName());
            System.out.println("Image: " + rule.getImg());
        }
    }
}
