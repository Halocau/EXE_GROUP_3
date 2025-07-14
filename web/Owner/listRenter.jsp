<%-- 
    Document   : listRenter
    Created on : 4 thg 7, 2024, 23:21:05
    Author     : quocp
--%>

<%@page import="dao.RoomDAO,java.util.List"%>
<%@page import="model.Rooms, model.RenterList" %>
<%@page import="dao.RenterDAO" %>
<%@page import="model.Statistics" %>

<%
    List<RenterList> listRenter = (List<RenterList>) request.getAttribute("listRenters");
    RenterDAO renterDAO = new RenterDAO();
    Statistics stats = renterDAO.getStatistics();
%>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="author" content="Untree.co">
        <link rel="shortcut icon" href="favicon.png">

        <meta name="description" content="" />
        <meta name="keywords" content="bootstrap, bootstrap5" />

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap" rel="stylesheet">


        <link rel="stylesheet" href="fonts/icomoon/style.css">
        <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

        <link rel="stylesheet" href="css/tiny-slider.css">
        <link rel="stylesheet" href="css/aos.css">
        <link rel="stylesheet" href="css/style.css">

        <title>Hola Motel</title>
        <style>
            .pagination {
                display: flex;
                justify-content: center;
                align-items: center;
                margin-top: 20px;
            }

            .pagination a {
                color: #007bff;
                padding: 8px 16px;
                text-decoration: none;
                border: 1px solid #ddd;
                margin: 0 5px;
                border-radius: 5px;
                transition: background-color 0.3s ease;
            }

            .pagination a:hover {
                background-color: #007bff;
                color: white;
            }

            .pagination a.active {
                background-color: #007bff;
                color: white;
                border-color: #007bff;
            }

            .search-container {
                text-align: left;
                margin-bottom: 20px;
                margin-right: 10px;
            }

            .search-input {
                width: 100%;
                padding: 10px;
                font-size: 16px;
                border: 1px solid #ccc;
                border-radius: 5px;
                transition: width 0.4s ease-in-out;
            }

            .search-input:focus {
                width: 270px;
                outline: none;
                border-color: #4CAF50;
            }

            .search-filter {
                background-color: #f8f9fa;
                border: 1px solid #ddd;
                border-radius: 5px;
                padding: 20px;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            }

            .search-container {
                margin-bottom: 20px;
            }

            .search-input {
                width: 100%;
                padding: 10px;
                border: 1px solid #ccc;
                border-radius: 5px;
                box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);
                font-size: 16px;
            }

            .price-range {
                margin-top: 20px;
            }

            .price-label {
                display: inline-block;
                margin-right: 10px;
                cursor: pointer;
            }

            .price-input {
                appearance: none;
                -webkit-appearance: none;
                -moz-appearance: none;
                width: 20px;
                height: 20px;
                border: 2px solid #ccc;
                border-radius: 4px;
                vertical-align: middle;
                margin-right: 5px;
                cursor: pointer;
            }

            .price-input:checked {
                background-color: #17a2b8;
                border-color: #17a2b8;
            }

            .search-filter label {
                display: block;
                cursor: pointer;
                margin-bottom: 10px;
                padding: 5px 0;
                font-size: 14px;
                color: #555;
            }

            .search-filter input[type="radio"] {
                display: none;
            }

            .search-filter input[type="radio"] + label {
                position: relative;
                padding-left: 30px;
                cursor: pointer;
            }

            .search-filter input[type="radio"] + label:before {
                content: '';
                display: inline-block;
                width: 20px;
                height: 20px;
                border: 2px solid #007bff;
                border-radius: 50%;
                background: #fff;
                position: absolute;
                left: 0;
                top: 50%;
                transform: translateY(-50%);
            }

            .search-filter input[type="radio"]:checked + label:after {
                content: '';
                display: inline-block;
                width: 12px;
                height: 12px;
                border-radius: 50%;
                background: #007bff;
                position: absolute;
                left: 4px;
                top: 50%;
                transform: translateY(-50%);
            }

            .search-filter input[type="radio"]:checked + label:before {
                border-color: #007bff;
            }

            .property-content {
                position: relative;
            }

            .occupancy {
                position: absolute;
                top: 0;
                right: 0;
                margin-bottom: 10px;
                display: flex;
                align-items: center;
                margin-top: 38px;
                margin-right: 10px;
                background-color: #ffcccc;
            }


            .occupancy .icon-person {
                font-size: 16px;
                color: #ff8080;
            }

            .occupancy .caption {
                font-size: 14px;
                margin-left: 5px;
                color: #555;
            }

            .table-container {
                overflow-x: auto;
                margin-bottom: 20px;
                min-height: 300px;
                display: flex;
                align-items: stretch;
            }

            table {
                width: 100%;
                border-collapse: collapse;
                table-layout: fixed;
            }

            th, td {
                padding: 12px;
                border: 1px solid #ddd;
                text-align: left;
                word-wrap: break-word;
            }

            th {
                background-color: #f8f9fa;
            }

            td {
                background-color: #fff;
            }

            .hidden {
                display: none;
            }

            .chart-container {
                position: relative;
                margin: auto;
                height: 300px;
                width: 100%;
            }
            .stat-box {
                transition: transform 0.3s ease;
            }
            .stat-box:hover {
                transform: translateY(-5px);
                box-shadow: 0 4px 8px rgba(0,0,0,0.1);
            }

            .nav, .nav-tabs {
                display: flex;
                justify-content: center;
                width: 100%;
                margin: 0;
                padding: 0;
            }

        </style>
    </head>
    <body>
       
            <!-- Phần hiển thị danh sách người thuê -->
            <div class="site-mobile-menu site-navbar-target">
                <div class="site-mobile-menu-header">
                    <div class="site-mobile-menu-close">
                        <span class="icofont-close js-menu-toggle"></span>
                    </div>
                </div>
                <div class="site-mobile-menu-body"></div>
            </div>

            <nav class="site-nav">

                <div class="container">
                    <div class="menu-bg-wrap">
                        <div class="site-navigation">
                            <a href="OwnerController?service=OwnerHome" class="logo m-0 float-start">StayNow</a>

                            <jsp:include page = "navbar.jsp"></jsp:include>

                                <a href="#" class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none" data-toggle="collapse" data-target="#main-navbar">
                                    <span></span>
                                </a>

                            </div>
                        </div>
                    </div>
            </div>
        </nav>

        <div class="hero page-inner overlay" style="background-image: url('images/hero_bg_1.jpg');">
            <div class="container">
                <div class="row justify-content-center align-items-center">
                    <div class="col-lg-9 text-center mt-5">
                        <h1 class="heading" data-aos="fade-up">List of Renter</h1>

                        <nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
                            <ol class="breadcrumb text-center justify-content-center">
                                <li class="breadcrumb-item "><a href="OwnerController?service=OwnerHome">Home</a></li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>                        


        <!-- Statistics Section -->
        <div class="container mt-5">
            <div class="row mb-4">
                <div class="col-md-12">
                    <div class="card">
                        <div class="card-header bg-primary text-white">
                            <h4 class="mb-0">Monthly Report</h4>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="chart-container">
                                        <canvas id="revenueChart"></canvas>
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="chart-container">
                                        <canvas id="occupancyChart"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-md-12">
                                    <div class="chart-container" style="height: 300px;">
                                        <canvas id="monthlyRevenueChart"></canvas>
                                    </div>
                                </div>
                            </div>
                            <div class="row mt-4">
                                <div class="col-md-3">
                                    <div class="stat-box text-center p-3 bg-light rounded">
                                        <h5 class="text-primary">Monthly Revenue</h5>
                                        <h3 class="mb-0"><%= String.format("%,.0f", stats.getTotalRevenue()) %> VND</h3>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="stat-box text-center p-3 bg-light rounded">
                                    <h5 class="text-success">Current Occupants</h5>
                                    <h3 class="mb-0"><%= stats.getTotalOccupants() %> people</h3>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="stat-box text-center p-3 bg-light rounded">
                                    <h5 class="text-warning">Occupied Rooms</h5>
                                    <h3 class="mb-0"><%= stats.getOccupiedRooms() %> rooms</h3>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <div class="stat-box text-center p-3 bg-light rounded">
                                    <h5 class="text-danger">Available Rooms</h5>
                                    <h3 class="mb-0"><%= stats.getEmptyRooms() %> rooms</h3>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- End Statistics Section -->

    <!-- Add Chart.js -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <script>
        function filterRoomsByNumber() {
            var input, filter, table, tr, td, i, txtValue;
            input = document.getElementById("searchInput");
            filter = input.value.toUpperCase();
            table = document.getElementById("renterTable");
            tr = table.getElementsByTagName("tr");
            for (i = 1; i < tr.length; i++) {
                td = tr[i].getElementsByTagName("td")[1];
                if (td) {
                    txtValue = td.textContent || td.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        tr[i].classList.remove("hidden");
                    } else {
                        tr[i].classList.add("hidden");
                    }
                }
            }
        }

        // Revenue Chart
        const revenueCtx = document.getElementById('revenueChart').getContext('2d');
        new Chart(revenueCtx, {
            type: 'bar',
            data: {
                labels: ['Revenue'],
                datasets: [{
                        label: 'Monthly Revenue (VND)',
                        data: [<%= stats.getTotalRevenue() %>],
                        backgroundColor: 'rgba(54, 162, 235, 0.5)',
                        borderColor: 'rgba(54, 162, 235, 1)',
                        borderWidth: 1
                    }]
            },
            options: {
                responsive: true,
                plugins: {
                    title: {
                        display: true,
                        text: 'Monthly Revenue Chart'
                    },
                    legend: {
                        display: true,
                        position: 'top'
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            callback: function (value) {
                                return value.toLocaleString('vi-VN') + ' VND';
                            }
                        }
                    }
                }
            }
        });

        // Room Occupancy Chart
        const occupancyCtx = document.getElementById('occupancyChart').getContext('2d');
        new Chart(occupancyCtx, {
            type: 'pie',
            data: {
                labels: ['Occupied Rooms', 'Available Rooms'],
                datasets: [{
                        data: [<%= stats.getOccupiedRooms() %>, <%= stats.getEmptyRooms() %>],
                        backgroundColor: [
                            'rgba(255, 206, 86, 0.5)',
                            'rgba(255, 99, 132, 0.5)'
                        ],
                        borderColor: [
                            'rgba(255, 206, 86, 1)',
                            'rgba(255, 99, 132, 1)'
                        ],
                        borderWidth: 1
                    }]
            },
            options: {
                responsive: true,
                plugins: {
                    title: {
                        display: true,
                        text: 'Room Occupancy Ratio'
                    },
                    legend: {
                        display: true,
                        position: 'top'
                    }
                }
            }
        });

        // Monthly Revenue Line Chart
        const monthlyRevenueCtx = document.getElementById('monthlyRevenueChart').getContext('2d');
        new Chart(monthlyRevenueCtx, {
            type: 'line',
            data: {
                labels: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
                    'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'],
                datasets: [{
                        label: 'Monthly Revenue (VND)',
                        data: [15, 18, 22, 25, 28, 30, 32, 35, 33, 31, 29, 27].map(v => v * 1000000),
                        borderColor: 'rgb(75, 192, 192)',
                        backgroundColor: 'rgba(75, 192, 192, 0.1)',
                        tension: 0.3,
                        fill: true
                    }]
            },
            options: {
                responsive: true,
                maintainAspectRatio: false,
                plugins: {
                    title: {
                        display: true,
                        text: 'Monthly Revenue Trend 2024',
                        font: {
                            size: 16
                        }
                    },
                    legend: {
                        display: true,
                        position: 'top'
                    },
                    tooltip: {
                        callbacks: {
                            label: function (context) {
                                let value = context.raw;
                                return new Intl.NumberFormat('vi-VN', {
                                    style: 'currency',
                                    currency: 'VND'
                                }).format(value);
                            }
                        }
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        ticks: {
                            callback: function (value) {
                                return (value / 1000000).toFixed(1) + 'M VND';
                            }
                        }
                    }
                }
            }
        });
    </script>
    <script src="js/bootstrap.bundle.min.js"></script>
    <script src="js/tiny-slider.js"></script>
    <script src="js/aos.js"></script>
    <script src="js/navbar.js"></script>
    <script src="js/counter.js"></script>
    <script src="js/custom.js"></script>

    <!-- JavaScript Libraries -->
    <script src="lib/jquery/jquery.min.js"></script>
    <script src="lib/jquery/jquery-migrate.min.js"></script>
    <script src="lib/popper/popper.min.js"></script>
    <script src="lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>
    <script src="lib/scrollreveal/scrollreveal.min.js"></script>

    <!-- Template Main Javascript File -->
    <script src="js/main_owner.js"></script>

    <!-- Room Detail Statistics Table with Filter and Pagination -->
    <div class="container mt-5">
        <ul class="nav nav-tabs justify-content-center" id="ownerTab" role="tablist">
            <li class="nav-item" role="presentation">
                <button class="nav-link <%= (request.getParameter("tab") == null || "rooms".equals(request.getParameter("tab"))) ? "active" : "" %>" id="rooms-tab" data-bs-toggle="tab" data-bs-target="#rooms" type="button" role="tab" aria-controls="rooms" aria-selected="true">Room Detail Statistics</button>
            </li>
            <li class="nav-item" role="presentation">
                <button class="nav-link <%= "renters".equals(request.getParameter("tab")) ? "active" : "" %>" id="renters-tab" data-bs-toggle="tab" data-bs-target="#renters" type="button" role="tab" aria-controls="renters" aria-selected="false">List of Renters</button>
            </li>
        </ul>
        <div class="tab-content pt-3" id="ownerTabContent">
            <div class="tab-pane fade <%= (request.getParameter("tab") == null || "rooms".equals(request.getParameter("tab"))) ? "show active" : "" %>" id="rooms" role="tabpanel" aria-labelledby="rooms-tab">
                <!-- Room Detail Statistics Table with Filter and Pagination (filter, bảng phòng) đặt ở tab đầu tiên -->
                <div class="row mt-4">
                    <div class="col-md-12">
                        <div class="card">
                            <div class="card-header bg-info text-white">
                                <h4 class="mb-0">Room Detail Statistics</h4>
                            </div>
                            <div class="card-body">
                                <!-- Filter Form -->
                                <form method="get" action="ListRenterController" class="row g-3 mb-3">
                                    <input type="hidden" name="tab" value="rooms"/>
                                    <div class="col-md-3">
                                        <input type="text" name="searchRoomNumber" class="form-control" placeholder="Search by Room Number" value="<%= request.getAttribute("searchRoomNumber") != null ? request.getAttribute("searchRoomNumber") : "" %>">
                                    </div>
                                    <div class="col-md-2">
                                        <select name="status" class="form-select">
                                            <option value="all" <%= (request.getAttribute("status") == null || "all".equals(request.getAttribute("status"))) ? "selected" : "" %>>All Status</option>
                                            <option value="occupied" <%= "occupied".equals(request.getAttribute("status")) ? "selected" : "" %>>Occupied</option>
                                            <option value="empty" <%= "empty".equals(request.getAttribute("status")) ? "selected" : "" %>>Empty</option>
                                        </select>
                                    </div>
                                    <div class="col-md-2">
                                        <input type="number" name="minPrice" class="form-control" placeholder="Min Price" value="<%= request.getAttribute("minPrice") != null ? request.getAttribute("minPrice") : "" %>">
                                    </div>
                                    <div class="col-md-2">
                                        <input type="number" name="maxPrice" class="form-control" placeholder="Max Price" value="<%= request.getAttribute("maxPrice") != null ? request.getAttribute("maxPrice") : "" %>">
                                    </div>
                                    <div class="col-md-2">
                                        <button type="submit" class="btn btn-primary w-100">Filter</button>
                                    </div>
                                </form>
                                <!-- End Filter Form -->
                                <div class="table-responsive">
                                    <table class="table table-bordered">
                                        <thead>
                                            <tr>
                                                <th>Room Number</th>
                                                <th>Floor</th>
                                                <th>Room Fee</th>
                                                <th>Status</th>
                                                <th>Detail</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <% 
                                                java.util.List<model.Rooms> filteredRooms = (java.util.List<model.Rooms>) request.getAttribute("filteredRooms");
                                                if (filteredRooms == null) {
                                                    dao.RoomDAO roomDAO = new dao.RoomDAO();
                                                    filteredRooms = roomDAO.getRooms();
                                                }
                                                for (model.Rooms room : filteredRooms) { 
                                            %>
                                            <tr>
                                                <td><%= room.getRoomNumber() %></td>
                                                <td><%= room.getRoomFloor() %></td>
                                                <td><%= room.getRoomFee() != null ? String.format("%,.0f", room.getRoomFee()) : "" %> VND</td>
                                                <td>
                                                    <% if(room.getRoomOccupant() > 0) { %>
                                                    <span class="badge bg-success">Occupied</span>
                                                    <% } else { %>
                                                    <span class="badge bg-secondary">Empty</span>
                                                    <% } %>
                                                </td>
                                                <td>
                                                    <a href="OwnerController?service=roomDetail&roomID=<%= room.getRoomID() %>" class="btn btn-primary btn-sm">View Detail</a>
                                                </td>
                                            </tr>
                                            <% } %>
                                        </tbody>
                                    </table>
                                </div>
                                <!-- Pagination -->
                                <nav aria-label="Room pagination">
                                    <ul class="pagination justify-content-center">
                                        <% 
                                            Integer currentPage = (Integer) request.getAttribute("currentPage");
                                            Integer totalPages = (Integer) request.getAttribute("totalPages");
                                            if (currentPage == null) currentPage = 1;
                                            if (totalPages == null) totalPages = 1;
                                            String searchRoomNumber = (String) request.getAttribute("searchRoomNumber");
                                            String status = (String) request.getAttribute("status");
                                            String minPrice = (String) request.getAttribute("minPrice");
                                            String maxPrice = (String) request.getAttribute("maxPrice");
                                            for (int i = 1; i <= totalPages; i++) {
                                        %>
                                        <li class="page-item <%= (i == currentPage) ? "active" : "" %>">
                                            <form method="get" action="ListRenterController" style="display:inline;">
                                                <input type="hidden" name="page" value="<%= i %>"/>
                                                <input type="hidden" name="tab" value="rooms"/>
                                                <input type="hidden" name="searchRoomNumber" value="<%= searchRoomNumber != null ? searchRoomNumber : "" %>"/>
                                                <input type="hidden" name="status" value="<%= status != null ? status : "all" %>"/>
                                                <input type="hidden" name="minPrice" value="<%= minPrice != null ? minPrice : "" %>"/>
                                                <input type="hidden" name="maxPrice" value="<%= maxPrice != null ? maxPrice : "" %>"/>
                                                <button type="submit" class="page-link"><%= i %></button>
                                            </form>
                                        </li>
                                        <% } %>
                                    </ul>
                                </nav>
                                <!-- End Pagination -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="tab-pane fade <%= "renters".equals(request.getParameter("tab")) ? "show active" : "" %>" id="renters" role="tabpanel" aria-labelledby="renters-tab">
                <!-- Danh sách người thuê (giữ nguyên phần hiện tại) -->
                <div class="row" id="roomContainer">
                    <div class="table-container">
                        <table id="renterTable">
                            <thead>
                                <tr>
                                    <th>Renter Name</th>
                                    <th>Room Number</th>
                                    <th>Room Floor</th>
                                    <th>Balance</th>
                                    <th>Room Fee</th>                                               
                                </tr>
                            </thead>
                            <tbody>
                                <% for (model.RenterList renters : (java.util.List<model.RenterList>) request.getAttribute("listRenters")) { %>
                                <tr class="property-content">
                                    <td><a href="ViewRenterProfileController?renterID=<%= renters.getUserID() %>"><%= renters.getUserName() %></a></td>
                                    <td><%= renters.getRoomNumber() %></td>
                                    <td><%= renters.getRoomFloor() %></td>
                                    <td><%= renters.getBalance() %></td>
                                    <td>
                                        <a href="roomfee?roomID=<%= renters.getRoomID() %>">See Detail</a>
                                    </td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
 
</body>
<script src="<%= request.getContextPath() %>/js/chatbot.js"></script>
</html>