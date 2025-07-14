<%@page import="dao.RoomDAO,java.util.List" %>
    <%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
        <%@page import="model.Rooms" %>
            <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
                <% List<Rooms> listRoomVip1 = (List<Rooms>) request.getAttribute("listRoomVip1"); %>
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
                            <link
                                href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap"
                                rel="stylesheet">
                            <link href='https://api.mapbox.com/mapbox-gl-js/v2.6.1/mapbox-gl.css' rel='stylesheet' />

                            <link rel="stylesheet" href="fonts/icomoon/style.css">
                            <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
                            <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css"
                                rel="stylesheet">
                            <link rel="stylesheet" href="css/tiny-slider.css">
                            <link rel="stylesheet" href="css/aos.css">
                            <link rel="stylesheet" href="css/style.css">

                            <title>HoLa Motel</title>
                            <style>
                                /* Tiêu đề danh sách */
                                .vip-1-title::after,
                                .vip-2-title::after,
                                .vip-3-title::after {
                                    content: "";
                                    display: block;
                                    width: 60px;
                                    height: 3px;
                                    margin-top: 6px;
                                    border-radius: 2px;
                                }

                                .vip-1-title::after {
                                    background-color: #d35400;
                                }

                                .vip-2-title::after {
                                    background-color: #3498db;
                                }

                                .vip-3-title::after {
                                    background-color: #27ae60;
                                }

                                /* Card Vip 1 nổi bật */
                                .property-card.vip-1 {
                                    background: linear-gradient(135deg, #fffbe6 60%, #ffe0b2 100%);
                                    border: 2.5px solid #f5c06b;
                                    box-shadow: 0 4px 24px #f5c06b40, 0 1.5px 0 #fff8e1;
                                    border-radius: 18px;
                                    position: relative;
                                    overflow: hidden;
                                    transition: box-shadow 0.3s, transform 0.2s;
                                }

                                .property-card.vip-1:hover {
                                    box-shadow: 0 8px 32px 0 #f5c06b80, 0 2px 0 #fff8e1;
                                    transform: translateY(-6px) scale(1.025);
                                }

                                .property-card.vip-1 .room-img {
                                    border-radius: 14px;
                                    border: 2px solid #ffe0b2;
                                    box-shadow: 0 2px 12px #f5c06b30;
                                }

                                .property-card .btn {
                                    font-weight: 600;
                                    border-radius: 24px;
                                    font-size: 1.05em;
                                    padding: 8px 0;
                                    margin-top: 8px;
                                    transition: background 0.2s, color 0.2s, box-shadow 0.2s, transform 0.2s;
                                }

                                .property-card .btn:hover {
                                    background: #d35400;
                                    color: #fff;
                                    box-shadow: 0 2px 8px #d3540080;
                                    transform: translateY(-2px) scale(1.03);
                                }

                                .room-img {
                                    height: 260px;
                                    width: 100%;
                                    object-fit: cover;
                                    display: block;
                                }

                                /* Badge VIP 1 với vương miện */
                                .vip-badge {
                                    display: inline-flex;
                                    align-items: center;
                                    background: linear-gradient(90deg, #ffb347, #ffcc33);
                                    color: #fff;
                                    font-weight: bold;
                                    padding: 4px 16px 4px 10px;
                                    border-radius: 16px;
                                    font-size: 1em;
                                    margin-bottom: 6px;
                                    margin-right: 6px;
                                    box-shadow: 0 2px 8px #f5c06b80;
                                    letter-spacing: 1px;
                                    position: absolute;
                                    top: 16px;
                                    left: 16px;
                                    z-index: 2;
                                    font-family: 'Work Sans', sans-serif;
                                }

                                .vip-badge .crown {
                                    font-size: 1.2em;
                                    margin-right: 6px;
                                }

                                /* Giá phòng nhấp nháy nổi bật */
                                .blink-price {
                                    animation: blinkPrice 1.1s linear infinite;
                                    background: #fff6e0;
                                    border-radius: 8px;
                                    padding: 2px 10px;
                                    box-shadow: 0 0 8px #ffb34780;
                                    font-size: 1.15em;
                                }

                                @keyframes blinkPrice {

                                    0%,
                                    100% {
                                        opacity: 1;
                                    }

                                    50% {
                                        opacity: 0.45;
                                    }
                                }

                                /* Thông tin chủ phòng */
                                .owner-info {
                                    color: #b35400;
                                    font-weight: 500;
                                    font-size: 1em;
                                    margin-bottom: 2px;
                                }

                                /* Responsive chỉnh lại padding */
                                @media (max-width: 991px) {
                                    .property-card.vip-1 {
                                        margin-bottom: 18px;
                                    }
                                }

                                /* Card Vip 2 nổi bật */
                                .property-card.vip-2 {
                                    background: linear-gradient(135deg, #f7faff 60%, #e3f0ff 100%);
                                    border: 2.5px solid #3498db;
                                    box-shadow: 0 4px 24px #3498db30, 0 1.5px 0 #e3f2fd;
                                    border-radius: 18px;
                                    position: relative;
                                    overflow: hidden;
                                    transition: box-shadow 0.3s, transform 0.2s;
                                }

                                .property-card.vip-2:hover {
                                    box-shadow: 0 8px 32px 0 #3498db60, 0 2px 0 #e3f2fd;
                                    transform: translateY(-6px) scale(1.025);
                                }

                                .property-card.vip-2 .room-img {
                                    border-radius: 14px;
                                    border: 2px solid #b0d4f1;
                                    box-shadow: 0 2px 12px #b0d4f130;
                                }

                                .vip-badge.vip-2 {
                                    display: inline-flex;
                                    align-items: center;
                                    background: linear-gradient(90deg, #4fc3f7, #1976d2);
                                    color: #fff;
                                    font-weight: bold;
                                    padding: 4px 16px 4px 10px;
                                    border-radius: 16px;
                                    font-size: 1em;
                                    margin-bottom: 6px;
                                    margin-right: 6px;
                                    box-shadow: 0 2px 8px #4fc3f780;
                                    letter-spacing: 1px;
                                    position: absolute;
                                    top: 16px;
                                    left: 16px;
                                    z-index: 2;
                                    font-family: 'Work Sans', sans-serif;
                                }

                                .vip-badge.vip-2 .star {
                                    font-size: 1.2em;
                                    margin-right: 6px;
                                }

                                .price.vip-2 {
                                    font-weight: bold;
                                    color: #1976d2;
                                    background: #e3f2fd;
                                    border-radius: 8px;
                                    padding: 2px 10px;
                                    font-size: 1.15em;
                                    margin-bottom: 6px;
                                    display: inline-block;
                                }

                                /* Card Vip 3 nổi bật */
                                .property-card.vip-3 {
                                    background: linear-gradient(135deg, #f8fff8 60%, #e0ffe8 100%);
                                    border: 2.5px solid #27ae60;
                                    box-shadow: 0 4px 24px #27ae6030, 0 1.5px 0 #e8f5e9;
                                    border-radius: 18px;
                                    position: relative;
                                    overflow: hidden;
                                    transition: box-shadow 0.3s, transform 0.2s;
                                }

                                .property-card.vip-3:hover {
                                    box-shadow: 0 8px 32px 0 #27ae6060, 0 2px 0 #e8f5e9;
                                    transform: translateY(-6px) scale(1.025);
                                }

                                .property-card.vip-3 .room-img {
                                    border-radius: 14px;
                                    border: 2px solid #d1e7dd;
                                    box-shadow: 0 2px 12px #27ae6030;
                                }

                                .vip-badge.vip-3 {
                                    display: inline-flex;
                                    align-items: center;
                                    background: linear-gradient(90deg, #43e97b, #38f9d7);
                                    color: #fff;
                                    font-weight: bold;
                                    padding: 4px 16px 4px 10px;
                                    border-radius: 16px;
                                    font-size: 1em;
                                    margin-bottom: 6px;
                                    margin-right: 6px;
                                    box-shadow: 0 2px 8px #43e97b80;
                                    letter-spacing: 1px;
                                    position: absolute;
                                    top: 16px;
                                    left: 16px;
                                    z-index: 2;
                                    font-family: 'Work Sans', sans-serif;
                                }

                                .vip-badge.vip-3 .leaf {
                                    font-size: 1.2em;
                                    margin-right: 6px;
                                }

                                .price.vip-3 {
                                    font-weight: bold;
                                    color: #27ae60;
                                    background: #e8f5e9;
                                    border-radius: 8px;
                                    padding: 2px 10px;
                                    font-size: 1.15em;
                                    margin-bottom: 6px;
                                    display: inline-block;
                                }

                                @media (min-width: 992px) {
                                    .vip-row-5 {
                                        display: flex;
                                        flex-wrap: wrap;
                                        margin-left: -8px;
                                        margin-right: -8px;
                                    }

                                    .vip-col-5 {
                                        flex: 0 0 20%;
                                        max-width: 20%;
                                        padding-left: 8px;
                                        padding-right: 8px;
                                        margin-bottom: 24px;
                                        display: flex;
                                    }
                                }

                                @media (max-width: 991.98px) {
                                    .vip-col-5 {
                                        flex: 0 0 50%;
                                        max-width: 50%;
                                    }
                                }

                                @media (max-width: 767.98px) {
                                    .vip-col-5 {
                                        flex: 0 0 100%;
                                        max-width: 100%;
                                    }
                                }

                                .property-card.vip-2,
                                .property-card.vip-3 {
                                    min-width: 0;
                                    width: 100%;
                                    min-height: 420px;
                                    padding-bottom: 12px;
                                }
                            </style>

                        </head>

                        <body>

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
                                            <a href="GuestController?service=GuestHome"
                                                class="logo m-0 float-start">StayNow</a>

                                            <jsp:include page="navbar.jsp"></jsp:include>

                                            <a href="#"
                                                class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none"
                                                data-toggle="collapse" data-target="#main-navbar">
                                                <span></span>
                                            </a>

                                        </div>
                                    </div>
                                </div>
                            </nav>

                            <div class="hero">
                                <div class="hero-slide">
                                    <c:forEach var="s" items="${slider}">
                                        <div class="img overlay"
                                            style="background-image: url('data:image/jpeg;base64,${s.sliderImg}')">
                                        </div>
                                    </c:forEach>
                                </div>
                                <div class="container">
                                    <div class="row justify-content-center align-items-center">
                                        <div class="col-lg-9 text-center">
                                            <h1 class="heading" data-aos="fade-up">StayNow - The Apartment For
                                                college student</h1>

                                            </form>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="section">
                                <div class="container">
                                    <div class="row mb-5 align-items-center">
                                        <div class="col-lg-12 text-lg-end">
                                            <p><a href="GuestController?service=ListRoom&index=1"
                                                    class="btn btn-primary text-white py-3 px-4">View list rooms</a></p>
                                        </div>
                                    </div>
                                    <!-- VIP loại 1 -->
                                    <h3 class="mb-4 vip-1-title">Danh sách phòng VIP loại 1</h3>
                                    <div class="row">
                                        <% for (int i=0; i < listRoomVip1.size(); i++) { %>
                                            <div class="col-md-3 col-lg-3 mb-4">
                                                <div
                                                    class="property-card vip-1 h-100 shadow-sm rounded-3 p-3 border position-relative">
                                                    <span class="vip-badge"><span class="crown">👑</span>VIP 1</span>
                                                    <a
                                                        href="GuestController?service=roomDetail&roomID=<%= listRoomVip1.get(i).getRoomID() %>">
                                                        <% String base64Image=listRoomVip1.get(i).getRoomImg(); %>
                                                            <img src="data:image/jpg;base64,<%= base64Image %>"
                                                                class="room-img img-fluid d-block mx-auto rounded-2"
                                                                alt="Room image">
                                                    </a>
                                                    <div class="property-content mt-2">
                                                        <div class="blink-price price fw-bold text-danger mb-1">
                                                            <%= listRoomVip1.get(i).getRoomFee().longValue() %>k VND –
                                                                <%= listRoomVip1.get(i).getVip().getVipName() %>
                                                        </div>
                                                        <div class="text-muted small mb-1">
                                                            <%= listRoomVip1.get(i).getUserAddress() %>
                                                        </div>
                                                        <div class="owner-info mb-1">
                                                            Phone: <%= listRoomVip1.get(i).getUserPhone() %>
                                                        </div>
                                                        <div class="fw-semibold">Room <%=
                                                                listRoomVip1.get(i).getRoomNumber() %>
                                                        </div>
                                                        <div class="specs d-flex my-3 text-secondary">
                                                            <span class="me-2"><i class="bi bi-bed me-1"></i>
                                                                <%= listRoomVip1.get(i).getRoomSize() %> beds
                                                            </span>
                                                            <span class="me-2"><i class="bi bi-building me-1"></i>
                                                                <%= listRoomVip1.get(i).getRoomFloor() %> Floor
                                                            </span>
                                                            <a href="https://zalo.me/<%= listRoomVip1.get(i).getUserPhone() %>"
                                                                target="_blank" class="text-decoration-none">
                                                                <img src="${pageContext.request.contextPath}/image_new/zalo-icon.jpg"
                                                                    alt="Zalo"
                                                                    style="width: 18px; height: 18px; margin-right: 6px;">
                                                            </a>
                                                            <a href="<%= listRoomVip1.get(i).getFacebook() %>"
                                                                target="_blank" class="text-decoration-none">
                                                                <img src="${pageContext.request.contextPath}/image_new/facebook-icon.png"
                                                                    alt="Facebook"
                                                                    style="width: 18px; height: 18px; margin-right: 6px;">
                                                            </a>
                                                        </div>
                                                        <a href="GuestController?service=roomDetail&roomID=<%= listRoomVip1.get(i).getRoomID() %>"
                                                            class="btn btn-outline-primary w-100 rounded-pill">See
                                                            details</a>
                                                    </div>
                                                </div>
                                            </div>
                                            <% } %>
                                    </div>


                                    <!-- VIP loại 2 -->
                                    <h3 class="mb-4 vip-2-title mt-5">Danh sách phòng VIP loại 2</h3>
                                    <div class="vip-row-5">
                                        <% List<Rooms> listRoomVip2 = (List<Rooms>)
                                                request.getAttribute("listRoomVip2");
                                                for (int i = 0; i < listRoomVip2.size(); i++) { %>
                                                    <div class="vip-col-5">
                                                        <div
                                                            class="property-card vip-2 h-100 shadow-sm rounded-3 p-3 border position-relative w-100">
                                                            <span class="vip-badge vip-2"><span class="star">⭐</span>VIP
                                                                2</span>
                                                            <a
                                                                href="GuestController?service=roomDetail&roomID=<%= listRoomVip2.get(i).getRoomID() %>">
                                                                <% String base64Image=listRoomVip2.get(i).getRoomImg();
                                                                    %>
                                                                    <img src="data:image/jpg;base64,<%= base64Image %>"
                                                                        class="room-img img-fluid d-block mx-auto rounded-2"
                                                                        alt="Room image">
                                                            </a>
                                                            <div class="property-content mt-2">
                                                                <div class="price vip-2 mb-1">
                                                                    <%= listRoomVip2.get(i).getRoomFee().longValue() %>k
                                                                        VND –
                                                                        <%= listRoomVip2.get(i).getVip().getVipName() %>
                                                                </div>
                                                                <div class="text-muted small mb-1">Thôn 3, Tân Xã, Thạch
                                                                    Thất</div>
                                                                <div class="owner-info mb-1">
                                                                    Phone: <%= listRoomVip2.get(i).getUserPhone() %>
                                                                </div>
                                                                <div class="fw-semibold">Room <%=
                                                                        listRoomVip2.get(i).getRoomNumber() %>
                                                                </div>
                                                                <div class="specs d-flex my-3 text-secondary">
                                                                    <span class="me-4"><i class="bi bi-bed me-1"></i>
                                                                        <%= listRoomVip2.get(i).getRoomSize() %> beds
                                                                    </span>
                                                                    <span><i class="bi bi-building me-1"></i>
                                                                        <%= listRoomVip2.get(i).getRoomFloor() %> Floor
                                                                    </span>
                                                                </div>
                                                                <a href="GuestController?service=roomDetail&roomID=<%= listRoomVip2.get(i).getRoomID() %>"
                                                                    class="btn btn-outline-primary w-100 rounded-pill">See
                                                                    details</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <% } %>
                                    </div>

                                    <h3 class="mb-4 vip-3-title mt-5">Danh sách phòng VIP loại 3</h3>
                                    <div class="vip-row-5">
                                        <% List<Rooms> listRoomVip3 = (List<Rooms>)
                                                request.getAttribute("listRoomVip3");
                                                for (int i = 0; i < listRoomVip3.size(); i++) { %>
                                                    <div class="vip-col-5">
                                                        <div
                                                            class="property-card vip-3 h-100 shadow-sm rounded-3 p-3 border position-relative w-100">
                                                            <span class="vip-badge vip-3"><span
                                                                    class="leaf">🍃</span>VIP 3</span>
                                                            <a
                                                                href="GuestController?service=roomDetail&roomID=<%= listRoomVip3.get(i).getRoomID() %>">
                                                                <% String base64Image=listRoomVip3.get(i).getRoomImg();
                                                                    %>
                                                                    <img src="data:image/jpg;base64,<%= base64Image %>"
                                                                        class="room-img img-fluid d-block mx-auto rounded-2"
                                                                        alt="Room image">
                                                            </a>
                                                            <div class="property-content mt-2">
                                                                <div class="price vip-3 mb-1">
                                                                    <%= listRoomVip3.get(i).getRoomFee().longValue() %>k
                                                                        VND –
                                                                        <%= listRoomVip3.get(i).getVip().getVipName() %>
                                                                </div>
                                                                <div class="text-muted small mb-1">Thôn 3, Tân Xã, Thạch
                                                                    Thất</div>
                                                                <div class="owner-info mb-1">
                                                                    Phone: <%= listRoomVip3.get(i).getUserPhone() %>
                                                                </div>
                                                                <div class="fw-semibold">Room <%=
                                                                        listRoomVip3.get(i).getRoomNumber() %>
                                                                </div>
                                                                <div class="specs d-flex my-3 text-secondary">
                                                                    <span class="me-4"><i class="bi bi-bed me-1"></i>
                                                                        <%= listRoomVip3.get(i).getRoomSize() %> beds
                                                                    </span>
                                                                    <span><i class="bi bi-building me-1"></i>
                                                                        <%= listRoomVip3.get(i).getRoomFloor() %> Floor
                                                                    </span>
                                                                </div>
                                                                <a href="GuestController?service=roomDetail&roomID=<%= listRoomVip3.get(i).getRoomID() %>"
                                                                    class="btn btn-outline-success w-100 rounded-pill">See
                                                                    details</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <% } %>
                                    </div>

                                </div>

                                <div class="site-footer">
                                    <div class="container">

                                        <div class="row">
                                            <div class="col-lg-4">
                                                <div class="widget">
                                                    <h3>Contact</h3>
                                                    <address>Thon 3 Thach Hoa Thach That Ha Noi</address>
                                                    <ul class="list-unstyled links">
                                                        <li><a href="tel://11234567890">+1(123)-456-7890</a></li>
                                                        <li><a href="tel://11234567890">+1(123)-456-7890</a></li>
                                                        <li><a href="mailto:info@mydomain.com">info@mydomain.com</a>
                                                        </li>
                                                    </ul>
                                                </div> <!-- /.widget -->
                                            </div> <!-- /.col-lg-4 -->
                                            <div class="col-lg-4">
                                                <div class="widget">
                                                    <h3>Sources</h3>
                                                    <ul class="list-unstyled float-start links">
                                                        <li><a href="#">About us</a></li>
                                                        <li><a href="#">Services</a></li>
                                                        <li><a href="#">Vision</a></li>
                                                        <li><a href="#">Mission</a></li>
                                                        <li><a href="#">Terms</a></li>
                                                        <li><a href="#">Privacy</a></li>
                                                    </ul>
                                                    <ul class="list-unstyled float-start links">
                                                        <li><a href="#">Partners</a></li>
                                                        <li><a href="#">Business</a></li>
                                                        <li><a href="#">Careers</a></li>
                                                        <li><a href="#">Blog</a></li>
                                                        <li><a href="#">FAQ</a></li>
                                                        <li><a href="#">Creative</a></li>
                                                    </ul>
                                                </div> <!-- /.widget -->
                                            </div> <!-- /.col-lg-4 -->
                                            <div class="col-lg-4">
                                                <div class="widget">
                                                    <h3>Links</h3>
                                                    <ul class="list-unstyled links">
                                                        <li><a href="#">Our Vision</a></li>
                                                        <li><a href="#">About us</a></li>
                                                        <li><a href="#">Contact us</a></li>
                                                    </ul>
                                                    <ul class="list-unstyled social">
                                                        <li><a href="#"><span class="icon-instagram"></span></a></li>
                                                        <li><a href="#"><span class="icon-twitter"></span></a></li>
                                                        <li><a href="#"><span class="icon-facebook"></span></a></li>
                                                        <li><a href="#"><span class="icon-linkedin"></span></a></li>
                                                        <li><a href="#"><span class="icon-pinterest"></span></a></li>
                                                        <li><a href="#"><span class="icon-dribbble"></span></a></li>
                                                    </ul>
                                                </div> <!-- /.widget -->
                                            </div> <!-- /.col-lg-4 -->
                                        </div> <!-- /.row -->

                                        <div class="row mt-5">
                                            <div class="col-12 text-center">

                                                <p>Copyright &copy;
                                                    <script>document.write(new Date().getFullYear());</script>. All
                                                    Rights
                                                    Reserved. &mdash; Designed with love by <a
                                                        href="https://untree.co">Untree.co</a>
                                                    <!-- License information: https://untree.co/license/ -->
                                                </p>

                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div id="overlayer"></div>
                                <div class="loader">
                                    <div class="spinner-border" role="status">
                                        <span class="visually-hidden">Loading...</span>
                                    </div>
                                </div>

                                <script src="js/bootstrap.bundle.min.js"></script>
                                <script src="js/tiny-slider.js"></script>
                                <script src="js/aos.js"></script>
                                <script src="js/navbar.js"></script>
                                <script src="js/counter.js"></script>
                                <script src="js/custom.js"></script>
                                <script src="<%= request.getContextPath() %>/js/chatbot.js"></script>
                        </body>

                        </html>