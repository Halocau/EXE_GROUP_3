<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<% String service=(String) request.getParameter("service"); %>

<!DOCTYPE html>
<html lang="vi">

    <head>
        <meta charset="UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <title>Hola StayNow</title>

        <!-- Google Fonts & Font Awesome -->
        <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;600&display=swap" rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
              integrity="sha512-…" crossorigin="anonymous" referrerpolicy="no-referrer" />


        <!-- === NAVBAR CSS === -->
        <style>
            /* container nổi trên ảnh */
            .navbar-custom {
                position: absolute;
                top: 20px;
                left: 50%;
                transform: translateX(-50%);
                width: calc(100% - 40px);
                max-width: 1200px;
                background: rgba(5, 77, 66, 0.95);
                border-radius: 0.5rem;
                padding: 0.75rem 1.5rem;
                display: flex;
                align-items: center;
                justify-content: space-between;
                z-index: 1000;
            }

            /* brand text */
            .navbar-brand {
                color: #f5f5f5;
                font-size: 1.25rem;
                font-weight: 600;
                text-decoration: none;
            }

            /* menu chính */
            .navbar-nav {
                list-style: none;
                display: flex;
                align-items: center;
                margin: 0;
                padding: 0;
                gap: 2rem;
            }

            /* ẩn menu trên mobile */
            @media (max-width: 991.98px) {
                .navbar-nav {
                    display: none;
                }
            }

            .navbar-nav li {
                position: relative;
            }

            .navbar-nav li a {
                color: #cbdad4;
                text-decoration: none;
                font-weight: 500;
                padding: 0.5rem 0;
                transition: color 0.2s;
            }

            .navbar-nav li.active>a,
            .navbar-nav li a:hover {
                color: #ffffff;
            }

            /* dropdown arrow */
            .navbar-nav .has-children>a::after {
                content: '▼';
                font-size: 0.6em;
                margin-left: 0.3em;
                color: #a5d7c5;
                transition: transform 0.2s;
            }

            .navbar-nav .has-children:hover>a::after {
                transform: rotate(180deg);
            }

            /* dropdown menu */
            .navbar-nav .dropdown {
                display: none;
                position: absolute;
                top: 100%;
                left: 0;
                background: #ffffff;
                border-radius: 0.25rem;
                box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                list-style: none;
                padding: 0.5rem 0;
                margin: 0;
                min-width: 180px;
            }

            .navbar-nav .has-children:hover .dropdown {
                display: block;
            }

            .navbar-nav .dropdown li a {
                display: block;
                padding: 0.5rem 1rem;
                color: #333333;
                text-decoration: none;
                transition: background 0.2s;
                font-size: 0.9rem;
            }

            .navbar-nav .dropdown li a:hover {
                background: #f1f1f1;
            }

            /* avatar */
            .navbar-avatar img {
                border-radius: 50%;
                width: 30px;
                height: 30px;
                object-fit: cover;
                border: 2px solid #ffffff;
            }

            /* Hamburger menu button */
            .navbar-toggle {
                display: none;
                background: none;
                border: none;
                color: #fff;
                font-size: 2rem;
                cursor: pointer;
                margin-left: 1rem;
            }

            @media (max-width: 991.98px) {
                .navbar-nav {
                    display: none;
                    position: absolute;
                    top: 60px;
                    left: 0;
                    width: 100vw;
                    background: rgba(5, 77, 66, 0.98);
                    flex-direction: column;
                    gap: 0;
                    padding: 1rem 0;
                    z-index: 2000;
                }

                .navbar-nav.show {
                    display: flex;
                }

                .navbar-toggle {
                    display: block;
                }

                .navbar-custom {
                    flex-wrap: wrap;
                    padding: 0.75rem 1rem;
                }

                .navbar-avatar {
                    margin-top: 1rem;
                }
            }
        </style>

        <!-- === 2. CSS CHO WALLET.JSP === -->
        <style>
            html,
            body {
                height: 100%;
                min-height: 100vh;
            }

            body {
                font-family: 'Poppins', sans-serif;
                background: linear-gradient(120deg, #eef6fb 0%, #e3eafc 100%);
                color: #333;
                margin: 0;
                padding: 0;
                min-height: 100vh;
            }

            /* Membership */
            .membership-section {
                background: transparent;
                max-width: 1200px;
                margin: 0 auto 2.5rem auto;
                padding: 2.5rem 2.5rem;
                border-radius: 0;
                text-align: center;
                box-shadow: none;
                margin-top: 90px;
            }

            .membership-section h2 {
                color: #0476d0;
                font-size: 2.2rem;
                margin-bottom: 0.5rem;
                font-weight: 700;
                letter-spacing: 1px;
            }

            .membership-section .desc {
                color: #7a99b7;
                font-size: 1.1rem;
                margin-bottom: 2rem;
            }

            .membership-cards {
                display: flex;
                flex-wrap: wrap;
                gap: 2.5rem;
                justify-content: center;
            }

            .membership-card {
                background: #fff;
                border-radius: 18px;
                overflow: hidden;
                box-shadow: 0 6px 32px rgba(80, 120, 200, 0.13);
                display: flex;
                flex-direction: column;
                min-width: 300px;
                max-width: 340px;
                flex: 1 1 320px;
                border: 2px solid transparent;
                transition: transform 0.18s, box-shadow 0.18s, border 0.18s;
                position: relative;
            }

            .membership-card:hover {
                transform: translateY(-8px) scale(1.03);
                box-shadow: 0 12px 40px rgba(80, 120, 200, 0.18);
                border: 2px solid #b157f7;
            }

            .card-header {
                position: relative;
                color: #fff;
                text-align: center;
                padding: 2.2rem 1rem 1.5rem 1rem;
                background: linear-gradient(135deg, #b157f7 0%, #6f5efd 100%);
            }

            .membership-card:nth-child(2) .card-header {
                background: linear-gradient(135deg, #6f5efd 0%, #47caff 100%);
            }

            .membership-card:nth-child(3) .card-header {
                background: linear-gradient(135deg, #47caff 0%, #6f5efd 100%);
            }

            .card-header h3 {
                font-size: 1.7rem;
                font-weight: 700;
                margin-bottom: 0.3rem;
            }

            .card-header p {
                margin-top: 0.5rem;
                font-size: 1.25rem;
                font-weight: 500;
            }

            .ribbon {
                position: absolute;
                top: 18px;
                right: -38px;
                background: linear-gradient(90deg, #ffb347 0%, #ff7b00 100%);
                color: #fff;
                font-size: 0.85rem;
                font-weight: 700;
                padding: 0.35rem 2.2rem;
                transform: rotate(45deg);
                box-shadow: 0 2px 8px rgba(255, 123, 0, 0.18);
                letter-spacing: 1px;
                z-index: 2;
            }

            .features-list {
                list-style: none;
                padding: 1.5rem 1.5rem 1rem 1.5rem;
                flex-grow: 1;
                text-align: left;
            }

            .features-list li {
                display: flex;
                align-items: center;
                border-bottom: 1px solid #f0f0f0;
                padding: 0.85rem 0;
                font-size: 1.05rem;
                font-weight: 500;
                color: #444;
            }

            .features-list li:last-child {
                border-bottom: none;
            }

            .features-list li .fa-check {
                color: #28a745;
                margin-right: 0.85rem;
                font-size: 1.1rem;
            }

            .avatar-wrap {
                margin-top: 1rem;
                text-align: center;
            }

            .avatar-wrap img {
                width: 80px;
                height: 80px;
                border-radius: 50%;
                border: 4px solid #b157f7;
            }

            .btn-pay {
                background: linear-gradient(90deg, #b157f7 0%, #6f5efd 100%);
                color: #fff;
                padding: 0.95rem 0;
                font-weight: 700;
                border: none;
                border-radius: 24px;
                cursor: pointer;
                margin: 1.2rem 2.5rem 1.5rem 2.5rem;
                font-size: 1.1rem;
                box-shadow: 0 2px 12px rgba(80, 120, 200, 0.10);
                transition: background 0.18s, box-shadow 0.18s, transform 0.18s;
            }

            .btn-pay:hover {
                background: linear-gradient(90deg, #6f5efd 0%, #b157f7 100%);
                box-shadow: 0 4px 18px rgba(80, 120, 200, 0.18);
                transform: scale(1.04);
            }

            /* Recharge */
            .recharge-section {
                background: linear-gradient(135deg, #6f5efd, #a95eff);
                border-radius: 8px;
                padding: 2rem;
                color: #fff;
            }

            .recharge-section h2 {
                font-size: 1.75rem;
                margin: 0;
            }

            .recharge-section p {
                margin: 0.5rem 0 2rem;
                color: rgba(255, 255, 255, 0.85);
            }

            .recharge-container {
                display: grid;
                grid-template-columns: 1fr 1fr;
                gap: 2rem;
            }

            .card {
                background: #fff;
                border-radius: 8px;
                padding: 1.5rem;
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
                color: #333;
            }

            .field {
                margin-bottom: 1rem;
            }

            .field label {
                display: block;
                font-size: 0.85rem;
                color: #555;
                margin-bottom: 0.3rem;
            }

            .field .value {
                background: #f8f9fa;
                padding: 0.75rem 1rem;
                border-radius: 4px;
                font-weight: 600;
            }

            .btn-primary {
                background: #ff6b6b;
                color: #fff;
                border: none;
                border-radius: 4px;
                padding: 0.75rem 1.5rem;
                font-weight: 600;
                cursor: pointer;
                width: 100%;
            }

            .btn-secondary {
                background: #ff4c4c;
                color: #fff;
                border: none;
                border-radius: 4px;
                padding: 0.75rem 1.5rem;
                font-weight: 600;
                cursor: pointer;
                width: 100%;
                margin-top: 0.5rem;
            }

            .guide {
                background: rgba(255, 255, 255, 0.15);
                border-radius: 8px;
                padding: 1rem;
                color: #fff;
                margin-top: 1.5rem;
            }

            .guide ol {
                padding-left: 1.2rem;
            }

            .status {
                background: rgba(255, 255, 255, 0.15);
                padding: 0.75rem 1rem;
                border-radius: 4px;
                text-align: center;
                margin-top: 2rem;
            }

            .qr-card {
                text-align: center;
            }

            .qr-card img {
                max-width: 200px;
                width: 100%;
                margin: 1rem 0;
            }

            @media (max-width: 768px) {

                .membership-cards,
                .recharge-container {
                    grid-template-columns: 1fr !important;
                }

                .membership-section,
                .recharge-section {
                    padding: 1rem !important;
                }

                .card-header {
                    padding: 1.5rem 0.5rem;
                }

                .card-header h3 {
                    font-size: 1.25rem;
                }

                .card-header p {
                    font-size: 1rem;
                }

                .btn-pay,
                .btn-primary,
                .btn-secondary {
                    padding: 0.6rem !important;
                    font-size: 0.9rem;
                }
            }

            /* Đảm bảo modal-content có thể scroll nếu QR quá cao */
            .modal-content {
                background: #fff;
                margin: 10% auto;
                padding: 1.5rem;
                border-radius: 8px;
                width: 90%;
                max-width: 400px;
                position: relative;
                text-align: center;
                box-sizing: border-box;
                overflow-x: hidden;
                overflow-y: auto;
                z-index: 1001;
                /* nếu cần nổi trên navbar */
            }

            .modal-note {
                color: #777777;
                font-size: 0.875rem;
                /* nhỏ hơn text chính */
                font-style: italic;
                /* nghiêng cho nhẹ nhàng */
                margin-top: 0.5rem;
                /* tạo khoảng cách */
                text-align: left;
            }

            .modal-field {
                text-align: left;
                margin-bottom: 1.5rem;
            }

            /* nhóm input + nút copy */
            .copy-group {
                display: flex;
                align-items: center;
                gap: 0.5rem;
            }

            /* input chiếm hết không gian còn lại */
            .copy-group input {
                flex: 1;
                padding: 0.5rem;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
            }

            /* nút copy nhỏ gọn */
            #modal-copy-btn {
                background: none;
                border: none;
                cursor: pointer;
                font-size: 1.25rem;
                color: #555;
                padding: 0.25rem;
                border-radius: 4px;
                transition: background 0.2s;
            }

            #modal-copy-btn:hover {
                background: rgba(0, 0, 0, 0.05);
            }

            #modal-copy-btn:active {
                background: rgba(0, 0, 0, 0.1);
            }

            .modal {
                display: none;
                /* phải có */
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background: rgba(0, 0, 0, 0.5);
                z-index: 1000;
            }

            /* Đảm bảo padding nằm trong width 100% */
            .modal-field input {
                width: 100%;
                box-sizing: border-box;
                padding: 0.5rem 2.5rem 0.5rem 0.5rem;
                border: 1px solid #ccc;
                border-radius: 4px;
            }

            /* Icon copy tuyệt đối bên phải */
            #copy-icon {
                position: absolute;
                top: 50%;
                right: 0.75rem;
                transform: translateY(-50%);
                cursor: pointer;
                color: #555;
            }


            /* Giới hạn kích thước QR image */
            .modal-qr img {
                display: block;
                max-width: 250px;
                /* bạn có thể điều chỉnh con số này */
                width: 80%;
                /* chiếm 80% chiều ngang modal */
                height: auto;
                /* giữ tỉ lệ gốc */
                margin: 1rem auto;
                /* căn giữa */
            }

            .card-header {
                position: relative;
                overflow: hidden;
                /* quan trọng để wave ko vượt header */
                z-index: 1;
                /* header nội dung trên sóng */
            }

            .card-header::after {
                content: '';
                position: absolute;
                bottom: -1px;
                left: 0;
                width: 100%;
                height: 40px;
                background: url('data:image/svg+xml;utf8,...') no-repeat bottom center;
                background-size: cover;
                z-index: 0;
                /* sóng nằm dưới */
            }

            .card-header h3,
            .card-header p {
                position: relative;
                /* cho text nằm lên trên sóng */
                z-index: 2;
            }
        </style>
        <style>
            /* Footer CSS */
            .footer {
                background: #054f45;
                /* gần tương tự navbar */
                color: #f5f5f5;
                font-family: 'Poppins', sans-serif;
                padding-top: 2rem;
            }

            .footer-container {
                max-width: 1200px;
                margin: auto;
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(200px, 1fr));
                gap: 2rem;
                padding: 0 1rem;
            }

            .footer-col h4 {
                margin-bottom: 1rem;
                font-size: 1.1rem;
                font-weight: 600;
            }

            .footer-col p,
            .footer-col ul,
            .footer-col a {
                font-size: 0.9rem;
                line-height: 1.6;
                color: #e0e0e0;
                text-decoration: none;
            }

            .footer-col ul {
                list-style: none;
                padding: 0;
            }

            .footer-col ul li {
                margin-bottom: 0.5rem;
            }

            .footer-col ul li a:hover {
                color: #fff;
            }

            .social-icons a {
                display: inline-block;
                margin-right: 0.5rem;
                font-size: 1.2rem;
                color: #e0e0e0;
                transition: color 0.2s;
            }

            .social-icons a:hover {
                color: #fff;
            }

            .footer-bottom {
                text-align: center;
                padding: 1rem 0;
                border-top: 1px solid rgba(255, 255, 255, 0.2);
                margin-top: 2rem;
            }

            .footer-bottom p {
                margin: 0;
                font-size: 0.85rem;
                color: #ccc;
            }

            /* Responsive nhỏ hơn 600px */
            @media (max-width: 600px) {
                .footer-container {
                    grid-template-columns: 1fr;
                    text-align: center;
                }

                .social-icons {
                    margin-top: 0.5rem;
                }

                .footer-col h4 {
                    font-size: 1rem;
                }

                .footer-col p,
                .footer-col ul,
                .footer-col a {
                    font-size: 0.85rem;
                }
            }
        </style>
    </head>

    <body>
        <!-- NAVBAR HTML -->
        <nav class="navbar-custom">
            <a href="#" class="navbar-brand">StayNow</a>
            <button class="navbar-toggle" aria-label="Toggle navigation"><i class="fa fa-bars"></i></button>
            <ul class="navbar-nav">
                <li class="${param.service == null || param.service == 'renterhome' ? 'active' : ''}">
                    <a href="rentercontroller?service=renterhome">Home</a>
                </li>
                <li class="has-children ${(param.service == 'listRoom') ||  (param.service == 'guideandrule') || (param.service == 'RenterRoomDetail') ? 'active' : ''}">
                    <a href="#">View</a>
                    <ul class="dropdown">
                        <li><a href="RenterRoomController?service=listRoom&index=1">List Of Rooms</a></li>
                        <li><a href="renterguideline?service=guideandrule">Guide and Rule</a></li>
                        <li><a href="RenterRoomDetail?service=RenterRoomDetail">My Room</a></li>
                        <li><a href="rentercontroller?service=news">News</a></li>
                        <li><a href="renpen">Penalty</a></li>
                    </ul>
                </li>               
    <!--            <li class="${param.service == "paymentList" ? "active" : ''}"><a href="WalletController">Wallet</a></li>-->
                <li><a href="WalletController">Service</a></li>

                <li><a href="rentercontroller?service=request">Contact Us</a></li>
                <li><a href="listrequest1?service=request">List Request</a></li>
                <li><a href="logout">Logout</a></li>
                <li class="navbar-avatar">
                    <a href="rentercontroller?service=renterprofile">
                        <img src="${pageContext.request.contextPath}/${imgAvata}" alt="Profile Image" width="30px" height="30px" style="border-radius: 10px;">
                    </a>
                </li>
            </ul>
        </nav>

        <!-- MEMBERSHIP SECTION -->
        <section class="membership-section">
            <h2>Đăng ký chủ trọ</h2>
            <p class="desc">
                Để trở thành chủ trọ và sử dụng các chức năng đặc biệt tại Hola StayNow, bạn cần đăng ký với mức phí
                50.000đ.
            </p>
            <div class="membership-cards" style="justify-content:center;">
                <div class="membership-card featured" style="max-width:350px;">
                    <div class="card-header vip">
                        <h3>Đăng ký chủ trọ</h3>
                        <p>50.000₫ / 1 lần đăng ký</p>
                        <div class="ribbon">HOT</div>
                    </div>
                    <ul class="features-list">
                        <li><i class="fa-solid fa-check"></i> Được đăng phòng, quản lý trọ</li>
                        <li><i class="fa-solid fa-check"></i> Ưu tiên hỗ trợ từ hệ thống</li>
                        <li><i class="fa-solid fa-check"></i> Nhận thông báo mới nhất</li>
                    </ul>
                    <button class="btn-pay" id="open-modal-btn">Thanh toán</button>
                </div>
            </div>
        </section>

        <!-- PAYMENT MODAL -->
        <div id="payment-modal" class="modal">
            <div class="modal-content">
                <span class="modal-close"
                      style="position:absolute; top:0.5rem; right:1rem; font-size:1.5rem; cursor:pointer;">&times;</span>
                <h3>Thanh toán đăng ký chủ trọ</h3>
                <div class="modal-qr">
                    <img src="https://img.vietqr.io/image/970415-113366668888-qr_only.png" alt="QR Code" />
                </div>
                <div class="modal-field">
                    <label for="modal-input">Nội dung CK:</label>
                    <div class="copy-group">
                        <input id="modal-input" type="text" readonly />
                        <button type="button" id="modal-copy-btn" title="Sao chép"><i
                                class="fa-regular fa-copy"></i></button>
                    </div>
                    <!-- Dòng thông báo mờ -->
                    <p class="modal-note">
                        Bạn vui lòng đợi tầm 5 – 10p để hệ thống kiểm tra
                    </p>                </div>
            </div>
        </div>

        <!-- Cuối body, trước </body>, chèn script này: -->
        <jsp:useBean id="currentUser" type="model.User" scope="session" />


        <script>
            function slugify(str) {
                return str
                        .normalize('NFD')
                        .replace(/[\u0300-\u036f]/g, '')
                        .replace(/\s+/g, '');
            }
            // Lấy username & phone từ session
            var tenTro = '<%= currentUser != null ? currentUser.getUserName()  : "" %>';
            var tenKhach = '<%= currentUser != null ? currentUser.getUserPhone() : "" %>';
            // Mở popup và set nội dung CK
            document.getElementById('open-modal-btn').addEventListener('click', function () {
                var userSlug = slugify(tenTro);
                var parts = ['HSLN', userSlug, tenKhach, 'DKCT'];
//                var content = parts.join('_');
                var content = parts.join('');
                document.getElementById('modal-input').value = content;
                document.getElementById('payment-modal').style.display = 'block';
            });
            // Đóng modal
            var modal = document.getElementById('payment-modal');
            document.querySelector('.modal-close').addEventListener('click', function () {
                modal.style.display = 'none';
            });
            window.addEventListener('click', function (e) {
                if (e.target === modal)
                    modal.style.display = 'none';
            });
            // Copy nội dung
            document.getElementById('modal-copy-btn').addEventListener('click', function () {
                const input = document.getElementById('modal-input');
                input.select();
                document.execCommand('copy');
                this.innerHTML = '<i class="fa-solid fa-check" style="color:green"></i>';
                setTimeout(() => {
                    this.innerHTML = '<i class="fa-regular fa-copy"></i>';
                }, 1500);
            });

            // Hamburger menu toggle for mobile
            document.querySelector('.navbar-toggle').addEventListener('click', function () {
                var nav = document.querySelector('.navbar-nav');
                nav.classList.toggle('show');
            });
            // Đóng menu khi click ngoài (mobile)
            window.addEventListener('click', function (e) {
                var nav = document.querySelector('.navbar-nav');
                var toggle = document.querySelector('.navbar-toggle');
                if (window.innerWidth <= 991.98 && nav.classList.contains('show')) {
                    if (!nav.contains(e.target) && !toggle.contains(e.target)) {
                        nav.classList.remove('show');
                    }
                }
            });

        </script>
        <!-- Thêm ngay trên </body> -->
        <footer class="footer">
            <div class="footer-container">
                <div class="footer-col">
                    <h4>Hola StayNow</h4>
                    <p>Chuyên cho thuê trọ, homestay với giá tốt và dịch vụ tận tâm.</p>
                </div>
                <div class="footer-col">
                    <h4>Liên kết nhanh</h4>
                    <ul>
                        <li><a href="/">Trang chủ</a></li>
                        <li><a href="/listings">Danh sách phòng</a></li>
                        <li><a href="/about">Giới thiệu</a></li>
                        <li><a href="/contact">Liên hệ</a></li>
                    </ul>
                </div>
                <div class="footer-col">
                    <h4>Liên hệ</h4>
                    <p>Địa chỉ: 123 Đường ABC, Quận XYZ, TP.HCM</p>
                    <p>Hotline: <a href="tel:0123456789">0123 456 789</a></p>
                    <p>Email: <a href="mailto:support@holastaynow.com">support@holastaynow.com</a></p>
                </div>
                <div class="footer-col">
                    <h4>Theo dõi chúng tôi</h4>
                    <div class="social-icons">
                        <a href="#"><i class="fa-brands fa-facebook-f"></i></a>
                        <a href="#"><i class="fa-brands fa-instagram"></i></a>
                        <a href="#"><i class="fa-brands fa-twitter"></i></a>
                    </div>
                </div>
            </div>
            <div class="footer-bottom">
                <p>© 2025 Hola StayNow. All Rights Reserved.</p>
            </div>
        </footer>
        <script src="<%= request.getContextPath() %>/js/chatbot.js"></script>
    </body>

</html>