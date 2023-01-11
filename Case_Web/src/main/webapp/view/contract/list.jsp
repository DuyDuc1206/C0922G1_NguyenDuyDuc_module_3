<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/9/2023
  Time: 9:54 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Contract Details</title>
    <meta charset="UTF-8">
    <%@include file="/view/interface/css.jsp" %>
</head>
<body>
<%@include file="/view/interface/header.jsp" %>

<div class="container">
    <p class="text-center fs-2 fw-bold">All Contract Details</p>
    <table class="table table-striped table-bordered">
        <thead>
        <tr>
            <th class="col">No.</th>
            <th class="col">Service</th>
            <th class="col">Employee</th>
            <th class="col">Start Date</th>
            <th class="col">End Date</th>
            <th class="col">Deposit</th>
            <th class="col">Cost</th>
            <th class="col">Action</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="contract" items="${contractList}" varStatus="status">
        <tr>
            <th scope="row">${status.count}</th>
            <td>${contract.getFacility().getName()}</td>
            <td>${contract.getCustomer().getName()}</td>
            <td>${contract.getStartDate()}</td>
            <td>${contract.getEndDate()}</td>
            <td>${contract.getDeposit()}</td>
            <td></td>
            <td class="text-center">
                <button class="btn btn-md btn-outline-primary"><i class="fas fa-plus"></i></button>
                <button class="btn btn-md btn-outline-primary ms-2">List Attach Facility</button>
            </td>
        </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<%@include file="/view/interface/footer.jsp" %></body>
</html>
