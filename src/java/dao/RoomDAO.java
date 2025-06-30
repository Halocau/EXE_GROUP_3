package dao;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import model.Rooms;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;
import java.util.Vector;
import model.RoomDetailSe;
import model.User;
import model.*;
import model.Vip;
import java.util.logging.Level;
import java.util.logging.Logger;

public class RoomDAO extends DBContext {

    protected PreparedStatement statement;// thực thi các câu lệnh SQL trước khi thực sự thực thi
    protected ResultSet resultSet;// giống như 1 cái bảng , như sql manager

    public List<Rooms> getRooms() {
        List<Rooms> rooms = new ArrayList<>();
        String query = "SELECT * FROM room";

        try (PreparedStatement ps = connection.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                int roomID = rs.getInt("roomID");
                int roomFloor = rs.getInt("roomFloor");
                int roomNumber = rs.getInt("roomNumber");
                int roomSize = rs.getInt("roomSize");
                BigDecimal roomFee = rs.getBigDecimal("roomFee");
                String roomImg = rs.getString("roomImg");
                int roomStatus = rs.getInt("roomStatus");
                int roomOccupant = rs.getInt("roomOccupant");
                String rooomDepartment = rs.getString("roomDepartment");

                Rooms room = new Rooms(roomID, roomFloor, roomNumber, roomSize, roomImg, roomFee, roomStatus,
                        roomOccupant, rooomDepartment);
                rooms.add(room);
            }
        } catch (SQLException e) {
        }
        return rooms;
    }

    public List<Rooms> getMyRooms(int ownerId) {
        List<Rooms> rooms = new ArrayList<>();
        String query = "SELECT * FROM room WHERE ownerId = ?";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, ownerId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int roomID = rs.getInt("roomID");
                int roomFloor = rs.getInt("roomFloor");
                int roomNumber = rs.getInt("roomNumber");
                int roomSize = rs.getInt("roomSize");
                BigDecimal roomFee = rs.getBigDecimal("roomFee");
                String roomImg = rs.getString("roomImg");
                int roomStatus = rs.getInt("roomStatus");
                int roomOccupant = rs.getInt("roomOccupant");
                String roomDepartment = rs.getString("roomDepartment");

                Rooms room = new Rooms(roomID, roomFloor, roomNumber, roomSize, roomImg, roomFee, roomStatus,
                        roomOccupant, roomDepartment);
                rooms.add(room);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rooms;
    }

    public List<Rooms> getRoomsByIdRoomSatatus(int idRoomStatus) {
        List<Rooms> rooms = new ArrayList<>();
        String query = "SELECT * FROM room where roomStatus = ?";

        try (PreparedStatement ps = connection.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            ps.setInt(1, idRoomStatus);
            while (rs.next()) {
                int roomID = rs.getInt("roomID");
                int roomFloor = rs.getInt("roomFloor");
                int roomNumber = rs.getInt("roomNumber");
                int roomSize = rs.getInt("roomSize");
                BigDecimal roomFee = rs.getBigDecimal("roomFee");
                String roomImg = rs.getString("roomImg");
                int roomStatus = rs.getInt("roomStatus");
                int roomOccupant = rs.getInt("roomOccupant");
                String rooomDepartment = rs.getString("roomDepartment");

                Rooms room = new Rooms(roomID, roomFloor, roomNumber, roomSize, roomImg, roomFee, roomStatus,
                        roomOccupant, rooomDepartment);
                rooms.add(room);
            }
        } catch (SQLException e) {
        }
        return rooms;
    }

    public List<Rooms> getRoomsAvailable() {
        List<Rooms> rooms = new ArrayList<>();
        String query = "SELECT * FROM room where roomStatus = 1";

        try (PreparedStatement ps = connection.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                int roomID = rs.getInt("roomID");
                int roomFloor = rs.getInt("roomFloor");
                int roomNumber = rs.getInt("roomNumber");
                int roomSize = rs.getInt("roomSize");
                BigDecimal roomFee = rs.getBigDecimal("roomFee");
                String roomImg = rs.getString("roomImg");
                int roomStatus = rs.getInt("roomStatus");
                int roomOccupant = rs.getInt("roomOccupant");
                String rooomDepartment = rs.getString("roomDepartment");

                Rooms room = new Rooms(roomID, roomFloor, roomNumber, roomSize, roomImg, roomFee, roomStatus,
                        roomOccupant, rooomDepartment);
                rooms.add(room);
            }
        } catch (SQLException e) {
        }
        return rooms;
    }

    public Room findById(int id) {
        String query = "SELECT * FROM room where roomID = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int roomID = rs.getInt("roomID");
                int roomFloor = rs.getInt("roomFloor");
                int roomNumber = rs.getInt("roomNumber");
                int roomSize = rs.getInt("roomSize");
                String roomImg = rs.getString("roomImg");

                Room room = new Room(roomID, roomFloor, roomNumber, roomSize, roomImg, 0);
                return room;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public List<Rooms> pagingRoom(int index, int flag) {
        List<Rooms> rooms = new ArrayList<>();
        String query = null;
        if (flag == 0) {
            query = "select * from room\n"
                    + "where roomStatus = 1\n"
                    + "order by roomID\n"
                    + "OFFSET ? ROWS FETCH NEXT 10 ROWS only";
        } else if (flag == 1) {
            query = "select * from room\n"
                    + "order by roomID\n"
                    + "OFFSET ? ROWS FETCH NEXT 10 ROWS only";
        }
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, (index - 1) * 6);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int roomID = rs.getInt("roomID");
                int roomFloor = rs.getInt("roomFloor");
                int roomNumber = rs.getInt("roomNumber");
                int roomSize = rs.getInt("roomSize");
                BigDecimal roomFee = rs.getBigDecimal("roomFee");
                String roomImg = rs.getString("roomImg");
                int roomStatus = rs.getInt("roomStatus");
                int roomOccupant = rs.getInt("roomOccupant");
                String roomDepartment = rs.getString("roomDepartment");

                Rooms room = new Rooms(roomID, roomFloor, roomNumber, roomSize, roomImg, roomFee, roomStatus,
                        roomOccupant, roomDepartment);
                rooms.add(room);
            }
        } catch (SQLException e) {
        }
        return rooms;
    }

    public List<Rooms> pagingMyRoom(int index, int flag, int ownerId) {
        List<Rooms> rooms = new ArrayList<>();
        String query = null;

        if (flag == 0) {
            query = "SELECT * FROM room "
                    + "WHERE roomStatus = 1 AND ownerId = ? "
                    + "ORDER BY roomID "
                    + "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
        } else if (flag == 1) {
            query = "SELECT * FROM room "
                    + "WHERE ownerId = ? "
                    + "ORDER BY roomID "
                    + "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
        }

        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, ownerId);
            ps.setInt(2, (index - 1) * 6);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int roomID = rs.getInt("roomID");
                int roomFloor = rs.getInt("roomFloor");
                int roomNumber = rs.getInt("roomNumber");
                int roomSize = rs.getInt("roomSize");
                BigDecimal roomFee = rs.getBigDecimal("roomFee");
                String roomImg = rs.getString("roomImg");
                int roomStatus = rs.getInt("roomStatus");
                int roomOccupant = rs.getInt("roomOccupant");
                String roomDepartment = rs.getString("roomDepartment");

                Rooms room = new Rooms(roomID, roomFloor, roomNumber, roomSize, roomImg, roomFee, roomStatus,
                        roomOccupant, roomDepartment);
                rooms.add(room);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return rooms;
    }

    public List<Rooms> pagingRoomVip(int index, int flag, int vipID) {
        List<Rooms> rooms = new ArrayList<>();
        String query = null;
        if (flag == 0) {
            query = "SELECT room.*, u.userAddress, u.userPhone, v.vipName "
                    + "FROM room "
                    + "JOIN vip v ON room.vipID = v.vipID "
                    + " JOIN [user] u ON room.ownerId = u.userID "
                    + "WHERE roomStatus = 1 AND v.vipID = ? "
                    + "ORDER BY roomID "
                    + "OFFSET ? ROWS FETCH NEXT 10 ROWS ONLY";
        } else if (flag == 1) {
            query = "select * from room\n"
                    + "JOIN vip v ON room.vipID = v.vipID\n"
                    + "order by roomID\n"
                    + "OFFSET ? ROWS FETCH NEXT 10 ROWS only";
        }
        try {
            PreparedStatement ps = connection.prepareStatement(query);
            ps.setInt(1, vipID);
            ps.setInt(2, (index - 1) * 6);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int roomID = rs.getInt("roomID");
                int roomFloor = rs.getInt("roomFloor");
                int roomNumber = rs.getInt("roomNumber");
                int roomSize = rs.getInt("roomSize");
                BigDecimal roomFee = rs.getBigDecimal("roomFee");
                String roomImg = rs.getString("roomImg");
                int roomStatus = rs.getInt("roomStatus");
                int roomOccupant = rs.getInt("roomOccupant");
                String roomDepartment = rs.getString("roomDepartment");
                String userAddress = rs.getString("userAddress");
                String userPhone = rs.getString("userPhone");
                String facebook = rs.getString("facebook");

                Vip vip = new Vip();
                vip.setVipID(rs.getInt("vipID"));
                vip.setVipName(rs.getString("vipName"));
                Rooms room = new Rooms(roomID, roomFloor, roomNumber, roomSize, roomImg, roomFee, roomStatus,
                        roomOccupant, roomDepartment, vip, userAddress, userPhone, facebook);
                rooms.add(room);
            }
        } catch (SQLException e) {
        }
        return rooms;
    }

    public List<String> getItemName() {
        List<String> itemNames = new ArrayList<>();
        String query = "SELECT itemName FROM item";

        try (PreparedStatement ps = connection.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                String itemName = rs.getString("itemName");

                itemNames.add(itemName);
            }
        } catch (SQLException e) {

        }

        return itemNames;
    }

    public int cancleRoom(int renterID, int roomID) {
        int result = 0;

        String deleteRenterQuery = "DELETE FROM renter WHERE renterID = ?";
        String updateRoomQuery = "UPDATE room SET roomOccupant = roomOccupant - 1 WHERE roomID = ?";
        String updateRoomStatusQuery = "UPDATE room SET roomStatus = 1 WHERE roomID = ?";

        try {

            connection.setAutoCommit(false);

            try (PreparedStatement deletePs = connection.prepareStatement(deleteRenterQuery)) {
                deletePs.setInt(1, renterID);
                result = deletePs.executeUpdate();
            }

            try (PreparedStatement updatePs = connection.prepareStatement(updateRoomQuery)) {
                updatePs.setInt(1, roomID);
                result += updatePs.executeUpdate();
            }

            try (PreparedStatement updateStatusPs = connection.prepareStatement(updateRoomStatusQuery)) {
                updateStatusPs.setInt(1, roomID);
                result += updateStatusPs.executeUpdate();
            }

            connection.commit();
        } catch (SQLException e) {

            try {
                connection.rollback();
            } catch (SQLException rollbackEx) {
                rollbackEx.printStackTrace();
            }
            e.printStackTrace();
            result = 0;
        } finally {

            try {
                connection.setAutoCommit(true);
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return result;
    }

    public int getItemIDOrQuantityByItemName(String itemName, int flag, int roomID) {
        int raw = 0;
        if (flag == 0) {
            String query = "SELECT itemID FROM item WHERE itemName = ?";
            try (PreparedStatement ps = connection.prepareStatement(query)) {
                ps.setString(1, itemName);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        raw = rs.getInt("itemID");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        } else if (flag == 1) {
            String query1 = "select quantity from roomItem ri\n"
                    + "  join item i \n"
                    + "  on ri.itemID = i.itemID\n"
                    + "  where itemName = ? and roomID = ?";
            try (PreparedStatement ps = connection.prepareStatement(query1)) {
                ps.setString(1, itemName);
                ps.setInt(2, roomID);
                try (ResultSet rs = ps.executeQuery()) {
                    if (rs.next()) {
                        raw = rs.getInt("quantity");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return raw;
    }

    public User getOwnerProfileByID(int userID) {
        String query = "select u.userName, u.userGender, u.userBirth, u.userAddress, u.userPhone, a.userMail, u.userAvatar from account a join [user] u on u.userID = a.userID \n"
                + "  where a.userRole = 2 and u.userID = " + userID;
        User ownerProfile = null;

        try (PreparedStatement ps = connection.prepareStatement(query); ResultSet rs = ps.executeQuery()) {
            if (rs.next()) {
                String userName = rs.getString("userName");
                String userGender = rs.getString("userGender");
                String userBirth = rs.getString("userBirth");
                String userAddress = rs.getString("userAddress");
                String userPhone = rs.getString("userPhone");
                String email = rs.getString("userMail");
                String userAvatar = rs.getString("userAvatar");
                ownerProfile = new User(userName, userGender, userBirth, userAddress, userPhone, email, userAvatar);
            }
        } catch (SQLException e) {

        }

        return ownerProfile;
    }

    public int updateOwnerProfile(User ownerProfile) {
        int n = 0;
        String sql = "UPDATE [dbo].[user]\n"
                + "   SET [userName] = ?\n"
                + "      ,[userGender] = ?\n"
                + "      ,[userBirth] = ?\n"
                + "      ,[userAddress] = ?\n"
                + "      ,[userPhone] = ?      \n"
                + " WHERE userID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, ownerProfile.getUserName());
            pre.setString(2, ownerProfile.getUserGender());
            pre.setString(3, ownerProfile.getUserBirth());
            pre.setString(4, ownerProfile.getUserAddress());
            pre.setString(5, ownerProfile.getUserPhone());
            pre.setInt(6, ownerProfile.getUserID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {

        }

        return n;
    }

    public int updateAvatar(User ownerProfile) {
        int n = 0;
        String sql = "UPDATE [dbo].[user]\n"
                + "   SET [userAvatar] = ?\n"
                + " WHERE userID = ?";
        try {
            PreparedStatement pre = connection.prepareStatement(sql);
            pre.setString(1, ownerProfile.getUserAvatar());
            pre.setInt(2, ownerProfile.getUserID());
            n = pre.executeUpdate();
        } catch (SQLException ex) {

        }
        return n;
    }

    public RoomDetailSe getRoomDetail(int roomid) {
        String query = "select r.roomID, r.roomFloor, r.roomNumber, r.roomSize, r.roomFee, r.roomImg,\n"
                + "       i.itemName, i.itemImg, ri.quantity, ri.itemID,\n"
                + "       r.roomOccupant, r.roomStatus, r.description, u.userAddress, u.userPhone, r.roomName\n"
                + "from room r\n"
                + "left join roomItem ri on r.roomID = ri.roomID\n"
                + "left join item i on ri.itemID = i.itemID\n"
                + "left join [user] u on r.ownerId = u.userID\n"
                + "where r.roomID = ?";

        RoomDetailSe roomDetail = null;
        List<String> itemNames = new ArrayList<>();
        List<Integer> quantities = new ArrayList<>();
        List<Integer> itemIDs = new ArrayList<>();

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, roomid);
            try (ResultSet rs = ps.executeQuery()) {
                boolean roomDetailSet = false;
                while (rs.next()) {
                    if (!roomDetailSet) {
                        int roomID = rs.getInt("roomID");
                        int roomNumber = rs.getInt("roomNumber");
                        int roomFloor = rs.getInt("roomFloor");
                        int roomSize = rs.getInt("roomSize");
                        double roomFee = rs.getDouble("roomFee");
                        String roomImg = rs.getString("roomImg");
                        int roomOccupant = rs.getInt("roomOccupant");
                        int roomStatus = rs.getInt("roomStatus");
                        String description = rs.getString("description");
                        String address = rs.getString("userAddress");
                        String userPhone = rs.getString("userPhone");
                        String roomName = rs.getString("roomName");

                        roomDetail = new RoomDetailSe(roomID, roomNumber, roomSize, roomFloor,
                                roomImg, null, null, null, roomFee, null,
                                roomOccupant, roomStatus, description, address, userPhone, roomName);
                        roomDetailSet = true;
                    }

                    int itemID = rs.getInt("itemID");
                    if (!rs.wasNull()) {
                        String itemName = rs.getString("itemName");
                        itemNames.add(itemName);

                        int quantity = rs.getInt("quantity");
                        quantities.add(quantity);

                        itemIDs.add(itemID);
                    }
                }

                if (roomDetail != null) {
                    roomDetail.setItemName(itemNames.toArray(new String[0]));
                    roomDetail.setQuantity(quantities.stream().mapToInt(i -> i).toArray());
                    roomDetail.setItemID(itemIDs.stream().mapToInt(i -> i).toArray());
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return roomDetail;
    }

    public int deleteRoomItem(int roomID, int itemID) {
        String query = "DELETE FROM roomItem WHERE roomID = ? AND itemID = ?";
        int n = 0;
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, roomID);
            ps.setInt(2, itemID);

            n = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return n;
    }

    public int addRoomItem(int roomID, int itemID, int quantity) {
        String query = "INSERT INTO [dbo].[roomItem]\n"
                + "           ([roomID]\n"
                + "           ,[itemID]\n"
                + "           ,[quantity])\n"
                + "     VALUES\n"
                + "           (?,?,?)";
        int n = 0;
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, roomID);
            ps.setInt(2, itemID);
            ps.setInt(3, quantity);
            n = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return n;
    }

    public int updateItemQuantity(int roomID, int itemID, int quantity) {
        String query = "UPDATE roomItem SET quantity = ? WHERE roomID = ? AND itemID = ?";
        int n = 0;
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, quantity);
            ps.setInt(2, roomID);
            ps.setInt(3, itemID);
            n = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return n;
    }

    public int updateRoomDetail(int roomID, double roomFee, String roomImg, int roomNumber) {
        String query = "UPDATE [dbo].[room]\n"
                + "   SET [roomNumber] = ?\n"
                + "      ,[roomFee] = ?\n"
                + "      ,[roomImg] = ?\n"
                + " WHERE roomID = ?";
        int n = 0;
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, roomNumber);
            ps.setDouble(2, roomFee);
            ps.setString(3, roomImg);
            ps.setInt(4, roomID);
            n = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return n;
    }

    public boolean isExistRoomNumber(int roomNumber) {
        String query = "select * from room where roomNumber = ?";
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, roomNumber);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return false;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return true;
    }

    public int getTotalRoom() {
        String query = "select count(*) from room where roomStatus = 1";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public int getTotalMyRoom(int ownerId) {
        String query = "SELECT COUNT(*) FROM room WHERE roomStatus = 1 AND ownerId = ?";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, ownerId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public int getCurrentRoomNumber(int roomID) {
        String query = "select roomNumber from room where roomID = ?";

        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, roomID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1;
    }

    public int updateRoomStatus(int roomID, int roomStatus) {
        String query = "Update room set roomStatus = ? where roomID = ?";
        int n = 0;
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, roomStatus);
            ps.setInt(2, roomID);
            n = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return n;
    }

    public int updateRoomOccupant(int roomID) {
        String query = "Update room set roomOccupant += 1  where roomID = ?";
        int n = 0;
        try (PreparedStatement ps = connection.prepareStatement(query)) {
            ps.setInt(1, roomID);
            n = ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return n;
    }

    public List<Room> getAllRooms() {
        List<Room> rooms = new ArrayList<>();
        String sql = "SELECT * FROM Room";

        try (Connection conn = connection; PreparedStatement ps = conn.prepareStatement(sql); ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Room room = new Room();
                room.setRoomID(rs.getInt("roomID"));
                room.setRoomFloor(rs.getInt("roomFloor"));
                room.setRoomNumber(rs.getInt("roomNumber"));
                room.setRoomSize(rs.getInt("roomSize"));
                room.setRoomFee(rs.getBigDecimal("roomFee"));

                room.setRoomImg(rs.getString("roomImg"));

                rooms.add(room);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return rooms;
    }

    public List<RoomItem> getRoomDetails(String roomId) {
        List<RoomItem> roomItems = new ArrayList<>();

        String sql = "select ri.itemID,i.itemName,i.itemImg,ri.quantity from roomItem ri join item i on ri.itemID = i.itemID where ri.roomID = ? ";

        try {
            java.sql.Connection conn = connection;
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, roomId);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                RoomItem roomItem = new RoomItem();

                roomItem.setItemID(rs.getInt("itemID"));
                roomItem.setQuantity(rs.getInt("quantity"));
                roomItem.setItemName(rs.getString("itemName"));
                roomItem.setItemImg(rs.getString("itemImg"));

                roomItems.add(roomItem);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return roomItems;
    }

    public Room getRoomDetailByID(int id) {
        String sql = "SELECT \n"
                + "    r.roomID,\n"
                + "    r.roomFloor,\n"
                + "    r.roomNumber,\n"
                + "    r.roomSize,\n"
                + "    r.roomFee,\n"
                + "    r.roomImg,\n"
                + "    r.roomOccupant,\n"
                + "    COUNT(re.renterID) AS total\n"
                + "FROM \n"
                + "    Room r\n"
                + "LEFT JOIN \n"
                + "    Renter re ON r.roomID = re.roomID\n"
                + "WHERE \n"
                + "    r.roomID = ?\n"
                + "GROUP BY \n"
                + "    r.roomID, r.roomFloor, r.roomNumber, r.roomSize, r.roomFee, r.roomImg, r.roomOccupant";

        Room room = null;
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int roomID = rs.getInt("roomID");
                    int roomFloor = rs.getInt("roomFloor");
                    int roomNumber = rs.getInt("roomNumber");
                    int roomSize = rs.getInt("roomSize");
                    BigDecimal roomFee = rs.getBigDecimal("roomFee");
                    String roomImg = rs.getString("roomImg");
                    int total = rs.getInt("total");
                    int roomOccupant = rs.getInt("roomOccupant");
                    room = new Room(roomID, roomFloor, roomNumber, roomSize, roomImg, roomFee, total, roomOccupant);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving room details: " + e.getMessage());
            e.printStackTrace();
        }
        return room;
    }

    public Rooms getRoomByID(int id) {
        String sql = "SELECT \n"
                + "    r.roomID,\n"
                + "    r.roomFloor,\n"
                + "    r.roomNumber,\n"
                + "    r.roomSize,\n"
                + "    r.roomFee,\n"
                + "    r.roomImg,\n"
                + "    r.roomOccupant\n"
                + "    COUNT(re.renterID) AS total\n"
                + "FROM \n"
                + "    Room r\n"
                + "LEFT JOIN \n"
                + "    Renter re ON r.roomID = re.roomID\n"
                + "WHERE \n"
                + "    r.roomID = ?\n"
                + "GROUP BY \n"
                + "    r.roomID, r.roomFloor, r.roomNumber, r.roomSize, r.roomFee, r.roomImg";

        Rooms room = null;
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int roomID = rs.getInt("roomID");
                    int roomFloor = rs.getInt("roomFloor");
                    int roomNumber = rs.getInt("roomNumber");
                    int roomSize = rs.getInt("roomSize");
                    BigDecimal roomFee = rs.getBigDecimal("roomFee");
                    String roomImg = rs.getString("roomImg");
                    int roomOccupant = rs.getInt("roomOccupant");
                    int total = rs.getInt("total");
                    room = new Rooms(roomID, roomFloor, roomNumber, roomSize, roomFee, roomImg, roomOccupant);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving room details: " + e.getMessage());
            e.printStackTrace();
        }
        return room;
    }

    public Room getRoomDetailByNumber(int roomNumber) {

        String sql = "SELECT \n"
                + "    r.roomID,\n"
                + "    r.roomFloor,\n"
                + "    r.roomNumber,\n"
                + "    r.roomSize,\n"
                + "    r.roomFee,\n"
                + "    r.roomImg,\n"
                + "    r.roomOccupant,\n"
                + "    COUNT(re.renterID) AS total\n"
                + "FROM \n"
                + "    Room r\n"
                + "LEFT JOIN \n"
                + "    Renter re ON r.roomID = re.roomID\n"
                + "WHERE \n"
                + "    r.roomNumber = ?\n"
                + "GROUP BY \n"
                + "    r.roomID, r.roomFloor, r.roomNumber, r.roomSize, r.roomFee, r.roomImg, r.roomOccupant";

        Room room = null;
        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, roomNumber);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    int roomID = rs.getInt("roomID");
                    int roomFloor = rs.getInt("roomFloor");
                    int roomNum = rs.getInt("roomNumber"); // Changed variable name to avoid conflict
                    int roomSize = rs.getInt("roomSize");
                    BigDecimal roomFee = rs.getBigDecimal("roomFee");
                    String roomImg = rs.getString("roomImg");
                    int total = rs.getInt("total");
                    int roomOccupant = rs.getInt("roomOccupant");
                    room = new Room(roomID, roomFloor, roomNum, roomSize, roomImg, roomFee, total, roomOccupant);
                }
            }
        } catch (SQLException e) {
            System.out.println("Error retrieving room details: " + e.getMessage());
            e.printStackTrace();
        }
        return room;
    }

    public void addRoom(Room r) {
        String sql = "INSERT INTO [dbo].[room] "
                + "([roomFloor], [roomNumber], [roomSize], [roomFee], [roomStatus], "
                + "[roomOccupant], [roomDepartment], [vipID], [roomImg], "
                + "[paymentCode], [ownerId], [description], [facebook], [roomName]) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            statement = connection.prepareStatement(sql, statement.RETURN_GENERATED_KEYS);
            statement.setObject(1, r.getRoomFloor());
            statement.setObject(2, r.getRoomNumber());
            statement.setObject(3, r.getRoomSize());
            statement.setObject(4, r.getRoomFee());
            statement.setObject(5, r.getRoomStatus());
            statement.setObject(6, r.getRoomOccupant());
            statement.setObject(7, null);
            statement.setObject(8, null);
            statement.setObject(9, r.getRoomImg());
            statement.setObject(10, r.getPaymentCode());
            statement.setObject(11, r.getOwnerID());
            statement.setObject(12, r.getDescription());
            statement.setObject(13, null);
            statement.setObject(14, r.getRoomName());
            statement.executeUpdate();
            resultSet = statement.getGeneratedKeys();
        } catch (Exception ex) {
            ex.printStackTrace();
            Logger.getLogger(RoomDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // public static void main(String[] args) {
    // RoomDAO dao = new RoomDAO();
    // int testRoomID = 1; // Replace with a valid room ID for testing
    // Room room = dao.getRoomDetailByID(testRoomID);
    // if (room != null) {
    // System.out.println("Room ID: " + room.getRoomID());
    // System.out.println("Room Floor: " + room.getRoomFloor());
    // System.out.println("Room Number: " + room.getRoomNumber());
    // System.out.println("Room Size: " + room.getRoomSize());
    // System.out.println("Room Fee: " + room.getRoomFee());
    // System.out.println("Room Image: " + room.getRoomImg());
    // System.out.println("Total Renters: " + room.getTotal());
    // } else {
    // System.out.println("No room found with ID: " + testRoomID);
    // }
    // }
    // public static void main(String[] args) {
    // RoomDAO dao = new RoomDAO();
    // List<Rooms> pagingRoom = dao.pagingRoom(1, 1);
    // for (Rooms rooms : pagingRoom) {
    // System.out.println(rooms.getRoomID());
    // }
    // }
    public static void main(String[] args) {
        RoomDAO roomDAO = new RoomDAO(); // Ensure your RoomDAO sets up DB connection

        int ownerId = 15;   // 🔍 Replace with a real ownerId in your database
        int pageIndex = 1;  // 🧭 Test with other indexes like 2, 3...
        int flag = 1;       // Use 0 for only active rooms, 1 for all rooms of owner

        List<Rooms> rooms = roomDAO.pagingMyRoom(pageIndex, flag, ownerId);

        System.out.println("📄 Paging result for owner ID " + ownerId + ", page index " + pageIndex + ":");
        if (rooms.isEmpty()) {
            System.out.println("❌ No rooms found for this page.");
        } else {
            for (Rooms room : rooms) {
                System.out.println("Room ID: " + room.getRoomID());
                System.out.println(" - Floor: " + room.getRoomFloor());
                System.out.println(" - Number: " + room.getRoomNumber());
                System.out.println(" - Size: " + room.getRoomSize());
                System.out.println(" - Fee: " + room.getRoomFee());
                System.out.println(" - Status: " + room.getRoomStatus());
                System.out.println(" - Occupant: " + room.getRoomOccupant());
                System.out.println(" - Department: " + room.getRoomDepartment());
                System.out.println(" - Image present: " + (room.getRoomImg() != null));
                System.out.println("------------------------------");
            }
        }
    }

    // Lấy danh sách phòng có filter và phân trang
    public List<Rooms> getFilteredRooms(String searchRoomNumber, String status, Integer minPrice, Integer maxPrice,
            int page, int pageSize) {
        List<Rooms> rooms = new ArrayList<>();
        StringBuilder sql = new StringBuilder("SELECT * FROM room WHERE 1=1");
        List<Object> params = new ArrayList<>();
        if (searchRoomNumber != null && !searchRoomNumber.isEmpty()) {
            sql.append(" AND roomNumber LIKE ?");
            params.add("%" + searchRoomNumber + "%");
        }
        if (status != null && !status.equals("all") && !status.isEmpty()) {
            if (status.equals("occupied")) {
                sql.append(" AND roomOccupant > 0");
            } else if (status.equals("empty")) {
                sql.append(" AND roomOccupant = 0");
            }
        }
        if (minPrice != null) {
            sql.append(" AND roomFee >= ?");
            params.add(minPrice);
        }
        if (maxPrice != null) {
            sql.append(" AND roomFee <= ?");
            params.add(maxPrice);
        }
        sql.append(" ORDER BY roomID OFFSET ? ROWS FETCH NEXT ? ROWS ONLY");
        params.add((page - 1) * pageSize);
        params.add(pageSize);
        try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {
            int idx = 1;
            for (Object param : params) {
                ps.setObject(idx++, param);
            }
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int roomID = rs.getInt("roomID");
                int roomFloor = rs.getInt("roomFloor");
                int roomNumber = rs.getInt("roomNumber");
                int roomSize = rs.getInt("roomSize");
                BigDecimal roomFee = rs.getBigDecimal("roomFee");
                String roomImg = rs.getString("roomImg");
                int roomStatus = rs.getInt("roomStatus");
                int roomOccupant = rs.getInt("roomOccupant");
                String roomDepartment = rs.getString("roomDepartment");
                Rooms room = new Rooms(roomID, roomFloor, roomNumber, roomSize, roomImg, roomFee, roomStatus,
                        roomOccupant, roomDepartment);
                rooms.add(room);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rooms;
    }

    // Đếm tổng số phòng sau khi filter
    public int countFilteredRooms(String searchRoomNumber, String status, Integer minPrice, Integer maxPrice) {
        int count = 0;
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) FROM room WHERE 1=1");
        List<Object> params = new ArrayList<>();
        if (searchRoomNumber != null && !searchRoomNumber.isEmpty()) {
            sql.append(" AND roomNumber LIKE ?");
            params.add("%" + searchRoomNumber + "%");
        }
        if (status != null && !status.equals("all") && !status.isEmpty()) {
            if (status.equals("occupied")) {
                sql.append(" AND roomOccupant > 0");
            } else if (status.equals("empty")) {
                sql.append(" AND roomOccupant = 0");
            }
        }
        if (minPrice != null) {
            sql.append(" AND roomFee >= ?");
            params.add(minPrice);
        }
        if (maxPrice != null) {
            sql.append(" AND roomFee <= ?");
            params.add(maxPrice);
        }
        try (PreparedStatement ps = connection.prepareStatement(sql.toString())) {
            int idx = 1;
            for (Object param : params) {
                ps.setObject(idx++, param);
            }
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                count = rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return count;
    }
}
