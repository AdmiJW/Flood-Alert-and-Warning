<%--
  Created by IntelliJ IDEA.
  User: Ethan
  Date: 11/2/2023
  Time: 9:00 pm
  To change this template use File | Settings | File Templates.
--%>
<%@page
        language="java"
        contentType="text/html; charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>

<!-- Header -->
<c:import url="/includes/header.jsp">
    <c:param name="title" value="FAW - Add Evacuation point"/>
</c:import>

<script>
    const districts = JSON.parse(`${districts}`);
    const locations = JSON.parse(`${locations}`);
</script>
<script src="<c:url value="/public/scripts/geoSelectInput.js" />"></script>


<body>
<div class="min-vh-100">

    <!-- Navbar -->
    <c:import url="/includes/navbar.jsp">
        <c:param name="active" value="Evacuation"/>
    </c:import>

    <!-- Breadcrumb -->
    <c:import url="/includes/breadcrumb.jsp">
        <c:param name="path" value="Evacuation/Add Point"/>
    </c:import>

    <!-- Add Evacuation Point form -->
    <main class='container my-4'>

        <h1 class='text-center fw-bold'>
            Add Evacuation Point
            <i class="bi bi-database-fill-add"></i>
        </h1>

        <p class='lead text-center text-muted'>
            Add a new evacuation point for victims.
            <br>
        </p>


        <form
                class='bg-light rounded shadow-sm m-auto p-3 my-4'
                style='max-width: 500px;'
                method='POST'
                action='<c:url value="/Evacuation/AddEvacPoint" />'
        >

            <div class='text-center display-6'>
                <i class="bi bi-lightning-charge-fill"></i>
                <span class="fw-bold">FAW</span>
            </div>

            <p class='text-center text-muted'>
                Fill in the form below to add a new evacuation point.
            </p>

            <div class="mb-2">
                <label for="pointName" class="form-label fw-bold">Point Name:</label>
                <input type="text" class="form-control" name='pointName' id="pointName" required
                       aria-label="Point Name">
            </div>

            <!-- Select state -->
            <div class="mb-2">
                <label for="state" class="form-label fw-bold">State:</label>

                <select class="form-select" name='state' id='state' required aria-label="Select state">
                    <option selected disabled value=''>Select state</option>

                    <c:forEach items="${states}" var="state">
                        <option value="${state.id}">${state.name}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- Select district -->
            <div class="mb-2">
                <label for="district" class="form-label fw-bold">District:</label>

                <select class="form-select" name='district' id='district' required aria-label="Select district">
                    <option selected disabled value=''>Select district</option>
                </select>
            </div>


            <!-- Map and search -->
            <div class='my-3'>
                <c:import url="/includes/bingMap.jsp">
                    <c:param value="400px" name="height"/>
                    <c:param value="pinAllFlood" name="action"/>
                </c:import>
            </div>
            <h5 class="text-center fw-bold">Please provide the address of the location</h5>
            <div class='container mt-2'>
                <c:import url="/includes/bingMapSearch.jsp" />
            </div>


            <!-- Location (from Map) -->
            <div class="mb-2">
                <label for="location" class="form-label fw-bold">Location:</label>
                <input type="text" class="form-control" id="location" name="location" required />
            </div>

            <!-- Latitude (from Map) -->
            <div class="mb-2">
                <label for="lat" class="form-label fw-bold">Latitude:</label>
                <input type="text" class="form-control" id="lat" name="lat" required />
            </div>

            <!-- Longitude (from Map) -->
            <div class="mb-5">
                <label for="lng" class="form-label fw-bold">Longitude:</label>
                <input type="text" class="form-control" id="lng" name="lng" required />
            </div>

        <%-- Current Occupancy --%>
            <div class="mb-2">
                <label for="currentOccupancy" class="form-label fw-bold">Current Occupancy:</label>
                <input type="number" class="form-control" name='currentOccupancy' id="currentOccupancy" placeholder="0"
                       required aria-label="Current Occupancy">
            </div>


            <%-- Capacity--%>
            <div class="mb-2">
                <label for="capacity" class="form-label fw-bold">Capacity:</label>
                <input type="number" class="form-control" name='capacity' id="capacity" placeholder="0" required
                       aria-label="Capacity">
            </div>

            <%-- Remarks --%>
            <div class="mb-2">
                <label for="remarks" class="form-label fw-bold">Remarks:</label>
                <textarea class="form-control" name='remarks' id="remarks" rows="3" required
                          aria-label="Description"></textarea>
            </div>

            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
        <div class="mx-auto d-flex justify-content-center w-25">
            <a href="<c:url value="/Evacuation" />" class="btn btn-danger d-block m-auto"
               style="max-width: 600px;">Back
            </a>
        </div>
    </main>
</div>

<!-- Footer -->
<c:import url="/includes/footer.jsp"/>

</body>
</html>