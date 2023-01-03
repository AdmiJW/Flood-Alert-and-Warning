
<%@ 
	page language="java" 
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
%>



<!DOCTYPE html>
<html>

<!-- Header -->
<jsp:include page="/includes/header.jsp" />

<body>

	<!-- Navbar -->
	<jsp:include page="/includes/navbar.jsp">
		<jsp:param name="route" value="subscribe" />
		<jsp:param name="username" value="" />
	</jsp:include>
	
	<!-- Breadcrumb -->
	<jsp:include page="/includes/breadcrumb.jsp" />
	
	<!-- Alert -->
	<jsp:include page="/includes/alert.jsp" />
	

	<!-- Subscription form -->
	<main class='container my-4'>
		
		<h1 class='text-center fw-bold'>
			My Subscriptions
			<i class="bi bi-mailbox2 ms-2"></i>
		</h1>
		
		<!-- Table -->
		<div class='table-responsive my-4 mx-auto' style='max-width: 1000px;'>
			<table class="table table-dark table-striped table-hover">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Station</th>
						<th scope="col">Email</th>
						<th scope="col">SMS</th>
						<th scope='col'></th>
					</tr>
				</thead>
				
				<tbody>
				    <tr>
						<th scope="row">1</th>
						<td>Kg. Kuala Kabong, Kulai, Johor</td>
						<td>
							<i class="bi bi-check-circle-fill text-success fs-4"></i>
						</td>
						<td>
							<i class="bi bi-x-circle-fill text-danger fs-4"></i>
						</td>
						<td class='text-end'>
							<a class='btn btn-danger' href='#'>
								<i class="bi bi-trash-fill"></i>
							</a>
						</td>
				    </tr>
				    
				    <tr>
						<th scope="row">2</th>
						<td>Pusat Bandar Kulai (Berhampiran Bangunan Mara Kulai), Kulai, Johor</td>
						<td>
							<i class="bi bi-check-circle-fill text-success fs-4"></i>
						</td>
						<td>
							<i class="bi bi-check-circle-fill text-success fs-4"></i>
						</td>
						<td class='text-end'>
							<a class='btn btn-danger' href='#'>
								<i class="bi bi-trash-fill"></i>
							</a>
						</td>
				    </tr>
				    
				    <tr>
						<th scope="row">2</th>
						<td>Bandar Kulai Bt21, Kulai, Johor</td>
						<td>
							<i class="bi bi-check-circle-fill text-success fs-4"></i>
						</td>
						<td>
							<i class="bi bi-check-circle-fill text-success fs-4"></i>
						</td>
						<td class='text-end'>
							<a class='btn btn-danger' href='#'>
								<i class="bi bi-trash-fill"></i>
							</a>
						</td>
				    </tr>
				    
				    <tr>
						<th scope="row">1</th>
						<td>Istana &amp; Kawasan Sekitarnya, Johor Bahru, Johor</td>
						<td>
							<i class="bi bi-x-circle-fill text-danger fs-4"></i>
						</td>
						<td>
							<i class="bi bi-check-circle-fill text-success fs-4"></i>
						</td>
						<td class='text-end'>
							<a class='btn btn-danger' href='#'>
								<i class="bi bi-trash-fill"></i>
							</a>
						</td>
				    </tr>
				    
				    <tr>
						<th scope="row">1</th>
						<td>Sk Taman Bukit Dahlia, Johor Bahru, Johor</td>
						<td>
							<i class="bi bi-x-circle-fill text-danger fs-4"></i>
						</td>
						<td>
							<i class="bi bi-check-circle-fill text-success fs-4"></i>
						</td>
						<td class='text-end'>
							<a class='btn btn-danger' href='#'>
								<i class="bi bi-trash-fill"></i>
							</a>
						</td>
				    </tr>
				</tbody>
			</table>
		</div>

		<!-- Pagination -->
		<jsp:include page="/includes/pagination.jsp">
			<jsp:param name="totalPages" value="5" />
			<jsp:param name="activePage" value="2" />
			<jsp:param name="link" value="Subscribe/Subscriptions" />
		</jsp:include>
		
		
		<!-- Back button -->
		<div class='d-flex justify-content-center gap my-4'>
			<a class='btn btn-info' href='subscribe.jsp'>
				Back
			</a>
		</div>
		
	</main>
	
	
	<!-- Footer -->
	<jsp:include page="/includes/footer.jsp">
		<jsp:param name="visits" value="123" />
	</jsp:include>

</body>
</html>




