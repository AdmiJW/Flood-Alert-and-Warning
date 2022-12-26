<%@ 
	page language="java" 
	contentType="text/html; 
	charset=ISO-8859-1" 
	pageEncoding="ISO-8859-1" 
%>

<html>

<jsp:include page="includes/header.jsp">
	<jsp:param name="title" value="FAW" />
</jsp:include>

<body>
	<!-- Navbar -->
	<jsp:include page="includes/navbar.jsp">
		<jsp:param name="route" value="dashboard/reports/evacuation/subscribe" />
		<jsp:param name="username" value="" />
	</jsp:include>
	
	<!-- Breadcrumb -->
	<jsp:include page="includes/breadcrumb.jsp">
		<jsp:param name="path" value="/Flood_Alert_and_Warning/Evacuation/Update Evacuation Point" />
	</jsp:include>
	
	<main class='container'>
		<h1 class='text-center fw-bold'>
			Edit Evacuation Point
			<i class="bi bi-pencil-square"></i>
		</h1>
	
		<!-- Evacuation Point Edit Form -->
		<form method="post" action="editEvacPoint" class='mb-4 m-auto' style='max-width: 700px;'>
			<div class="form-group mb-2">
				<label for="name">Name:</label> 
				<input type="text" class="form-control" id="name" value="Universiti Teknologi Malaysia"> 
			</div>
			
			<div class="form-group mb-2">
				<label for="location">Location:</label> 
				<input type="text" class="form-control" id="location" value="Skudai,Johor">
			</div>
			
			<div class="form-group mb-2">
				<label for="capacity">Capacity:</label> 
				<input type="number" class="form-control" id="capacity" value="200" min="1">
			</div>
			
			<div class="form-group mb-4">
				<label for="remarks">Remarks:</label> 
				<textarea class="form-control" id="remarks" rows="3">UTM evacuation point is currently looking for volunteer.</textarea>
			</div>
			
			<div class="form-group mb-2">
				<label for="mapLocation">Location:</label> 
				
				<jsp:include page="includes/bingMapSearch.jsp" />
				<jsp:include page="includes/bingMap.jsp" />
			</div>
			
			<div class="text-center">
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
	<jsp:include page="includes/footer.jsp">
		<jsp:param name="visits" value="1232" />
	</jsp:include>
	
</body>
</html>