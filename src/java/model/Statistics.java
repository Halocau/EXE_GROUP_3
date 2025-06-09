package model;

public class Statistics {
    private double totalRevenue;
    private int totalOccupants;
    private int occupiedRooms;
    private int emptyRooms;
    
    public Statistics() {
    }
    
    public Statistics(double totalRevenue, int totalOccupants, int occupiedRooms, int emptyRooms) {
        this.totalRevenue = totalRevenue;
        this.totalOccupants = totalOccupants;
        this.occupiedRooms = occupiedRooms;
        this.emptyRooms = emptyRooms;
    }

    public double getTotalRevenue() {
        return totalRevenue;
    }

    public void setTotalRevenue(double totalRevenue) {
        this.totalRevenue = totalRevenue;
    }

    public int getTotalOccupants() {
        return totalOccupants;
    }

    public void setTotalOccupants(int totalOccupants) {
        this.totalOccupants = totalOccupants;
    }

    public int getOccupiedRooms() {
        return occupiedRooms;
    }

    public void setOccupiedRooms(int occupiedRooms) {
        this.occupiedRooms = occupiedRooms;
    }

    public int getEmptyRooms() {
        return emptyRooms;
    }

    public void setEmptyRooms(int emptyRooms) {
        this.emptyRooms = emptyRooms;
    }
} 