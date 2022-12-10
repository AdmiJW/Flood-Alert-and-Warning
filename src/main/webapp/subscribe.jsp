<%@ 
	page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
%>


<!DOCTYPE html>
<html>

<!-- Header -->
<jsp:include page="includes/header.jsp">
	<jsp:param name="title" value="FAW - Subscribe" />
</jsp:include>

<script src="public/scripts/showPassword.js"></script>

<body>

	<!-- Navbar -->
	<jsp:include page="includes/navbar.jsp">
		<jsp:param name="route" value="login" />
		<jsp:param name="username" value="" />
	</jsp:include>
	
	<!-- Breadcrumb -->
	<jsp:include page="includes/breadcrumb.jsp" />

	<!-- Login form -->
	<div class='container my-5'>
		<form class='bg-light rounded shadow-sm m-auto p-3' style='max-width: 500px;'>
		
			<div class='text-center display-6'>
				<i class="bi bi-lightning-charge-fill"></i>
            	<span class="fw-bold">FAW</span>
			</div>
			
			<p class='text-center fs-3 fw-light'>
				User Login
			</p>
		
			<div class="mb-3">
				<label for="emailusername" class="form-label">Email/Username</label>
				<input type="text" class="form-control" name='emailusername' id="emailusername">
			</div>
			
			<div class="mb-3">
				<label for="password" class="form-label">Password</label>
				<div class='input-group'>
					<input type="password" class="form-control" id="password" name='password' data-show-password="password">
					<button class="btn btn-primary" type="button" data-show-password="password">
						<i class="bi bi-eye-fill"></i>
					</button>
				</div>
			</div>
			
			<div class="mb-3 form-check">
				<input type="checkbox" class="form-check-input" name='remember' id="remember">
				<label class="form-check-label" for="remember">Remember me</label>
			</div>
			
			<button type="submit" class="btn btn-primary">Submit</button>
			
			<p class='text-muted mt-4'>
				Don't have an account yet?
				<a href='/Flood_Alert_and_Warning/register.jsp'>Register</a>
			</p>
		</form>
	</div>
	
	<!-- Footer -->
	<jsp:include page="includes/footer.jsp">
		<jsp:param name="visits" value="123" />
	</jsp:include>

</body>
</html>