<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="col-md-2 sidebar">

    <div class="logo">

        <i class="fa-solid fa-laptop"></i>

        <span>T2 Shop</span>

    </div>

    <ul class="nav flex-column mt-4">

        <li class="nav-item">

            <a href="/admin/dashboard"
               class="nav-link">

                <i class="fa-solid fa-chart-line"></i>

                Dashboard

            </a>

        </li>

        <li class="nav-item">

            <a href="/admin/product"
               class="nav-link">

                <i class="fa-solid fa-box"></i>

                Product

            </a>

        </li>
        
        <li class="nav-item">

            <a href="/admin/category"
               class="nav-link">

                <i class="fa-solid fa-layer-group"></i>

                Category

            </a>

        </li>

        

        <li class="nav-item">

            <a href="/admin/order"
               class="nav-link">

                <i class="fa-solid fa-cart-shopping"></i>

                Order

            </a>

        </li>

        <li class="nav-item mt-5">

            <a href="/logout"
               class="nav-link text-danger">

                <i class="fa-solid fa-right-from-bracket"></i>

                Logout

            </a>

        </li>

    </ul>

</div>
