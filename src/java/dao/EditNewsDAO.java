package dao;

import java.sql.PreparedStatement;
import model.News;
import java.sql.ResultSet;

/**
 *
 * @author pc
 */
public class EditNewsDAO extends DBContext {

    // Cập nhật tin tức
    public int updateNews(News news) {
        int n = 0;
        String query = "UPDATE news "
                + "SET newTitle = ?, "
                + "    description = ?, "
                + "    img = ?, "
                + "    creatAt = ? "
                + "WHERE newID = ?";

        try {
            java.sql.Connection conn = connection;
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, news.getNewTitle());
            ps.setString(2, news.getDescription());
            ps.setString(3, news.getImg());
            ps.setString(4, news.getCreateAt());
            ps.setInt(5, news.getNewId());

            n = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return n;
    }

    // Lấy tin tức theo ID
    public News getNewsById(int id) {
        News news = null;
        String query = "SELECT * FROM news WHERE newID = ?";

        try {
            java.sql.Connection conn = connection;
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                news = new News();
                news.setNewId(rs.getInt("newID"));
                news.setNewTitle(rs.getString("newTitle"));
                news.setDescription(rs.getString("description"));
                news.setImg(rs.getString("img"));
                news.setCreateAt(rs.getString("creatAt"));
            }
            rs.close();
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return news;
    }

    // Xóa tin tức
    public int DeleteNews(News news) {
        int n = 0;
        String query = "DELETE FROM news WHERE newID = ?";
        try {
            java.sql.Connection conn = connection;
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setInt(1, news.getNewId());
            n = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return n;
    }

    public static void main(String[] args) {
        EditNewsDAO dao = new EditNewsDAO();
        News news = dao.getNewsById(32);
        System.out.println(news.getNewId());
    }
}
