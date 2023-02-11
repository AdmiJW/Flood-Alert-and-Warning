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
<div class="min-vh-100">
	<!-- Navbar -->
	<c:import url="/includes/navbar.jsp" />

	<!-- Breadcrumb -->
	<c:choose>
		<c:when test="${isAdmin}">
			<c:import url="/includes/breadcrumb.jsp">
			<c:param name="path" value="Evacuation/Update" />
			</c:import>
		</c:when>
		<c:otherwise>
			<c:import url="/includes/breadcrumb.jsp">
			<c:param name="path" value="Evacuation/View" />
			</c:import>
		</c:otherwise>
	</c:choose>

	
	<main class='container'>
		<h1 class='text-center fw-bold'>
			Edit Evacuation Point
			<i class="bi bi-pencil-square"></i>
		</h1>

		<c:import url="/includes/alert.jsp" />
	
		<!-- Evacuation Point Edit Form -->
		<form method="post" action='<c:url value="/Evacuation"/> ' class='mb-4 m-auto' style='max-width: 700px;'>
			<input type="hidden" name="pointId" value="${evacPoint.id}">
			<div class="form-group mb-2">
				<label for="name">Name:</label> 
				<input
					type="text"
					class="form-control"
					id="name"
					disabled
					value="${evacPoint.pointName}"
				>
			</div>
			
			<div class="form-group mb-2">
				<label for="location">Location:</label> 
				<input
					type="text"
					class="form-control"
					id="location"
					disabled
					value="${evacPoint.location.district.name},${evacPoint.location.district.state.name}">
			</div>

			<div class="form-group mb-2">
				<label for="currentOccupancy">Current Occupancy:</label>
				<input
					type="number"
					class="form-control"
					id="currentOccupancy"
					name="currentOccupancy"
					${isAdmin ? 'enabled' : 'disabled'}
					value="${evacPoint.currentOccupancy}"
				>
			</div>
			
			<div class="form-group mb-2">
				<label for="capacity">Capacity:</label> 
				<input
					type="number"
					class="form-control"
					id="capacity"
					name="capacity"
					${isAdmin ? 'enabled' : 'disabled'}
					value="${evacPoint.capacity}"
				>
			</div>
			
			<div class="form-group mb-4">
				<label for="remarks">Remarks:</label> 
				<textarea
					class="form-control"
					id="remarks"
					name="remarks"
					rows="3"
					${isAdmin ? 'enabled' : 'disabled'}
				>${evacPoint.remarks}</textarea>
			</div>
			
			<div class="form-group mb-2">
				<label for="mapLocation">Location:</label> 
				
				<c:import url="/includes/bingMapSearch.jsp" />
				<c:import url="/includes/bingMap.jsp" />
			</div>

			<c:if test="${isAdmin}">
				<div class="text-center">
					<button
						type="submit"
						class="btn btn-primary mt-4 me-2"
					>
						Update
						<i class="bi bi-send-fill ms-1"></i>
					</button>
					<a
							class="btn btn-danger mt-4"
							href="
				<c:url value="/Evacuation/Delete" >
					<c:param name="id" value="${evacPoint.id}" />
				</c:url>
				"
					>
						Delete
						<i class="bi bi-trash3-fill"></i>
					</a>
				</div>
			</c:if>
		</form>

		<div class='d-flex justify-content-center gap my-4'>
			<a class='btn btn-info' href='<c:url value="/Evacuation" />'>
				Back
			</a>
		</div>
	</main>
</div>

<!-- Footer -->
<c:import url="/includes/footer.jsp"/>
	
</body>
</html>