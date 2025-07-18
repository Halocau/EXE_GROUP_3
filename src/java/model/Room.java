package model;

import java.math.BigDecimal;

public class Room {

    private int roomID;
    private int roomFloor;
    private int roomNumber;
    private int roomSize;
    private String roomImg;
    private int total;
    private Item item;
    private RoomItem roomitem;
    private BigDecimal roomFee;
    private int roomOccupant;
    private Integer vipId;
    private String paymentCode;
    private int roomStatus;
    private int ownerID;
    private String description;
    private String roomName;
    
    public Room(Item item, RoomItem roomitem) {
        this.item = item;
        this.roomitem = roomitem;
    }

    public Room(int roomID, int roomFloor, int roomNumber, int roomSize, String roomImg, BigDecimal roomFee) {
        this.roomID = roomID;
        this.roomFloor = roomFloor;
        this.roomNumber = roomNumber;
        this.roomSize = roomSize;
        this.roomImg = roomImg;
        this.roomFee = roomFee;
    }
    
    public Room(int roomID, int roomFloor, int roomNumber, int roomSize, String roomImg, BigDecimal roomFee, int total, int roomOccupant) {
        this.roomID = roomID;
        this.roomFloor = roomFloor;
        this.roomNumber = roomNumber;
        this.roomSize = roomSize;
        this.roomImg = roomImg;
        this.roomFee = roomFee;
        this.total = total;
        this.roomOccupant = roomOccupant;
    }

    public Room(int roomID, int roomFloor, int roomNumber, int roomSize, String roomImg, int total) {
        this.roomID = roomID;
        this.roomFloor = roomFloor;
        this.roomNumber = roomNumber;
        this.roomSize = roomSize;
        this.roomImg = roomImg;
        this.total = total;
    }
    
    
    public Room(int roomID, int roomFloor, int roomNumber, int roomSize, String roomImg) {
        this.roomID = roomID;
        this.roomFloor = roomFloor;
        this.roomNumber = roomNumber;
        this.roomSize = roomSize;
        this.roomImg = roomImg;
    }
    
    public Room(int roomID, int roomFloor, int roomNumber, int roomSize, BigDecimal roomFee) {
        this.roomID = roomID;
        this.roomFloor = roomFloor;
        this.roomNumber = roomNumber;
        this.roomSize = roomSize;   
        this.roomFee = roomFee;
    }

    public Room(int roomID, int roomFloor, int roomNumber, int roomSize, String roomImg, int total, Item item, RoomItem roomitem, BigDecimal roomFee, int roomOccupant, int vipId) {
        this.roomID = roomID;
        this.roomFloor = roomFloor;
        this.roomNumber = roomNumber;
        this.roomSize = roomSize;
        this.roomImg = roomImg;
        this.total = total;
        this.item = item;
        this.roomitem = roomitem;
        this.roomFee = roomFee;
        this.roomOccupant = roomOccupant;
        this.vipId = vipId;
    }

    public Room(int roomID, int roomFloor, int roomNumber, int roomSize, String roomImg, int total, Item item, RoomItem roomitem, BigDecimal roomFee, int roomOccupant, int vipId, String paymentCode) {
        this.roomID = roomID;
        this.roomFloor = roomFloor;
        this.roomNumber = roomNumber;
        this.roomSize = roomSize;
        this.roomImg = roomImg;
        this.total = total;
        this.item = item;
        this.roomitem = roomitem;
        this.roomFee = roomFee;
        this.roomOccupant = roomOccupant;
        this.vipId = vipId;
        this.paymentCode = paymentCode;
    }

    public Room(int roomID, int roomFloor, int roomNumber, int roomSize, String roomImg, int total, Item item, RoomItem roomitem, BigDecimal roomFee, int roomOccupant, Integer vipId, String paymentCode, int roomStatus) {
        this.roomID = roomID;
        this.roomFloor = roomFloor;
        this.roomNumber = roomNumber;
        this.roomSize = roomSize;
        this.roomImg = roomImg;
        this.total = total;
        this.item = item;
        this.roomitem = roomitem;
        this.roomFee = roomFee;
        this.roomOccupant = roomOccupant;
        this.vipId = vipId;
        this.paymentCode = paymentCode;
        this.roomStatus = roomStatus;
    }

 

    public Room() {
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }
    
    public int getOwnerID() {
        return ownerID;
    }

    public void setOwnerID(int ownerID) {
        this.ownerID = ownerID;
    }
    
    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }

    public int getRoomFloor() {
        return roomFloor;
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

    public int getRoomOccupant() {
        return roomOccupant;
    }

    public void setRoomOccupant(int roomOccupant) {
        this.roomOccupant = roomOccupant;
    }

    public Integer getVipId() {
        return vipId;
    }

    public void setVipId(Integer vipId) {
        this.vipId = vipId;
    }

    public String getPaymentCode() {
        return paymentCode;
    }

    public void setPaymentCode(String paymentCode) {
        this.paymentCode = paymentCode;
    }

    public int getRoomStatus() {
        return roomStatus;
    }

    public void setRoomStatus(int roomStatus) {
        this.roomStatus = roomStatus;
    }

    @Override
    public String toString() {
        return "Room{" + "roomID=" + roomID + ", roomFloor=" + roomFloor + ", roomNumber=" + roomNumber + ", roomSize=" + roomSize + ", roomImg=" + roomImg + ", total=" + total + ", item=" + item + ", roomitem=" + roomitem + ", roomFee=" + roomFee + ", roomOccupant=" + roomOccupant + ", vipId=" + vipId + ", paymentCode=" + paymentCode + ", roomStatus=" + roomStatus + '}';
    }

   

    

}


   