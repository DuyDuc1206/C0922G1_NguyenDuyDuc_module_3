<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/10/2023
  Time: 10:33 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Medical Record Details</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<body>
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
                <h5 class="modal-title" id="exampleModalLabel">Delete Medical Record</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/medicalRecord?action=delete" method="post">
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
                <h5 class="modal-title">Edit Customer Information</h5>
            </div>
            <div class="modal-body">
                <form action="/medicalRecord?action=edit" method="post" id="myForm">
                    <input type="text" id="id" name="id" hidden>
                    <div class="mb-3">
                        <label class="form-label">Name</label>
                        <input type="text" class="form-control" name="name" id="newName" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Patient Name</label>
                        <select class="form-select" name="patientId" id="patientId">
                            <c:forEach var="patient" items="${patientList}">
                                <option value="${patient.getId()}">${patient.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Hospitalized Date </label>
                        <input type="date" class="form-control" name="hospitalizedDate" id="hospitalizedDate"
                               required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Discharged Date</label>
                        <input type="date" class="form-control" name="dischargedDate" id="dischargedDate" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Reason</label>
                        <input type="text" class="form-control" name="reason" id="reason" required>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                <button type="submit" class="btn btn-danger" form="myForm">Save changes</button>
            </div>
        </div>
    </div>
</div>

<%--Modal add--%>
<div class="modal fade" id="add" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Medical Record Information</h5>
            </div>
            <form action="/medicalRecord?action=add" method="post">
                <div class="modal-body">
                    <div class="mb-3 form-group">
                        <label class="form-label">Medical Record Name</label>
                        <input type="text" class="form-control" name="name" required>
                    </div>
                    <div class="mb-3 form-group">
                        <label class="form-label">Patient Name</label>
                        <select class="form-select" name="patientId">
                            <c:forEach var="patient" items="${patientList}">
                                <option value="${patient.getId()}">${patient.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3 form-group">
                        <label class="form-label">Hospitalized Date</label>
                        <input type="date" class="form-control" name="hospitalizedDate" required>
                    </div>
                    <div class="mb-3 form-group">
                        <label class="form-label">Discharged Date</label>
                        <input type="date" class="form-control" name="dischargedDate" required>
                    </div>
                    <div class="mb-3 form-group">
                        <label class="form-label">Reason</label>
                        <input type="text" class="form-control" name="reason" required>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="Submit" class="btn btn-danger">Submit</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
    function infoDelete(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;
    }

    function infoEdit(id, name, patientId, hospitalizedDate, dischargedDate, reason) {
        document.getElementById("id").value = id;
        document.getElementById("newName").value = name;
        document.getElementById("patientId").value = patientId;
        document.getElementById("hospitalizedDate").value = hospitalizedDate;
        document.getElementById("dischargedDate").value = dischargedDate;
        document.getElementById("reason").value = reason;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
