
<%@page
	language="java"
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>

<!-- Header -->
<c:import url="/includes/header.jsp" />

<body>

	<!-- Navbar -->
	<c:import url="/includes/navbar.jsp" />

	<!-- Breadcrumb -->
	<c:import url="/includes/breadcrumb.jsp">
		<c:param name="path" value="Subscribe/Subscriptions" />
	</c:import>
	
	<!-- Alert -->
	<c:import url="/includes/alert.jsp" />
	

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
		<c:import url="/includes/pagination.jsp">
			<c:param name="totalPages" value="5" />
			<c:param name="activePage" value="2" />
			<c:param name="link" value="Subscribe/Subscriptions" />
		</c:import>
		
		
		<!-- Back button -->
		<div class='d-flex justify-content-center gap my-4'>
			<a class='btn btn-info' href='<c:url value="/Subscribe" />'>
				Back
			</a>
		</div>
		
	</main>


	<!-- Footer -->
	<c:import url="/includes/footer.jsp"/>

</body>
</html>




