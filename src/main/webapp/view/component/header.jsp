<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <c:import url="/view/layout/library.jsp"/>
</head>
<body>
<div class="top-header">

    <div class="container">

        <div class="row align-items-center">

            <!-- Logo -->

            <div class="col-md-3">

                <a href="/">

                    <img src="/view/images/logo.png"
                         class="logo"
                         alt="Logo">

                </a>

            </div>

            <!-- Search -->

            <div class="col-md-5">

                <form>

                    <div class="input-group">

                        <input type="text"
                               class="form-control"
                               placeholder="Nhập tên sản phẩm, mã sản phẩm cần tìm...">

                            <button class="btn btn-warning" type="submit">

                                <i class="fas fa-search"></i>

                            </button>

                    </div>

                </form>

            </div>

            <!-- Right -->

            <div class="col-md-4">

                <div class="header-right">

                    <a href="#">
                        <i class="fas fa-user"></i>
                        Đăng nhập
                    </a>

                    <a href="#">
                        <i class="fas fa-user-plus"></i>
                        Đăng ký
                    </a>

                    <a href="#">
                        <i class="fas fa-shopping-cart"></i>
                        Giỏ hàng
                    </a>

                </div>

            </div>

        </div>

    </div>

</div>
</body>
</html>
