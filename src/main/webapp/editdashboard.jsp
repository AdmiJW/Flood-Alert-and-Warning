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
		<p class="text-center h1 mb-5">Edit Dashboard</p>
	
		<%-- <% Object evacPoint = request.getParameter("index"); %> --%>
	<!-- Evacuation Point Edit Form -->
		<div class='mb-4'>
			<form method="post" action="editDashboard">
				<div class="form-group mb-2">
					<label for="station">Station:</label> 
					<input type="text" class="form-control" id="station" value="dashPoint.station"> 
				</div>
				<div class="form-group mb-2">
					<label for="waterlevel">Water Level (m):</label> 
					<input type="text" class="form-control" id="waterlevel" value="dashPoint.waterlevel">
				</div>
				<div class="form-group mb-2">
					<label for="rainfall">Rainfall (mm):</label> 
					<input type="number" class="form-control" id="rainfall" value="dashPoint.rainfall">
				</div>
				<div class="form-group mb-2">
					<label for="dashremarks">Remarks:</label> 
					<textarea class="form-control" id="dashremarks" rows="3" value="dashPoint.remarks"></textarea>
				</div>
				<div class="form-group mb-2">
					<jsp:include page="includes/map.jsp">
						<jsp:param value="PinOneEvac" name="action"/>
						<jsp:param value="Universiti Teknologi Malaysia" name="location"/>
					</jsp:include>
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