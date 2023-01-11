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
<div class="container">
    <p id="mess" class="text-center text-danger fs-2 ">${mess}</p>
</div>
<div class="container mt-2">
    <div class="row justify-content-between">
        <div class="col-md-2">
            <button class="btn btn-outline-primary " data-bs-toggle="modal" data-bs-target="#addEmployee">Add Employee <i
                    class="fas fa-plus"></i></button>
        </div>
        <div class="col-md-6">
            <form action="/employee?action=search" method="post" class="d-flex">
                <input class="form-control " type="text" placeholder="Search Address" aria-label="search" name="address">
                <input class="form-control ms-2 " type="text" placeholder="Search Name" aria-label="search" name="name">
                <select name="positionId" class="ms-2 col-md-3">
                    <option value="" >Search Position</option>
                    <c:forEach var="position" items="${positionList}">
                        <option value="${position.getId()}">${position.getName()}</option>
                    </c:forEach>
                </select>
                <button class="btn btn-md btn-outline-secondary ms-2 col-md-3">Search</button>
            </form>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <p class="text-center fs-2 fw-bold ">All Employee Details</p>
    </div>
    <div class="row table-responsive">
        <table class="table table-bordered table-striped align-middle ">
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
                        <button onclick="infoEdit('${employee.getId()}','${employee.getName()}','${employee.getDateOfBirth()}',
                                '${employee.getIdCard()}','${employee.getSalary()}','${employee.getPhoneNumber()}','${employee.getEmail()}',
                                '${employee.getAddress()}','${employee.getPosition().getId()}','${employee.getEducationDegree().getId()}',
                                '${employee.getDivision().getId()}','${employee.getUser().getUserName()}')"
                                class="btn btn-md btn-outline-secondary" data-bs-toggle="modal"
                                data-bs-target="#editEmployee"><i class="fas fa-edit"></i></button>
                        <button onclick="infoDelete('${employee.getId()}','${employee.getName()}')"
                                class="btn btn-md btn-outline-danger ms-1" data-bs-toggle="modal"
                                data-bs-target="#deleteEmployee"><i
                                class="fas fa-trash-alt"></i></button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Modal delete-->
<div class="modal fade" id="deleteEmployee" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete Employee</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/employee?action=delete" method="post">
                <div class="modal-body">
                    <input hidden type="text" id="deleteId" name="deleteId">
                    <span>Do you want to delete </span><span id="deleteName" class="text-danger"></span> ?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-md btn-primary">Delete</button>
                </div>
            </form>
        </div>
    </div>
</div>

