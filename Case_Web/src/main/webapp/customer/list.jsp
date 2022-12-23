<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/23/2022
  Time: 11:43 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customer Details</title>
    <meta charset="UTF-8">
    <%@include file="/interface/css.jsp" %>
</head>
<body>
<div><p class="text-center fs-5">${mess}</p></div>
<div class="container-fluid">
    <p class="text-center fs-2 fw-bold">All Customer Details</p>
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th class="col">No.</th>
            <th class="col">Name</th>
            <th class="col">DOB</th>
            <th class="col">Gender</th>
            <th class="col">ID Card</th>
            <th class="col">Phone Number</th>
            <th class="col">Address</th>
            <th class="col">Email</th>
            <th class="col">Customer Name</th>
            <th class="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="customer" items="${customerList}" varStatus="status">
            <tr>
                <th scope="row"><c:out value="${status.count}"/></th>
                <td><c:out value="${customer.getName()}"/></td>
                <td><c:out value="${customer.getDateOfBirth()}"/></td>
                <td><c:out value="${customer.getGender()}"/></td>
                <td><c:out value="${customer.getIdCard()}"/></td>
                <td><c:out value="${customer.getPhoneNumber()}"/></td>
                <td><c:out value="${customer.getAddress()}"/></td>
                <td><c:out value="${customer.getEmail()}"/></td>
                <td><c:out value="${customer.getCustomerType().getName()}"/></td>
                <td>
                    <a href="" class="btn btn-md btn-outline-secondary"> <i class="fas fa-edit"></i></a>
                    <button onclick="infoDelete('${customer.getId()}','${customer.getName}')"
                            class="btn btn-md btn-danger ms-1 " data-bs-toggle="modal" data-bs-target="#exampleModal"><i
                            class="fas fa-trash-alt"></i></button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<!-- Modal delete-->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete Customer</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/customer?action=delete" method="post">
                <div class="modal-body">
                    <input hidden type="text" id="deleteId" name="deleteId">
                    <span>Do you want to delete </span><span id="deleteName" class="text-danger"></span>?
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                        <button type="submit" class="btn btn-md btn-primary">Delete</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function infoDelete(id, name) {
        document.getElementById("deleteId").values = id;
        document.getElementById("deleteName").innerText = name;
    }
</script>
</body>
</html>
