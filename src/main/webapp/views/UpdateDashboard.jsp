<%@ page import="entity.Dashboard" %>
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
		<c:param name="path" value="Dashboard/Update" />
	</c:import>

	<!-- Alert -->
	<c:import url="/includes/alert.jsp" />
	
	<main class='container my-4'>
		
		<!-- Title -->
		<div class='my-4'>
			<h1 class='text-center fw-bold'>
				Update Station
				<i class="bi bi-pencil-fill"></i>
			</h1>
		</div>
	
		<!-- Dashboard Station Edit Form -->
		<form method='POST' action='<c:url value="/Dashboard/Update" />' class='m-auto' style='max-width: 500px;'>
			<div class="form-group mb-4">
				<label class="form-label fw-bold">Station: <c:out value="${dashboard.location.name}"/></label>
				<input type="hidden" name="id" value="<c:out value="${dashboard.id}"/>">
			</div>

			<div class="form-group mb-3">
				<label for="water">Water Level (m):</label>
				<input type="number" step="0.01" class="form-control" id="water" name="water" value="<c:out value="${dashboard.water}"/>">
			</div>

			<div class="form-group mb-3">
				<label>Status:</label>
				<div>
				<input type="radio" id="rising" name="status" value="RISING" ${dashboard.status=="RISING"?'checked':''}>
				<label>Rising</label>
				</div>
				<div>
				<input type="radio" id="receding" name="status" value="RECEDING" ${dashboard.status=="RECEDING"?'checked':''}>
				<label>Receding</label>
				</div>
				<div>
				<input type="radio" id="nochange" name="status" value="NOCHANGE" ${dashboard.status=="NOCHANGE"?'checked':''}>
				<label>No Change</label>
				</div>
			</div>

			<div class="form-group mb-3">
				<label for="rainfall">Rainfall (mm):</label>
				<input type="number" class="form-control" id="rainfall" name="rainfall" value="<c:out value="${dashboard.rainfall}"/>">
			</div>

			<div class="form-group mb-3">
				<label for="date">Date:</label>
				<input type="date" class="form-control" id="date" name="date" value="<c:out value="${dashboard.date}"/>">
			</div>

			<div class='text-center'>
				<button type="submit" class="btn btn-primary mt-4 me-2">
					Update
					<i class="bi bi-send-fill ms-1"></i>
				</button>
			</div>
		</form>
	</main>
</div>


<!-- Footer -->
<c:import url="/includes/footer.jsp"/>
	
</body>
</html>