<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



		<!DOCTYPE html>
		<html>
		<!-- Header -->
		<c:import url="/includes/header.jsp">
			<c:param name="title" value="FAW - Reports" />
		</c:import>

		<script src="<c:url value='/public/scripts/geoSelectInput.js'/>"></script>
		
		<!--<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/3.1.4/js/bootstrap-datetimepicker.min.js"></script>
		
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.css" rel="stylesheet">-->

		<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/css/bootstrap-datetimepicker.css" rel="stylesheet">
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment-with-locales.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.47/js/bootstrap-datetimepicker.min.js"></script>

		<body>
			<div class="min-vh-100">
				<!-- Navbar -->
				<c:import url="/includes/navbar.jsp">
					<c:param name="active" value="reports" />
				</c:import>

				<!-- Breadcrumb -->
				<c:import url="/includes/breadcrumb.jsp">
					<c:param name="path" value="Reports" />
				</c:import>

				<!-- Alert -->
				<c:import url="/includes/alert.jsp" />



				<div class='container'>
					<div class='my-4'>
						<h1 class='text-center fw-bold'>
							Report <i class="bi bi-chat-square-text-fill"></i>
						</h1>

						<p class='lead text-center text-muted'>Report a flood or possible
							cause of flooding</p>
					</div>

					<form action="<c:url value="/Reports/Search"/>" method="get">
						<div class="input-group mb-3">
							<input type="text" class="form-control" placeholder="Search and Filter" id="searchbar"
								name="search_key" aria-label="Search and Filter">
							<div class="input-append" >
								<div class="input-group date" id="datetimepicker6">
									<span class="input-group-text"  style="border-radius: 0px;"><i class="bi bi-calendar3"></i></span>
									<input type="text" class="form-control" placeholder="From" id="datetimepicker6"
										name="start_date"  style="border-radius: 0px;">
								</div>
							</div>
							<div class="input-append">
								<div class="input-group date" id="datetimepicker6">
									<span class="input-group-text"  style="border-radius: 0px;"><i class="bi bi-calendar3" ></i></span>
									<input type="text" class="form-control" placeholder="Until" id="datetimepicker7"
										name="end_date"  style="border-radius: 0px;">
								</div>
							</div>
							 <input type="submit" class="btn btn-primary" value="Search" id="button-addon2">
						</div>
					</form>

					<script type="text/javascript">
						$(function () {
							$('#datetimepicker6').datetimepicker();
							$('#datetimepicker7').datetimepicker({
						useCurrent: false //Important! See issue #1075
						});
							$("#datetimepicker6").on("dp.change", function (e) {
								$('#datetimepicker7').data("DateTimePicker").minDate(e.date);
							});
							$("#datetimepicker7").on("dp.change", function (e) {
								$('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
							});
						});
					 </script>
				</div>
				

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
							</div>
						</div>

					</div>
				</c:forEach>
			</div>

			<div class="sticky-bottom" style="margin-left: 90%;"><a href="<c:url value='/Reports/Add'/>" /><i
					class="bi bi-plus-circle-fill" style="font-size:80px"></i></a></div>

			<!-- Pagination -->
			<c:import url="/includes/pagination.jsp" />
			</div>

			<!-- Footer -->
			<c:import url="/includes/footer.jsp" />

		</body>

		</html>