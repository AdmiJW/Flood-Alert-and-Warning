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
<script src="<c:url value="/public/scripts/geoSelectInput.js" />"></script>



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

      <%-- Image --%>
      <div class="mb-2">
        <img src="${report.media_path}" alt="Report Image" class="img-fluid">
      </div>

      <%-- Status --%>
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