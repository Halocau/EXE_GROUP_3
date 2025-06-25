<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <title>Quản lý tài khoản - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet"/>
        <link href="AdminCSS/css/styles.css" rel="stylesheet"/>
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"/>
        <!-- Thêm SweetAlert2 -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    </head>
    <body class="sb-nav-fixed">

        <!-- Top navbar -->
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand ps-3" href="manage">Admin</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4" id="sidebarToggle"><i class="fas fa-bars"></i></button>
            <ul class="navbar-nav ms-auto">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end">
                        <li><hr class="dropdown-divider"/></li>
                        <li><a class="dropdown-item" href="logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>

        <div id="layoutSidenav">
            <!-- Side nav -->
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="manage"><div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>Account</a>
                            <a class="nav-link" href="selist"><div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>Security List</a>
                            <a class="nav-link" href="rooms"><div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>Room List</a>
                            <a class="nav-link" href="sendemail"><div class="sb-nav-link-icon"><i class="fas fa-envelope"></i></div>Send Email</a>
                            <a class="nav-link" href="approvalVip"><div class="sb-nav-link-icon"><i class="fas fa-check-circle"></i></div>VIP Approval</a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Admin
                    </div>
                </nav>
            </div>

            <!-- Main content -->
            <div id="layoutSidenav_content">
                <main class="container-fluid px-4">
                    <h1 class="mt-4">Quản lý tài khoản</h1>
                    <ol class="breadcrumb mb-4">
                        <li class="breadcrumb-item"><a href="">Manage</a></li>
                        <li class="breadcrumb-item active">Account</li>
                    </ol>

                    <div class="card mb-4">
                        <div class="card-header"><i class="fas fa-table me-1"></i>Account List</div>
                        <div class="card-body">
                            <table id="datatablesSimple" class="table table-striped">
                                <thead>
                                    <tr>
                                        <th>Email</th>
                                        <th>Username</th>
                                        <th>Phone</th>
                                        <th>Role</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="acc" items="${account}">
                                        <tr>
                                            <td>${acc.userMail}</td>
                                            <td>${acc.user.userName}</td>
                                            <td>${acc.user.userPhone}</td>
                                            <td>
                                                <form action="manage" method="post" class="d-inline">
                                                    <input type="hidden" name="email" value="${acc.userMail}"/>
                                                    <select name="role" onchange="this.form.submit()" class="form-select form-select-sm border-0 bg-transparent">
                                                        <option value="0" ${acc.userRole==0?'selected':''}>DeActive</option>
                                                        <option value="1" ${acc.userRole==1?'selected':''}>User</option>
                                                        <option value="2" ${acc.userRole==2?'selected':''}>Renter</option>
                                                        <option value="4" ${acc.userRole==4?'selected':''}>Admin</option>
                                                    </select>
                                                </form>
                                            </td>
                                            <td>
                                                <!-- Edit icon -->
                                                <a href="#" class="me-2" data-bs-toggle="modal" data-bs-target="#editModal"
                                                   data-email="${acc.userMail}" data-password="" data-role="${acc.userRole}">
                                                    <i class="fa-regular fa-pen-to-square"></i>
                                                </a>
                                                <!-- Send Email icon -->
                                                <a href="#" data-bs-toggle="modal" data-bs-target="#emailModal"
                                                   data-email="${acc.userMail}" title="Gửi email">
                                                    <i class="fa-solid fa-envelope-circle-check"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </main>

                <!--=== Edit Account Modal ===-->
                <div class="modal fade" id="editModal" tabindex="-1">
                    <div class="modal-dialog">
                        <form id="editForm" action="edac" method="post" class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Chỉnh sửa tài khoản</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">
                                <div class="mb-3">
                                    <label>Email</label>
                                    <input type="email" name="email" id="editEmail" class="form-control" readonly>
                                </div>
                                <div class="mb-3">
                                    <label>Password</label>
                                    <input type="password" name="password" id="editPassword" class="form-control">
                                </div>
                                <div class="mb-3">
                                    <label>Role</label>
                                    <input type="number" name="role" id="editRole" class="form-control">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-secondary" data-bs-dismiss="modal">Huỷ</button>
                                <button type="submit" class="btn btn-primary">Lưu</button>
                            </div>
                        </form>
                    </div>
                </div>

                <!--=== Send Email Modal ===-->
                <div class="modal fade" id="emailModal" tabindex="-1">
                    <div class="modal-dialog">
                        <form action="sendemail" method="post" class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">Gửi Email Thông Báo</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">
                                <!-- hidden recipient -->
                                <input type="hidden" name="to" id="emailTo">

                                <div class="mb-3">
                                    <label for="emailAction" class="form-label">Loại Email</label>
                                    <select id="emailAction" name="action" class="form-select" required onchange="onEmailTypeChange()">
                                        <option value="">-- Chọn loại --</option>
                                        <option value="vip-confirm">Xác nhận tin VIP</option>
                                        <option value="request-success">Thuê phòng thành công</option>
                                        <option value="host-register">Đăng ký chủ trọ</option>
                                        <option value="feedback">Phản hồi</option>
                                    </select>
                                </div>

                                <div id="extra-vip-confirm" class="mb-3 d-none">
                                    <label class="form-label">Mã VIP</label>
                                    <select name="vipCode" class="form-select">
                                        <option value="">-- Chọn gói VIP --</option>
                                        <option>VIP 1</option>
                                        <option>VIP 2</option>
                                        <option>VIP 3</option>
                                    </select>
                                </div>
                                <div id="extra-request-success" class="mb-3 d-none">
                                    <label class="form-label">Mã phòng</label>
                                    <input type="text" name="roomCode" class="form-control">
                                </div>
                                <div id="extra-host-register" class="mb-3 d-none">
                                    <label class="form-label">Email chủ trọ</label>
                                    <input type="text" name="emailAccount" class="form-control">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-secondary" data-bs-dismiss="modal">Huỷ</button>
                                <button type="submit" class="btn btn-primary">Gửi</button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- footer -->
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">© 2023 Hola StayNow</div>
                            <div>
                                <a href="#">Privacy Policy</a> &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>

        <!-- Scripts -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script>
                                        // Đổ dữ liệu khi bật Edit Modal
                                        var editModal = document.getElementById('editModal');
                                        editModal.addEventListener('show.bs.modal', function (e) {
                                            var btn = e.relatedTarget;
                                            editModal.querySelector('#editEmail').value = btn.getAttribute('data-email');
                                            editModal.querySelector('#editPassword').value = btn.getAttribute('data-password');
                                            editModal.querySelector('#editRole').value = btn.getAttribute('data-role');
                                        });

                                        // Đổ email và reset form trong Send Email Modal
                                        var emailModal = document.getElementById('emailModal');
                                        emailModal.addEventListener('show.bs.modal', function (e) {
                                            var to = e.relatedTarget.getAttribute('data-email');
                                            this.querySelector('#emailTo').value = to;
                                            this.querySelector('form').reset();
                                        });

                                        // Hiện / ẩn input phụ
                                        function onEmailTypeChange() {
                                            document.querySelectorAll('[id^="extra-"]').forEach(el => el.classList.add('d-none'));
                                            var sel = document.getElementById('extra-' + document.getElementById('emailAction').value);
                                            if (sel)
                                                sel.classList.remove('d-none');
                                        }
        </script>
        <script>
            document.addEventListener('DOMContentLoaded', function () {
                const params = new URLSearchParams(window.location.search);

                if (params.has('emailSent')) {
                    Swal.fire({
                        icon: 'success',
                        title: 'Gửi email thành công',
                        timer: 2000,
                        showConfirmButton: false
                    });
                    // Xóa param khỏi URL để không show lại khi reload
                    history.replaceState(null, null, window.location.pathname);
                }

                if (params.has('emailError')) {
                    Swal.fire({
                        icon: 'error',
                        title: 'Gửi email thất bại',
                        text: 'Vui lòng thử lại sau.',
                    });
                    history.replaceState(null, null, window.location.pathname);
                }
            });
        </script>

        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>
        <script src="AdminCSS/js/datatables-simple-demo.js"></script>
        <script src="AdminCSS/js/scripts.js"></script>
    </body>
</html>
