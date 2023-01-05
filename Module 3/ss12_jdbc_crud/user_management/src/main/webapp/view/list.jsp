<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 1/4/2023
  Time: 10:53 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>List User</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>
<body>
<div class="container">
    <div class="row">
        <p class="text-danger text-center fs-4">${mess}</p>
    </div>
    <div class="d-flex justify-content-between">
        <div class="col-md-3">
            <form action="/user?action=search" method="post">
                <div>
                    <input type="text" name="country" placeholder="country search">
                    <button class="btn btn-sm btn-primary" type="submit">Search</button>
                </div>
            </form>
        </div>
        <div class="col-md-3">
            <button class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#addModal">Insert User
            </button>
        </div>
        <div class="col-md-3">
            <button class="btn btn-sm btn-primary" onclick="location.href='/user?action=addCall'">Add User
            </button>
        </div>
        <div class="col-md-1"><a href="/user">Return List</a></div>
    </div>
    <div class="row">
        <div>
            <p class="text-center fs-3 fw-bold text-secondary">List User Details</p>
        </div>
    </div>
    <div class="row">
        <table class="table table-striped table-bordered text-center">
            <thead>
            <tr>
                <th class="col">No.</th>
                <th class="col">Name</th>
                <th class="col">Email</th>
                <th class="col">Country</th>
                <th class="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="user" items="${userList}" varStatus="status">
                <tr>
                    <th scope="row">${status.count}</th>
                    <td>${user.getName()}</td>
                    <td>${user.getEmail()}</td>
                    <td>${user.getCountry()}</td>
                    <td>
                        <button onclick="infoEdit('${user.getId()}','${user.getName()}','${user.getEmail()}','${user.getCountry()}')"
                                class="btn btn-sm btn-primary" data-bs-toggle="modal" data-bs-target="#editModal">Edit
                        </button>
                        <button onclick="infoDelete('${user.getId()}','${user.getName()}')"
                                class="btn btn-sm btn-danger"
                                data-bs-toggle="modal" data-bs-target="#deleteModal">Delete
                        </button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<%--Delete Modal--%>
<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/user?action=delete" method="post">
                <div class="modal-header">
                    <h5 class="modal-title">Delete User Information</h5>
                </div>
                <div class="modal-body">
                    <input type="text" id="deleteId" name="deleteId" hidden>
                    <span>Do you want delete </span><span class="text-danger" id="deleteName"></span> ?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%--Edit Modal--%>
<div class="modal fade" id="editModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/user?action=edit" method="post">
                <div class="modal-header">
                    <h5 class="modal-title">Edit User Information</h5>
                </div>
                <div class="modal-body">
                    <input type="text" id="idEdit" name="id" hidden>
                    <div class="mb-3">
                        <label class="form-label">Name</label>
                        <input class="form-control" type="text" id="nameEdit" name="name">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input class="form-control" type="text" id="emailEdit" name="email">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Country</label>
                        <input class="form-control" type="text" id="countryEdit" name="country">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
                </div>
            </form>
        </div>
    </div>
</div>

<%--Add Modal--%>
<div class="modal fade" id="addModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <form action="/user?action=add" method="post">
                <div class="modal-header">
                    <h5 class="modal-title">Add User Information</h5>
                </div>
                <div class="modal-body">
                    <div class="mb-3">
                        <label class="form-label">Name</label>
                        <input class="form-control" type="text" name="name">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Email</label>
                        <input class="form-control" type="text" name="email">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Country</label>
                        <input class="form-control" type="text" name="country">
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save changes</button>
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

    function infoEdit(id, name, email, country) {
        document.getElementById("idEdit").value = id;
        document.getElementById("nameEdit").value = name;
        document.getElementById("emailEdit").value = email;
        document.getElementById("countryEdit").value = country;
    }
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
</body>
</html>
