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
</body>
</html>
