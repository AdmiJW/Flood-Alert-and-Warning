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
		<c:param name="route" value="dashboard/reports/evacuation/subscribe" />
		<c:param name="username" value="" />
	</c:import>

	<!-- Breadcrumb -->
	<c:import url="/includes/breadcrumb.jsp">
		<c:param name="path" value="Evacuation" />
	</c:import>
	
	<div class='container'>
		<h1 class='text-center fw-bold'>
			Evacuation
			<i class="bi bi-houses"></i>
		</h1>
		
		<!-- MAP API -->
		<div class='mb-5'>
			<c:import url="/includes/bingMapSearch.jsp" />
			
			<c:import url="/includes/bingMap.jsp">
				<c:param value="500px" name="height"/>
				<c:param value="pinAllEvac" name="action"/>
			</c:import>
		</div>
		
		<!-- Evacuation Point Detail Card  -->
		<div class='mb-4'>
			<c:import url="/includes/evacPointTable.jsp">
				<c:param name="EvacPoint" value="Parameter" />
			</c:import>
		</div>
	</div>

	<!-- Footer -->
	<c:import url="/includes/footer.jsp"/>
	
</body>
</html>