<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


		<!DOCTYPE html>
		<html>

		<!-- Header -->
		<c:import url="/includes/header.jsp">
			<c:param name="title" value="FAW - Reports" />
		</c:import>

		<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script> 

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


					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="Search and Filter" id="searchbar"
							name="search_key" aria-label="Search and Filter">
						<div class="input-append">
							<div class="input-group date" id="datepickergroup1">
								<span class="input-group-text" style="border-radius: 0px;">From</span>
								<input type="date" class="form-control" id="datepicker1" name="start_date"
									style="border-radius: 0px;">
							</div>
						</div>
						<div class="input-append">
							<div class="input-group date" id="datepickergroup2">
								<span class="input-group-text" style="border-radius: 0px;">Until</span>
								<input type="date" class="form-control" value="" id="datepicker2"
									name="end_date" style="border-radius: 0px;">
							</div>
						</div>
					</div>

					<div class='d-flex justify-content-end'>
						<div class="input-group mb-3" style='max-width: 300px;'>
							
							<select class="form-select" name='review_type' id='review_type' 
									aria-label="Select review type">
									<c:set var="review_type" value="${['Pending','Approved','Denied','Expired']}"/>
									<c:forEach var="type" items="${review_type}">
										<c:if test="${type==reports.get(0).review_status}">
											<option selected value="${type}">${type}</option>
										</c:if>
										<c:if test="${type!=reports.get(0).review_status}">
											<option value="${type}">${type}</option>
										</c:if>
									</c:forEach>
									<!--<option value="Pending">Pending</option>
									<option value="Approved">Approved</option>
									<option value="Denied">Denied</option>
									<option value="Expired">Expired</option>-->
								</select>
						</div>
					</div>



					<!-- Contents -->
					<div id="ReportsAdminItems">
						<c:import url="ReportsAdminItems.jsp">
							<c:param name="reports" value="${reports}"/>
						</c:import>
					</div>


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
				var start_date=date1.val();
				var end_date=date2.val();
				$.ajax({
					url: "/FAW/Reports/Search",
					data: {
						search_key: $("#searchbar").val(),
						start_date: start_date,
						end_date: end_date
					},
					success: function (response) {
						$("#ReportsAdminItems").html(response);
					}
				});
			});

			$("#datepicker1, #datepicker2").on("change", function () {
				var start_date=date1.val();
				var end_date=date2.val();
				$.ajax({
					url: "/FAW/Reports/Search",
					data: {
						search_key: $("#searchbar").val(),
						start_date: start_date,
						end_date: end_date
					},
					success: function (response) {
						$("#ReportsAdminItems").html(response);
					}
				});
			})

			$("#review_type").on("change",function () {
				$.ajax({
					url: "/FAW/Reports/ReviewType",
					data: {
						review_type:$("#review_type option:selected").val()
					},
					success: function (response) {
						$("#ReportsAdminItems").html(response);
					}
				});
			})
		</script>

		</html>