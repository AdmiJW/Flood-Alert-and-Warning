<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


		<!DOCTYPE html>
		<html>

		<!-- Header -->
		<c:import url="/includes/header.jsp">
			<c:param name="title" value="FAW - Reports" />
		</c:import>

		<body>
			<div class="min-vh-100">

				<!-- Navbar -->
				<c:import url="/includes/navbar.jsp" />

				<!-- Breadcrumb -->
				<c:import url="/includes/breadcrumb.jsp">
					<c:param name="path" value="Reports/Admin/Edit" />
				</c:import>


				<!-- Alert -->
				<c:import url="/includes/alert.jsp" />

				<div class='container'>

					<div class='my-4'>
						<h1 class='text-center fw-bold'>
							Report Control Center <i class="bi bi-chat-square-text-fill"></i>
						</h1>
					</div>


					<form action="<c:url value='/Reports/Search'/>" method="get">
						<div class="input-group mb-3">
							<input type="text" class="form-control" placeholder="Search and Filter" id="searchbar"
								name="search_key" aria-label="Search and Filter">
							<div class="input-append">
								<div class="input-group date" id="datetimepicker6">
									<span class="input-group-text" style="border-radius: 0px;"><i
											class="bi bi-calendar3"></i></span>
									<input type="text" class="form-control" placeholder="From" id="datetimepicker6"
										name="start_date" style="border-radius: 0px;">
								</div>
							</div>
							<div class="input-append">
								<div class="input-group date" id="datetimepicker6">
									<span class="input-group-text" style="border-radius: 0px;"><i
											class="bi bi-calendar3"></i></span>
									<input type="text" class="form-control" placeholder="Until" id="datetimepicker7"
										name="end_date" style="border-radius: 0px;">
								</div>
							</div>
							<input class="btn btn-primary" id="button-addon2" type="submit" value="Search">
						</div>
					</form>

					<div class='d-flex justify-content-end'>
						<div class="input-group mb-3" style='max-width: 300px;'>
							<input type="text" class="form-control" aria-label="Text input with dropdown button">

							<button class="btn btn-outline-primary" type="button" data-bs-toggle="dropdown"
								aria-expanded="false"><i class="bi bi-chevron-down"></i></button>

							<ul class="dropdown-menu dropdown-menu-end">
								<li><a class="dropdown-item" href="<c:url value='/Reports/ReviewType/Approved'/>">Approved</a></li>
								<li><a class="dropdown-item" href="<c:url value='/Reports/ReviewType/Pending'/>">Pending</a></li>
								<li><a class="dropdown-item" href="<c:url value='/Reports/ReviewType/Rejected'/>">Rejected</a></li>
								<li><a class="dropdown-item" href="<c:url value='/Reports/ReviewType/Expired'/>">Expired</a></li>
							</ul>
						</div>
					</div>



					<!-- Contents -->
					<c:forEach items="${reports}" var="report" varStatus="loop">

						<div class="d-grid py-4 gap-4 justify-content-center"
							style='grid-template-columns: repeat( auto-fit, minmax(250px, 350px) );'>

							<div class="card rounded-4 overflow-hidden">
								<img src="${report.media_path}" class="card-img-top" alt="flood" />


								<div class="card-body">
									<div class="card-title">
										<h3>${report.user.username}</h3>
									</div>

									<div class="card-desc text-muted">
										<span class="card-date">${report.submission_date}</span> <br>
										<span class="card-location">${report.location.name}</span><br>
										<span class="card-location">${report.district.name},
											${report.state.name}</span><br>
									</div>

									<p class="card-text mt-4">
										${report.detail}
									</p>
									<c:choose>
										<c:when test="${report.review_status=='Pending'}">
											<div class='mt-4'>
												<a href=
												"<c:url value='/Reports/Review'>
													<c:param name='review_type' value='Approved'/>
													<c:param name='reportID' value='${report.id}'/>
												</c:url>"
													class="btn btn-success">Approve</a>
												<a href="<c:url value='/Reports/Review'>
													<c:param name='review_type' value='Rejected'/>
													<c:param name='reportID' value='${report.id}'/>
												</c:url>"
													class="btn btn-danger">Reject</a>
											</div>
										</c:when>
										<c:when test="${report.review_status=='Approved'}">
											<div class='mt-4'>
												<button class="btn btn-success" disabled>Approved</button>
											</div>
										</c:when>
										<c:when test="${report.review_status=='Rejected'}">
											<div class='mt-4'>
												<button class="btn btn-danger" disabled>Rejected</button>
											</div>
										</c:when>
									</c:choose>
								</div>
							</div>

						</div>
					</c:forEach>


				</div>
			</div>

			<!-- Pagination -->
			<c:import url="/includes/pagination.jsp">
				<c:param name="totalPages" value="5" />
				<c:param name="activePage" value="2" />
				<c:param name="link" value="Subscribe/Subscriptions" />
			</c:import>

			</div>

			<!-- Footer -->
			<c:import url="/includes/footer.jsp" />

		</body>

		<script>
			let date1 = $("#datepicker1");
			let date2 = $("#datepicker2");

			date1.on("change", function () {
				if (date1.val() != "") {
					date2.attr("min", date1.val());
				}
				else {
					date2.removeAttr("min");
				}
			});
			date2.on("change", function () {
				if (date2.val() != "") {
					date1.attr("max", date2.val());
				}
				else {
					date1.removeAttr("max");
				}
			});

			$("#searchbar").on("keyup", function () {
				var start_date=null;
				var end_date=null;
				$.ajax({
					url: "/FAW/Reports/Search",
					data: {
						search_key: $("#searchbar").val(),
						start_date: start_date,
						end_date: end_date
					},
					success: function (response) {
						$("#ReportsItems").html(response);
					}
				});
			});

			$("#datepicker1, #datepicker2").on("change", function () {
				var date_segments=null;
				var start_date=null;
				var end_date=null;
				if (date1.val()!="") {
					date_segments = date1.val().split("-");
					start_date = date_segments[2] + "-" + date_segments[1] + "-" + date_segments[0];
				}
				if(date2.val()!=""){
					date_segments = "";
					date_segments = date2.val().split("-");
					end_date = date_segments[2] + "-" + date_segments[1] + "-" + date_segments[0];
				}
				$.ajax({
					url: "/FAW/Reports/Search",
					data: {
						search_key: $("#searchbar").val(),
						start_date: start_date,
						end_date: end_date
					},
					success: function (response) {
						$("#ReportsItems").html(response);
					}
				});
			})
		</script>

		</html>