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
	
	<!-- Breadcrumb -->
	<jsp:include page="includes/breadcrumb.jsp" />
	
	<!-- Alert -->
	<jsp:include page="includes/alert.jsp" />
	

	<!-- MAP API HERE -->
	<div class='container'>
		<h2 class='fw-bold py-4'>MAP PLACE HERE</h2>
			<!-- MAP API -->
		<div class='mb-5'>
			<jsp:include page="includes/map.jsp"></jsp:include>
		</div>
	</div>
	
	<div>
		<p class="text-center h1">Dashboard</p>
		
		<p>Table of Stations</p>
		<div class='mb-4'>
			<jsp:include page="includes/dashPointCard.jsp">
				<jsp:param name="DashPoint" value="Parameter" />
			</jsp:include>
		</div>
		
	</div>


	<!-- Footer -->
	<jsp:include page="includes/footer.jsp">
		<jsp:param name="visits" value="123" />
	</jsp:include>


</body>
</html>