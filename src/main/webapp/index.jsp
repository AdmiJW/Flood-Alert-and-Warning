<%@ 
	page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
%>

<!DOCTYPE html>
<html>

<jsp:include page="includes/header.jsp">  
	<jsp:param name="title" value="Flood Alert and Warning" />
</jsp:include>

<body>
	
	<!-- Navbar -->
	<jsp:include page="includes/navbar.jsp">
		<jsp:param name="route" value="dashboard/reports/evacuation/subscribe"/>
		<jsp:param name="username" value=""/>
	</jsp:include>
		

	<div class='container'>
		<div class='p-4'>
			<p class='lead'>Hello IP</p>
			<button class='btn btn-primary btn-lg'>Let's go</button>
		</div>
	</div>
	
	
</body>

</html>