<%@page language="java" contentType="text/html;
	    charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<html>

		<c:import url="/includes/header.jsp">
			<c:param name="title" value="FAW" />
		</c:import>

		<script src="https://code.jquery.com/jquery-3.6.3.min.js"></script>
		<script>
			const districts = JSON.parse(`${districts}`);
			const locations = JSON.parse(`${locations}`);
		</script>
		<script src="<c:url value="/public/scripts/geoSelectInput.js"/>"></script>

		<body>
			<div class="min-vh-100">
				<!-- Navbar -->
				<c:import url="/includes/navbar.jsp" />

				<!-- Breadcrumb -->
				<c:import url="/includes/breadcrumb.jsp">
					<c:param name="path" value="Reports/${report.id}" />
				</c:import>


				<main class='container'>
					<!--<h1 class='text-center fw-bold'>
						Report #${report.id}: ${report.user.username}
						<i class="bi bi-file-earmark-text-fill"></i>
					</h1>-->

					<c:import url="/includes/alert.jsp" />

					<form class='bg-light rounded shadow-sm m-auto p-3 my-4' style='max-width: 500px;' method='POST'
						action="<c:url value='/Reports/${report.id}'/>" enctype="multipart/form-data">

						<div class='text-center display-6'>
							<i class="bi bi-lightning-charge-fill"></i>
							<span class="fw-bold">FAW</span>
						</div>

						<p class='text-center fs-3 fw-light'>
							Edit Report
						</p>


						<!-- Select state -->
					<div id="dis_loc">
						<div class="mb-2">
							<label for="state" class="form-label fw-bold">State:</label>

							<select class="form-select" name='state' id='state' required aria-label="Select state">
								<option selected value='${report.state.id}'>${report.state.name}</option>

								<c:forEach items="${states}" var="state">
									<c:if test="${state.id!=report.state.id}">
										<option value="${state.id}">${state.name}</option>
									</c:if>
								</c:forEach>
							</select>
							<input type="hidden" id="report_origina_state" value="${report.state.id}">
						</div>

							<!-- Select district -->
							<div class="mb-2">
								<label for="district" class="form-label fw-bold">District:</label>
								<select class="form-select" name='district' id='district' required
									aria-label="Select district">
									<option selected value='${report.district.id}'>${report.district.name}</option>
								</select>
							</div>
							<!-- Select POI -->
							<div class="mb-2">
								<label for="location" class="form-label fw-bold">Location:</label>
								<select class="form-select" name='location' id='location' required
									aria-label="Select location">
									<option selected value='${report.location.id}'>${report.location.name}</option>
								</select>
							</div>
						</div>

						<!-- Upload Picture -->
						<div class="form-upload-file mb-2">
							<label for="report_media" class="form-label fw-bold">Video/Photo:</label>
							<img src="${report.media_path}" alt="flood" style="object-fit:contain; max-height:100%; max-width:100%;">
							<input class="form-control mt-2" name="report_media" type="file" id="report_media">
						</div>

						<!-- Addtional Description -->
						<div class="mb-4">
							<label for="report_detail" class="form label fw-bold">Details:</label>
							<textarea class="form-control" name="report_detail" id="report_detail" cols="30"
								rows="5" placeholder="${report.detail}"></textarea>
						</div>


						<button type="submit" class="btn btn-primary">Submit</button>
					</form>

					<div class='d-flex justify-content-center gap-2 my-4'>
						<a class='btn btn-primary' href='<c:url value="/Reports"/>'>
							Back
						</a>

							<a class='btn btn-danger' href='<c:url value="/Reports/Delete/${report.id}" />'>
								Delete
							</a>

					</div>
				</main>
			</div>

			<!-- Footer -->
			<c:import url="/includes/footer.jsp" />

		</body>

		<script>
			$("#state").on("change", function () {
				$.ajax({
					type:"POST",
					url: "/FAW/Reports/",
					data: {
						selected_state:$("state :selected").val()
					},
					success: function (response) {
						$("#dis_loc").html(response);
					}
				});
			});
		</script>

		</html>