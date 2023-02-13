<%@page
        language="java"
        contentType="text/html;
	    charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<script>
  const districts = JSON.parse(`${districts}`);
  const locations = JSON.parse(`${locations}`);
</script>
<script src="<c:url value='/public/scripts/geoSelectInput.js'/>"></script>



<html>

<c:import url="/includes/header.jsp">
  <c:param name="title" value="FAW" />
</c:import>

<body>
<div class="min-vh-100">
  <!-- Navbar -->
  <c:import url="/includes/navbar.jsp" />

  <!-- Breadcrumb -->
  <c:import url="/includes/breadcrumb.jsp">
    <c:param name="path" value="Reports/${report.id}" />
  </c:import>


  <main class='container'>
    <h1 class='text-center fw-bold'>
      Report #${report.id}: ${report.user.username}
      <i class="bi bi-file-earmark-text-fill"></i>
    </h1>

    <c:import url="/includes/alert.jsp" />

    <!-- Report Details -->
    <form method="post" action='<c:url value="/Evacuation"/> ' class='mb-4 m-auto' style='max-width: 700px;'>

      <!-- Image -->
      <div class="mb-2">
        <img src="${report.media_path}" alt="Report Image" class="img-fluid">
      </div>

      <!-- Status -->
      <div class="mb-2">
          <label class="form-label fw-bold">Status:</label>
          <c:out value="${report.review_status}" />
      </div>

      <!-- State -->
      <div class="mb-2">
        <label class="form-label fw-bold">State:</label>
        <c:out value="${report.state.name}" />
      </div>

      <!-- District -->
        <div class="mb-2">
            <label class="form-label fw-bold">District:</label>
            <c:out value="${report.district.name}" />
        </div>

      <!-- Location -->
      <div class="mb-2">
          <label class="form-label fw-bold">Location:</label>
          <c:out value="${report.location.name}" />
      </div>

      <%-- Submission date --%>
      <div class="mb-2">
          <label class="form-label fw-bold">Submission Date:</label>
          <c:out value="${report.submission_date}" />
      </div>

      <%-- Phone Number --%>
      <div class="form-group mb-2">
          <label class="form-label fw-bold">Phone Number:</label>
          <c:out value="${report.user.phone}" />
      </div>

      <%-- Details --%>
      <div class="form-group mb-2">
          <label for="details" class="form-label fw-bold">Details:</label>

          <textarea
              class="form-control"
              id="details"
              disabled
              rows="3"
          >${report.detail}</textarea>
      </div>
    </form>

    <form class='bg-light rounded shadow-sm m-auto p-3 my-4' style='max-width: 500px;' method='POST'
							action="<c:url value='/Reports/Add'/>" enctype="multipart/form-data">

						<div class='text-center display-6'>
							<i class="bi bi-lightning-charge-fill"></i>
							<span class="fw-bold">FAW</span>
						</div>

						<p class='text-center fs-3 fw-light'>
							Report Form
						</p>


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
							<input class="form-control" name="report_media" type="file" id="report_media" required>
						</div>

						<!-- Addtional Description -->
						<div class="mb-4">
							<label for="report_detail" class="form label fw-bold">Details:</label>
							<textarea class="form-control" name="report_detail" id="report_detail" cols="30"
								rows="5"></textarea>
						</div>


						//<!-- Submission DateTime -->
						//<c:set var="now" value="<%=new java.util.Date()%>" />
						//<fmt:formatDate type="date" pattern="dd-MM-yyyy" value="${now}"/>

						<button type="submit" class="btn btn-primary">Submit</button>
						</form>

    <div class='d-flex justify-content-center gap-2 my-4'>
        <a class='btn btn-primary' href='<c:url value="/Reports" />'>
            Back
        </a>

        <c:if test="${user.userType == 'ADMIN' || user.id == report.user.id}">
            <a class='btn btn-info' href='<c:url value="/Reports/Update/${report.id}" />'>
                Update
            </a>

            <a class='btn btn-danger' href='<c:url value="/Reports/Delete/${report.id}" />'>
                Delete
            </a>
        </c:if>

    </div>
  </main>
</div>

<!-- Footer -->
<c:import url="/includes/footer.jsp"/>

</body>
</html>