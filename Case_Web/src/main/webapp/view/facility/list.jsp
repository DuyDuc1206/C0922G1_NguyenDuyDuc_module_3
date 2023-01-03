<%--
  Created by IntelliJ IDEA.
  User: Admin
  Date: 12/30/2022
  Time: 1:38 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Facility List</title>
    <%@include file="/view/interface/css.jsp" %>
</head>
<body>
<%@include file="/view/interface/header.jsp" %>

<div>
    <p id="mess" class="text-center text-danger fs-2">${mess}</p>
</div>
<div class="container mt-2">
    <div class="row">
        <div class="col-md-2">
            <button class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#addFacility">
                ADD FACILITY <i class="fas fa-plus"></i>
            </button>
        </div>
    </div>
</div>
<div class="container-fluid">
    <div class="row">
        <p class="text-center fs-2 fw-bold">All Facility Details</p>
    </div>
    <div class="row">
        <table id="tableFacility" class="table table-striped table-bordered">
            <thead>
            <tr>
                <th class="col">No.</th>
                <th class="col">Name</th>
                <th class="col">Area</th>
                <th class="col">Cost</th>
                <th class="col">Max People</th>
                <th class="col">Standard Room</th>
                <th class="col">Description</th>
                <th class="col">Pool Area</th>
                <th class="col">Number Of Floor</th>
                <th class="col">Facility Free</th>
                <th class="col">Rent Type Name</th>
                <th class="col">Facility Type Name</th>
                <th class="col">Action</th>
            </tr>
            </thead>
            <tbody>
            <c:forEach var="facility" items="${facilityList}" varStatus="status">
                <tr>
                    <th scope="row"><c:out value="${status.count}"/></th>
                    <td><c:out value="${facility.getName()}"/></td>
                    <td><c:out value="${facility.getArea()}"/></td>
                    <td><c:out value="${facility.getCost()}"/></td>
                    <td><c:out value="${facility.getMaxPeople()}"/></td>
                    <td><c:out value="${facility.getStandardRoom()}"/></td>
                    <td><c:out value="${facility.getDescription()}"/></td>
                    <td><c:out value="${facility.getPoolArea()}"/></td>
                    <td><c:out value="${facility.getNumberOfFloor()}"/></td>
                    <td><c:out value="${facility.getFacilityFree()}"/></td>
                    <td><c:out value="${facility.getRentType().getName()}"/></td>
                    <td><c:out value="${facility.getFacilityType().getName()}"/></td>
                    <td>
                        <button onclick="infoEdit('${facility.getId()}','${facility.getName()}','${facility.getArea()}','${facility.getCost()}','${facility.getMaxPeople()}',
                                '${facility.getStandardRoom()}','${facility.getDescription()}','${facility.getPoolArea()}','${facility.getNumberOfFloor()}','${facility.getFacilityFree()}',
                                '${facility.getRentType().getId()}','${facility.getFacilityType().getId()}')"
                                class="btn btn-md btn-outline-secondary" data-bs-toggle="modal"
                                data-bs-target="#editFacility"><i class="fas fa-edit"></i></button>
                        <button onclick="infoDelete('${facility.getId()}','${facility.getName()}')"
                                class="btn btn-md btn-danger ms-1" data-bs-toggle="modal"
                                data-bs-target="#deleteFacility"><i
                                class="fas fa-trash-alt"></i></button>
                    </td>
                </tr>
            </c:forEach>
            </tbody>
        </table>
    </div>
</div>

