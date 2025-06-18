package dao;

import jakarta.servlet.http.HttpServlet;
import java.util.ArrayList;
import java.util.List;
import model.Guideline;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author DAT
 */
public class GuideLineDAO extends DBContext {

    // Lấy tất cả các guideline
    public ArrayList<Guideline> findAll() {
        ArrayList<Guideline> guideLines = new ArrayList<>();
        try {
            String sql = "SELECT * FROM guideline"; // Sửa lại không cần [dbo].
            PreparedStatement ps;
            ResultSet rs;
            ps = connection.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                guideLines.add(toGuideLine(rs));
            }
        } catch (SQLException ex) {
            Logger.getLogger(GuideLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(guideLines.size());
        return guideLines;
    }

    // Lấy guideline theo ID
    public Guideline findById(int id) {
        try {
            String sql = "SELECT * FROM guideline WHERE guideID = ?"; // Sửa lại không cần [dbo].
            PreparedStatement ps;
            ResultSet rs;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                return toGuideLine(rs);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GuideLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    // Thêm mới guideline
    public int insert(Guideline model) {
        try {
            String sql = "INSERT INTO guideline(guideName, img) VALUES (?, ?)"; // Sửa lại không cần [dbo].
            PreparedStatement ps;
            ps = connection.prepareStatement(sql);
            ps.setString(1, model.getGuideName());
            ps.setString(2, model.getImg());
            ps.executeUpdate();
            return 1;
        } catch (SQLException ex) {
            Logger.getLogger(GuideLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    // Cập nhật guideline
    public int update(Guideline model) {
        try {
            String sql = "UPDATE guideline SET guideName = ?, img = ? WHERE guideID = ?"; // Sửa lại không cần [dbo].
            PreparedStatement ps;
            ps = connection.prepareStatement(sql);
            ps.setString(1, model.getGuideName());
            ps.setString(2, model.getImg());
            ps.setInt(3, model.getGuideID());
            ps.executeUpdate();
            return 1;
        } catch (SQLException ex) {
            Logger.getLogger(GuideLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    // Xóa guideline
    public int remove(int id) {
        try {
            String sql = "DELETE FROM guideline WHERE guideID = ?"; // Sửa lại không cần [dbo].
            PreparedStatement ps;
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            return 1;
        } catch (SQLException ex) {
            Logger.getLogger(GuideLineDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return -1;
    }

    // Chuyển đổi từ ResultSet thành đối tượng Guideline
    private Guideline toGuideLine(ResultSet rs) throws SQLException {
        Guideline guideLine = new Guideline();
        guideLine.setGuideID(rs.getInt("guideID"));
        guideLine.setGuideName(rs.getString("guideName"));
        guideLine.setImg(rs.getString("img"));
        return guideLine;
    }

    public static void main(String[] args) {
        GuideLineDAO dao = new GuideLineDAO();
        int add = dao.insert(new Guideline("Safety", "./Image/guideline/guideline4.jpg"));
        System.out.println(add);
    }
}
