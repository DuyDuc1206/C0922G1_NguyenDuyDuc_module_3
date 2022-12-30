<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/30/2022
  Time: 10:50 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customer List</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <style>
        img {
            height: 100px;
            width: 100px;
        }
    </style>
</head>
<body>

<div class="container ">
    <div class="row">
        <h2 class="text-center">List Customer</h2>
    </div>
    <table class="table table-striped justify-content-center align-items-center">
        <thead>
        <tr>
            <th scope="col">STT</th>
            <th scope="col">Name</th>
            <th scope="col">DOB</th>
            <th scope="col">Address</th>
            <th scope="col">Image</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="customer" items="${customerList}" varStatus="status">
            <tr>
                <th scope="row">${status.count}</th>
                <td>${customer.name}</td>
                <td>${customer.date}</td>
                <td>${customer.address}</td>
                <td><img src="${customer.image}" alt="img" style=""></td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</html>
