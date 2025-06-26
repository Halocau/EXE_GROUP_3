<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8"/>
        <title>Quản lý tài khoản – Hola StayNow Admin</title>

        <!-- Bootstrap 5 -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"/>

        <!-- Simple-DataTables -->
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet"/>

        <!-- FontAwesome & SweetAlert2 -->
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

        <!-- Custom SB Admin CSS -->
        <link href="AdminCSS/css/styles.css" rel="stylesheet"/>

        <style>
            /* Thêm một chút spacing cho table */
            .dataTable-wrapper .table-striped tbody tr:hover {
                background-color: rgba(0,123,255,0.05);
            }
            .navbar-brand {
                font-weight: 600;
            }
        </style>
    </head>
    <body class="sb-nav-fixed">

        <!-- Top navbar -->
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand ps-3" href="manage">Hola StayNow</a>
            <button class="btn btn-link btn-sm order-1 me-4 me-lg-0" id="sidebarToggle"><i class="fas fa-bars"></i></button>
            <ul class="navbar-nav ms-auto me-3">
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
                            <a class="nav-link" href="approvalVip">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                VIP Approval
                            </a>
                            <a class="nav-link" href="owner-statics">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Owner Statics
                            </a>

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
                        <li class="breadcrumb-item"><a href="manage">Dashboard</a></li>
                        <li class="breadcrumb-item active">Accounts</li>
                    </ol>

                    <div class="card mb-4 shadow-sm">
                        <div class="card-header bg-primary text-white">
                            <i class="fas fa-table me-1"></i> Danh sách tài khoản
                        </div>
                        <div class="card-body">
                            <table id="datatablesSimple" class="table table-striped table-hover align-middle">
                                <thead class="table-light">
                                    <tr>
                                        <th>Email</th>
                                        <th>Username</th>
                                        <th>Phone</th>
                                        <th>Role</th>
                                        <th>Vip</th> <!-- Cột Vip -->
                                        <th style="width:120px">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="acc" items="${account}">
                                        <tr>
                                            <td>${acc.userMail}</td>
                                            <td>${acc.userPassword}</td>
                                            <td>
                                                <c:if test="${acc.userRole == 1}">
                                                    Renter
                                                </c:if>
                                                <c:if test="${acc.userRole == 2}">
                                                    Owner
                                                </c:if>
                                                <c:if test="${acc.userRole == 3}">
                                                    Security
                                                </c:if>
                                                <c:if test="${acc.userRole == 4}">
                                                    Admin
                                                </c:if>
                                                <c:if test="${acc.userRole == 0}">
                                                    DeActive
                                                </c:if>
                                            </td>

                                            <td>
                                                <form action="manage" method="post" class="d-inline">
                                                    <input type="hidden" name="email" value="${acc.userMail}"/>
                                                    <select name="vipId" onchange="this.form.submit()" 
                                                            class="form-select form-select-sm border-0 bg-transparent p-0">
                                                        <option value="0" ${acc.user.vipId == 0 ? 'selected' : ''}>None</option>
                                                        <option value="1" ${acc.user.vipId == 1 ? 'selected' : ''}>VIP 1</option>
                                                        <option value="2" ${acc.user.vipId == 2 ? 'selected' : ''}>VIP 2</option>
                                                        <option value="3" ${acc.user.vipId == 3 ? 'selected' : ''}>VIP 3</option>
                                                    </select>
                                                </form>
                                            </td>
                                            <td>
                                                <!-- Edit -->
                                                <a href="#" class="text-primary me-2" data-bs-toggle="modal" data-bs-target="#editModal"
                                                   data-email="${acc.userMail}" data-password="" data-role="${acc.userRole}">
                                                    <i class="fas fa-edit"></i>
                                                </a>
                                                <!-- Send Email -->
                                                <a href="#" class="text-success" data-bs-toggle="modal" data-bs-target="#emailModal"
                                                   data-email="${acc.userMail}" title="Gửi email">
                                                    <i class="fas fa-envelope"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </main>

                <!-- Edit Account Modal -->
                <div class="modal fade" id="editModal" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered">
                        <form id="editForm" action="edac" method="post" class="modal-content">
                            <div class="modal-header bg-secondary text-white">
                                <h5 class="modal-title">Chỉnh sửa tài khoản</h5>
                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
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
                                <button class="btn btn-outline-secondary" data-bs-dismiss="modal">Huỷ</button>
                                <button type="submit" class="btn btn-primary">Lưu</button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Send Email Modal -->
                <div class="modal fade" id="emailModal" tabindex="-1">
                    <div class="modal-dialog modal-dialog-centered">
                        <form action="sendemail" method="post" class="modal-content">
                            <div class="modal-header bg-success text-white">
                                <h5 class="modal-title">Gửi Email Thông Báo</h5>
                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                            </div>
                            <div class="modal-body">
                                <input type="hidden" name="to" id="emailTo">
                                <div class="mb-3">
                                    <label class="form-label">Loại Email</label>
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
                                    <input type="email" name="emailAccount" class="form-control">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button class="btn btn-outline-secondary" data-bs-dismiss="modal">Huỷ</button>
                                <button type="submit" class="btn btn-success">Gửi</button>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- Footer -->
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

        <!-- Bootstrap & DataTables scripts -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>
        <script src="AdminCSS/js/datatables-simple-demo.js"></script>
        <script src="AdminCSS/js/scripts.js"></script>

        <script>
                                        // Modal Edit: điền dữ liệu
                                        var editModal = document.getElementById('editModal');
                                        editModal.addEventListener('show.bs.modal', function (e) {
                                            var btn = e.relatedTarget;
                                            editModal.querySelector('#editEmail').value = btn.getAttribute('data-email');
                                            editModal.querySelector('#editPassword').value = btn.getAttribute('data-password');
                                            editModal.querySelector('#editRole').value = btn.getAttribute('data-role');
                                        });

                                        // Modal Email: gán recipient & reset phụ kiện
                                        var emailModal = document.getElementById('emailModal');
                                        emailModal.addEventListener('show.bs.modal', function (e) {
                                            var to = e.relatedTarget.getAttribute('data-email');
                                            this.querySelector('#emailTo').value = to;
                                            this.querySelector('#emailAction').value = '';
                                            onEmailTypeChange();
                                        });

                                        // Hiện/ẩn input phụ
                                        function onEmailTypeChange() {
                                            document.querySelectorAll('[id^="extra-"]').forEach(el => el.classList.add('d-none'));
                                            var sel = document.getElementById('extra-' + document.getElementById('emailAction').value);
                                            if (sel)
                                                sel.classList.remove('d-none');
                                        }

                                        // SweetAlert2 thông báo kết quả gửi email
                                        document.addEventListener('DOMContentLoaded', function () {
                                            const params = new URLSearchParams(window.location.search);
                                            if (params.has('emailSent')) {
                                                Swal.fire({icon: 'success', title: 'Gửi email thành công', timer: 2000, showConfirmButton: false});
                                                history.replaceState(null, null, window.location.pathname);
                                            }
                                            if (params.has('emailError')) {
                                                Swal.fire({icon: 'error', title: 'Gửi email thất bại', text: 'Vui lòng thử lại sau.'});
                                                history.replaceState(null, null, window.location.pathname);
                                            }
                                        });
        </script>
    </body>
</html>
