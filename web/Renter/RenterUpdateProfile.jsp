<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@page import="model.Rooms, model.User" %>
<%@page import="dao.RoomDAO, dao.RenterDAO, java.util.List,java.util.Vector" %>
<%@page import="model.Room, model.User, model.UserDetail, model.Account" %>
<%@ page import="java.util.Base64" %>
<%@ page import="utils.EnvLoader" %>

<% UserDetail userDetail=(UserDetail) request.getAttribute("userDetail");%>

<!DOCTYPE html>
<html>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" href="images/favicon.png">
        <link rel='stylesheet'
              href='https://cdn.jsdelivr.net/npm/bootstrap@4.4.1/dist/css/bootstrap.min.css'>
        <title>Edit Owner Profile</title>

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Work+Sans:wght@400;500;600;700&display=swap"
            rel="stylesheet">


        <link rel="stylesheet" href="fonts/icomoon/style.css">
        <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">

        <link rel="stylesheet" href="css/tiny-slider.css">
        <link rel="stylesheet" href="css/aos.css">
        <link rel="stylesheet" href="css/style.css">

        <link rel='stylesheet'
              href='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css'>
        <link rel="stylesheet"
              href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
        <link
            href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;700&display=swap"
            rel="stylesheet">
        <style>
            body {
                background: #fff;
                min-height: 100vh;
                font-family: 'Inter', sans-serif;
            }

            .site-nav {
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                margin-left: auto;
                margin-right: auto;
                max-width: 1200px;
                z-index: 1000;
                border-radius: 16px;
                margin-top: 24px;
                box-shadow: 0 4px 24px rgba(80, 80, 160, 0.10);
            }

            .container.main-body {
                margin-top: 140px;
            }

            .card {
                background: #fff;
                border-radius: 24px;
                box-shadow: 0 8px 32px rgba(80, 80, 160, 0.10);
                padding: 32px 24px 24px 24px;
                margin-bottom: 24px;
                border: none;
            }

            .rounded-circle {
                width: 120px;
                height: 120px;
                border-radius: 50%;
                border: 5px solid #fff;
                box-shadow: 0 4px 16px rgba(80, 80, 160, 0.15);
                object-fit: cover;
                margin-bottom: 16px;
            }

            .btn-primary,
            .btn-gradient {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: #fff;
                border: none;
                border-radius: 12px;
                font-weight: 600;
                font-size: 1rem;
                padding: 0.5rem 1.5rem;
                transition: background 0.2s, transform 0.2s;
            }

            .btn-primary:hover,
            .btn-gradient:hover {
                background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
                color: #fff;
                transform: translateY(-2px) scale(1.04);
            }

            .file-input-wrapper button {
                display: inline-block;
            }

            .main-body {
                padding: 32px 0;
            }

            .card-body label,
            .card-body h6 {
                color: #888;
                font-size: 1rem;
                font-weight: 500;
            }

            .card-body input,
            .card-body select {
                font-size: 1.08rem;
                font-weight: 600;
                color: #222;
                border-radius: 8px;
                border: 1px solid #e0e0e0;
                margin-bottom: 8px;
            }

            .card-body input:focus,
            .card-body select:focus {
                border-color: #764ba2;
                box-shadow: 0 0 0 2px #764ba233;
            }

            .list-group-item {
                border: none;
                background: transparent;
                padding-left: 0;
                padding-right: 0;
            }

            .text-secondary a {
                color: #667eea;
                text-decoration: underline;
            }

            .text-secondary a:hover {
                color: #764ba2;
            }

            @media (max-width: 991px) {
                .card {
                    padding: 24px 12px;
                    border-radius: 12px;
                }

                .container.main-body {
                    margin-top: 120px;
                }
            }

            @media (max-width: 767px) {
                .main-body {
                    padding: 8px 0;
                }

                .card {
                    padding: 18px 6px;
                    border-radius: 12px;
                }

                .container.main-body {
                    margin-top: 100px;
                }
            }

            .form-actions {
                display: flex;
                justify-content: flex-end;
                align-items: center;
                gap: 16px;
                margin-top: 24px;
            }

            .custom-file-input {
                display: none;
            }

            .btn-update-avatar {
                background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
                color: #fff;
                border: none;
                border-radius: 12px;
                font-weight: 600;
                font-size: 1rem;
                padding: 0.5rem 1.5rem;
                margin-bottom: 12px;
                margin-top: 12px;
                transition: background 0.2s, transform 0.2s;
                cursor: pointer;
            }

            .btn-update-avatar:hover {
                background: linear-gradient(135deg, #764ba2 0%, #667eea 100%);
                color: #fff;
                transform: translateY(-2px) scale(1.04);
            }
        </style>
    </head>

    <body>
        <div class="container">
            <div class="main-body">

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

                    <div class="row" style="margin-top: 120px;">
                        <div class="col-lg-4">
                            <div class="card">
                                <div class="card-body">
                                    <div class="d-flex flex-column align-items-center text-center">
                                        <form action="UpdateProfileRenterController"
                                              enctype="multipart/form-data" id="imageForm"
                                              method="post">
                                        <% String base64Image=userDetail.getUserAvatar(); %>
                                        <img src="${pageContext.request.contextPath}/${userDetail.getUserAvatar()}
                                             alt="Owner" class="rounded-circle" width="150">
                                        <div class="file-input-wrapper"
                                             style="text-align: center;">
                                            <button type="button" class="btn-update-avatar"
                                                    onclick="document.getElementById('imgInput').click()">Update
                                                avatar</button>
                                            <input type="file" name="img"
                                                   class="custom-file-input" id="imgInput"
                                                   accept="image/*"
                                                   onchange="document.getElementById('imageForm').submit();">
                                            <div class="file-input-info">Kích thước ảnh tối
                                                đa 1mb, định dạng .jpg</div>
                                        </div>
                                        <div class="error-message" id="errorMessage">File
                                            không hợp lệ hoặc quá 1MB.</div>
                                        <div class="mt-3">
                                            <p class="text-secondary mb-1">Image</p>
                                        </div>
                                        <input type="hidden" name="service"
                                               value="updateRenterAvatar">
                                    </form>
                                </div>
                                <hr class="my-4">
                                <ul class="list-group list-group-flush">
                                    <li
                                        class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                        <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg"
                                                              width="24" height="24" viewBox="0 0 24 24"
                                                              fill="none" stroke="currentColor"
                                                              stroke-width="2" stroke-linecap="round"
                                                              stroke-linejoin="round"
                                                              class="feather feather-globe me-2 icon-inline">
                                            <circle cx="12" cy="12" r="10"></circle>
                                            <line x1="2" y1="12" x2="22" y2="12"></line>
                                            <path
                                                d="M12 2a15.3 15.3 0 0 1 4 10 15.3 15.3 0 0 1-4 10 15.3 15.3 0 0 1-4-10 15.3 15.3 0 0 1 4-10z">
                                            </path>
                                            </svg>Website</h6>
                                        <span class="text-secondary">
                                            <%= utils.EnvLoader.get("Origin") %>/HL_Motel/
                                        </span>
                                    </li>
                                    <li
                                        class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                        <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg"
                                                              width="24" height="24" viewBox="0 0 24 24"
                                                              fill="none" stroke="currentColor"
                                                              stroke-width="2" stroke-linecap="round"
                                                              stroke-linejoin="round"
                                                              class="feather feather-github me-2 icon-inline">
                                            <path
                                                d="M9 19c-5 1.5-5-2.5-7-3m14 6v-3.87a3.37 3.37 0 0 0-.94-2.61c3.14-.35 6.44-1.54 6.44-7A5.44 5.44 0 0 0 20 4.77 5.07 5.07 0 0 0 19.91 1S18.73.65 16 2.48a13.38 13.38 0 0 0-7 0C6.27.65 5.09 1 5.09 1A5.07 5.07 0 0 0 5 4.77a5.44 5.44 0 0 0-1.5 3.78c0 5.42 3.3 6.61 6.44 7A3.37 3.37 0 0 0 9 18.13V22">
                                            </path>
                                            </svg>Github</h6>
                                        <span class="text-secondary"><a
                                                href="https://github.com/Phucnhhe170085/SE1803_SWP391_Group5">GIT</a></span>
                                    </li>
                                    <li
                                        class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                        <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg"
                                                              width="24" height="24" viewBox="0 0 24 24"
                                                              fill="none" stroke="currentColor"
                                                              stroke-width="2" stroke-linecap="round"
                                                              stroke-linejoin="round"
                                                              class="feather feather-twitter me-2 icon-inline text-info">
                                            <path
                                                d="M23 3a10.9 10.9 0 0 1-3.14 1.53 4.48 4.48 0 0 0-7.86 3v1A10.66 10.66 0 0 1 3 4s-4 9 5 13a11.64 11.64 0 0 1-7 2c9 5 20 0 20-11.5a4.5 4.5 0 0 0-.08-.83A7.72 7.72 0 0 0 23 3z">
                                            </path>
                                            </svg>Twitter</h6>
                                        <span class="text-secondary"><a
                                                href="https://www.youtube.com/">X</a></span>
                                    </li>
                                    <li
                                        class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                        <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg"
                                                              width="24" height="24" viewBox="0 0 24 24"
                                                              fill="none" stroke="currentColor"
                                                              stroke-width="2" stroke-linecap="round"
                                                              stroke-linejoin="round"
                                                              class="feather feather-instagram me-2 icon-inline text-danger">
                                            <rect x="2" y="2" width="20" height="20" rx="5"
                                                  ry="5"></rect>
                                            <path
                                                d="M16 11.37A4 4 0 1 1 12.63 8 4 4 0 0 1 16 11.37z">
                                            </path>
                                            <line x1="17.5" y1="6.5" x2="17.51" y2="6.5">
                                            </line>
                                            </svg>Instagram</h6>
                                        <span class="text-secondary"><a
                                                href="https://web.telegram.org/">Tele</a></span>
                                    </li>
                                    <li
                                        class="list-group-item d-flex justify-content-between align-items-center flex-wrap">
                                        <h6 class="mb-0"><svg xmlns="http://www.w3.org/2000/svg"
                                                              width="24" height="24" viewBox="0 0 24 24"
                                                              fill="none" stroke="currentColor"
                                                              stroke-width="2" stroke-linecap="round"
                                                              stroke-linejoin="round"
                                                              class="feather feather-facebook me-2 icon-inline text-primary">
                                            <path
                                                d="M18 2h-3a5 5 0 0 0-5 5v3H7v4h3v8h4v-8h3l1-4h-4V7a1 1 0 0 1 1-1h3z">
                                            </path>
                                            </svg>Facebook</h6>
                                        <span class="text-secondary"><a
                                                href="https://www.facebook.com/elfadkeachother">FaceBook</a></span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-8">
                        <div class="card">
                            <form action="UpdateProfileRenterController" method="post">
                                <div class="card-body">
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Full Name</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="text" class="form-control"
                                                   value="<%= userDetail.getUserName()%>"
                                                   name="fullName">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Gender</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <select name="gender" class="form-control">
                                                <option value="Female" <%="Female"
                                                    .equals(userDetail.getUserGender())
                                                    ? "selected" : "" %>>Female</option>
                                                <option value="Male" <%="Male"
                                                    .equals(userDetail.getUserGender())
                                                    ? "selected" : "" %>>Male</option>
                                                <option value="Other" <%="Other"
                                                    .equals(userDetail.getUserGender())
                                                    ? "selected" : "" %>>Other</option>
                                            </select>
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Date of birth</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="date" class="form-control" name="dob"
                                                   value="<%= userDetail.getUserBirth()%>">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Email</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="text" class="form-control" name="email"
                                                   value="<%= userDetail.getUserMail()%>"
                                                   readonly="">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Phone</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="text" class="form-control" name="phone"
                                                   value="<%= userDetail.getUserPhone()%>">
                                        </div>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col-sm-3">
                                            <h6 class="mb-0">Address</h6>
                                        </div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="text" class="form-control"
                                                   name="address"
                                                   value="<%= userDetail.getUserAddress()%>">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="form-actions">
                                                <input type="submit"
                                                       class="btn btn-primary px-4"
                                                       value="Save Changes">
                                                <a href="renterprofile"
                                                   class="btn btn-link">Back To Profile</a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-3"></div>
                                        <div class="col-sm-9 text-secondary">
                                            <input type="hidden" class="btn btn-primary px-4"
                                                   name="service" value="updateProfileRenter">
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <script
        src='https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js'></script>
        <script src="js/bootstrap.bundle.min.js"></script>
        <script src="js/tiny-slider.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/navbar.js"></script>
        <script src="js/counter.js"></script>
        <script src="js/custom.js"></script>
        <script>
                                                       const imgInput = document.getElementById('imgInput');
                                                       const btn = document.querySelector('.file-input-wrapper button');
                                                       const errorMessage = document.getElementById('errorMessage');
                                                       const form = document.getElementById('imageForm');
                                                       const currentImage = document.getElementById('currentImage');

                                                       imgInput.addEventListener('change', function () {
                                                           const file = imgInput.files[0];
                                                           const validImageTypes = ['image/jpeg', 'image/png', 'image/gif'];

                                                           if (file && validImageTypes.includes(file.type) && file.size <= 1048576) {
                                                               btn.textContent = file.name;
                                                               errorMessage.style.display = 'none';
                                                               form.submit();
                                                           } else {
                                                               errorMessage.style.display = 'block';
                                                               imgInput.value = '';
                                                               btn.textContent = 'Chọn ảnh';
                                                           }
                                                       });
        </script>
    </body>
     <script src="<%= request.getContextPath() %>/js/chatbot.js"></script>

</html>