<%@page import="dao.RoomDAO,java.util.List"%>
<%@page import="model.RoomDetailSe"%>
<%@ page import="java.util.Base64" %>
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<% RoomDetailSe roomDetail = (RoomDetailSe) request.getAttribute("roomDetail");  
   int userID = (int) request.getAttribute("userID"); 

%>

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
                position: relative;
                color: #2e2a2a;
                font-family: "Be Vietnam Pro", sans-serif, sans-serif;
                font-style: normal;
                font-weight: 300;
                font-size: 15px;
                line-height: 1.5;
            }
            .confirm-rent {
                margin: 20px;
                padding: 20px;
                border: 1px solid #ccc;
                background-color: #f9f9f9;
                text-align: center;
                max-width: 500px;
                margin-left: auto;
                margin-right: auto;
            }
            .payment-table {
                margin: 0 auto;
                border-collapse: collapse;
                width: 100%;
                text-align: left;
            }
            .payment-table td {
                padding: 10px;
                white-space: nowrap;
            }
            .payment-options {
                margin-top: 20px;
            }
            .payment-options button {
                margin: 10px;
                padding: 10px 20px;
                font-size: 16px;
                cursor: pointer;
                border: none;
                border-radius: 5px;
                transition: background-color 0.3s;
            }
            .payment-options button[name="paymentMethod"][value="cash"] {
                background-color: #28a745;
                color: white;
            }
            .payment-options button[name="paymentMethod"][value="cash"]:hover {
                background-color: #218838;
            }
            /*            .payment-options button[name="paymentMethod"][value="online"] {
                            background-color: #007bff;
                            color: white;
                        }*/
            .payment-options button[name="paymentMethod"][value="online"]:hover {
                background-color: #0056b3;
            }
            .heading-center {
                text-align: center;
            }
            .cancel-link {
                display: block;
                margin-top: 10px;
                color: #dc3545;
                text-decoration: none;
                transition: color 0.3s;
            }

            .cancel-link:hover {
                color: #bd2130;
            }
            .payment-options button,
            .payment-options .cancel-link {
                background-color: #005555;
                color: white;
                padding: 10px 20px;
                text-align: center;
                display: inline-block;
                width: 150px; /* ?i?u ch?nh kích th??c theo ý mu?n */
                text-decoration: none;
                border: none;
                cursor: pointer;
            }

            .payment-options .cancel-link {
                background-color: #005555;
                border: 1px solid #005555;
                padding: 10px 20px;
                width: 150px;
                display: inline-block;
                text-align: center;
                color: white;
                border-radius: 5px;
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
                        <a href="#" class="logo m-0 float-start">Confirm Rent</a>

                        <jsp:include page = "navbar.jsp"></jsp:include>

                            <a href="#" class="burger light me-auto float-end mt-1 site-menu-toggle js-menu-toggle d-inline-block d-lg-none" data-toggle="collapse" data-target="#main-navbar">
                                <span></span>
                            </a>
                        </div>
                    </div>
                </div>
            </nav>

            <div class="hero page-inner overlay" style="background-image: url('images/slide-1.jpg');">
                <div class="container">
                    <div class="row justify-content-center align-items-center">
                        <div class="col-lg-9 text-center mt-5">
                            <h1 class="heading" data-aos="fade-up">Confirm Rent</h1>
                            <nav aria-label="breadcrumb" data-aos="fade-up" data-aos-delay="200">
                                <ol class="breadcrumb text-center justify-content-center">
                                    <li class="breadcrumb-item "><a href="rentercontroller?service=renterhome">Home</a></li>                               
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
                                <img style="margin-top: 50px;" src="data:image/jpg;base64, <%= base64Image %>" alt="Image" class="img-fluid">
                            </div>
                        </div>
                    </div>

                    <% 
                        double deposit = 2000;
                        DecimalFormat df = new DecimalFormat("#.##");
                        String formattedFeePerMonth = df.format(roomDetail.getRoomFee());
                        String formattedFeePerQuarterly = df.format(roomDetail.getRoomFee() * 4);
                        String formattedFeeTotal = df.format(roomDetail.getRoomFee() * 4 + 2000);
                    %>        
                    <div class="col-lg-4">
                        <div class="d-block agent-box p-5">
                            <h2 class="heading text-primary heading-center" style="font-weight: 700">Confirm Rent</h2>

                            <!-- payment -->
                            <div class="confirm-rent">
                                <table class="payment-table">
                                    <tr>
                                        <td>Rent Price (x1 month):</td>
                                        <td><%= formattedFeePerMonth %>k VND</td>
                                    </tr>
                                </table>


                                <div class="payment-options"> 
                                    <button type="button" onclick="showWalletModal()">Pay Online</button>
                                    <a href="RenterRoomController?service=cancelRoom&roomID=<%= roomDetail.getRoomID() %>" class="cancel-link">Cancel</a> 
                                </div>

                                <div id="qr-overlay" style="display: none; position: fixed; top: 0; left: 0;
                                     width: 100%; height: 100%; background-color: rgba(0, 0, 0, 0.7);
                                     align-items: center; justify-content: center; z-index: 9999;">

                                    <div style="position: relative; background-color: white; padding: 20px; border-radius: 10px; text-align: center;">
                                        <button onclick="hideQRCode()" style="position: absolute; top: 5px; right: 10px; background: none; border: none; font-size: 20px; cursor: pointer;">&times;</button>

                                        <img src="<%= request.getContextPath() %>/Image/QR_Code/QR_Code.png" 
                                             alt="QR Code" style="max-width: 300px;">
                                        <p style="margin-top: 10px;">Content payment: <%= roomDetail.getRoomNumber() + "_" + request.getAttribute("paymentCode") %> </p>
                                    </div>
                                </div>
                            </div>
                            <!-- end payment -->
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="site-footer">
            <div class="container">

                <div class="row">
                    <div class="col-lg-4">
                        <div class="widget">
                            <h3>Contact</h3>
                            <address>43 Raymouth Rd. Baltemoer, London 3910</address>
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

            </div> <!-- /.container -->
        </div> <!-- /.site-footer -->
        <!-- Payment Confirmation Modal -->
        <div id="wallet-modal" style="display:none; position:fixed; top:0; left:0; width:100%; height:100%;
             background:rgba(0,0,0,0.6); z-index:9999; justify-content:center; align-items:center;">
            <div style="background:#fff; padding:30px; border-radius:8px; width:400px; position:relative; text-align:center;">
                <h4>Xác nhận thanh toán</h4>
                <p>Số dư ví của bạn: 
                    <strong><%= request.getAttribute("wallet") != null ? request.getAttribute("wallet") + "k VND" : "Không khả dụng" %></strong>
                </p>


                <p>Giá cần thanh toán: <strong><%= formattedFeePerMonth %>k VND</strong></p>

                <form method="post" action="PayOnlineController">
                    <input type="hidden" name="userID" value="<%= userID %>" />
                    <input type="hidden" name="roomID" value="<%= roomDetail.getRoomID() %>" />
                    <input type="hidden" name="amount" value="<%= roomDetail.getRoomFee() %>" />

                    <button type="submit" style="background-color: #28a745; color: white; padding: 10px 20px;">Xác nhận</button>
                    <button type="button" onclick="hideWalletModal()" style="margin-left: 10px; background: #dc3545; color: white; padding: 10px 20px;">Hủy</button>
                </form>
            </div>
        </div>


        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/navbar.js"></script>
        <script src="js/counter.js"></script>
        <script src="js/custom.js"></script>
        <script>
                        function showWalletModal() {
                            document.getElementById("wallet-modal").style.display = "flex";
                        }

                        function hideWalletModal() {
                            document.getElementById("wallet-modal").style.display = "none";
                        }
        </script>

    </body>
</html>
