<%@ 
	page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
%>


<!DOCTYPE html>
<html>

<!-- Header -->
<jsp:include page="includes/header.jsp">
	<jsp:param name="title" value="FAW - Register" />
</jsp:include>

<body>

	<!-- Navbar -->
	<jsp:include page="includes/navbar.jsp">
		<jsp:param name="route" value="register" />
		<jsp:param name="username" value="" />
	</jsp:include>
	
	<!-- Breadcrumb -->
	<jsp:include page="includes/breadcrumb.jsp" />
	
	<!-- Alert -->
	<jsp:include page="includes/alert.jsp" />

	<!-- Login form -->
	<div class='container my-5'>
		<form class='bg-light rounded shadow-sm m-auto p-3' style='max-width: 500px;'>
		
			<div class='text-center display-6'>
				<i class="bi bi-lightning-charge-fill"></i>
            	<span class="fw-bold">FAW</span>
			</div>
			
			<p class='text-center fs-3 fw-light'>
				Registration
			</p>
		
			<div class="mb-3">
				<label for="username" class="form-label">Username</label>
				<input type="text" class="form-control" id="username" name='username'>
			</div>
			
			<div class="mb-3">
				<label for="email" class="form-label">Email</label>
				<input type="email" class="form-control" id="email" name='email'>
			</div>
			
			<div class="mb-3">
				<label for="tel" class="form-label">Phone</label>
				<input type="tel" class="form-control" id="tel" name='tel'>
			</div>
			
			<div class="mb-3">
				<label for="password" class="form-label">Password</label>
				<div class='input-group'>
					<input type="password" class="form-control" id="password" data-show-password="password">
					<button class="btn btn-primary" type="button" data-show-password="password">
						<i class="bi bi-eye-fill"></i>
					</button>
				</div>
			</div>
			
			<button type="submit" class="btn btn-primary">Submit</button>
			
			<p class='text-muted mt-4'>
				Already have an account?
				<a href='/Flood_Alert_and_Warning/login.jsp'>Login</a>
			</p>
		</form>
	</div>
	
	<!-- Footer -->
	<jsp:include page="includes/footer.jsp">
		<jsp:param name="visits" value="123" />
	</jsp:include>

</body>
</html>