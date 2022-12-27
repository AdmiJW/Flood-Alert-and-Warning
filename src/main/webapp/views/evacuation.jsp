<%@ 
	page language="java" 
	contentType="text/html; 
	charset=ISO-8859-1" 
	pageEncoding="ISO-8859-1" 
%>

<html>

<jsp:include page="/includes/header.jsp">
	<jsp:param name="title" value="FAW" />
</jsp:include>


<body>
	<!-- Navbar -->
	<jsp:include page="/includes/navbar.jsp">
		<jsp:param name="route" value="dashboard/reports/evacuation/subscribe" />
		<jsp:param name="username" value="" />
	</jsp:include>
	
	<!-- Breadcrumb -->
	<jsp:include page="/includes/breadcrumb.jsp" />
	
	<div class='container'>
		<h1 class='text-center fw-bold'>
			Evacuation
			<i class="bi bi-houses"></i>
		</h1>
		
		<!-- MAP API -->
		<div class='mb-5'>
			<jsp:include page="/includes/bingMapSearch.jsp" />
			
			<jsp:include page="/includes/bingMap.jsp">
				<jsp:param value="500px" name="height"/>
			</jsp:include>
		</div>
		
		<!-- Evacuation Point Detail Card  -->
		<div class='mb-4'>
			<jsp:include page="/includes/evacPointTable.jsp">
				<jsp:param name="EvacPoint" value="Parameter" />
			</jsp:include>
		</div>
	</div>
	
	<!-- Footer -->
	<jsp:include page="/includes/footer.jsp">
		<jsp:param name="visits" value="1232" />
	</jsp:include>
	
</body>
</html>