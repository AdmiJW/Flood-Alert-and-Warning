<%@ 
	page language="java" 
	contentType="text/html; 
	charset=ISO-8859-1" 
	pageEncoding="ISO-8859-1" 
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<script type="text/javascript">
	const bingPins = JSON.parse(`${bingPins}`);
</script>

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
		<c:param name="active" value="evacuation" />
	</c:import>

	<!-- Breadcrumb -->
	<c:import url="/includes/breadcrumb.jsp">
		<c:param name="path" value="Evacuation" />
	</c:import>

	<c:import url="/includes/alert.jsp" />
	
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
				<c:param value="pinAllFlood" name="action"/>
			</c:import>
		</div>


		<%-- Add Evacuation Point--%>
		<c:if test="${isAdmin}">
			<div class="mb-4">
				<div class='mx-auto' style='max-width: 1000px;'>
					<a href="<c:url value="/Evacuation/AddEvacPoint" />">
						<button type="button" class="btn btn-primary">
							Add Evacuation Point
							<i class="bi bi-database-add"></i>
						</button>
					</a>
				</div>
			</div>
		</c:if>

		<!-- Evacuation Point Detail Card  -->
		<div class='mb-4'>
			<c:import url="/includes/evacPointTable.jsp">
				<c:param name="EvacPoint" value="Parameter" />
			</c:import>
		</div>
	</div>
</div>

<!-- Footer -->
<c:import url="/includes/footer.jsp"/>
	
</body>
</html>