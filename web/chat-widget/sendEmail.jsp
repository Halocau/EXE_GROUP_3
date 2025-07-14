<%-- Document : sendEmail.jsp Created on : Jun 2, 2025, 1:35:12 PM Author : Admin --%>

    <%@page contentType="text/html" pageEncoding="UTF-8" %>
        <%-- Document : roomTable Created on : 27 thg 5, 2024, 11:02:30 Author : Admin --%>
            <!DOCTYPE html>
            <html lang="en">

            <head>
                <meta charset="utf-8" />
                <link rel="icon" href="favicon.png">
                <meta http-equiv="X-UA-Compatible" content="IE=edge" />
                <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
                <meta name="description" content="" />
                <meta name="author" content="" />
                <title>Tables - SB Admin</title>
                <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
                <link href="AdminCSS/css/styles.css" rel="stylesheet" />
                <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
            </head>

            <style>
                form {
                    max-width: 600px;
                    margin: 40px auto;
                    padding: 30px;
                    background: #ffffff;
                    border-radius: 10px;
                    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                    font-family: Arial, sans-serif;
                }

                form label {
                    font-weight: bold;
                    display: block;
                    margin-bottom: 5px;
                    margin-top: 20px;
                    color: #333;
                }

                form input[type="text"],
                form input[type="email"],
                form select,
                form textarea {
                    width: 100%;
                    padding: 10px 12px;
                    margin-top: 5px;
                    border: 1px solid #ccc;
                    border-radius: 6px;
                    box-sizing: border-box;
                    font-size: 14px;
                }

                .extra-input {
                    display: none;
                    margin-top: 10px;
                }

                button[type="submit"] {
                    margin-top: 30px;
                    padding: 10px 20px;
                    background-color: #007bff;
                    color: white;
                    font-size: 16px;
                    border: none;
                    border-radius: 6px;
                    cursor: pointer;
                    transition: background-color 0.3s ease;
                }

                button[type="submit"]:hover {
                    background-color: #0056b3;
                }
            </style>

            <body class="sb-nav-fixed">
                <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
                    <!-- Navbar Brand-->
                    <a class="navbar-brand ps-3" href="manage">Admin</a>
                    <!-- Sidebar Toggle-->
                    <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i
                            class="fas fa-bars"></i></button>
                    <!-- Navbar Search-->
                    <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">

                    </form>
                    <!-- Navbar-->
                    <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">

                                <li>
                                    <hr class="dropdown-divider" />
                                </li>
                                <li><a class="dropdown-item" href="logout">Logout</a></li>
                            </ul>
                        </li>
                    </ul>
                </nav>
                <div id="layoutSidenav">
                    <div id="layoutSidenav_nav">
                        <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                            <div class="sb-sidenav-menu">
                                <div class="nav">


                                    <div class="sb-sidenav-menu-heading">Addons</div>
                                    <a class="nav-link" href="manage">
                                        <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                        Account
                                    </a>

                                    </a>
                                    <a class="nav-link" href="selist">
                                        <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                        Security List
                                    </a>
                                    <a class="nav-link" href="rooms">
                                        <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                        Room List
                                    </a>
                                    <a class="nav-link" href="sendemail">
                                        <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                        Send Email
                                    </a>

                                </div>
                            </div>
                            <div class="sb-sidenav-footer">
                                <div class="small">Logged in as:</div>
                                Admin
                            </div>
                        </nav>
                    </div>

                    <div id="layoutSidenav_content">
                        <main>
                            <form action="sendemail" method="post">
                                <label>Email người nhận:</label>
                                <input type="email" name="to" required>

                                <label>Loại email:</label>
                                <select name="action" id="emailType" required onchange="handleSelectChange()">
                                    <option value="">-- Chọn loại email --</option>
                                    <option value="vip-confirm">Xác nhận tin VIP</option>
                                    <option value="request-success">Thuê phòng thành công</option>
                                    <option value="host-register">Đăng ký làm chủ trọ thành công</option>
                                    <option value="feedback">Gửi phản hồi</option>
                                </select>

                                <div id="vip-confirm" class="extra-input">
                                    <label>Chọn loại VIP:</label>
                                    <select name="vipCode" required>
                                        <option value="">-- Chọn gói VIP --</option>
                                        <option value="VIP 1">VIP 1</option>
                                        <option value="VIP 2">VIP 2</option>
                                        <option value="VIP 3">VIP 3</option>
                                    </select>
                                </div>

                                <div id="request-success" class="extra-input">
                                    <label>Mã phòng cho thuê:</label>
                                    <input type="text" name="roomCode">
                                </div>

                                <div id="host-register" class="extra-input">
                                    <label>Email của tài khoản sẽ thành chủ trọ:</label>
                                    <input type="text" name="emailAccount">
                                </div>

                                <!-- Nếu muốn bật lại phần phản hồi -->
                                <!--
            <div id="feedback" class="extra-input">
                <label>Lời nhắn phản hồi:</label>
                <textarea name="feedbackMessage" rows="4" cols="50"></textarea>
            </div>
            -->

                                <button type="submit">Gửi Email</button>
                            </form>

                            <script>
                                function handleSelectChange() {
                                    const value = document.getElementById('emailType').value;

                                    document.querySelectorAll('.extra-input').forEach(el => {
                                        el.style.display = 'none';
                                    });

                                    const selectedDiv = document.getElementById(value);
                                    if (selectedDiv) {
                                        selectedDiv.style.display = 'block';
                                    }
                                }
                            </script>
                        </main>

                        <footer class="py-4 bg-light mt-auto">
                            <div class="container-fluid px-4">
                                <div class="d-flex align-items-center justify-content-between small">
                                    <div class="text-muted">Copyright &copy; Your Website 2023</div>
                                    <div>
                                        <a href="#">Privacy Policy</a>
                                        &middot;
                                        <a href="#">Terms &amp; Conditions</a>
                                    </div>
                                </div>
                            </div>
                        </footer>
                    </div>
                </div>

                </script>
                <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
                    crossorigin="anonymous"></script>
                <script src="AdminCSS/js/scripts.js"></script>
                <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
                    crossorigin="anonymous"></script>
                <script src="AdminCSS/js/datatables-simple-demo.js"></script>

            </body>

            </html>