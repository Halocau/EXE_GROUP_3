package model;

public class RoomDetailSe {
    // Trả về tiện ích dạng chuỗi cho chatbot
    public String getAmenitiesString() {
        StringBuilder sb = new StringBuilder();
        if (itemName != null && quantity != null) {
            for (int i = 0; i < itemName.length; i++) {
                sb.append(quantity[i]).append(" ").append(itemName[i]);
                if (i < itemName.length - 1) sb.append(", ");
            }
        }
        if (getSingleBed() > 0) sb.append(", ").append(getSingleBed()).append(" Single Bed");
        if (getBunk() > 0) sb.append(", ").append(getBunk()).append(" Bunk Bed");
        if (getChair() > 0) sb.append(", ").append(getChair()).append(" Chair");
        if (isCeilingFans()) sb.append(", Ceiling Fan");
        if (isAirConditional()) sb.append(", Air Conditioner");
        return sb.toString().replaceFirst(", ", "");
    }

    private int roomID;
    private int roomNumber;
    private int roomSize;
    private int roomFloor;
    private int singleBed;
    private int bunk;
    private int chair;
    private boolean ceilingFans;
    private boolean airConditional;
    private String roomImg;
    private String[] itemName;
    private byte[] itemImg;
    private int[] quantity;
    private double roomFee;
    private int[] itemID;
    private int roomOccupant; // thêm ngày 21 / 7
    private int roomStatus; // thêm ngày 21 / 7
    private String roomDescription;
    private String address;
    private String phone;
    private String roomName;

    public RoomDetailSe(int roomID, int roomNumber, int roomSize, int roomFloor, 
            String roomImg, String[] itemName, byte[] itemImg, int[] quantity, 
            double roomFee, int[] itemID, int roomOccupant, int roomStatus) {
        this.roomID = roomID;
        this.roomNumber = roomNumber;
        this.roomSize = roomSize;
        this.roomFloor = roomFloor;
        this.roomImg = roomImg;
        this.itemName = itemName;
        this.itemImg = itemImg;
        this.quantity = quantity;
        this.roomFee = roomFee;
        this.itemID = itemID;
        this.roomOccupant = roomOccupant;
        this.roomStatus = roomStatus;
    }
    
    public RoomDetailSe(int roomID, int roomNumber, int roomSize, int roomFloor,
            String roomImg, String[] itemName, byte[] itemImg, int[] quantity,
            double roomFee, int[] itemID, int roomOccupant, int roomStatus,
            String roomDescription, String address, String phone, String roomName) {

        this.roomID = roomID;
        this.roomNumber = roomNumber;
        this.roomSize = roomSize;
        this.roomFloor = roomFloor;
        this.roomImg = roomImg;
        this.itemName = itemName;
        this.itemImg = itemImg;
        this.quantity = quantity;
        this.roomFee = roomFee;
        this.itemID = itemID;
        this.roomOccupant = roomOccupant;
        this.roomStatus = roomStatus;
        this.roomDescription = roomDescription;
        this.address = address;
        this.phone = phone;
        this.roomName = roomName;
    }

    public int[] getItemID() {
        return itemID;
    }

    public void setItemID(int[] itemID) {
        this.itemID = itemID;
    }

    public String getRoomDescription() {
        return roomDescription;
    }

    public void setRoomDescription(String roomDescription) {
        this.roomDescription = roomDescription;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }
    
    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }
    
    public double getRoomFee() {
        return roomFee;
    }

    public void setRoomFee(double roomFee) {
        this.roomFee = roomFee;
    }      
    
    public String[] getItemName() {
        return itemName;
    }

    public void setItemName(String[] itemName) {
        this.itemName = itemName;
    }

    public byte[] getItemImg() {
        return itemImg;
    }

    public void setItemImg(byte[] itemImg) {
        this.itemImg = itemImg;
    }

    public int[] getQuantity() {
        return quantity;
    }

    public void setQuantity(int[] quantity) {
        this.quantity = quantity;
    }

    public RoomDetailSe() {
    }

    public int getRoomID() {
        return roomID;
    }

    public void setRoomID(int roomID) {
        this.roomID = roomID;
    }

    public int getRoomNumber() {
        return roomNumber;
    }

    public void setRoomNumber(int roomNumber) {
        this.roomNumber = roomNumber;
    }

    public String getRoomImg() {
        return roomImg;
    }

    public void setRoomImg(String roomImg) {
        this.roomImg = roomImg;
    }

    public int getRoomSize() {
        return roomSize;
    }

    public void setRoomSize(int roomSize) {
        this.roomSize = roomSize;
    }

    public int getRoomFloor() {
        return roomFloor;
    }

    public void setRoomFloor(int roomFloor) {
        this.roomFloor = roomFloor;
    }

    public int getSingleBed() {
        return singleBed;
    }

    public void setSingleBed(int singleBed) {
        this.singleBed = singleBed;
    }

    public int getBunk() {
        return bunk;
    }

    public void setBunk(int bunk) {
        this.bunk = bunk;
    }

    public int getChair() {
        return chair;
    }

    public void setChair(int chair) {
        this.chair = chair;
    }

    public boolean isCeilingFans() {
        return ceilingFans;
    }

    public void setCeilingFans(boolean ceilingFans) {
        this.ceilingFans = ceilingFans;
    }

    public boolean isAirConditional() {
        return airConditional;
    }

    public void setAirConditional(boolean airConditional) {
        this.airConditional = airConditional;
    }   

    public int getRoomOccupant() {
        return roomOccupant;
    }

    public void setRoomOccupant(int roomOccupant) {
        this.roomOccupant = roomOccupant;
    }

    public int getRoomStatus() {
        return roomStatus;
    }

    public void setRoomStatus(int roomStatus) {
        this.roomStatus = roomStatus;
    }
    
    
}
