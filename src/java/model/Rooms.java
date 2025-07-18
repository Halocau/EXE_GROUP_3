package model;

import java.math.BigDecimal;

public class Rooms {

    private int roomID;
    private int roomFloor;
    private int roomNumber;
    private int roomSize;
    private String roomImg;
    private int total;
    private Item item;
    private RoomItem roomitem;
    private BigDecimal roomFee;
    private int roomStatus;
    private int roomOccupant;
    private String roomDepartment;
    private Vip vip;
    private String userAddress;
    private String userPhone;
    private String facebook;
    private String description;
    private String paymentCode;
    private int ownerID;
    private String roomName;
    
    public Rooms(Item item, RoomItem roomitem) {
        this.item = item;
        this.roomitem = roomitem;
    }
    
    public Rooms(int roomID, int roomFloor, int roomNumber, int roomSize, String roomImg,
            BigDecimal roomFee, int roomStatus, int roomOccupant, String roomDepartment,
            Vip vip, String userAddress, String userPhone, String facebook,
            String description, String roomName, int ownerID) {
        this.roomID = roomID;
        this.roomFloor = roomFloor;
        this.roomNumber = roomNumber;
        this.roomSize = roomSize;
        this.roomImg = roomImg;
        this.roomFee = roomFee;
        this.roomStatus = roomStatus;
        this.roomOccupant = roomOccupant;
        this.roomDepartment = roomDepartment;
        this.vip = vip;
        this.userAddress = userAddress;
        this.userPhone = userPhone;
        this.facebook = facebook;
        this.description = description;
        this.roomName = roomName;
        this.ownerID = ownerID;
    }


    public Rooms(int roomID, int roomFloor, int roomNumber, int roomSize, String roomImg, BigDecimal roomFee, int roomStatus, int roomOccupant, String roomDepartment, Vip vip,
            String userAddress, String userPhone, String facebook) {
        this.roomID = roomID;
        this.roomFloor = roomFloor;
        this.roomNumber = roomNumber;
        this.roomSize = roomSize;
        this.roomImg = roomImg;
        this.roomFee = roomFee;
        this.roomStatus = roomStatus;
        this.roomOccupant = roomOccupant;
        this.roomDepartment = roomDepartment;
        this.vip = vip;
        this.userAddress = userAddress;
        this.userPhone = userPhone;
        this.facebook = facebook;
    }

    public Rooms(int roomID, int roomFloor, int roomNumber, int roomSize, String roomImg, BigDecimal roomFee, int roomStatus, int roomOccupant, String roomDepartment, Vip vip) {
        this.roomID = roomID;
        this.roomFloor = roomFloor;
        this.roomNumber = roomNumber;
        this.roomSize = roomSize;
        this.roomImg = roomImg;
        this.roomFee = roomFee;
        this.roomStatus = roomStatus;
        this.roomOccupant = roomOccupant;
        this.roomDepartment = roomDepartment;
        this.vip = vip;
    }

    public Rooms(int roomID, int roomFloor, int roomNumber, int roomSize, String roomImg, BigDecimal roomFee, int roomStatus, int roomOccupant, String roomDepartment) {
        this.roomID = roomID;
        this.roomFloor = roomFloor;
        this.roomNumber = roomNumber;
        this.roomSize = roomSize;
        this.roomImg = roomImg;
        this.roomFee = roomFee;
        this.roomStatus = roomStatus;
        this.roomOccupant = roomOccupant;
        this.roomDepartment = roomDepartment;
    }

    public Rooms(int roomID, int roomFloor, int roomNumber, int roomSize, String roomImg, int total) {
        this.roomID = roomID;
        this.roomFloor = roomFloor;
        this.roomNumber = roomNumber;
        this.roomSize = roomSize;
        this.roomImg = roomImg;
        this.total = total;
    }

    public Rooms(int roomID, int roomFloor, int roomNumber, int roomSize, String roomImg) {
        this.roomID = roomID;
        this.roomFloor = roomFloor;
        this.roomNumber = roomNumber;
        this.roomSize = roomSize;
        this.roomImg = roomImg;
    }

    public Rooms(int roomID, int roomFloor, int roomNumber, int roomSize, BigDecimal roomFee, String roomImg, int roomOccupant) {
        this.roomID = roomID;
        this.roomFloor = roomFloor;
        this.roomNumber = roomNumber;
        this.roomSize = roomSize;
        this.roomFee = roomFee;
        this.roomImg = roomImg;
        this.roomOccupant = roomOccupant;
    }

    public Rooms() {
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public int getRoomFloor() {
        return roomFloor;
    }
    
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPaymentCode() {
        return paymentCode;
    }

    public void setPaymentCode(String paymentCode) {
        this.paymentCode = paymentCode;
    }
    
    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public int getOwnerID() {
        return ownerID;
    }

    public void setOwnerID(int ownerID) {
        this.ownerID = ownerID;
    }

    public void setRoomFloor(int roomFloor) {
        this.roomFloor = roomFloor;
    }

    public int getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }

    public int getRoomSize() {
        return roomSize;
    }

    public void setRoomSize(int roomSize) {
        this.roomSize = roomSize;
    }

    public String getRoomImg() {
        return roomImg;
    }

    public void setRoomImg(String roomImg) {
        this.roomImg = roomImg;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public Item getItem() {
        return item;
    }

    public void setItem(Item item) {
        this.item = item;
    }

    public RoomItem getRoomitem() {
        return roomitem;
    }

    public void setRoomitem(RoomItem roomitem) {
        this.roomitem = roomitem;
    }

    public BigDecimal getRoomFee() {
        return roomFee;
    }

    public void setRoomFee(BigDecimal roomFee) {
        this.roomFee = roomFee;
    }

    public int getRoomStatus() {
        return roomStatus;
    }

    public void setRoomStatus(int roomStatus) {
        this.roomStatus = roomStatus;
    }

    public int getRoomOccupant() {
        return roomOccupant;
    }

    public void setRoomOccupant(int roomOccupant) {
        this.roomOccupant = roomOccupant;
    }

    public String getRoomDepartment() {
        return roomDepartment;
    }

    public void setRoomDepartment(String roomDepartment) {
        this.roomDepartment = roomDepartment;
    }

    public Vip getVip() {
        return vip;
    }

    public void setVip(Vip vip) {
        this.vip = vip;
    }

    public String getUserAddress() {
        return userAddress;
    }

    public void setUserAddress(String userAddress) {
        this.userAddress = userAddress;
    }

    public String getUserPhone() {
        return userPhone;
    }

    public void setUserPhone(String userPhone) {
        this.userPhone = userPhone;
    }

    public String getFacebook() {
        return facebook;
    }

    public void setFacebook(String facebook) {
        this.facebook = facebook;
    }
}
