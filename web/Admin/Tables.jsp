<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8" />
  <link rel="icon" href="favicon.png">
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
  <title>Manage Accounts | Hola StayNow Admin</title>

  <!-- SB Admin CSS + DataTables CSS -->
  <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
  <link href="AdminCSS/css/styles.css" rel="stylesheet" />
  <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

  <style>
    /* Tinh chỉnh nhỏ */
    .table-responsive { margin-top: 1rem; }
    .role-select { width: auto; min-width: 120px; }
    .action-icons a { margin-right: 0.5rem; color: #333; }
    .action-icons a:hover { color: #007bff; }
  </style>
</head>

<body class="sb-nav-fixed">
  <!-- Topbar -->
  <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
    <a class="navbar-brand ps-3" href="manage">Hola StayNow Admin</a>
    <button class="btn btn-link btn-sm order-1 me-4 me-lg-0" id="sidebarToggle"><i class="fas fa-bars"></i></button>
    <ul class="navbar-nav ms-auto me-3 me-lg-4">
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown">
          <i class="fas fa-user fa-fw"></i>
        </a>
        <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
          <li><hr class="dropdown-divider" /></li>
          <li><a class="dropdown-item" href="logout">Logout</a></li>
        </ul>
      </li>
    </ul>
  </nav>

  <div id="layoutSidenav">
    <!-- Sidebar -->
    <div id="layoutSidenav_nav">
      <nav class="sb-sidenav accordion sb-sidenav-dark">
        <div class="sb-sidenav-menu">
          <div class="nav">
            <div class="sb-sidenav-menu-heading">Quản lý</div>
            <a class="nav-link" href="manage">
              <div class="sb-nav-link-icon"><i class="fas fa-user-shield"></i></div>
              Accounts
            </a>
            <a class="nav-link" href="selist">
              <div class="sb-nav-link-icon"><i class="fas fa-user-check"></i></div>
              Security List
            </a>
            <a class="nav-link" href="rooms">
              <div class="sb-nav-link-icon"><i class="fas fa-door-open"></i></div>
              Room List
            </a>
            <a class="nav-link" href="sendemail">
              <div class="sb-nav-link-icon"><i class="fas fa-envelope"></i></div>
              Send Email
            </a>
            <a class="nav-link" href="approvalVip">
              <div class="sb-nav-link-icon"><i class="fas fa-star"></i></div>
              VIP Approval
            </a>
          </div>
        </div>
        <div class="sb-sidenav-footer">
          <div class="small">Logged in as:</div>
          Admin
        </div>
      </nav>
    </div>

    <!-- Main Content -->
    <div id="layoutSidenav_content">
      <main class="container-fluid px-4">
        <h1 class="mt-4">Quản lý tài khoản</h1>
        <ol class="breadcrumb mb-4">
          <li class="breadcrumb-item"><a href="manage">Dashboard</a></li>
          <li class="breadcrumb-item active">Accounts</li>
        </ol>

        <div class="card mb-4">
          <div class="card-header d-flex align-items-center justify-content-between">
            <span><i class="fas fa-table me-1"></i>Danh sách tài khoản</span>
            <button class="btn btn-primary btn-sm" data-bs-toggle="modal" data-bs-target="#addAccountModal">
              <i class="fas fa-plus"></i> Thêm mới
            </button>
          </div>
          <div class="card-body">
            <div class="table-responsive">
              <table id="datatablesSimple" class="table table-striped table-hover">
                <thead class="table-dark">
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
                          <input type="hidden" name="email" value="${acc.userMail}" />
                          <select name="role" class="form-select form-select-sm role-select"
                                  onchange="this.form.submit()">
                            <option value="0" ${acc.userRole == 0 ? 'selected' : ''}>DeActive</option>
                            <option value="1" ${acc.userRole == 1 ? 'selected' : ''}>User</option>
                            <option value="2" ${acc.userRole == 2 ? 'selected' : ''}>Renter</option>
                            <option value="4" ${acc.userRole == 4 ? 'selected' : ''}>Admin</option>
                          </select>
                        </form>
                      </td>
                      <td class="action-icons">
                        <!-- Edit Modal Trigger -->
                        <a href="#" class="text-secondary" title="Edit"
                           data-bs-toggle="modal" data-bs-target="#editModal"
                           data-email="${acc.userMail}">
                          <i class="fas fa-pen"></i>
                        </a>
                        <!-- Deactivate -->
                        <a href="changeRole?email=${acc.userMail}"
                           class="text-danger" title="Deactivate"
                           onclick="return confirm('Bạn chắc chắn muốn khoá tài khoản này?')">
                          <i class="fas fa-user-slash"></i>
                        </a>
                      </td>
                    </tr>
                  </c:forEach>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </main>

      <!-- Edit Account Modal -->
      <div class="modal fade" id="editModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
          <form id="editAccountForm" action="edac" method="post" class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">Chỉnh sửa tài khoản</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
              <div class="mb-3">
                <label for="emailInput" class="form-label">Email</label>
                <input type="email" name="email" id="emailInput" class="form-control" readonly>
              </div>
              <div class="mb-3">
                <label for="passwordInput" class="form-label">Mật khẩu mới</label>
                <input type="password" name="password" id="passwordInput"
                       class="form-control" placeholder="Nhập mật khẩu mới">
              </div>
              <div class="mb-3">
                <label for="roleInput" class="form-label">Role</label>
                <select name="role" id="roleInput" class="form-select">
                  <option value="0">DeActive</option>
                  <option value="1">User</option>
                  <option value="2">Renter</option>
                  <option value="4">Admin</option>
                </select>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Huỷ</button>
              <button type="submit" class="btn btn-primary">Lưu thay đổi</button>
            </div>
          </form>
        </div>
      </div>

      <!-- Add Account Modal -->
      <div class="modal fade" id="addAccountModal" tabindex="-1" aria-hidden="true">
        <div class="modal-dialog">
          <form id="addAccountForm" action="addAccount" method="get" class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">Thêm tài khoản mới</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
              <div class="mb-3">
                <label for="addEmailInput" class="form-label">Email</label>
                <input type="email" name="email" id="addEmailInput"
                       class="form-control" required>
              </div>
              <div class="mb-3">
                <label for="addPasswordInput" class="form-label">Mật khẩu</label>
                <input type="password" name="password" id="addPasswordInput"
                       class="form-control" required>
              </div>
              <div class="mb-3">
                <label for="addRoleInput" class="form-label">Role</label>
                <select name="role" id="addRoleInput" class="form-select" required>
                  <option value="1">User</option>
                  <option value="2">Renter</option>
                  <option value="4">Admin</option>
                </select>
              </div>
            </div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Huỷ</button>
              <button type="submit" class="btn btn-success">Thêm</button>
            </div>
          </form>
        </div>
      </div>

      <!-- Footer -->
      <footer class="py-4 bg-light mt-auto">
        <div class="container-fluid px-4">
          <div class="d-flex align-items-center justify-content-between small">
            <div class="text-muted">&copy; 2024 Hola StayNow</div>
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

  <!-- Scripts -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
  <script src="AdminCSS/js/scripts.js"></script>
  <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"></script>
  <script>
    // Khởi tạo DataTable
    window.addEventListener('DOMContentLoaded', event => {
      const table = document.getElementById('datatablesSimple');
      if (table) new simpleDatatables.DataTable(table);
    });

    // Fill dữ liệu vào form Edit khi bật modal
    const editModal = document.getElementById('editModal');
    editModal.addEventListener('show.bs.modal', event => {
      const btn = event.relatedTarget;
      const email = btn.getAttribute('data-email');
      editModal.querySelector('#emailInput').value = email;
    });
  </script>
</body>
</html>