<!-- Modal delete-->
<div class="modal fade" id="deleteFacility" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Delete Facility</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <form action="/facility?action=delete" method="post">
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
<div class="modal fade" id="editFacility" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit Facility Information</h5>
            </div>
            <div class="modal-body">
                <form action="/facility?action=edit" method="post" id="myform">
                    <input type="text" id="id" name="id" hidden>
                    <div class="mb-3">
                        <label class="form-label">Name</label>
                        <input type="text" class="form-control" name="name" id="newName" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Area</label>
                        <input type="number" class="form-control" name="area" id="newArea" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Cost</label>
                        <input type="number" class="form-control" name="cost" id="newCost" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Cost</label>
                        <input type="number" class="form-control" name="maxPeople" id="newMaxPeople" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Standard Room</label>
                        <input type="text" class="form-control" name="standardRoom" id="newStandardRoom" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Description</label>
                        <input type="text" class="form-control" name="description" id="newDescription" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Pool Area</label>
                        <input type="number" class="form-control" name="poolArea" id="newPoolArea">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Number Of Floor</label>
                        <input type="number" class="form-control" name="numberOfFloor" id="newNumberOfFloor">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Facility Free</label>
                        <input type="text" class="form-control" name="facilityFree" id="newFacilityFree">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Rent Type Name</label>
                        <select class="form-select"
                                aria-label="Example select with button addon" id="newRentTypeId"
                                name="rentTypeId">
                            <c:forEach var="rentType" items="${rentTypeList}">
                                <option value="${rentType.getId()}">${rentType.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Facility Type Name</label>
                        <select class="form-select"
                                aria-label="Example select with button addon" id="newFacilityTypeId"
                                name="facilityTypeId">
                            <c:forEach var="facilityType" items="${facilityTypeList}">
                                <option value="${facilityType.getId()}">${facilityType.getName()}</option>
                            </c:forEach>
                        </select>
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

<%--Modal add--%>
<div class="modal fade" id="addFacility" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-scrollable">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add Facility Information</h5>
            </div>
            <div class="modal-body">
                <form action="/facility?action=insert" method="post" id="formAdd">
                    <div class="d-flex justify-content-evenly ps-5" id="type">
                        <input type="text" name="facilityIdType" id="valueType" hidden>
                        <button  class="btn tbn-md btn-outline-secondary" onclick="addVilla()" >
                            Villa
                        </button>
                        <button  class="btn tbn-md btn-outline-secondary" onclick="addHouse()" >
                            House
                        </button>
                        <button class="btn tbn-md btn-outline-secondary" onclick="addRoom()" >Room
                        </button>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Name</label>
                        <input type="text" class="form-control" name="name" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Area</label>
                        <input type="number" class="form-control" name="area" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Cost</label>
                        <input type="number" class="form-control" name="cost" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Max People</label>
                        <input type="number" class="form-control" name="maxPeople" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Standard Room</label>
                        <input type="text" class="form-control" name="standardRoom" required>
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Description</label>
                        <input type="text" class="form-control" name="description" required>
                    </div>
                    <div class="mb-3" id="addPoolArea">
                        <label class="form-label">Pool Area</label>
                        <input type="number" class="form-control" name="poolArea">
                    </div>
                    <div class="mb-3" id="addNumberOfFloor">
                        <label class="form-label">Number Of Floor</label>
                        <input type="number" class="form-control" name="numberOfFloor">
                    </div>
                    <div class="mb-3" id="addFacilityFree">
                        <label class="form-label">Facility Free</label>
                        <input type="text" class="form-control" name="facilityFree">
                    </div>
                    <div class="mb-3">
                        <label class="form-label">Rent Type Name</label>
                        <select class="form-select"
                                aria-label="Example select with button addon"
                                name="rentTypeId">
                            <c:forEach var="rentType" items="${rentTypeList}">
                                <option value="${rentType.getId()}">${rentType.getName()}</option>
                            </c:forEach>
                        </select>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                <button type="Submit" class="btn btn-danger" form="formAdd">Submit</button>
            </div>
        </div>
    </div>
</div>

<script>
    function addVilla() {
        document.getElementById("valueType").value = 1;
        document.getElementById("addFacilityFree").style.display = 'none';
        document.getElementById("addPoolArea").style.display = 'block';
        document.getElementById("addNumberOfFloor").style.display = 'block';
    }

    function addHouse() {
        document.getElementById("valueType").value = 2;
        document.getElementById("addPoolArea").style.display = "none";
        document.getElementById("addFacilityFree").style.display = 'block';
        document.getElementById("addNumberOfFloor").style.display = 'block';
    }

    function addRoom() {
        document.getElementById("valueType").value = 3;
        document.getElementById("addFacilityFree").style.display = 'block';
        document.getElementById("addPoolArea").style.display = "none";
        document.getElementById("addNumberOfFloor").style.display = "none";
    }

    function infoDelete(idDelete, nameDelete) {
        document.getElementById("deleteId").value = idDelete;
        document.getElementById("deleteName").innerText = nameDelete;
    }

    function infoEdit(id, name, area, cost, maxPeople, standardRoom, description, poolArea, numberOfFloor, facilityFree, rentTypeId, facilityTypeId) {
        document.getElementById("id").value = id;
        document.getElementById("newName").value = name;
        document.getElementById("newArea").value = area;
        document.getElementById("newCost").value = cost;
        document.getElementById("newMaxPeople").value = maxPeople;
        document.getElementById("newStandardRoom").value = standardRoom;
        document.getElementById("newDescription").value = description;
        document.getElementById("newPoolArea").value = poolArea;
        document.getElementById("newNumberOfFloor").value = numberOfFloor;
        document.getElementById("newFacilityFree").value = facilityFree;
        document.getElementById("newRentTypeId").value = rentTypeId;
        debugger
        document.getElementById("newFacilityTypeId").value = facilityTypeId;
    }

    setTimeout(function () {
        document.getElementById("mess").style.display = "none";
    }, 3000)
</script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableFacility').dataTable({
            "dom": 'frtlip',
            "lengthChange": false,
            "pageLength": 10,
            "bInfo": false
        });
    });
</script>
<%@include file="/view/interface/footer.jsp" %>
</body>
</html>
