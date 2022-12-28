<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Home</title>
    <%@include file="css.jsp" %>
</head>
<body>
<%@include file="header.jsp" %>
<%@include file="navbar.jsp" %>
<div class="row container-fluid ">
    <div class="col-lg-3 " >
        <ul class="list-group">
            <li class="list-group-item active" aria-current="true"
                style="text-align: center; background-color: #046056">Products
            </li>
            <li class="list-group-item">A first item</li>
            <li class="list-group-item">A second item</li>
            <li class="list-group-item">A third item</li>
            <li class="list-group-item">And a fourth one</li>
        </ul>
    </div>
    <div id="carouselExampleIndicators" class="carousel slide col-lg-9" data-bs-ride="carousel">
        <div class="carousel-indicators">
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"
                    aria-current="true" aria-label="Slide 1"></button>
            <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1"
                    aria-label="Slide 2"></button>
        </div>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img src="https://furamavietnam.com/wp-content/uploads/2018/10/Vietnam_Danang_Furama_Resort_Exterior_Courtyard-1.jpg"
                     class="d-block w-100" alt="...">
            </div>
            <div class="carousel-item">
                <img src="https://danangfantasticity.com/wp-content/uploads/2015/12/furama-resort-da-nang-thumb.jpg"
                     class="d-block w-100" alt="...">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Previous</span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="visually-hidden">Next</span>
        </button>
    </div>
    <div class="container" style="background-color: #f4f4ef">
        <div class="m-5">
            <p class="text-center fs-2">WHAT YOU WILL VISIT</p>
        </div>
        <div class="row row-cols-1 row-cols-md-3 g-4 my-4">
            <div class="col">
                <div class="card h-100 p-4">
                    <img src="https://cdn.vntrip.vn/cam-nang/wp-content/uploads/2020/06/Review-Furama-Resort-Da-Nang-13.jpg"
                         class="card-img-top" alt="img1" style="height: 100%">
                    <div class="card-body">
                        <h5 class="card-title">Phòng Suite hướng biển</h5>
                        <p class="card-text">Diện tích 80m2.</p>
                    </div>
                    <div class="card-footer">
                        <small class="text-muted">Còn phòng </small>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card h-100 p-4" >
                    <img src="https://vietpowertravel.com.vn/data/images/furama%20resort%202.jpg"
                         class="card-img-top" alt="img3"style="height: 100%">
                    <div class="card-body">
                        <h5 class="card-title">Phòng studio suite hướng biển</h5>
                        <p class="card-text">Diện tích 100m2.</p>
                    </div>
                    <div class="card-footer">
                        <small class="text-muted">Còn phòng </small>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="card h-100 p-4">
                    <img src="https://thodiavn24h.com/wp-content/uploads/2020/05/toan-canh-furama-resort-danang-1.jpg"
                         class="card-img-top" alt="img3"style="height: 100%">
                    <div class="card-body">
                        <h5 class="card-title">Phòng Deluxe hướng biển</h5>
                        <p class="card-text">Diện tích 150m2.</p>
                    </div>
                    <div class="card-footer">
                        <small class="text-muted">Còn phòng </small>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@include file="footer.jsp" %>
</body>
</html>
