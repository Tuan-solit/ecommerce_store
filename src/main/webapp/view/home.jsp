<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<c:import url="component/header.jsp"/>
<c:import url="component/navbar.jsp"/>
<div class="container">

    <div class="row">

        <div class="col-lg-3">

            <c:import url="component/sidebar.jsp"/>
        </div>

        <div class="col-lg-9">

            <c:import url="component/banner.jsp"/>

        </div>

    </div>

<div class="row">
    <c:import url="component/product-card.jsp"/>
    <c:import url="component/product-card.jsp"/>
    <c:import url="component/product-card.jsp"/>
    <c:import url="component/product-card.jsp"/>
</div>
</div>
<c:import url="component/footer.jsp"/>

<c:if test="${not empty successMessage}">

    <div class="toast-container position-fixed top-0 end-0 p-3">

        <div id="loginToast"
             class="toast text-bg-success border-0">

            <div class="d-flex">

                <div class="toast-body">

                        ${successMessage}

                </div>

                <button class="btn-close btn-close-white me-2 m-auto"
                        data-bs-dismiss="toast">
                </button>

            </div>

        </div>

    </div>

    <script>

        document.addEventListener("DOMContentLoaded", function () {

            const toast = new bootstrap.Toast(
                document.getElementById("loginToast"),
                {
                    delay:3000
                });

            toast.show();

        });

    </script>

</c:if>
</body>
</html>
