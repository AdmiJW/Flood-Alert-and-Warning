<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



		<!DOCTYPE html>
		<html>
		<!-- Header -->
		<c:import url="/includes/header.jsp">
			<c:param name="title" value="FAW - Reports" />
		</c:import>

		<script src="<c:url value="/public/scripts/geoSelectInput.js"/>"></script>

		<body>
			<!-- Init Page -->

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
						<input type="text" class="form-control" placeholder="Search and Filter"
							aria-label="Search and Filter">
						<button class="btn btn-primary" type="button" id="button-addon2">Search</button>
					</div>


					<c:forEach items="${reports}" var="report" varStatus="loop">

					<div class="d-grid py-4 gap-4 justify-content-center"
						style='grid-template-columns: repeat( auto-fit, minmax(250px, 350px) );'>

						<div class="card rounded-4 overflow-hidden">
							<img src="${report.getMedia_path()}"
								class="card-img-top" alt="flood" />

							<div class="card-body">
								<div class="card-title">
									<h3>${report.getReporter_name()}</h3>
								</div>

								<div class="card-desc text-muted">
									<span class="card-date">${report.getSubmission_date()}</span> <br>
									<span class="card-location">${report.getLocation().getName()}</span><br>
									<span class="card-location">${report.getDistrict().getName()}, ${report.getState().getName()}</span><br>
								</div>

								<p class="card-text mt-4">
									${report.getDetail()}
								</p>
							</div>
						</div>

					</div>
					</c:forEach>
				</div>

				<div class="sticky-bottom" style="margin-left: 90%;"><a href="<c:url value="/Reports/Add" />"/><i
						class="bi bi-plus-circle-fill" style="font-size:80px"></i></a></div>

				<!--<div id="ajaxGetUserServletResponse"></div>
    <script src="https://code.jquery.com/jquery-1.10.2.js"
    	type="text/javascript"></script>
    <script>
        $("#button-addon2").click(function() {

        		$.ajax({
        			url : '/FAW/Reports/session',
         			success : function(responseText) {
        				alert(${sessionScope.noredirect});
        			}
        		});
        	});
    </script>-->


				<!-- Pagination -->
				<c:import url="/includes/pagination.jsp" />
			</div>

			<!-- Footer -->
			<c:import url="/includes/footer.jsp" />

		</body>

		</html>