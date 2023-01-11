<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/11/2023
  Time: 10:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <%@include file="/view/interface/css.jsp" %>
</head>
<body>
<%@include file="/view/interface/header.jsp" %>

<div class="container">
    <div class="row justify-content-between">
        <div class="col-md-3">
            <button class="btn btn-md btn-primary"
                    data-bs-toggle="modal" data-bs-target="#add">Add Medical Record
            </button>
        </div>
        <div class="col-md-6">
            <form action="/medicalRecord?action=search" method="post">
                <input class="col-md-3" type="text" name="name" placeholder="Search Name">
                <button class="btn btn-md btn-primary">Search</button>
            </form>
        </div>
    </div>
</div>
<p class="text-center text-danger fs-5">${mess}</p>
<div class="container">
    <div class="row">
        <p class="text-center fs-3">Medical Record Details</p>
        <table class="table table-striped table-bordered">
            <thead>
            <tr>
                <th class="col">No</th>
                <th class="col">Medical Record</th>
                <th class="col">Patient</th>
                <th class="col">Hospitalized Date</th>
                <th class="col">Discharged Date</th>
                <th class="col">Reason</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="medicalRecord" items="${medicalRecordList}" varStatus="status">
                <tr>
                    <th scope="row">${status.count}</th>
                    <td>${medicalRecord.getName()}</td>
                    <td>${medicalRecord.getPatient().getName()}</td>
                    <td>${medicalRecord.getHospitalizedDate()}</td>
                    <td>${medicalRecord.getDischargedDate()}</td>
                    <td>${medicalRecord.getReason()}</td>
                    <td>
                        <button onclick="infoEdit('${medicalRecord.getId()}','${medicalRecord.getName()}','${medicalRecord.getPatient().getId()}',
                                '${medicalRecord.getHospitalizedDate()}','${medicalRecord.getDischargedDate()}','${medicalRecord.getReason()}')"
                                class="btn btn-md btn-primary" data-bs-toggle="modal" data-bs-target="#edit">Edit
                        </button>
                        <button onclick="infoDelete('${medicalRecord.getId()}','${medicalRecord.getName()}')"
                                class="btn btn-md btn-danger"
                                data-bs-toggle="modal" data-bs-target="#delete">Delete
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Modal delete-->
<div class="modal fade" id="delete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
<div class="modal fade" id="edit" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
<div class="modal fade" id="add" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
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
</body>
</html>
