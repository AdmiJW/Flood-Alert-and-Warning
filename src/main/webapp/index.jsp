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
	

	<!-- Dummy content -->
	<div class='container'>
		<h2 class='fw-bold py-4'>Hello IP</h2>

		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">Email address</label>
			<input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
		</div>
		
		<div class="mb-5">
			<label for="exampleFormControlTextarea1" class="form-label">Example textarea</label>
			<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
		</div>
		
		<button class='btn btn-primary btn-lg mb-4'>Let's go</button>
	</div>


	<!-- Footer -->
	<jsp:include page="includes/footer.jsp">
		<jsp:param name="visits" value="123" />
	</jsp:include>


</body>
</html>