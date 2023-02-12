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
<div class="min-vh-100">
	<!-- Navbar -->
	<c:import url="/includes/navbar.jsp">
		<c:param name="active" value="dashboard" />
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
		<c:import url="/includes/breadcrumb.jsp">
			<c:param name="path" value="Dashboard" />
		</c:import>
		
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
		<form method="GET" action="<c:url value="/Dashboard"/>" class='mb-4 container'>
			<div class="input-group mb-3">
				<input type="text" class="form-control" placeholder="Search and Filter" aria-label="Search and Filter" name="search">
	  			<button class="btn btn-primary" type="submit" id="button-addon2">Search</button>
			</div>
		
			<c:import url="/includes/dashPointTable.jsp">
				<c:param name="DashPoint" value="Parameter" />
			</c:import>
		</form>
	</main>
</div>

<!-- Footer -->
<c:import url="/includes/footer.jsp"/>

</body>
</html>