<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="model.Statistics" %>
<%@ page import="dao.RenterDAO" %>
<html>
<head>
    <title>Thống kê hệ thống</title>
    <style>
        body { font-family: Arial, sans-serif; background: #f5f6fa; }
        .container { max-width: 500px; margin: 40px auto; background: #fff; border-radius: 8px; box-shadow: 0 2px 8px #ccc; padding: 32px; }
        h2 { text-align: center; color: #2d3436; }
        table { width: 100%; border-collapse: collapse; margin-top: 24px; }
        th, td { padding: 12px 8px; text-align: left; }
        th { background: #0984e3; color: #fff; }
        tr:nth-child(even) { background: #f1f2f6; }
        .stat-label { font-weight: bold; }
    </style>
</head>
<body>
    <div class="container">
        <h2>Thống kê hệ thống</h2>
        <% 
            RenterDAO dao = new RenterDAO();
            Statistics stats = dao.getStatistics();
        %>
        <table>
            <tr>
                <td class="stat-label">Tổng doanh thu:</td>
                <td><%= stats.getTotalRevenue() %> VNĐ</td>
            </tr>
            <tr>
                <td class="stat-label">Tổng số người ở:</td>
                <td><%= stats.getTotalOccupants() %></td>
            </tr>
            <tr>
                <td class="stat-label">Số phòng đang cho thuê:</td>
                <td><%= stats.getOccupiedRooms() %></td>
            </tr>
            <tr>
                <td class="stat-label">Số phòng trống:</td>
                <td><%= stats.getEmptyRooms() %></td>
            </tr>
        </table>
    </div>
</body>
</html> 