<%@page import="dao.RoomDAO,java.util.List"%>
<%@page import="model.RoomDetailSe"%>
<%@ page import="java.util.Base64" %>
<%@ page import="java.text.DecimalFormat" %>

<% RoomDetailSe roomDetail = (RoomDetailSe) request.getAttribute("roomDetail"); %>

<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
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

        <title>Room Detail</title>

        <style>
            .textDetail {
                color: #2e2a2a;
                font-family: "Be Vietnam Pro", sans-serif;
                font-size: 15px;
                line-height: 1.6;
            }

            .room-detail-card {
                background: #f8f9fa;
                border-radius: 12px;
                box-shadow: 0 0 20px rgba(0, 0, 0, 0.08);
                padding: 30px 25px 25px 25px;
                height: 100%;
            }

            .price-tag {
                font-size: 24px;
                font-weight: 600;
                color: #e74c3c;
                background: #fef2f2;
                padding: 10px 20px;
                border-radius: 8px;
                display: inline-block;
                margin-bottom: 20px;
            }

            .section-title {
                color: #34495e;
                font-size: 18px;
                font-weight: 600;
                margin-bottom: 15px;
                padding-bottom: 10px;
                border-bottom: 2px solid #e7e7e7;
            }

            .info-section,
            .amenities-section,
            .contact-section {
                background: white;
                padding: 18px 15px;
                border-radius: 8px;
                margin-bottom: 18px;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.04);
            }

            .info-item {
                padding: 8px 0;
                border-radius: 6px;
                display: flex;
                align-items: center;
            }

            .info-item i {
                margin-right: 10px;
                color: #3498db;
                font-size: 18px;
            }

            .btn-rent {
                background: #2980b9;
                color: white;
                padding: 12px 30px;
                border-radius: 8px;
                border: none;
                font-weight: 600;
                width: 100%;
                transition: all 0.3s ease;
                font-size: 18px;
                margin-top: 10px;
            }

            .btn-rent:hover {
                transform: translateY(-2px);
                box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
                background: #3498db;
            }

            .amenity-item {
                padding: 8px;
                background: #f8f9fa;
                border-radius: 5px;
                margin-bottom: 8px;
                display: flex;
                align-items: center;
                font-size: 15px;
            }

            .amenity-item i {
                color: #27ae60;
                margin-right: 8px;
            }
        </style>
    </head>

    <body>

        <nav class="site-nav">
            <div class="container">
                <div class="menu-bg-wrap">
                    <div class="site-navigation">
                        <a href="#" class="logo m-0 float-start">StayNow</a>

                        <jsp:include page = "navbar.jsp"></jsp:include>

                            <a href="#" class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none" data-toggle="collapse" data-target="#main-navbar">
                                <span></span>
                            </a>
                            </nav>
                            <div class="hero page-inner overlay" style="background-image: url('images/slide-1.jpg');">
                                <div class="container">
                                    <div class="row justify-content-center align-items-center">
                                        <div class="col-lg-9 text-center mt-5">
                                            <h1 class="heading">Room Detail</h1>
                                            <nav aria-label="breadcrumb">
                                                <ol class="breadcrumb text-center justify-content-center">
                                                    <li class="breadcrumb-item"><a href="rentercontroller?service=renterhome">Home</a></li>
                                                </ol>
                                            </nav>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="section">
                                <div class="container">
                                    <div class="row justify-content-between">
                                        <div class="col-lg-7">
                                            <div class="img-property-slide-wrap">
                                                <div class="img-property-slide">
                                                <% String base64Image = roomDetail.getRoomImg(); %>
                                                <img style="margin-top: 50px; width: 100%; max-width: 750px; height: 660px; object-fit: cover; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.08);"
                                                     src="data:image/jpg;base64, <%= base64Image %>" alt="Image" class="img-fluid">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-lg-4">
                                        <div class="room-detail-card">
                                            <h2 class="heading" style="color: #2c3e50; font-weight: 700; margin-bottom: 20px;">
                                                <%= roomDetail.getRoomName()%>
                                            </h2>
                                            <div class="price-tag">
                                                <% DecimalFormat df = new DecimalFormat("#,###");
                               String formattedFee = df.format(roomDetail.getRoomFee() * 1000); %>
                                                <%= formattedFee %> VND/Month
                                            </div>
                                            <div class="info-section">
                                                <h3 class="section-title">Room Information</h3>
                                                <div class="info-item">
                                                    <i class="icon-home2"></i>
                                                    <span class="textDetail">Room Number: <%= roomDetail.getRoomNumber()%></span>
                                                </div>
                                                <div class="info-item">
                                                    <i class="icon-expand"></i>
                                                    <span class="textDetail">Area: 22m�</span>
                                                </div>
                                                <div class="info-item">
                                                    <i class="icon-building"></i>
                                                    <span class="textDetail">Floor: <%= roomDetail.getRoomFloor()%></span>
                                                </div>
                                                <div class="info-item">
                                                    <i class="icon-ruler"></i>
                                                    <span class="textDetail">Size: <%= roomDetail.getRoomSize()%></span>
                                                </div>
                                            </div>
                                            <% String[] itemNames = roomDetail.getItemName(); int[] quantities = roomDetail.getQuantity(); %>
                                            <% if (itemNames != null && quantities != null && itemNames.length > 0 && quantities.length > 0) { %>
                                            <div class="amenities-section">
                                                <h3 class="section-title">Room Amenities</h3>
                                                <% String description = roomDetail.getRoomDescription(); %>
                                                <% if (description != null && !description.trim().isEmpty()) { %>
                                                <p class="textDetail"><%= description %></p>
                                                <% } %>
                                                <div class="amenities-grid" style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 10px;">
                                                    <% for (int i = 0; i < itemNames.length; i++) { %>
                                                    <div class="amenity-item">
                                                        <i class="icon-check"></i>
                                                        <span class="textDetail">
                                                            <%= quantities[i] %> <%= itemNames[i] %>
                                                        </span>
                                                    </div>
                                                    <% } %>
                                                </div>
                                            </div>
                                            <% } %>
                                            <div class="contact-section">
                                                <h3 class="section-title">Location & Contact</h3>
                                                <div class="info-item">
                                                    <i class="icon-location"></i>
                                                    <span class="textDetail"><%= roomDetail.getAddress()%></span>
                                                </div>
                                                <div class="info-item">
                                                    <i class="icon-phone"></i>
                                                    <span class="textDetail"><%= roomDetail.getPhone()%></span>
                                                </div>
                                                <% String address=roomDetail.getAddress(); %>
                                                <% if (address !=null && !address.trim().isEmpty()) { %>
                                                <div style="margin-top:15px; border-radius:10px; overflow:hidden;">
                                                    <iframe width="100%" height="220"
                                                            style="border-radius:10px; border:none;"
                                                            src="https://www.google.com/maps?q=<%= java.net.URLEncoder.encode(address, "UTF-8") %>&output=embed" allowfullscreen loading="lazy"></iframe>
                                                </div>
                                                <% } %>
                                            </div>
                                            <div class="action-buttons" style="text-align: center; margin-top: 20px;">
                                                <a class="btn-rent" href="RenterRoomController?service=rentRoom&roomID=<%= roomDetail.getRoomID()%>">
                                                    <i class="icon-key" style="margin-right: 8px;"></i>Rent Now
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <jsp:include page="footer.jsp"></jsp:include>

                            <script src="js/bootstrap.bundle.min.js"></script>
                            <script src="js/tiny-slider.js"></script>
                            <script src="js/aos.js"></script>
                            <script src="js/navbar.js"></script>
                            <script src="js/counter.js"></script>
                            <script src="js/custom.js"></script>
                            <script src="<%= request.getContextPath() %>/js/chatbot.js"></script>
                        </body>
                        </html>
