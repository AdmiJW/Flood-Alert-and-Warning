<%@page import="utils.CookieUtil"%>
<%@page import="model.Locations"%>


<%@ 
	page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
%>


<%
	// Obtain Locations object from Model Locations
	Locations loc = Locations.getInstance(application);

	CookieUtil.setCookie(response, "primaryAlert", "Hello");
%>




<!DOCTYPE html>
<html>

<!-- Header -->
<jsp:include page="includes/header.jsp">
	<jsp:param name="title" value="FAW - Subscribe" />
</jsp:include>

<script> const locs = JSON.parse(`<%= loc.asJSON() %>`); </script>
<script src="public/scripts/subscribePage.js"></script>

<body>

	<!-- Navbar -->
	<jsp:include page="includes/navbar.jsp">
		<jsp:param name="route" value="subscribe" />
		<jsp:param name="username" value="" />
	</jsp:include>
	
	<!-- Breadcrumb -->
	<jsp:include page="includes/breadcrumb.jsp" />
	
	<!-- Alert -->
	<jsp:include page="includes/alert.jsp" />
	
	

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

			<a href="subscriptions.jsp" class='btn btn-info mt-3'>
				View My Subscriptions 
			</a>
		</p>
		
		
		<form class='bg-light rounded shadow-sm m-auto p-3 my-4' style='max-width: 500px;' method='POST' action='' >
		
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
				    
				    <% for (String state: loc.getStates()) { %>
				    	<option value='<%= state %>'><%= state %></option>
				    <% } %>
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
	<jsp:include page="includes/footer.jsp">
		<jsp:param name="visits" value="123" />
	</jsp:include>

</body>
</html>




