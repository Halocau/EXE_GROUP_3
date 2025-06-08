package dao;

import java.math.BigDecimal;
import java.sql.Connection;
import model.Account;
import model.Renter;
import model.Room;
import model.User;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.News;
import model.UserDetail;
import model.Renter;
import model.RenterList;
import java.sql.CallableStatement;
import model.RentDetail;
import model.Statistics;

public class RenterDAO_temp extends MyDAO {

    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public Statistics getStatistics() {
        Statistics stats = new Statistics();
        
        // Kiểm tra và tạo kết nối mới nếu cần
        try {
            if (con == null || con.isClosed()) {
                con = new DBContext().connection;
            }
            
            // Tính tổng doanh thu
            String revenueSql = "SELECT SUM(r.roomFee) as totalRevenue FROM room r " +
                              "JOIN renter rt ON r.roomID = rt.roomID " +
                              "WHERE rt.renterStatus = 1";
            
            // Tính tổng số người ở
            String occupantsSql = "SELECT COUNT(*) as totalOccupants FROM renter " +
                                "WHERE renterStatus = 1";
            
            // Tính số phòng đang được cho thuê
            String occupiedRoomsSql = "SELECT COUNT(DISTINCT roomID) as occupiedRooms FROM renter " +
                                    "WHERE renterStatus = 1";
            
            // Tính số phòng trống
            String emptyRoomsSql = "SELECT COUNT(*) as emptyRooms FROM room r " +
                                 "LEFT JOIN renter rt ON r.roomID = rt.roomID " +
                                 "WHERE rt.roomID IS NULL OR rt.renterStatus = 0";
            
            // Lấy tổng doanh thu
            ps = con.prepareStatement(revenueSql);
            rs = ps.executeQuery();
            if (rs.next()) {
                stats.setTotalRevenue(rs.getDouble("totalRevenue"));
            }
            
            // Lấy tổng số người ở
            ps = con.prepareStatement(occupantsSql);
            rs = ps.executeQuery();
            if (rs.next()) {
                stats.setTotalOccupants(rs.getInt("totalOccupants"));
            }
            
            // Lấy số phòng đang được cho thuê
            ps = con.prepareStatement(occupiedRoomsSql);
            rs = ps.executeQuery();
            if (rs.next()) {
                stats.setOccupiedRooms(rs.getInt("occupiedRooms"));
            }
            
            // Lấy số phòng trống
            ps = con.prepareStatement(emptyRoomsSql);
            rs = ps.executeQuery();
            if (rs.next()) {
                stats.setEmptyRooms(rs.getInt("emptyRooms"));
            }
            
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        return stats;
    }
} 