package dao;

import model.News;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class NewDAO extends DBContext {

    // Lấy danh sách tin tức phân trang
    public List<News> getNewsList(int pageIndex, int pageSize) {
        List<News> news = new ArrayList<>();
        String sql = "SELECT newId, newTitle, description, creatAt, img "
                + "FROM news "
                + "ORDER BY newID "
                + "LIMIT ?, ?";

        try {
            java.sql.Connection conn = connection;
            PreparedStatement ps = conn.prepareStatement(sql);
            int offset = (pageIndex - 1) * pageSize;
            ps.setInt(1, offset);
            ps.setInt(2, pageSize);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                News newsItem = new News();
                newsItem.setNewId(rs.getInt("newId"));
                newsItem.setCreateAt(rs.getString("creatAt"));
                newsItem.setNewTitle(rs.getString("newTitle"));
                newsItem.setDescription(rs.getString("description"));
                newsItem.setImg(rs.getString("img"));
                news.add(newsItem);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return news;
    }

    // Thêm tin tức mới
    public int insertNews(News news) {
        int n = 0;
        String query = "INSERT INTO news (newTitle, description, img, creatAt) VALUES (?, ?, ?, ?)";
        try {
            java.sql.Connection conn = connection;
            PreparedStatement ps = conn.prepareStatement(query);
            ps.setString(1, news.getNewTitle());
            ps.setString(2, news.getDescription());
            ps.setString(3, news.getImg());
            ps.setString(4, news.getCreateAt());

            n = ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return n;
    }

    // Tìm kiếm tin tức theo tiêu đề
    public List<News> searchByText(int pageIndex, int pageSize, String search) {
        List<News> news = new ArrayList<>();
        String sql = "SELECT newID, newTitle, description, img, creatAt "
                + "FROM news "
                + "WHERE newTitle LIKE ? "
                + "ORDER BY newID "
                + "LIMIT ?, ?";

        try {
            java.sql.Connection conn = connection;
            PreparedStatement ps = conn.prepareStatement(sql);
            int offset = (pageIndex - 1) * pageSize;
            ps.setString(1, "%" + search + "%");
            ps.setInt(2, offset);
            ps.setInt(3, pageSize);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                News newsItem = new News();
                newsItem.setNewId(rs.getInt("newID"));
                newsItem.setNewTitle(rs.getString("newTitle"));
                newsItem.setDescription(rs.getString("description"));
                newsItem.setImg(rs.getString("img"));
                newsItem.setCreateAt(rs.getString("creatAt"));
                news.add(newsItem);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return news;
    }

    // Cập nhật tin tức
    public int updateNews(News news) {
        int n = 0;
        String query = "UPDATE news "
                + "SET newTitle = ?, description = ?, img = ?, creatAt = ? "
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
            e.printStackTrace();  // In thông báo lỗi ra console để dễ dàng gỡ lỗi
        }
        return n;
    }

    // Lấy thông tin tin tức theo ID
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

    // Lấy chi tiết tin tức
    public List<News> getNewsDetails(int newId) {
        List<News> news = new ArrayList<>();
        String sql = "SELECT newID, creatAt, newTitle, description, img "
                + "FROM news WHERE newID = ?";

        try {
            java.sql.Connection conn = connection;
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, newId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                News newsItem = new News();
                newsItem.setNewId(rs.getInt("newId"));
                newsItem.setCreateAt(rs.getString("creatAt"));
                newsItem.setNewTitle(rs.getString("newTitle"));
                newsItem.setDescription(rs.getString("description"));
                newsItem.setImg(rs.getString("img"));
                news.add(newsItem);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return news;
    }

    public static void main(String[] args) {
    // Khởi tạo đối tượng NewDAO
    NewDAO newDAO = new NewDAO();

    // 1. Kiểm tra phương thức getNewsList với phân trang
    System.out.println("Testing getNewsList with pagination:");
    List<News> newsList = newDAO.getNewsList(1, 5);  // Lấy 5 tin tức từ trang 1
    for (News news : newsList) {
        System.out.println("News ID: " + news.getNewId() + ", Title: " + news.getNewTitle());
    }

    // 2. Kiểm tra phương thức insertNews
    System.out.println("\nTesting insertNews:");
    News newNews = new News("Test News Title", "This is a test news description", "test-image.jpg", "2025-06-20");
    int insertResult = newDAO.insertNews(newNews);
    if (insertResult > 0) {
        System.out.println("New news inserted successfully.");
    } else {
        System.out.println("Failed to insert news.");
    }

    // 3. Kiểm tra phương thức updateNews
    System.out.println("\nTesting updateNews:");
    newNews.setNewTitle("Updated Test News Title");
    newNews.setDescription("This is an updated description");
    int updateResult = newDAO.updateNews(newNews);
    if (updateResult > 0) {
        System.out.println("News updated successfully.");
    } else {
        System.out.println("Failed to update news.");
    }

    // 4. Kiểm tra phương thức getNewsById
    System.out.println("\nTesting getNewsById:");
    News retrievedNews = newDAO.getNewsById(newNews.getNewId());
    if (retrievedNews != null) {
        System.out.println("News retrieved by ID: " + retrievedNews.getNewId() + ", Title: " + retrievedNews.getNewTitle());
    } else {
        System.out.println("No news found with the given ID.");
    }

    // 5. Kiểm tra phương thức searchByText
    System.out.println("\nTesting searchByText:");
    List<News> searchResults = newDAO.searchByText(1, 5, "test");
    for (News searchNews : searchResults) {
        System.out.println("Search result - News ID: " + searchNews.getNewId() + ", Title: " + searchNews.getNewTitle());
    }

    // 6. Kiểm tra phương thức getNewsDetails
    System.out.println("\nTesting getNewsDetails:");
    List<News> newsDetails = newDAO.getNewsDetails(newNews.getNewId());
    for (News detail : newsDetails) {
        System.out.println("News Detail - ID: " + detail.getNewId() + ", Title: " + detail.getNewTitle() + ", Description: " + detail.getDescription());
    }
}

}
