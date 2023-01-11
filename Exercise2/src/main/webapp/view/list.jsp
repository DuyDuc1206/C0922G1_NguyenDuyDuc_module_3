<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/11/2023
  Time: 3:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="row justify-content-between">
        <div class="col-md-3">
            <button class="btn btn-md btn-primary"
                    data-bs-toggle="modal" data-bs-target="#add">Add Student
            </button>
        </div>
        <div class="col-md-6">
            <form action="/student?action=search" method="post">
                <input class="col-md-3" type="text" name="searchName" placeholder="Search Name">
                <select name="searchClass">
                    <option value="">Search Class</option>
                    <c:forEach var="class" items="${classList}">
                        <option value="${class.id}">${class.name}</option>
                    </c:forEach>
                </select>
                <button class="btn btn-md btn-primary">Search</button>
            </form>
        </div>
    </div>
</div>
<div class="container">
    <div class="row">
        <p class="text-center fs-3 fw-bold">List Student</p>
        <table class="table table-stripe">
            <thead>
            <tr>
                <th class="col">No.</th>
                <th class="col">Name</th>
                <th class="col">Gender</th>
                <th class="col">Email</th>
                <th class="col">Point</th>
                <th class="col">Class Name</th>
                <th class="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="student" items="${studentList}" varStatus="status">
                <tr>
                    <th scope="row">${status.count}</th>
                    <td>${student.name}</td>
                    <td>${student.gender}</td>
                    <td>${student.email}</td>
                    <td>${student.point}</td>
                    <td>${student.classStudent.name}</td>
                    <td>
                        <button onclick="infoDelete('${student.id}','${student.name}')" class="btn btn-md btn-danger"
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
                <h5 class="modal-title" id="exampleModalLabel">DeleteStudent</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/student?action=delete" method="post">
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

<script>
    function infoDelete(id, name) {
        document.getElementById("deleteId").value = id;
        document.getElementById("deleteName").innerText = name;

    }
</script>

<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"
        integrity="sha384-oBqDVmMz9ATKxIep9tiCxS/Z9fNfEXiDAYTujMAeBAsjFuCZSmKbSSUnQlmh/jp3"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.min.js"
        integrity="sha384-cuYeSxntonz0PPNlHhBs68uyIAVpIIOZZ5JqeqvYYIcEL727kskC66kF92t6Xl2V"
        crossorigin="anonymous"></script>
</body>
</html>
