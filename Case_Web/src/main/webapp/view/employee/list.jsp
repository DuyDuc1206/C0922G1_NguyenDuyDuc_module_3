<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/5/2023
  Time: 4:02 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Employee Details</title>
    <%@include file="/view/interface/css.jsp" %>
</head>
<body>
<%@include file="/view/interface/header.jsp" %>

<div class="container mt-2">
    <div class="row col-md-2">
        <button class="btn btn-outline-primary">Add Employee <i class="fas fa-plus"></i></button>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <p class="text-center fs-2 fw-bold ">All Employee Details</p>
    </div>
    <div class="row">
        <table id="tableEmployee" class="table table-bordered table-striped">
            <thead>
            <tr>
                <th class="col">No.</th>
                <th class="col">Name</th>
                <th class="col">DOB</th>
                <th class="col">ID Card</th>
                <th class="col">Salary</th>
                <th class="col">Phone Number</th>
                <th class="col">Email</th>
                <th class="col">Address</th>
                <th class="col">Position Name</th>
                <th class="col">Education Degree Name</th>
                <th class="col">Division Name</th>
                <th class="col">User Name</th>
                <th class="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="employee" items="${employeeList}" varStatus="status">
                <tr>
                    <th scope="row">${status.count}</th>
                    <td>${employee.name}</td>
                    <td>${employee.dateOfBirth}</td>
                    <td>${employee.idCard}</td>
                    <td>${employee.salary}</td>
                    <td>${employee.phoneNumber}</td>
                    <td>${employee.email}</td>
                    <td>${employee.address}</td>
                    <td>${employee.getPosition().getName()}</td>
                    <td>${employee.getEducationDegree().getName()}</td>
                    <td>${employee.getDivision().getName()}</td>
                    <td>${employee.getUser().getUserName()}</td>
                    <td>
                        <button class="btn btn-outline-secondary"><i class="fas fa-edit"></i></button>
                        <button class="btn btn-outline-danger ms-1"><i
                                class="fas fa-trash-alt"></i></button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableEmployee').dataTable({
            "dom": 'frtlip',
            "lengthChange": false,
            "pageLength": 10,
            "bInfo": false,
            // "scrollX":true
        });
    });
</script>
<%@include file="/view/interface/footer.jsp" %>
</body>
</html>
