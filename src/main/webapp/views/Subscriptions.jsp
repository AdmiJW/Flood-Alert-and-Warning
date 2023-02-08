
<%@page
	language="java"
	contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>

<!-- Header -->
<c:import url="/includes/header.jsp" />

<body>
<div class="min-vh-100">

	<!-- Navbar -->
	<c:import url="/includes/navbar.jsp" />

	<!-- Breadcrumb -->
	<c:import url="/includes/breadcrumb.jsp">
		<c:param name="path" value="Subscribe/Subscriptions" />
	</c:import>

	<!-- Alert -->
	<c:import url="/includes/alert.jsp" />


	<!-- Subscription form -->
	<main class='container my-4'>

		<h1 class='text-center fw-bold'>
			My Subscriptions
			<i class="bi bi-mailbox2 ms-2"></i>
		</h1>

		<!-- Table -->
		<div class='table-responsive my-4 mx-auto' style='max-width: 1000px;'>
			<table class="table table-dark table-striped table-hover">
				<thead>
					<tr>
						<th scope="col">#</th>
						<th scope="col">Station</th>
						<th scope="col">Email</th>
						<th scope="col">SMS</th>
						<th scope='col'></th>
					</tr>
				</thead>

				<tbody>

					<c:forEach items="${subscriptions}" var="subscription" varStatus="loop">
						<tr>
							<th scope="row">${loop.index + 1}</th>
							<td>
								<c:out value="${subscription.location.name}" />,
								<c:out value="${subscription.location.district.name}" />,
								<c:out value="${subscription.location.state.name}" />
							</td>
							<td>
								<c:choose>
									<c:when test="${subscription.isEmailSubscription}">
										<i class="bi bi-check-circle-fill text-success"></i>
									</c:when>
									<c:otherwise>
										<i class="bi bi-x-circle-fill text-danger"></i>
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<c:choose>
									<c:when test="${subscription.isSmsSubscription}">
										<i class="bi bi-check-circle-fill text-success"></i>
									</c:when>
									<c:otherwise>
										<i class="bi bi-x-circle-fill text-danger"></i>
									</c:otherwise>
								</c:choose>
							</td>
							<td>
								<a href="
									<c:url value="/Subscribe/Unsubscribe" >
										<c:param name="id" value="${subscription.id}" />
									</c:url>
									"
								   class="btn btn-danger"
								>
									<i class="bi bi-trash"></i>
								</a>
							</td>
						</tr>
					</c:forEach>

				</tbody>
			</table>
		</div>


		<!-- Back button -->
		<div class='d-flex justify-content-center gap my-4'>
			<a class='btn btn-info' href='<c:url value="/Subscribe" />'>
				Back
			</a>
		</div>

	</main>
</div>

<!-- Footer -->
<c:import url="/includes/footer.jsp"/>

</body>
</html>




