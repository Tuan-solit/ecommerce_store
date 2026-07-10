<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
    <title>Đăng nhập</title>

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/view/css/style.css">
</head>

<body>

<jsp:include page="/view/component/header.jsp"/>

<jsp:include page="/view/component/navbar.jsp"/>

<div class="container mt-5">

    <div class="row justify-content-center">

        <div class="col-md-4">

            <div class="card">

                <div class="card-header">
                    Đăng nhập
                </div>

                <div class="card-body">

                    <form action="${pageContext.request.contextPath}/login"
                          method="post">

                        <div class="mb-3">
                            <label>Tài khoản</label>
                            <input class="form-control"
                                   type="text"
                                   name="username"
                                   value="${username}">

                            <small class="text-danger">
                                ${usernameError}
                            </small>
                        </div>

                        <div class="mb-3">
                            <label>Mật khẩu</label>
                            <input class="form-control"
                                   type="password"
                                   name="password">

                            <small class="text-danger">
                                ${passwordError}
                            </small>
                        </div>

                        <button class="btn btn-primary w-100">
                            Đăng nhập
                        </button>

                    </form>
                    <p style="color:red">
                        ${loginError}
                    </p>

                </div>

            </div>

        </div>

    </div>

</div>

<jsp:include page="/view/component/footer.jsp"/>

<c:if test="${param.success == '1'}">

    <div class="toast-container position-fixed top-0 end-0 p-3">

        <div id="successToast"
             class="toast text-bg-success border-0">

            <div class="d-flex">

                <div class="toast-body">

                    Đăng ký thành công! Vui lòng đăng nhập.

                </div>

                <button
                        type="button"
                        class="btn-close btn-close-white me-2 m-auto"
                        data-bs-dismiss="toast">
                </button>

            </div>

        </div>

    </div>

    <script>

        document.addEventListener("DOMContentLoaded", function () {

            let toast = new bootstrap.Toast(
                document.getElementById("successToast"),
                {
                    delay:3000
                });

            toast.show();

        });

    </script>

</c:if>

</body>
</html>