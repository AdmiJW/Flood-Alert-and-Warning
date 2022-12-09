<%@ 
	page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
%>


<!DOCTYPE html>
<html>

<!-- Header -->
<jsp:include page="includes/header.jsp">
	<jsp:param name="title" value="FAW - Login" />
</jsp:include>


<body>

	<!-- Navbar -->
	<jsp:include page="includes/navbar.jsp">
		<jsp:param name="route" value="dashboard/reports/evacuation/subscribe" />
		<jsp:param name="username" value="" />
	</jsp:include>
	
	<!-- Breadcrumb -->
	<jsp:include page="includes/breadcrumb.jsp" />
	
	<!-- Footer -->
	<jsp:include page="includes/footer.jsp">
		<jsp:param name="visits" value="123" />
	</jsp:include>

</body>
</html>