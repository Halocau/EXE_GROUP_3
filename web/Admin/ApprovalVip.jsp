<%-- Document : roomTable Created on : 27 thg 5, 2024, 11:02:30 Author : Admin --%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
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
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Tables</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="">Manage</a></li>
                            <li class="breadcrumb-item active">Account</li>
                        </ol>

                        <ul class="nav nav-tabs mb-3" id="adminTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="room-tab" data-bs-toggle="tab" data-bs-target="#room" type="button" role="tab" aria-controls="room" aria-selected="true">Room List</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="login-tab" data-bs-toggle="tab" data-bs-target="#login" type="button" role="tab" aria-controls="login" aria-selected="false">User Login Stats</button>
                            </li>
                        </ul>
                        <div class="tab-content" id="adminTabContent">
                            <div class="tab-pane fade show active" id="room" role="tabpanel" aria-labelledby="room-tab">
                                <!-- Toàn bộ phần bảng cũ để ở đây -->
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-table me-1"></i>
                                        Manage Account
                                    </div>
                                    <div class="card-body">
                                        <br>
                                        <table id="datatablesSimple" class="table table-bordered">
                                            <thead>
                                                <tr>
                                                    <th>Room ID</th>
                                                    <th>Floor</th>
                                                    <th>Room Number</th>
                                                    <th>Size (m²)</th>
                                                    <th>Price</th>
                                                    <th>Image</th>
                                                    <th>Status</th>
                                                    <th>Occupants</th>
                                                    <th>Department</th>
                                                    <th>Active</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="room" items="${rooms}">
                                                    <tr>
                                                        <td>${room.roomID}</td>
                                                        <td>${room.roomFloor}</td>
                                                        <td>${room.roomNumber}</td>
                                                        <td>${room.roomSize}</td>
                                                        <td>${room.roomFee}</td>
                                                        <td>
                                                            <img src="${pageContext.request.contextPath}/Image/Room/${room.roomImg}"
                                                                 alt="Room Image" width="100">
                                                        </td>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${room.roomStatus == 0}">Chưa thuê</c:when>
                                                                <c:when test="${room.roomStatus == 1}">Đã thuê</c:when>
                                                                <c:when test="${room.roomStatus == 2}">Chờ duyệt</c:when>
                                                                <c:when test="${room.roomStatus == 3}">Lên VIP</c:when>
                                                                <c:otherwise>Vacant</c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                        <td>${room.roomOccupant}</td>
                                                        <td>${room.roomDepartment}</td>
                                                        <td>
                                                            <form method="post" action="${pageContext.request.contextPath}/approvalVip" style="display:inline;">
                                                                <input type="hidden" name="roomID" value="${room.roomID}" />
                                                                <input type="hidden" name="roomStatus" value="3" />
                                                                <button type="submit" class="btn btn-sm btn-success">
                                                                    Approve
                                                                </button>
                                                            </form>
                                                            <form method="post" action="${pageContext.request.contextPath}/approvalVip" style="display:inline; margin-left:5px;">
                                                                <input type="hidden" name="roomID" value="${room.roomID}" />
                                                                <input type="hidden" name="roomStatus" value="1" />
                                                                <button type="submit" class="btn btn-sm btn-danger">
                                                                    Reject
                                                                </button>
                                                            </form>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="login" role="tabpanel" aria-labelledby="login-tab">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-bar me-1"></i>
                                        User Login Statistics (Fake Data)
                                    </div>
                                    <div class="card-body">
                                        <canvas id="loginChart" height="100"></canvas>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal fade" id="editModal" tabindex="-1" role="dialog"
                         aria-labelledby="editModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="editModalLabel">Edit Account</h5>
                                    <button type="button" class="close" data-bs-dismiss="modal"
                                            aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <c:if test="${not empty errorMessage}">
                                        <div class="alert alert-danger">${errorMessage}</div>
                                    </c:if>
                                    <form id="editAccountForm" action="edac" method="post">
                                        <div class="form-group">
                                            <label for="emailInput">Email address</label>
                                            <input type="email" name="email" class="form-control"
                                                   id="emailInput" aria-describedby="emailHelp">
                                            <label for="passwordInput">Pasword:</label>
                                            <input type="password" name="password" placeholder="Abcdefg1"
                                                   class="form-control" id="passwordInput"
                                                   aria-describedby="emailHelp" required><!-- comment -->
                                            <label for="roleInput">Role:</label>
                                            <input type="number" name="role" placeholder="Role: 1,2,3"
                                                   class="form-control" id="roleInput" aria-describedby="emailHelp"
                                                   required><br>
                                            <input type="submit" value="Save" name="save" />
                                        </div>
                                        <!-- Additional form fields can go here -->
                                    </form>
                                </div>

                            </div>
                        </div>
                    </div>

                    <!-- Add Account Modal -->
                    <div class="modal fade" id="addAccountModal" tabindex="-1" role="dialog"
                         aria-labelledby="addAccountModalLabel" aria-hidden="true">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="addAccountModalLabel">Add Account</h5>
                                    <button type="button" class="close" data-bs-dismiss="modal"
                                            aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form id="addAccountForm" action="addAccount" method="get">
                                        <div class="form-group">
                                            <label for="addEmailInput">Email address</label>
                                            <input type="email" name="email" class="form-control"
                                                   id="addEmailInput" aria-describedby="emailHelp" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="addPasswordInput">Password</label>
                                            <input type="password" name="password" placeholder="Abcdefg1"
                                                   class="form-control" id="addPasswordInput"
                                                   aria-describedby="emailHelp" required>
                                        </div>
                                        <div class="form-group">
                                            <label for="addRoleInput">Role</label>
                                            <input type="number" name="role" placeholder="Role: 1,2,3"
                                                   class="form-control" id="addRoleInput"
                                                   aria-describedby="emailHelp" required>
                                        </div>
                                        <button type="submit" value="Add" name="add" class="btn btn-primary"
                                                style="width: 70px">Add</button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- js modal -->
                    <script>
                        <% if (request.getAttribute("errorMessage") != null) { %>
                        $('#editModal').modal('show');
                        <% } %>

                        $(document).ready(function () {
                            $('#editModal').on('show.bs.modal', function (event) {
                                var button = $(event.relatedTarget); // Button that triggered the modal
                                var email = button.data('email'); // Extract email from data-* attributes
                                var password = button.data('password'); // Extract password from data-* attributes
                                var role = button.data('role'); // Extract role from data-* attributes

                                var modal = $(this);
                                modal.find('.modal-body #emailInput').val(email); // Populate the email input field
                                modal.find('.modal-body #passwordInput').val(password); // Populate the password input field
                                modal.find('.modal-body #roleInput').val(role); // Populate the role input field
                            });
                            $('#addAccountModal').on('show.bs.modal', function (event) {
                                var modal = $(this);
                                modal.find('.modal-body').find('input').val('');
                            });
                        });
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
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    crossorigin="anonymous"></script>
    <script src="AdminCSS/js/scripts.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js"
    crossorigin="anonymous"></script>
    <script src="AdminCSS/js/datatables-simple-demo.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
    document.addEventListener('DOMContentLoaded', function () {
        // Fake data cho 30 ngày
        const days = Array.from({length: 30}, (_, i) => 'Day ' + (i + 1));
        const loginCounts = [12, 15, 18, 20, 17, 14, 19, 22, 25, 21, 18, 16, 20, 23, 19, 17, 21, 24, 22, 20, 18, 19, 21, 23, 25, 22, 20, 18, 17, 19];

        const ctx = document.getElementById('loginChart').getContext('2d');
        new Chart(ctx, {
            type: 'line',
            data: {
                labels: days,
                datasets: [{
                    label: 'Number of user logins',
                    data: loginCounts,
                    borderColor: 'rgb(54, 162, 235)',
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    tension: 0.3,
                    fill: true
                }]
            },
            options: {
                responsive: true,
                plugins: {
                    title: {
                        display: true,
                        text: 'User Login Per Day (Fake Data)'
                    },
                    legend: {
                        display: true,
                        position: 'top'
                    }
                },
                scales: {
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: 'Number of logins'
                        }
                    },
                    x: {
                        title: {
                            display: true,
                            text: 'Day'
                        }
                    }
                }
            }
        });
    });
    </script>

</body>

</html>