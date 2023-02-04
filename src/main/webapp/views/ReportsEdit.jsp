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
	<c:param name="title" value="FAW - Reports" />
</c:import>
<body>
	<!-- Navbar -->
	<c:import url="/includes/navbar.jsp">
		<c:param name="route" value="reports" />
		<c:param name="username" value="" />
	</c:import>

	<!-- Breadcrumb -->
	<c:import url="/includes/breadcrumb.jsp">
		<c:param name="path" value="Dashboard/Edit" />
	</c:import>
	
	
	<!-- Alert -->
	<c:import url="/includes/alert.jsp" />

	<div class='container'>
	
		<div class='my-4'>
			<h1 class='text-center fw-bold'>
				Report Control Center <i class="bi bi-chat-square-text-fill"></i>
			</h1>
		</div>


		<div class="input-group mb-3">
			<input type="text" class="form-control"
				placeholder="Search and Filter" aria-label="Search and Filter">
			<button class="btn btn-primary" type="button" id="button-addon2">Search</button>
		</div>

		<div class='d-flex justify-content-end'>
			<div class="input-group mb-3" style='max-width: 300px;'>
				<input type="text" class="form-control"
					aria-label="Text input with dropdown button">
					
				<button class="btn btn-outline-primary"
					type="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="bi bi-chevron-down"></i></button>
					
				<ul class="dropdown-menu dropdown-menu-end">
					<li><a class="dropdown-item" href="#">Approved</a></li>
					<li><a class="dropdown-item" href="#">Pending</a></li>
					<li><a class="dropdown-item" href="#">Declined</a></li>
				</ul>
			</div>
		</div>
		


		<!-- Contents -->
		<div class="d-grid py-4 gap-4 justify-content-center" style='grid-template-columns: repeat( auto-fit, minmax(250px, 350px) );'>
			
			<div class="card rounded-4 overflow-hidden">
				<img
					src="https://assets.nst.com.my/images/articles/FLOODS_TERENGGANU1812_1671351158.jpg"
					class="card-img-top" alt="flood" />
					
				<div class="card-body">
					<div class="card-title">
						<h3>Jonathan</h3>
					</div>
					
					<div class="card-desc text-muted">
						<span class="card-date">16th November 2022</span> <br> 
						<span class="card-location">Klang Valley</span>
					</div>

					<p class="card-text mt-4">
						Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
					</p>
					
					<div class='mt-4'>
						<a href="#!" class="btn btn-success">Approve</a> 
						<a href="#!" class="btn btn-danger">Decline</a>
					</div>
				</div>
			</div>

			<div class="card rounded-4 overflow-hidden">
				<img
					src="https://ichef.bbci.co.uk/news/976/cpsprodpb/472D/production/_122312281_gettyimages-1237349496.jpg"
					class="card-img-top" alt="flood" />
				<div class="card-body">
					<div class="card-title">
						<h3>Alex</h3>
					</div>
					<div class="card-desc text-muted">
						<span class="card-date">16th November 2022</span> <br> 
						<span class="card-location">Klang Valley</span>
					</div>

					<p class="card-text mt-4">
						Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
					</p>
					
					<div class='mt-4'>
						<a href="#!" class="btn btn-success">Approve</a> 
						<a href="#!" class="btn btn-danger">Decline</a>
					</div>
				</div>
			</div>

			<div class="card rounded-4 overflow-hidden">
				<img
					src="https://image.cnbcfm.com/api/v1/image/106991396-1639914080677-Malaysia_floods_Dec_2021GettyImages.jpg?v=1639924911&w=1600&h=900"
					class="card-img-top" alt="flood" />
				<div class="card-body">
					<div class="card-title">
						<h3>Billy Wong</h3>
					</div>
					<div class="card-desc text-muted">
						<span class="card-date">16th November 2022</span> <br> 
						<span class="card-location">Klang Valley</span>
					</div>

					<p class="card-text mt-4">
						Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.
					</p>
					
					<div class='mt-4'>
						<a href="#!" class="btn btn-success">Approve</a> 
						<a href="#!" class="btn btn-danger">Decline</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Pagination -->
	<c:import url="/includes/pagination.jsp">
		<c:param name="totalPages" value="5" />
		<c:param name="activePage" value="2" />
		<c:param name="link" value="Subscribe/Subscriptions" />
	</c:import>

	<!-- Footer -->
	<c:import url="/includes/footer.jsp"/>
</body>
</html>