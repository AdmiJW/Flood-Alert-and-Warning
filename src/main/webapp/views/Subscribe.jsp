<%@page
	language="java"
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>






<!DOCTYPE html>
<html>

<!-- Header -->
<c:import url="/includes/header.jsp">
	<c:param name="title" value="FAW - Subscribe" />
</c:import>

<script>
	const districts = JSON.parse(`${districts}`);
	const locations = JSON.parse(`${locations}`);
</script>
<script src="<c:url value="/public/scripts/subscribePage.js" />"></script>


<body>

	<!-- Navbar -->
	<c:import url="/includes/navbar.jsp">
		<c:param name="active" value="subscribe" />
	</c:import>

	<!-- Breadcrumb -->
	<c:import url="/includes/breadcrumb.jsp">
		<c:param name="path" value="Subscribe" />
	</c:import>
	
	<!-- Alert -->
	<c:import url="/includes/alert.jsp" />
	
	

	<!-- Subscription form -->
	<main class='container my-4'>
		
		<h1 class='text-center fw-bold'>
			Subscribe
			<i class="bi bi-bell-fill"></i>
		</h1>
			
		<p class='lead text-center text-muted'>
			Obtain flood warning announcements through your email.
			<br>
			Receive flood forecast alerts of your registered Point of Interest (POI) locations. 
			<br>

			<a href="<c:url value="/Subscribe/Subscriptions" />" class='btn btn-info mt-3'>
				View My Subscriptions 
			</a>
		</p>
		
		
		<form
			class='bg-light rounded shadow-sm m-auto p-3 my-4'
			style='max-width: 500px;'
			method='POST'
			action='<c:url value="/Subscribe" />'
		>
		
			<div class='text-center display-6'>
				<i class="bi bi-lightning-charge-fill"></i>
            	<span class="fw-bold">FAW</span>
			</div>
			
			<p class='text-center fs-3 fw-light'>
				Subscription Form
			</p>
		
			<!-- Select state -->
			<div class="mb-2">
				<label for="state" class="form-label fw-bold">State:</label>
				
				<select class="form-select" name='state' id='state' required aria-label="Select state">
				    <option selected disabled value=''>Select state</option>

					<c:forEach items="${states}" var="state">
						<option value="${state.id}">${state.name}</option>
					</c:forEach>
				</select>
			</div>
			
			<!-- Select district -->
			<div class="mb-2">
				<label for="district" class="form-label fw-bold">District:</label>
				
				<select class="form-select" name='district' id='district' required aria-label="Select district">
				    <option selected disabled value=''>Select district</option>
				</select>
			</div>
			
			<!-- Select POI -->
			<div class="mb-5">
				<label for="location" class="form-label fw-bold">Location:</label>
				
				<select class="form-select" name='location' id='location' required aria-label="Select location">
				    <option selected disabled value=''>Select location</option>
				</select>
			</div>
			
			<!-- Notification method -->
			<div class="form-check">
				<input type="checkbox" class="form-check-input" name='email' id="email">
				<label class="form-check-label" for="email">Email Notification</label>
			</div>
			
			<div class="mb-4 form-check">
				<input type="checkbox" class="form-check-input" name='sms' id="sms">
				<label class="form-check-label" for="sms">SMS Notification</label>
			</div>
			
			<button type="submit" class="btn btn-primary">Submit</button>
		</form>
	</main>


	<!-- Footer -->
	<c:import url="/includes/footer.jsp"/>

</body>
</html>




