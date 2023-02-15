<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



		<!DOCTYPE html>
		<html>
		<!-- Header -->
		<c:import url="/includes/header.jsp">
			<c:param name="title" value="FAW - Reports" />
		</c:import>

		<script src="<c:url value='/public/scripts/geoSelectInput.js'/>"></script>
		
		<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script> 


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
				</div>


				<div id="ReportsItems">
					<c:choose>
						<c:when test="${from_profile!=true}">
							<c:import url="ReportsItems.jsp">
								<c:param name="reports" value="${reports}" />
							</c:import>
						</c:when>
						<c:otherwise>
							<c:import url="ReportsHistory.jsp">
								<c:param name="reports" value="${reports}" />
								<c:param name="from_profile" value="${from_profile}" />
							</c:import>
						</c:otherwise>
					</c:choose>
				</div>
			</div>

			<div class="sticky-bottom" style="margin-left: 90%;"><a href="<c:url value='/Reports/Add'/>" /><i
					class="bi bi-plus-circle-fill" style="font-size:80px"></i></a></div>

			<!-- Pagination -->
			<c:import url="/includes/pagination.jsp" />
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
						$("#ReportsItems").html(response);
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
						$("#ReportsItems").html(response);
					}
				});
			})
		</script>

		</html>