<%@ 
	page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>

<!-- Header -->
<c:import url="/includes/header.jsp">
	<c:param name="title" value="FAW - Login" />
</c:import>

<body>

	<!-- Navbar -->
	<c:import url="/includes/navbar.jsp" />

	<!-- Breadcrumb -->
	<c:import url="/includes/breadcrumb.jsp">
		<c:param name="path" value="Login" />
	</c:import>
	
	<!-- Alert -->
	<c:import url="/includes/alert.jsp" />

	<!-- Login form -->
	<div class='container my-5'>
		<form class='bg-light rounded shadow-sm m-auto p-3' style='max-width: 500px;' method='POST'>
		
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
	<c:import url="/includes/footer.jsp"/>

</body>
</html>