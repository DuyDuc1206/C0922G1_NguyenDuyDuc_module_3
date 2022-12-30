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
                        <button></button>
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
            <form action="/customer?action=delete" method="post">
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
    function infoDelete(idDelete, nameDelete) {
        document.getElementById("deleteId").value = idDelete;
        document.getElementById("deleteName").innerText = nameDelete;
    }
</script>
<script src="jquery/jquery-3.5.1.min.js"></script>
<script src="datatables/js/jquery.dataTables.min.js"></script>
<script src="datatables/js/dataTables.bootstrap5.min.js"></script>
<script>
    $(document).ready(function () {
        $('#tableFacility').dataTable({
            "dom": 'lrtip',
            "lengthChange": false,
            "pageLength": 10
        });
    });
</script>
<%@include file="/view/interface/footer.jsp" %>
</body>
</html>
