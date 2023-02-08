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
	<c:param name="title" value="FAW - Register" />
</c:import>

<body>
<div class="min-vh-100">

	<!-- Navbar -->
	<c:import url="/includes/navbar.jsp" />

	<!-- Breadcrumb -->
	<c:import url="/includes/breadcrumb.jsp">
		<c:param name="path" value="Register" />
	</c:import>
	
	<!-- Alert -->
	<c:import url="/includes/alert.jsp" />

	<!-- Login form -->
	<div class='container my-5'>
		<form
			class='bg-light rounded shadow-sm m-auto p-3'
			style='max-width: 500px;'
			method='POST'
			action='<c:url value="/Register" />'
		>
		
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
				<label for="phone" class="form-label">Phone</label>
				<input type="tel" class="form-control" id="phone" name='phone'>
			</div>
			
			<div class="mb-3">
				<label for="password" class="form-label">Password</label>
				<div class='input-group'>
					<input type="password" class="form-control" id="password" data-show-password="password" name="password">
					<button class="btn btn-primary" type="button" data-show-password="password">
						<i class="bi bi-eye-fill"></i>
					</button>
				</div>
			</div>
			
			<button type="submit" class="btn btn-primary">Submit</button>
			
			<p class='text-muted mt-4'>
				Already have an account?
				<a href='<c:url value="/Login" />'>Login</a>
			</p>
		</form>
	</div>
</div>

<!-- Footer -->
<c:import url="/includes/footer.jsp"/>

</body>
</html>