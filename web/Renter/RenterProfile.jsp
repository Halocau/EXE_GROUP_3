<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="dao.RoomDAO, dao.RenterDAO, java.util.List,java.util.Vector" %>
<%@page import="model.Room, model.User, model.UserDetail, model.Account" %>
<%@ page import="java.util.Base64" %>
<%@ page import="utils.EnvLoader" %>


<% UserDetail userDetail=(UserDetail) request.getAttribute("userDetail"); String error=(String)
                            request.getAttribute("error"); %>
<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="shortcut icon" href="images/favicon.png">
        <link rel='stylesheet'
              href='https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css'>
        <title>Profile | StayNow</title>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap"
            rel="stylesheet">

        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

        <link rel="stylesheet" href="css/style.css">
        <style>
            body {
                background: #fff;
                min-height: 100vh;
                font-family: 'Inter', sans-serif;
            }

            .main-body {
                padding: 32px 0;
            }

            .profile-card {
                background: #fff;
                border-radius: 24px;
                box-shadow: 0 8px 32px rgba(80, 80, 160, 0.10);
                padding: 32px 24px 24px 24px;
                text-align: center;
                margin-bottom: 24px;
            }

            .profile-avatar {
                width: 120px;
                height: 120px;
                border-radius: 50%;
                border: 5px solid #fff;
                box-shadow: 0 4px 16px rgba(80, 80, 160, 0.15);
                object-fit: cover;
                margin-bottom: 16px;
            }

            .profile-name {
                font-size: 1.4rem;
                font-weight: 700;
                margin-bottom: 4px;
            }

            .profile-role {
                font-size: 1rem;
                color: #888;
                margin-bottom: 16px;
            }

            .profile-social {
                display: flex;
                justify-content: center;
                gap: 16px;
                margin-bottom: 0;
            }

            .profile-social a {
                width: 40px;
                height: 40px;
                border-radius: 50%;
                background: #f3f4f6;
                display: flex;
                align-items: center;
                justify-content: center;
                color: #667eea;
                font-size: 1.2rem;
                transition: background 0.2s, color 0.2s, transform 0.2s;
            }

            .profile-social a:hover {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: #fff;
                transform: translateY(-2px) scale(1.1);
            }

            .info-card {
                background: #fff;
                border-radius: 24px;
                box-shadow: 0 8px 32px rgba(80, 80, 160, 0.10);
                padding: 32px 32px 24px 32px;
            }

            .info-list {
                margin-bottom: 24px;
            }

            .info-row {
                display: flex;
                align-items: center;
                padding: 12px 0;
                border-bottom: 1px solid #f0f0f0;
            }

            .info-row:last-child {
                border-bottom: none;
            }

            .info-label {
                flex: 0 0 140px;
                color: #888;
                font-size: 1rem;
                font-weight: 500;
            }

            .info-value {
                font-size: 1.08rem;
                font-weight: 600;
                color: #222;
            }

            .wallet-row {
                display: flex;
                align-items: center;
                justify-content: space-between;
                margin-bottom: 24px;
            }

            .wallet-label {
                font-size: 1.1rem;
                color: #888;
            }

            .wallet-value {
                font-size: 1.3rem;
                font-weight: 700;
                color: #4f46e5;
            }

            .btn-gradient {
                /*                background: linear-gradient(135deg, #43e97b 0%, #38f9d7 100%);*/
                background: #4f46e5;
                color: #fff;
                border: none;
                border-radius: 12px;
                padding: 0.5rem 1.5rem;
                font-weight: 600;
                font-size: 1rem;
                box-shadow: 0 2px 8px rgba(67, 233, 123, 0.10);
                transition: background 0.2s, transform 0.2s;
            }

            .btn-gradient:hover {
                background: linear-gradient(135deg, #38f9d7 0%, #43e97b 100%);
                color: #fff;
                transform: translateY(-2px) scale(1.04);
            }

            .action-btns {
                display: flex;
                gap: 16px;
                margin-top: 24px;
            }

            .action-btns .btn {
                border-radius: 12px;
                font-weight: 600;
                font-size: 1rem;
                padding: 0.5rem 1.5rem;
                border: none;
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: #fff;
                transition: background 0.2s, transform 0.2s;
            }

            .action-btns .btn:hover {
                background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
                color: #fff;
                transform: translateY(-2px) scale(1.04);
            }

            @media (max-width: 991px) {
                .info-card {
                    padding: 24px 12px;
                }
            }

            @media (max-width: 767px) {
                .main-body {
                    padding: 8px 0;
                }

                .profile-card,
                .info-card {
                    padding: 18px 6px;
                    border-radius: 12px;
                }

                .wallet-row {
                    flex-direction: column;
                    align-items: flex-start;
                    gap: 8px;
                }

                .action-btns {
                    flex-direction: column;
                    gap: 10px;
                }

                .site-nav {
                    border-radius: 0;
                    margin: 0;
                    max-width: 100vw;
                }

                .container.main-body {
                    margin-top: 140px;
                }
            }

            .site-nav {
                position: fixed;
                top: 0;
                left: 0;
                width: 100vw;
                z-index: 1000;
                border-radius: 0;
                margin: 0;
            }

            .container.main-body {
                margin-top: 140px;
            }
        </style>
    </head>

    <body>
        <div>
            <nav class="site-nav">
                <div class="container">
                    <div class="menu-bg-wrap">
                        <div class="site-navigation">
                            <a href="renterprofile" class="logo m-0 float-start"
                               style="text-decoration: none;">Profile</a>

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
            </div>
            <div class="container main-body">
                <div class="row">
                    <div class="col-lg-4 col-md-5 mb-4">
                        <div class="profile-card">
                        <% String base64Image=userDetail.getUserAvatar(); %>
                        <img src="${pageContext.request.contextPath}/${imgAvata}"  alt="Avatar"
                             class="profile-avatar">
                        <div class="profile-name">
                            <%= userDetail.getUserName() %>
                        </div>
                        <div class="profile-role">Renter</div>
                        <div class="profile-social">
                            <a href="<%= utils.EnvLoader.get(" Origin") %>/HL_Motel/"
                               title="Website"><i class="fa-solid fa-globe"></i></a>
                            <a href="https://github.com/Phucnhhe170085/SE1803_SWP391_Group5"
                               title="GitHub"><i class="fab fa-github"></i></a>
                            <a href="https://www.youtube.com/" title="Twitter/X"><i
                                    class="fab fa-twitter"></i></a>
                            <a href="https://web.telegram.org/" title="Telegram"><i
                                    class="fab fa-telegram"></i></a>
                            <a href="https://www.facebook.com/elfadkeachother"
                               title="Facebook"><i class="fab fa-facebook"></i></a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 col-md-7 mb-4">
                    <div class="info-card">
                        <div class="wallet-row">
                            <div>
                                <div class="wallet-label">Wallet</div>
                                <% java.text.NumberFormat
                                    nf=java.text.NumberFormat.getInstance(); String
                                    formattedWallet=userDetail.getWallet()==null ? "0" :
                                    nf.format(userDetail.getWallet()); %>
                                <div class="wallet-value">
                                    <%= formattedWallet %> VND
                                </div>
                            </div>
                            <a href="#" class="btn-gradient" data-toggle="modal"
                               data-target="#walletModal">Nạp tiền</a>
                        </div>
                        <div class="info-list">
                            <div class="info-row">
                                <div class="info-label">Full Name</div>
                                <div class="info-value">
                                    <%= userDetail.getUserName() %>
                                </div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Gender</div>
                                <div class="info-value">
                                    <%= userDetail.getUserGender() %>
                                </div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Date of birth</div>
                                <div class="info-value">
                                    <%= userDetail.getUserBirth() %>
                                </div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Email</div>
                                <div class="info-value">
                                    <%= userDetail.getUserMail() %>
                                </div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Phone</div>
                                <div class="info-value">
                                    <%= userDetail.getUserPhone() %>
                                </div>
                            </div>
                            <div class="info-row">
                                <div class="info-label">Address</div>
                                <div class="info-value">
                                    <%= userDetail.getUserAddress() %>
                                </div>
                            </div>
                        </div>
                        <div class="action-btns">
                            <a class="btn" href="rentercontroller?service=renterupdate"><i
                                    class="fa-solid fa-pen-to-square mr-2"></i>Edit</a>
                            <a class="btn" href="changePassword"><i
                                    class="fa-solid fa-key mr-2"></i>Change password</a>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Modal nạp tiền -->
            <%! public static String removeVietnameseTones(String str) {
                str=java.text.Normalizer.normalize(str, java.text.Normalizer.Form.NFD);
                str=str.replaceAll("\\p{InCombiningDiacriticalMarks}+", "" ); return str; } %>
            <% String
                fullName=removeVietnameseTones(userDetail.getUserName()).replaceAll("\\p{Punct}", ""
                ).replaceAll("\\s+", "" ); String phone=userDetail.getUserPhone(); String
                contentCK="HSLN" + fullName + phone + "WALLET" ; %>
            <div class="modal fade" id="walletModal" tabindex="-1" role="dialog"
                 aria-labelledby="walletModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content text-center">
                        <div class="modal-header">
                            <h5 class="modal-title w-100">Thanh toán nạp tiền ví</h5>
                            <button type="button" class="close" data-dismiss="modal"
                                    aria-label="Đóng">
                                <span>&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <img src="https://img.vietqr.io/image/970415-113366668888-qr_only.png"
                                 alt="QR Code" class="img-fluid mb-3"
                                 style="max-width: 250px;">
                            <div class="form-group">
                                <label for="paymentContent">Nội dung CK:</label>
                                <div class="input-group">
                                    <input id="paymentContent" type="text"
                                           class="form-control text-center" readonly
                                           value="<%= contentCK %>">
                                    <div class="input-group-append">
                                        <button class="btn btn-outline-secondary"
                                                onclick="copyContent()">📋</button>
                                    </div>
                                </div>
                                <small class="form-text text-muted">Sau khi chuyển tiền
                                    bạn vui
                                    lòng đợi tầm 5 – 10p để hệ thống kiểm tra</small>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <script
            src='https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js'></script>
            <script>
                                                    function copyContent() {
                                                        var copyText = document.getElementById("paymentContent");
                                                        copyText.select();
                                                        copyText.setSelectionRange(0, 99999);
                                                        document.execCommand("copy");
                                                        copyText.style.backgroundColor = "#d4edda";
                                                        setTimeout(function () {
                                                            copyText.style.backgroundColor = "";
                                                        }, 1500);
                                                    }
            </script>
        </div>
        <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"></script>
        <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/js/bootstrap.bundle.min.js"></script>
    <script>
                                    window.contextPath = "<%= request.getContextPath() %>";
            </script>

            <!-- Nhúng file JS bot -->
            <script src="<%= request.getContextPath() %>/js/chatbot.js"></script>
    </body>

</html>