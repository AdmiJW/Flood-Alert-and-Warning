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
	<jsp:param name="title" value="Flood Alert and Warning" />
</jsp:include>


<body>

	<!-- Navbar -->
	<jsp:include page="includes/navbar.jsp">
		<jsp:param name="route" value="dashboard/reports/evacuation/subscribe" />
		<jsp:param name="username" value="" />
	</jsp:include>


	<!-- Dummy content -->
	<div class='container'>
		<div class='py-4'>
			<p class='lead'>Hello IP</p>
			<button class='btn btn-primary btn-lg'>Let's go</button>
		</div>

		<div class="mb-3">
			<label for="exampleFormControlInput1" class="form-label">Email address</label>
			<input type="email" class="form-control" id="exampleFormControlInput1" placeholder="name@example.com">
		</div>
		<div class="mb-5">
			<label for="exampleFormControlTextarea1" class="form-label">Example textarea</label>
			<textarea class="form-control" id="exampleFormControlTextarea1" rows="3"></textarea>
		</div>
	</div>


	<!-- Footer -->
	<jsp:include page="includes/footer.jsp">
		<jsp:param name="visits" value="123" />
	</jsp:include>


</body>
</html>