<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>






			<!DOCTYPE html>
			<html>

			<!-- Header -->
			<c:import url="/includes/header.jsp">
				<c:param name="title" value="FAW - Subscribe" />
			</c:import>

			<script>
				const districts = JSON.parse(`${districts}`);
				const locations = JSON.parse(`${locations}`);
			</script>
			<script src="<c:url value="/public/scripts/geoSelectInput.js"/>"></script>


			<body>
				<div class="min-vh-100">

					<!-- Navbar -->
					<c:import url="/includes/navbar.jsp">
						<c:param name="active" value="reports" />
					</c:import>

					<!-- Breadcrumb -->
					<c:import url="/includes/breadcrumb.jsp">
						<c:param name="path" value="Reports/Add" />
					</c:import>

					<!-- Alert -->
					<c:import url="/includes/alert.jsp" />



					<!-- Add Report -->
					<main class='container my-4'>

						<h1 class='text-center fw-bold'>
							Add Report
							<i class="bi bi-chat-square-text-fill"></i>
						</h1>

						<p class='lead text-center text-muted'>
							Report any potential sign of flood on sight
						</p>


						<form class='bg-light rounded shadow-sm m-auto p-3 my-4' style='max-width: 500px;' method='POST'
							action='<c:url value="/Reports/Add"/>' enctype="multipart/form-data">

							<div class='text-center display-6'>
								<i class="bi bi-lightning-charge-fill"></i>
								<span class="fw-bold">FAW</span>
							</div>

							<p class='text-center fs-3 fw-light'>
								Report Form
							</p>

							<!-- Enter name -->
							<div class="mb-2">
								<label for="reporter_name" class="form-label fw-bold">Name:</label>
								<br>
								<input type="text" class="form-control" name="reporter_name" id="reporter_name"
									placeholder="Enter name here" required>
							</div>

							<!-- Enter phone number -->
							<div class="mb-2">
								<label for="phone_number" class="form-label fw-bold">Phone Number:</label>
								<br>
								<input type="tel" class="form-control" name="phone_number" id="phone_number"
									placeholder="012-34567890" required>
							</div>


							<!-- Select state -->
							<div class="mb-2">
								<label for="state" class="form-label fw-bold">State:</label>

								<select class="form-select" name='state' id='state' required aria-label="Select state">
									<option selected disabled value=''>Select state</option>

									<c:forEach items="${states}" var="state">
										<option value="${state.id}">${state.name}</option>
									</c:forEach>
								</select>
							</div>

							<!-- Select district -->
							<div class="mb-2">
								<label for="district" class="form-label fw-bold">District:</label>

								<select class="form-select" name='district' id='district' required
									aria-label="Select district">
									<option selected disabled value=''>Select district</option>
								</select>
							</div>

							<!-- Select POI -->
							<div class="mb-2">
								<label for="location" class="form-label fw-bold">Location:</label>

								<select class="form-select" name='location' id='location' required
									aria-label="Select location">
									<option selected disabled value=''>Select location</option>
								</select>
							</div>

							<!-- Upload Picture -->
							<div class="form-upload-file mb-2">
								<label for="report_media" class="form-label fw-bold">Video/Photo:</label>
								<input class="form-control" type="file" id="report_media" required>
							</div>

							<!-- Addtional Description -->
							<div class="mb-4">
								<label for="report_detail" class="form label fw-bold">Details:</label>
								<textarea class="form-control" name="report_detail" id="report_detail" cols="30"
									rows="5"></textarea>
							</div>


							<!-- Submission DateTime -->
							<c:set var="now" scope="page" value="<%=new java.util.Date()%>" />
							<span hidden>
								<fmt:formatDate pattern="dd-MM-yyyy" value="${now}" var="submission_date"
									scope="request" />
							</span>

							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</main>
				</div>

				<!-- Footer -->
				<c:import url="/includes/footer.jsp" />

			</body>

			</html>