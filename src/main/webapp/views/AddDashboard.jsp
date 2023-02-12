<%@page
        language="java"
        contentType="text/html;
	charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>

<c:import url="/includes/header.jsp">
  <c:param name="title" value="FAW" />
</c:import>

<script>
  const districts = JSON.parse(`${districts}`);
  const locations = JSON.parse(`${locations}`);
</script>
<script src="<c:url value="/public/scripts/geoSelectInput.js" />"></script>

<body>
<div class="min-vh-100">
  <!-- Navbar -->
  <c:import url="/includes/navbar.jsp" />

  <!-- Breadcrumb -->
  <c:import url="/includes/breadcrumb.jsp">
    <c:param name="path" value="Dashboard/Add" />
  </c:import>

  <!-- Alert -->
  <c:import url="/includes/alert.jsp" />


  <main class='container my-4'>

    <!-- Title -->
    <div class='my-4'>
      <h1 class='text-center fw-bold'>
        Add Station
        <i class="bi bi-clipboard-plus"></i>
      </h1>
    </div>

    <!-- Dashboard Station Edit Form -->
    <form method='POST' action='<c:url value="/Dashboard/AddDashboard" />' class='m-auto' style='max-width: 500px;'>
      <div class="form-group mb-4">
        <label class="form-label fw-bold">Station:</label>
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



    <%-- Select water level --%>
      <div class="form-group mb-3">
        <label for="water" class="form-label fw-bold">Water Level (m):</label>
        <input type="number" step="0.01" class="form-control" id="water" name="water">
      </div>

      <div class="form-group mb-3">
        <label class="form-label fw-bold">Status:</label>
        <div>
        <input class="form-check-input" type="radio" id="rising" name="status" value="RISING" required>
        <label>Rising</label>
        </div>
        <div>
        <input class="form-check-input" type="radio" id="receding" name="status" value="RECEDING" required>
        <label>Receding</label>
        </div>
        <div>
        <input class="form-check-input" type="radio" id="nochange" name="status" value="NOCHANGE" required>
        <label>No Change</label>
        </div>
      </div>

      <div class="form-group mb-3">
        <label for="rainfall" class="form-label fw-bold">Rainfall (mm):</label>
        <input type="number" class="form-control" id="rainfall" name="rainfall">
      </div>

      <div class="form-group mb-3">
        <label for="date" class="form-label fw-bold">Date:</label>
        <input type="date" class="form-control" id="date" name="date">
      </div>

      <div class='text-center'>
        <button type="submit" class="btn btn-primary mt-4 me-2">
          Add
          <i class="bi bi-send-fill ms-1"></i>
        </button>
        <a href="<c:url value="/Dashboard" />" class='btn btn-danger mt-4 me-2'> Back <i class="bi bi-arrow-left-square-fill"></i></a>
      </div>
    </form>
  </main>
</div>


<!-- Footer -->
<c:import url="/includes/footer.jsp"/>

</body>
</html>