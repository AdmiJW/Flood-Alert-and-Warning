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
	<jsp:include page="includes/breadcrumb.jsp" />
	
	<div class='container'>
	<!-- Static Content -->
		<p class="text-center h1 mb-5">Edit Evacuation Point</p>
	
		<%-- <% Object evacPoint = request.getParameter("index"); %> --%>
	<!-- Evacuation Point Edit Form -->
		<div class='mb-4'>
			<form method="post" action="editEvacPoint">
				<div class="form-group mb-2">
					<label for="name">Name:</label> 
					<input type="text" class="form-control" id="name" value="evacPoint.name"> 
				</div>
				<div class="form-group mb-2">
					<label for="location">Location:</label> 
					<input type="text" class="form-control" id="location" value="evacPoint.location">
				</div>
				<div class="form-group mb-2">
					<label for="capacity">Capacity:</label> 
					<input type="number" class="form-control" id="capacity" value="evacPoint.capacity" min="1">
				</div>
				<div class="form-group mb-2">
					<label for="remarks">Remarks:</label> 
					<textarea class="form-control" id="remarks" rows="3" value="evacPoint.remarks"></textarea>
				</div>
				<div class="form-group mb-2">
					<label for="maps">Maps:</label> 
					<textarea class="form-control" id="maps" rows="3" placeholder="mapAPI"></textarea>
				</div>

				<button type="submit" class="btn btn-primary mt-4">Submit</button>
			</form>
		</div>
	</div>
	
	<!-- Footer -->
	<jsp:include page="includes/footer.jsp">
		<jsp:param name="visits" value="1232" />
	</jsp:include>
	
</body>
</html>