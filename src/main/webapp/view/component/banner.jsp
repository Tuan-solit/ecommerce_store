<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="homeSlider"
     class="carousel slide"
     data-ride="carousel"
     data-bs-interval="5000">

    <div class="carousel-indicators">
        <button type="button"
                data-bs-target="#homeSlider"
                data-bs-slide-to="0"
                class="active"
                aria-current="true"></button>

        <button type="button"
                data-bs-target="#homeSlider"
                data-bs-slide-to="1"></button>

        <button type="button"
                data-bs-target="#homeSlider"
                data-bs-slide-to="2"></button>
    </div>

    <div class="carousel-inner">

        <div class="carousel-item active">

            <img src="/view/images/banner1.jpg"
                 class="d-block w-100 banner-img">

        </div>

        <div class="carousel-item">

            <img src="/view/images/banner2.jpg"
                 class="d-block w-100 banner-img">

        </div>

        <div class="carousel-item">

            <img src="/view/images/banner3.jpg"
                 class="d-block w-100 banner-img">

        </div>

    </div>

    <a class="carousel-control-prev"
       data-bs-target="#homeSlider"
       data-bs-slide="prev">

        <span class="carousel-control-prev-icon"></span>

    </a>

    <a class="carousel-control-next"
       data-bs-target="#homeSlider"
       data-bs-slide="next">

        <span class="carousel-control-next-icon"></span>

    </a>

</div>