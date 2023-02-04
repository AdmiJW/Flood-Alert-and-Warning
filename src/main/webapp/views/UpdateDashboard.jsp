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

<body>
	<!-- Navbar -->
	<c:import url="/includes/navbar.jsp" />

	<!-- Breadcrumb -->
	<c:import url="/includes/breadcrumb.jsp">
		<c:param name="path" value="Dashboard/Update" />
	</c:import>
	
	
	<main class='container my-4'>
		
		<!-- Title -->
		<div class='my-4'>
			<h1 class='text-center fw-bold'>
				Update Station
				<i class="bi bi-pencil-fill"></i>
			</h1>
		</div>
	
		<!-- Evacuation Point Edit Form -->
		<form method="POST" action="Update" class='m-auto' style='max-width: 700px;'>
			<div class="form-group mb-4">
				<label for="station">Station:</label> 
				<input type="text" class="form-control" id="station"> 
			</div>
			
			<div class="form-group mb-3">
				<label for="waterlevel">Water Level (m):</label> 
				<input type="text" class="form-control" id="waterlevel">
			</div>
			
			<div class="form-group mb-3">
				<label for="rainfall">Rainfall (mm):</label> 
				<input type="number" class="form-control" id="rainfall">
			</div>
			
			<div class="form-group mb-5">
				<label for="dashremarks">Remarks:</label> 
				<textarea class="form-control" id="dashremarks" rows="3"></textarea>
			</div>
			
			<div class="form-group mb-3">
				<label for="mapLocation">Location:</label> 
			
				<c:import url="/includes/bingMapSearch.jsp" />
				<c:import url="/includes/bingMap.jsp" />
			</div>
			
			<div class='text-center'>
				<button type="submit" class="btn btn-primary mt-4 me-2">
					Update
					<i class="bi bi-send-fill ms-1"></i>
				</button>
				<button type="submit" class="btn btn-danger mt-4">
					Delete
					<i class="bi bi-trash3-fill"></i>
				</button>
			</div>
		</form>
	</main>


	<!-- Footer -->
	<c:import url="/includes/footer.jsp"/>
	
</body>
</html>