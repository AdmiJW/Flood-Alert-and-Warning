<%@ 
	page language="java" 
	contentType="text/html; 
	charset=ISO-8859-1" 
	pageEncoding="ISO-8859-1" 
%>

<!DOCTYPE html>
<html>

<!-- Header -->
<jsp:include page="includes/header.jsp">
	<jsp:param name="title" value="FAW" />
</jsp:include>


<body>

	<!-- Navbar -->
	<jsp:include page="includes/navbar.jsp">
		<jsp:param name="route" value="dashboard/reports/evacuation/subscribe" />
		<jsp:param name="username" value="" />
	</jsp:include>
			
	<!-- Map and search -->
	<jsp:include page="includes/bingMap.jsp">
		<jsp:param value="100vh" name="height"/>
		<jsp:param value="100%" name="width"/>
	</jsp:include>
	
	<div class='container mt-2'>
		<jsp:include page="includes/bingMapSearch.jsp" />	
	</div>
	
	<!-- Alert -->
	<jsp:include page="includes/alert.jsp" />
	
	
	<main class='container my-4'>
		<!-- Breadcrumb -->
		<jsp:include page="includes/breadcrumb.jsp" />
		
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
		
			<jsp:include page="includes/dashPointCard.jsp">
				<jsp:param name="DashPoint" value="Parameter" />
			</jsp:include>
		</div>
	</main>
	
	
	<!-- Footer -->
	<jsp:include page="includes/footer.jsp">
		<jsp:param name="visits" value="123" />
	</jsp:include>


</body>
</html>