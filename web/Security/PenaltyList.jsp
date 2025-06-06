<%-- 
    Document   : roomTable
    Created on : 27 thg 5, 2024, 11:02:30
    Author     : Admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>Tables - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="SecurityCSS/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <script type = ></script>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="chartServlet">Security</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">

            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><hr class="dropdown-divider" /></li>
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
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="chartServlet">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                Dashboard
                            </a>
                            <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="shift">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Shift
                            </a>
                            <a class="nav-link" href="dbrenter">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Renter List
                            </a>
                            <a class="nav-link" href="dbroom">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Room List
                            </a>
                            <a class="nav-link" href="pen">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Penalty List
                            </a>
                            <a class="nav-link" href="newlist">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                News
                            </a>
                            <a class="nav-link" href="rule">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Rule
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        Security
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Penalty List</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item"><a href="chartServlet">Dashboard</a></li>
                            <li class="breadcrumb-item active">Tables</li>
                        </ol>

                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table me-1"></i>
                                Penalty List
                            </div>
                            <div class="card-body">
                                <a href="import" class="btn btn-primary">Add new penalty</a>
                                <br>
                                <table id="datatablesSimple">
                                    <thead>
                                        <tr>
                                            <th>Pen ID</th>
                                            <th>Room</th>
                                            <th>Description</th>
                                            <th>Date</th>
                                            <th>Rule</th>
                                            <th>Status</th>
                                            <th> </th>
                                            <th> </th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Pen ID</th>
                                            <th>Room</th>
                                            <th>Description</th>
                                            <th>Date</th>
                                            <th>Rule</th>
                                            <th>Status</th>
                                            <th> </th>
                                            <th> </th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <c:forEach var="o" items="${list}">
                                            <tr>

                                                <td>${o.penId}</td>
                                                <td>${o.roomNumber}</td>
                                                <td>${o.description}</td>
                                                <td>${o.penDate}</td>
                                                <td>${o.ruleName}</td>
                                                <c:choose>
                                                    <c:when test="${o.penStatus == 1}">
                                                        <td>Penalty</td>
                                                    </c:when>
                                                    <c:when test="${o.penStatus == 0}">
                                                        <td>Waiting</td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td>Removed</td>
                                                    </c:otherwise>
                                                </c:choose>

                                                <th><a href="updatepen?id=${o.penId}">Update</a></th>
<!--                                                <th><a href="delete?id=${o.penId}">Delete</a></th>-->
                                                <th><a href="javascript:confirmDelete(${o.penId})">Delete</a></th>
                                                <script>
                                                        function confirmDelete(penId) {
                                                          if (confirm("Are you sure you want to delete this record?")) {
                                                            window.location.href = "delete?id=" + penId;
                                                          }
                                                        }
                                                      </script>
                                            </tr>
                                        </c:forEach>

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="SecurityCSS/js/scripts.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="SecurityCSS/js/datatables-simple-demo.js"></script>
    </body>
</html>
