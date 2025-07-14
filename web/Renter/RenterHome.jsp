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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
        <link rel="stylesheet" href="css/tiny-slider.css">
        <link rel="stylesheet" href="css/aos.css">
        <link rel="stylesheet" href="css/style.css">

        <title>HoLa StayNow</title>

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

            /* Cấu trúc card */
            .property-card {
                transition: box-shadow 0.3s ease;
            }
            .property-card:hover {
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
            }
            .property-card img {
                transition: transform 0.3s ease;
            }
            .property-card:hover img {
                transform: scale(1.02);
            }

            /* Màu sắc theo từng VIP */
            .property-card.vip-1 {
                background: #fffdf8;
                border-color: #f5c06b;
            }
            .property-card.vip-2 {
                background: #f7f9fb;
                border-color: #b0d4f1;
            }
            .property-card.vip-3 {
                background: #f8f8f8;
                border-color: #d1e7dd;
            }

            /* Nút xem chi tiết */
            .property-card .btn {
                font-weight: 500;
                transition: all 0.2s ease;
            }
            .property-card .btn:hover {
                transform: translateY(-2px);
            }
            .room-img {
                height: 260px;
                width: 100%;
                object-fit: cover;
                border-radius: 12px;
                display: block;
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
                           class="logo m-0 float-start">HL-Apartment</a>

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
                         style="background-image: url('data:image/jpeg;base64,${s.sliderImg}')"></div>
                </c:forEach>
            </div>
            <div class="container">
                <div class="row justify-content-center align-items-center">
                    <div class="col-lg-9 text-center">
                        <h1 class="heading" data-aos="fade-up">Hoa Lac Apartment - The Apartment For
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
                    <% for (int i = 0; i < listRoomVip1.size(); i++) { %>
                    <div class="col-md-6 col-lg-6 mb-4">
                        <div class="property-card vip-1 h-100 shadow-sm rounded-3 p-3 border">
                            <a href="RenterRoomController?service=roomDetail&roomID=<%= listRoomVip1.get(i).getRoomID() %>">
                                <% String base64Image = listRoomVip1.get(i).getRoomImg(); %>
                                <img src="data:image/jpg;base64,<%= base64Image %>"
                                     class="room-img img-fluid d-block mx-auto rounded-2"
                                     alt="Room image">
                            </a>
                            <div class="property-content">
                                <div class="price fw-bold text-danger mb-1"><%= listRoomVip1.get(i).getRoomFee().longValue() %>k VND – <%= listRoomVip1.get(i).getVip().getVipName() %></div>
                                <div class="text-muted small mb-1"><%= listRoomVip1.get(i).getUserAddress() %></div>
                                <div class="fw-semibold">Room <%= listRoomVip1.get(i).getRoomNumber() %></div>
                                <div class="specs d-flex my-3 text-secondary">
                                    <span class="me-2"><i class="bi bi-bed me-1"></i><%= listRoomVip1.get(i).getRoomSize() %> beds</span>
                                    <span class="me-2"><i class="bi bi-building me-1"></i><%= listRoomVip1.get(i).getRoomFloor() %> Floor</span>
                                    <a href="https://zalo.me/<%= listRoomVip1.get(i).getUserPhone() %>" target="_blank" class="text-decoration-none">
                                        <img src="${pageContext.request.contextPath}/image_new/zalo-icon.jpg" alt="Zalo" style="width: 18px; height: 18px; margin-right: 6px;">
                                    </a>
                                    <a href="<%= listRoomVip1.get(i).getFacebook() %>" target="_blank" class="text-decoration-none">
                                        <img src="${pageContext.request.contextPath}/image_new/facebook-icon.png" alt="Zalo" style="width: 18px; height: 18px; margin-right: 6px;">
                                    </a>
                                </div>
                                <a href="RenterRoomController?service=roomDetail&roomID=<%= listRoomVip1.get(i).getRoomID() %>" class="btn btn-outline-primary w-100 rounded-pill">See details</a>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>


                <!-- VIP loại 2 -->
                <h3 class="mb-4 vip-2-title mt-5">Danh sách phòng VIP loại 2</h3>
                <div class="row">
                    <% List<Rooms> listRoomVip2 = (List<Rooms>) request.getAttribute("listRoomVip2");
     for (int i = 0; i < listRoomVip2.size(); i++) { %>
                    <div class="col-md-4 col-lg-4 mb-4">
                        <div class="property-card vip-2 h-100 shadow-sm rounded-3 p-3 border">
                            <a href="RenterRoomController?service=roomDetail&roomID=<%= listRoomVip2.get(i).getRoomID() %>">
                                <% String base64Image = listRoomVip2.get(i).getRoomImg(); %>
                                <img src="data:image/jpg;base64,<%= base64Image %>"
                                     class="room-img img-fluid d-block mx-auto rounded-2"
                                     alt="Room image">
                            </a>
                            <div class="property-content">
                                <div class="price fw-bold text-primary mb-1"><%= listRoomVip2.get(i).getRoomFee().longValue() %>k VND – <%= listRoomVip2.get(i).getVip().getVipName() %></div>
                                <div class="text-muted small mb-1">Thôn 3, Tân Xã, Thạch Thất</div>
                                <div class="fw-semibold">Room <%= listRoomVip2.get(i).getRoomNumber() %></div>
                                <div class="specs d-flex my-3 text-secondary">
                                    <span class="me-4"><i class="bi bi-bed me-1"></i><%= listRoomVip2.get(i).getRoomSize() %> beds</span>
                                    <span><i class="bi bi-building me-1"></i><%= listRoomVip2.get(i).getRoomFloor() %> Floor</span>
                                </div>
                                <a href="RenterRoomController?service=roomDetail&roomID=<%= listRoomVip2.get(i).getRoomID() %>" class="btn btn-outline-primary w-100 rounded-pill">See details</a>
                            </div>
                        </div>
                    </div>
                    <% } %>
                </div>

                <h3 class="mb-4 vip-3-title mt-5">Danh sách phòng VIP loại 3</h3>
                <div class="row">
                    <% List<Rooms> listRoomVip3 = (List<Rooms>) request.getAttribute("listRoomVip3");
     for (int i = 0; i < listRoomVip3.size(); i++) { %>
                    <div class="col-md-3 col-lg-3 mb-4">
                        <div class="property-card vip-3 h-100 shadow-sm rounded-3 p-3 border">
                            <a href="RenterRoomController?service=roomDetail&roomID=<%= listRoomVip3.get(i).getRoomID() %>">
                                <% String base64Image = listRoomVip3.get(i).getRoomImg(); %>
                                <img src="data:image/jpg;base64,<%= base64Image %>"
                                     class="room-img img-fluid d-block mx-auto rounded-2"
                                     alt="Room image">
                            </a>
                            <div class="property-content">
                                <div class="price fw-bold text-success mb-1"><%= listRoomVip3.get(i).getRoomFee().longValue() %>k VND – <%= listRoomVip3.get(i).getVip().getVipName() %></div>
                                <div class="text-muted small mb-1">Thôn 3, Tân Xã, Thạch Thất</div>
                                <div class="fw-semibold">Room <%= listRoomVip3.get(i).getRoomNumber() %></div>
                                <div class="specs d-flex my-3 text-secondary">
                                    <span class="me-4"><i class="bi bi-bed me-1"></i><%= listRoomVip3.get(i).getRoomSize() %> beds</span>
                                    <span><i class="bi bi-building me-1"></i><%= listRoomVip3.get(i).getRoomFloor() %> Floor</span>
                                </div>
                                <a href="RenterRoomController?service=roomDetail&roomID=<%= listRoomVip3.get(i).getRoomID() %>" class="btn btn-outline-success w-100 rounded-pill">See details</a>
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
                                    <li><a href="mailto:info@mydomain.com">info@mydomain.com</a></li>
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
                                <script>document.write(new Date().getFullYear());</script>. All Rights
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