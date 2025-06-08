<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh sách người thuê</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
        <style>
            .statistics-card {
                background: linear-gradient(45deg, #4CAF50, #2196F3);
                color: white;
                border-radius: 10px;
                padding: 20px;
                margin-bottom: 20px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
                transition: transform 0.3s ease;
            }
            .statistics-card:hover {
                transform: translateY(-5px);
            }
            .statistics-icon {
                font-size: 2.5rem;
                margin-bottom: 10px;
            }
            .statistics-value {
                font-size: 1.8rem;
                font-weight: bold;
            }
            .statistics-label {
                font-size: 1rem;
                opacity: 0.9;
            }
            .table-container {
                background: white;
                border-radius: 10px;
                padding: 20px;
                box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            }
        </style>
    </head>
    <body>
        <div class="container mt-4">
            <h2 class="mb-4">Quản lý người thuê</h2>
            
            <!-- Thống kê -->
            <div class="row mb-4">
                <div class="col-md-3">
                    <div class="statistics-card">
                        <div class="statistics-icon">
                            <i class="fas fa-money-bill-wave"></i>
                        </div>
                        <div class="statistics-value">
                            ${statistics.totalRevenue} VNĐ
                        </div>
                        <div class="statistics-label">
                            Tổng doanh thu
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="statistics-card">
                        <div class="statistics-icon">
                            <i class="fas fa-users"></i>
                        </div>
                        <div class="statistics-value">
                            ${statistics.totalOccupants}
                        </div>
                        <div class="statistics-label">
                            Tổng số người ở
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="statistics-card">
                        <div class="statistics-icon">
                            <i class="fas fa-door-open"></i>
                        </div>
                        <div class="statistics-value">
                            ${statistics.occupiedRooms}
                        </div>
                        <div class="statistics-label">
                            Phòng đang cho thuê
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="statistics-card">
                        <div class="statistics-icon">
                            <i class="fas fa-door-closed"></i>
                        </div>
                        <div class="statistics-value">
                            ${statistics.emptyRooms}
                        </div>
                        <div class="statistics-label">
                            Phòng trống
                        </div>
                    </div>
                </div>
            </div>
            
            <!-- Bảng danh sách người thuê -->
            <div class="table-container">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th>ID Phòng</th>
                            <th>Tên người thuê</th>
                            <th>Số phòng</th>
                            <th>Tầng</th>
                            <th>Số dư</th>
                            <th>Thao tác</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${listRenters}" var="renter">
                            <tr>
                                <td>${renter.roomID}</td>
                                <td>${renter.userName}</td>
                                <td>${renter.roomNumber}</td>
                                <td>${renter.roomFloor}</td>
                                <td>${renter.balance} VNĐ</td>
                                <td>
                                    <a href="#" class="btn btn-primary btn-sm">
                                        <i class="fas fa-edit"></i> Sửa
                                    </a>
                                    <a href="#" class="btn btn-danger btn-sm">
                                        <i class="fas fa-trash"></i> Xóa
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html> 