<!-- Modal edit-->
<div class="modal fade" id="editEmployee" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Employee Information</h5>
            </div>
            <div class="modal-body">
                <form action="/employee?action=edit" method="post" id="myform">
                    <input type="text" id="id" name="id" hidden>
                    <div class="mb-3">
                        <label class="form-label">Name</label>
                        <input type="text" class="form-control" name="name" id="newName" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Date Of Birth</label>
                        <input type="date" class="form-control" name="dateOfBirth" id="newDateOfBirth" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">ID Card</label>
                        <input type="text" class="form-control" name="idCard" id="newIdCard" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Salary</label>
                        <input type="text" class="form-control" name="salary" id="newSalary" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Phone Number</label>
                        <input type="text" class="form-control" name="phoneNumber" id="newPhoneNumber" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input type="text" class="form-control" name="email" id="newEmail" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Address</label>
                        <input type="text" class="form-control" name="address" id="newAddress" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Position Name</label>
                        <select class="form-select"
                                aria-label="Example select with button addon" name="positionId"
                                id="newPositionId">
                            <c:forEach var="position" items="${positionList}">
                                <option value="${position.getId()}">${position.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Education Degree Name</label>
                        <select class="form-select"
                                aria-label="Example select with button addon" name="educationDegreeId"
                                id="newEducationDegreeId">
                            <c:forEach var="educationDegree" items="${educationDegreeList}">
                                <option value="${educationDegree.getId()}">${educationDegree.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Division Name</label>
                        <select class="form-select"
                                aria-label="Example select with button addon" name="divisionId"
                                id="newDivisionId">
                            <c:forEach var="division" items="${divisionList}">
                                <option value="${division.getId()}">${division.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Username</label>
                        <input type="text" class="form-control" name="username" id="newUsername" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-danger" form="myform">Save changes</button>
            </div>
        </div>
    </div>
</div>

<!-- Modal add-->
<div class="modal fade" id="addEmployee" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Employee Information</h5>
            </div>
            <div class="modal-body">
                <form action="/employee?action=add" method="post" id="myFormAdd">
                    <div class="mb-3">
                        <label class="form-label">Name</label>
                        <input oninput="checkName(this.value)" type="text" class="form-control" name="name" required>
                        <span id="errorName" class="text-danger"></span>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Date Of Birth</label>
                        <input type="date" class="form-control" name="dateOfBirth" required max="12-12-2000">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">ID Card</label>
                        <input oninput="checkIdCard(this.value)" type="text" class="form-control" name="idCard" required>
                        <span id="errorIdCard" class="text-danger"></span>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Salary</label>
                        <input type="number" class="form-control" name="salary" required min="2000000">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Phone Number</label>
                        <input type="text" class="form-control" name="phoneNumber" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input oninput="checkEmail(this.value)" type="text" class="form-control" name="email" required >
                        <span id="errorEmail" class="text-danger"></span>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Address</label>
                        <input type="text" class="form-control" name="address" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Position Name</label>
                        <select class="form-select"
                                aria-label="Example select with button addon" name="positionId">
                            <c:forEach var="position" items="${positionList}">
                                <option value="${position.getId()}">${position.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Education Degree Name</label>
                        <select class="form-select"
                                aria-label="Example select with button addon" name="educationDegreeId">
                            <c:forEach var="educationDegree" items="${educationDegreeList}">
                                <option value="${educationDegree.getId()}">${educationDegree.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Division Name</label>
                        <select class="form-select"
                                aria-label="Example select with button addon" name="divisionId">
                            <c:forEach var="division" items="${divisionList}">
                                <option value="${division.getId()}">${division.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Username</label>
                        <input type="text" class="form-control" name="username" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button id="btnAdd" type="submit" class="btn btn-danger" form="myFormAdd">Save changes</button>
            </div>
        </div>
    </div>
</div>

<script>
    function infoDelete(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }

    function infoEdit(id, name, dob, idCard, salary, phoneNumber, email, address, positionId, educationId, divisionId, username) {
        document.getElementById("id").value = id;
        document.getElementById("newName").value = name;
        document.getElementById("newDateOfBirth").value = dob;
        document.getElementById("newIdCard").value = idCard;
        document.getElementById("newSalary").value = salary;
        document.getElementById("newPhoneNumber").value = phoneNumber;
        document.getElementById("newEmail").value = email;
        document.getElementById("newAddress").value = address;
        document.getElementById("newPositionId").value = positionId;
        document.getElementById("newEducationDegreeId").value = educationId;
        document.getElementById("newDivisionId").value = divisionId;
        document.getElementById("newUsername").value = username;
    }

    setTimeout(function () {
        document.getElementById("mess").style.display = "none";
    }, 3000)
    
    function checkName(name) {
        let regName = /^([A-Z][a-z]+[ ])+([A-Z][a-z]+)$/;
        let checkedName = regName.exec(name);
        if (!checkedName){
            document.getElementById("errorName").innerText = "Name doesn't match";
            document.getElementById("btnAdd").disabled = true;
        } else {
            document.getElementById("errorName").innerText = "";
            document.getElementById("btnAdd").disabled = false;
        }
    }
    function checkIdCard(idCard) {
        let regIdCard = /^\d{9}$/;
        let checkedIdCard = regIdCard.exec(idCard);
        if (!checkedIdCard){
            document.getElementById("errorIdCard").innerText = "ID Card doesn't match";
            document.getElementById("btnAdd").disabled = true;
        } else {
            document.getElementById("errorIdCard").innerText = "";
            document.getElementById("btnAdd").disable = false;
        }
    }
    function checkEmail(email) {
        let regEmail = /^([A-Za-z0-9._%-]+@[A-Za-z0-9.]+\.[A-Za-z]{2,6})$/;
        let checkedEmail = regEmail.exec(email);
        if (!checkedEmail){
            document.getElementById("errorEmail").innerText = "Email doesn't match";
            document.getElementById("btnAdd").disabled = true;
        }else {
            document.getElementById("errorEmail").innerText = "";
            document.getElementById("btnAdd").disable = false;
        }
    }
</script>

<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>

<%@include file="/view/interface/footer.jsp" %>
</body>
</html>
