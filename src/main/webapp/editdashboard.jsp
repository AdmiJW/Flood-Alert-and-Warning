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
		<jsp:param name="path" value="/Flood_Alert_and_Warning/Dashboard/Update Station" />
	</jsp:include>
	
	
	<main class='container my-4'>
		
		<!-- Title -->
		<div class='my-4'>
			<h1 class='text-center fw-bold'>
				Update Station
				<i class="bi bi-pencil-fill"></i>
			</h1>
		</div>
	
		<!-- Evacuation Point Edit Form -->
		<div>
			<form method="post" action="editDashboard">
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
				
				<div class="form-group mb-3">
					<label for="dashremarks">Remarks:</label> 
					<textarea class="form-control" id="dashremarks" rows="3"></textarea>
				</div>
				
				<div class="form-group mb-3">
					<jsp:include page="includes/map.jsp">
						<jsp:param value="PinOneEvac" name="action"/>
						<jsp:param value="Universiti Teknologi Malaysia" name="location"/>
					</jsp:include>
				</div>
	
				<button type="submit" class="btn btn-primary mt-4">Submit</button>
			</form>
		</div>
	</main>

	
	<!-- Footer -->
	<jsp:include page="includes/footer.jsp">
		<jsp:param name="visits" value="1232" />
	</jsp:include>
	
</body>
</html>