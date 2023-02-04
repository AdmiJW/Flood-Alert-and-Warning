<%@ 
	page language="java" 
	contentType="text/html; 
	charset=ISO-8859-1" 
	pageEncoding="ISO-8859-1" 
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>

<!-- Header -->
<c:import url="/includes/header.jsp">
	<c:param name="title" value="FAW" />
</c:import>


<body>
	<!-- Navbar -->
	<c:import url="/includes/navbar.jsp">
		<c:param name="route" value="dashboard" />
		<c:param name="username" value="" />
	</c:import>
			
	<!-- Map and search -->
	<div class='my-3'>
		<c:import url="/includes/bingMap.jsp">
			<c:param value="80vh" name="height"/>
			<c:param value="90%" name="width"/>
			<c:param value="pinAllFlood" name="action"/>
		</c:import>
	</div>
	
	
	<div class='container mt-2'>
		<c:import url="/includes/bingMapSearch.jsp" />
	</div>
	
	<!-- Alert -->
	<c:import url="/includes/alert.jsp" />
	
	
	<main class='container my-4'>
		<!-- Breadcrumb -->
		<c:import url="/includes/breadcrumb.jsp" />
		
		<!-- Title -->
		<div class='my-4'>
			<h1 class='text-center fw-bold'>
				Dashboard
				<i class="bi bi-house-fill"></i>
			</h1>
				
			<p class='lead text-center text-muted'>
				Get the latest flood information across the whole Malaysia here
			</p>
		</div>
	
		<!-- Table -->
		<div class='mb-4 container'>
			<div class="input-group mb-3">
				<input type="text" class="form-control" placeholder="Search and Filter" aria-label="Search and Filter">
	  			<button class="btn btn-primary" type="button" id="button-addon2">Search</button>
			</div>
		
			<c:import url="/includes/dashPointTable.jsp">
				<c:param name="DashPoint" value="Parameter" />
			</c:import>
		</div>
	</main>
	
	
	<!-- Footer -->
	<c:import url="/includes/footer.jsp">
		<c:param name="visits" value="123" />
	</c:import>


</body>
</html>