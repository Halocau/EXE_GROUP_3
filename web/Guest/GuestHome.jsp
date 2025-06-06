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

        <link rel="stylesheet" href="css/tiny-slider.css">
        <link rel="stylesheet" href="css/aos.css">
        <link rel="stylesheet" href="css/style.css">

        <title>HoLa Motel</title>
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
                <h3 class="mb-4">Danh sách phòng VIP loại 1</h3>
                <div class="row">
                    <div class="col-12">
                        <% for (int i=0; i < listRoomVip1.size(); i++) { %>
                        <div class="property-item mb-5 border rounded p-3">
                            <a href="OwnerController?service=roomDetail&roomID=<%= listRoomVip1.get(i).getRoomID() %>"
                               class="img d-block mb-3">
                                <% String base64Image=listRoomVip1.get(i).getRoomImg(); %>
                                <img src="data:image/jpg;base64,<%= base64Image %>"
                                     class="img-fluid"
                                     style="height: 350px; width: 100%; object-fit: cover;">
                            </a>

                            <div class="property-content">
                                <div class="price mb-2">
                                    <span>
                                        <%= listRoomVip1.get(i).getRoomFee().longValue() %>k VND
                                    </span>
                                    <span>– <%= listRoomVip1.get(i).getVip().getVipName() %></span>
                                </div>
                                <div>
                                    <span class="d-block mb-2 text-black-50">Thôn 3, Tân Xã, Thạch
                                        Thất</span>
                                    <span class="city d-block mb-3">Room <%=
                                                                listRoomVip1.get(i).getRoomNumber() %></span>
                                    <div class="specs d-flex mb-4">
                                        <span class="d-block d-flex align-items-center me-3">
                                            <span class="icon-bed me-2"></span>
                                            <span class="caption">
                                                <%= listRoomVip1.get(i).getRoomSize() %> beds
                                            </span>
                                        </span>
                                        <span class="d-block d-flex align-items-center">
                                            <span class="icon-bath me-2"></span>
                                            <span class="caption">
                                                <%= listRoomVip1.get(i).getRoomFloor() %> Floor
                                            </span>
                                        </span>
                                    </div>
                                    <a href="GuestController?service=roomDetail&roomID=<%= listRoomVip1.get(i).getRoomID() %>"
                                       class="btn btn-primary py-2 px-3">See details</a>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div>

                <!-- VIP loại 2 -->
                <h3 class="mb-4 mt-5">Danh sách phòng VIP loại 2</h3>
                <div class="row">
                    <div class="col-12">
                        <% List<Rooms> listRoomVip2 = (List<Rooms>)
                                request.getAttribute("listRoomVip2");
                                for (int i = 0; i < listRoomVip2.size(); i++) { %>
                        <div class="property-item mb-5 border rounded p-3">
                            <a href="OwnerController?service=roomDetail&roomID=<%= listRoomVip2.get(i).getRoomID() %>"
                               class="img d-block mb-3">
                                <% String base64Image=listRoomVip2.get(i).getRoomImg(); %>
                                <img src="data:image/jpg;base64,<%= base64Image %>"
                                     class="img-fluid"
                                     style="height: 350px; width: 100%; object-fit: cover;">
                            </a>
                            <div class="property-content">
                                <div class="price mb-2">
                                    <span>
                                        <%= listRoomVip2.get(i).getRoomFee().longValue() %>k
                                        VND
                                    </span>
                                    <span>– <%= listRoomVip2.get(i).getVip().getVipName() %>
                                    </span>
                                </div>
                                <div>
                                    <span class="d-block mb-2 text-black-50">Thôn 3, Tân Xã,
                                        Thạch Thất</span>
                                    <span class="city d-block mb-3">Room <%=
                                                                        listRoomVip2.get(i).getRoomNumber() %></span>
                                    <div class="specs d-flex mb-4">
                                        <span
                                            class="d-block d-flex align-items-center me-3">
                                            <span class="icon-bed me-2"></span>
                                            <span class="caption">
                                                <%= listRoomVip2.get(i).getRoomSize() %>
                                                beds
                                            </span>
                                        </span>
                                        <span class="d-block d-flex align-items-center">
                                            <span class="icon-bath me-2"></span>
                                            <span class="caption">
                                                <%= listRoomVip2.get(i).getRoomFloor() %>
                                                Floor
                                            </span>
                                        </span>
                                    </div>
                                    <a href="GuestController?service=roomDetail&roomID=<%= listRoomVip2.get(i).getRoomID() %>"
                                       class="btn btn-primary py-2 px-3">See details</a>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div>

                <!-- VIP loại 3 -->
                <h3 class="mb-4 mt-5">Danh sách phòng VIP loại 3</h3>
                <div class="row">
                    <div class="col-12">
                        <% List<Rooms> listRoomVip3 = (List<Rooms>)
                                request.getAttribute("listRoomVip3");
                                for (int i = 0; i < listRoomVip3.size(); i++) { %>
                        <div class="property-item mb-5 border rounded p-3">
                            <a href="OwnerController?service=roomDetail&roomID=<%= listRoomVip3.get(i).getRoomID() %>"
                               class="img d-block mb-3">
                                <% String base64Image=listRoomVip3.get(i).getRoomImg(); %>
                                <img src="data:image/jpg;base64,<%= base64Image %>"
                                     class="img-fluid"
                                     style="height: 350px; width: 100%; object-fit: cover;">

                            </a>
                            <div class="property-content">
                                <div class="price mb-2">
                                    <span>
                                        <%= listRoomVip3.get(i).getRoomFee().longValue() %>k
                                        VND
                                    </span>
                                    <span>– <%= listRoomVip3.get(i).getVip().getVipName() %>
                                    </span>
                                </div>
                                <div>
                                    <span class="d-block mb-2 text-black-50">Thôn 3, Tân Xã,
                                        Thạch Thất</span>
                                    <span class="city d-block mb-3">Room <%=
                                                                        listRoomVip3.get(i).getRoomNumber() %></span>
                                    <div class="specs d-flex mb-4">
                                        <span
                                            class="d-block d-flex align-items-center me-3">
                                            <span class="icon-bed me-2"></span>
                                            <span class="caption">
                                                <%= listRoomVip3.get(i).getRoomSize() %>
                                                beds
                                            </span>
                                        </span>
                                        <span class="d-block d-flex align-items-center">
                                            <span class="icon-bath me-2"></span>
                                            <span class="caption">
                                                <%= listRoomVip3.get(i).getRoomFloor() %>
                                                Floor
                                            </span>
                                        </span>
                                    </div>
                                    <a href="GuestController?service=roomDetail&roomID=<%= listRoomVip3.get(i).getRoomID() %>"
                                       class="btn btn-primary py-2 px-3">See details</a>
                                </div>
                            </div>
                        </div>
                        <% } %>
                    </div>
                </div>
            </div>
        </div>

        <section class="features-1">
            <div class="container">
                <div class="row">
                    <div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="300">
                        <div class="box-feature">
                            <span class="flaticon-house"></span>
                            <h3 class="mb-3">Our Properties</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates,
                                accusamus.</p>
                            <p><a href="#" class="learn-more">Learn More</a></p>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="500">
                        <div class="box-feature">
                            <span class="flaticon-building"></span>
                            <h3 class="mb-3">Property for Sale</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates,
                                accusamus.</p>
                            <p><a href="#" class="learn-more">Learn More</a></p>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="400">
                        <div class="box-feature">
                            <span class="flaticon-house-3"></span>
                            <h3 class="mb-3">Real Estate Agent</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates,
                                accusamus.</p>
                            <p><a href="#" class="learn-more">Learn More</a></p>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3" data-aos="fade-up" data-aos-delay="600">
                        <div class="box-feature">
                            <span class="flaticon-house-1"></span>
                            <h3 class="mb-3">House for Sale</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Voluptates,
                                accusamus.</p>
                            <p><a href="#" class="learn-more">Learn More</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <div class="section section-4 bg-light">
            <div class="container">
                <div class="row justify-content-center  text-center mb-5">
                    <div class="col-lg-5">
                        <h2 class="font-weight-bold heading text-primary mb-4">Let's find the room
                            that's perfect for you</h2>
                        <p class="text-black-50">Motel Page can help you find your room that you want.
                        </p>
                    </div>
                </div>
                <div class="row justify-content-between mb-5">
                    <div class="col-lg-7 mb-5 mb-lg-0 order-lg-2">
                        <div class="img-about dots">
                            <img src="images/hero_bg_3.jpg" alt="Image" class="img-fluid">
                        </div>
                    </div>
                    <div class="col-lg-4">
                        <div class="d-flex feature-h">
                            <span class="wrap-icon me-3">
                                <span class="icon-home2"></span>
                            </span>
                            <div class="feature-text">
                                <h3 class="heading">Cheap Price</h3>
                                <p class="text-black-50">Price will be 800kVND to 1mVND.</p>
                            </div>
                        </div>

                        <div class="d-flex feature-h">
                            <span class="wrap-icon me-3">
                                <span class="icon-person"></span>
                            </span>
                            <div class="feature-text">
                                <h3 class="heading">Top 100 in HOA LAC</h3>
                                <p class="text-black-50">With the best service and smart paymemnt</p>
                            </div>
                        </div>

                        <div class="d-flex feature-h">
                            <span class="wrap-icon me-3">
                                <span class="icon-security"></span>
                            </span>
                            <div class="feature-text">
                                <h3 class="heading">Best security</h3>
                                <p class="text-black-50">We have best security and camera.</p>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row section-counter mt-5">
                    <div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up"
                         data-aos-delay="300">
                        <div class="counter-wrap mb-5 mb-lg-0">
                            <span class="number"><span class="countup text-primary">32</span>+</span>
                            <span class="caption text-black-50">Room that available</span>
                        </div>
                    </div>
                    <div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up"
                         data-aos-delay="400">
                        <div class="counter-wrap mb-5 mb-lg-0">
                            <span class="number"><span class="countup text-primary">150</span>+</span>
                            <span class="caption text-black-50">Rented</span>
                        </div>
                    </div>
                    <div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up"
                         data-aos-delay="500">
                        <div class="counter-wrap mb-5 mb-lg-0">
                            <span class="number"><span class="countup text-primary">2</span>Km</span>
                            <span class="caption text-black-50">Near FPT University</span>
                        </div>
                    </div>
                    <div class="col-6 col-sm-6 col-md-6 col-lg-3" data-aos="fade-up"
                         data-aos-delay="600">
                        <div class="counter-wrap mb-5 mb-lg-0">
                            <span class="number"><span class="countup text-primary">80</span>%</span>
                            <span class="caption text-black-50">Sound proof</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="section">
            <div class="row justify-content-center footer-cta" data-aos="fade-up">
                <div class="col-lg-7 mx-auto text-center">
                    <h2 class="mb-4 ">Join Zalo Group to get help better</h2>
                    <p><a href="https://zalo.me/g/pimjmz442" target="_blank"
                          class="btn btn-primary text-white py-3 px-4">Click here to Join</a></p>
                </div> <!-- /.col-lg-7 -->
            </div> <!-- /.row -->
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
                        <!-- 
**==========
NOTE: 
Please don't remove this copyright link unless you buy the license here https://untree.co/license/  
**==========
                        -->

                        <p>Copyright &copy;
                            <script>document.write(new Date().getFullYear());</script>. All Rights
                            Reserved. &mdash; Designed with love by <a
                                href="https://untree.co">Untree.co</a>
                            <!-- License information: https://untree.co/license/ -->
                        </p>

                    </div>
                </div>
            </div> <!-- /.container -->
        </div> <!-- /.site-footer -->


        <!-- Preloader -->
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
    </body>

</html>