<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<!-- Header -->
<jsp:include page="includes/header.jsp">
	<jsp:param name="title" value="FAW - Reports" />
</jsp:include>
<body>
	<!-- Navbar -->
	<jsp:include page="includes/navbar.jsp">
		<jsp:param name="route" value="reports" />
		<jsp:param name="username" value="" />
	</jsp:include>

	<!-- Breadcrumb -->
	<jsp:include page="includes/breadcrumb.jsp" />

	<!-- Alert -->
	<jsp:include page="includes/alert.jsp" />

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

		<div class="input-group mb-3 w-50 float-end">
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



		<div class="carousel-inner py-4">
			<!-- Single item -->
			<div class="carousel-item active">
				<div class="container">
					<div class="row">
						<div class="col-sm col-xs-12 mb-4">
							<div class="card rounded-4 overflow-hidden">
								<img
									src="https://assets.nst.com.my/images/articles/FLOODS_TERENGGANU1812_1671351158.jpg"
									class="card-img-top" alt="flood" />
								<div class="card-body">
									<div class="card-title">
										<h3>Jonathan</h3>
									</div>
									<div class="card-desc">
										<span class="card-date">16th November 2022</span> <br> <span
											class="card-location">Klang Valley</span>
									</div>

									<div class="card-text mt-4">
										<h5>A passage to describe flood description</h5>
									</div>
									<a href="#!" class="btn btn-success rounded-3">Approve</a> <a
										href="#!" class="btn btn-danger rounded-3">Decline</a>
								</div>
							</div>
						</div>

						<div class="col-sm col-xs-12 mb-4">
							<div class="card rounded-4 overflow-hidden">
								<img
									src="https://assets.nst.com.my/images/articles/FLOODS_TERENGGANU1812_1671351158.jpg"
									class="card-img-top" alt="flood" />
								<div class="card-body">
									<div class="card-title">
										<h3>Jonathan</h3>
									</div>
									<div class="card-desc">
										<span class="card-date">16th November 2022</span> <br> <span
											class="card-location">Klang Valley</span>
									</div>

									<div class="card-text mt-4">
										<h5>A passage to describe flood description</h5>
									</div>
									<a href="#!" class="btn btn-success rounded-3">Approve</a> <a
										href="#!" class="btn btn-danger rounded-3">Decline</a>
								</div>
							</div>
						</div>

						<div class="col-sm col-xs-12 mb-4">
							<div class="card rounded-4 overflow-hidden">
								<img
									src="https://assets.nst.com.my/images/articles/FLOODS_TERENGGANU1812_1671351158.jpg"
									class="card-img-top" alt="flood" />
								<div class="card-body">
									<div class="card-title">
										<h3>Jonathan</h3>
									</div>
									<div class="card-desc">
										<span class="card-date">16th November 2022</span> <br> <span
											class="card-location">Klang Valley</span>
									</div>

									<div class="card-text mt-4">
										<h5>A passage to describe flood description</h5>
									</div>
									<a href="#!" class="btn btn-success rounded-3">Approve</a> <a
										href="#!" class="btn btn-danger rounded-3">Decline</a>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		</div>
	</div>

	<!-- Pagination -->
	<jsp:include page="includes/pagination.jsp">
		<jsp:param name="totalPages" value="5" />
		<jsp:param name="activePage" value="2" />
		<jsp:param name="link" value="Subscribe/Subscriptions" />
	</jsp:include>

	<!-- Footer -->
	<jsp:include page="includes/footer.jsp">
		<jsp:param name="visits" value="123" />
	</jsp:include>
</body>
</html>