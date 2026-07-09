<%@ page contentType="text/html;charset=UTF-8" %>

<html>

<head>

    <title>Đăng ký</title>

    <jsp:include page="/view/layout/library.jsp"/>

</head>

<body>

<jsp:include page="/view/component/header.jsp"/>

<jsp:include page="/view/component/navbar.jsp"/>

<div class="container mt-5">

    <div class="row justify-content-center">

        <div class="col-md-5">

            <div class="card">

                <div class="card-header">

                    <h3>Đăng ký</h3>

                </div>

                <div class="card-body">

                    <form action="${pageContext.request.contextPath}/register"
                          method="post">

                        <input class="form-control mb-3"
                               name="fullName"
                               placeholder="Họ và tên"
                               value="${fullName}">

                        <input class="form-control mb-3"
                               name="username"
                               placeholder="Tên đăng nhập"
                               value="${username}">

                        <input class="form-control mb-3"
                               name="email"
                               placeholder="Email"
                               value="${email}">

                        <input class="form-control mb-3"
                               name="phone"
                               placeholder="Số điện thoại"
                               value="${phone}">

                        <input class="form-control mb-3"
                               type="password"
                               name="password"
                               placeholder="Mật khẩu">

                        <input class="form-control mb-3"
                               type="password"
                               name="confirmPassword"
                               placeholder="Nhập lại mật khẩu">

                        <button class="btn btn-primary w-100">

                            Đăng ký

                        </button>

                    </form>

                    <br>

                    <span style="color:red">

                        ${message}

                    </span>

                </div>

            </div>

        </div>

    </div>

</div>

</body>

</html>