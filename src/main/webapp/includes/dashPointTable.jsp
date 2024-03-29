<!--
	Parameter: Dashpoint model
-->

<%@ 
	page language="java" 
	contentType="text/html; 
	charset=ISO-8859-1" 
	pageEncoding="ISO-8859-1" 
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<div class='my-4 mx-auto' style ='max-width: 1000px;'>
	<c:if test="${user.userType=='ADMIN'}">
		<a class='btn btn-primary' href='/FAW/Dashboard/AddDashboard'>
			Add Station Point
			<i class="bi bi-clipboard-plus"></i>
		</a>
	</c:if>
</div>
<div class='table-responsive my-4 mx-auto' style='max-width: 1000px;'>

	<table class="table table-dark table-striped table-hover">
		<thead>
		<tr>
			<th scope="col">#</th>
			<th scope="col">Station</th>
			<th scope="col">Water Level (m)</th>
			<th scope="col">Status</th>
			<th scope="col">Rainfall (mm)</th>
			<th scope="col">Date</th>
			<th></th>
			<th></th>
		</tr>
		</thead>
		<tbody>
			<c:forEach items="${paginator.getPage(currentPage)}" var="dashboard" varStatus="loop">
			<tr>
				<th scope="row">${loop.index + 1}</th>
				<td>
					<c:out value="${dashboard.location.name}" />,
					<c:out value="${dashboard.location.district.name}" />,
					<c:out value="${dashboard.location.state.name}" />
				</td>
				<td>
					<c:choose>
						<c:when test="${dashboard.water>20}">
							<label class="text-danger"><c:out value="${dashboard.water}"/> m (DANGER)</label>
						</c:when>
						<c:when test="${dashboard.water>10}">
							<label class="text-warning"><c:out value="${dashboard.water}"/> m (WARNING)</label>
						</c:when>
						<c:otherwise>
							<label><c:out value="${dashboard.water}"/> m (NORMAL)</label>
						</c:otherwise>
					</c:choose>
				</td>
				<td>
				<c:choose>
					<c:when test="${dashboard.status=='RISING'}">
						<label class="fw-bold text-danger">Rising</label>
					</c:when>
					<c:when test="${dashboard.status=='RECEDING'}">
						<label class="fw-bold text-warning">Receding</label>
					</c:when>
					<c:when test="${dashboard.status=='NOCHANGE'}">
						<label class="fw-bold text-primary">No Change</label>
					</c:when>
				</c:choose>
				</td>
				<td>
					<c:out value="${dashboard.rainfall}"/> mm
				</td>
				<td>
					<c:out value="${dashboard.date}" />
				</td>

				<td>
					<c:if test="${user.userType=='ADMIN'}">
					<a  href="
					<c:url value="/Dashboard/Update" >
						<c:param name="id" value="${dashboard.id}" />
					</c:url>
					"
						class='btn btn-primary'
					>
						<i class="bi bi-pencil-fill"></i>
					</a>
					</c:if>
				</td>
				<td>
					<c:if test="${user.userType=='ADMIN'}">
					<a href="
					<c:url value="/Dashboard/DeleteDashboard" >
						<c:param name="id" value="${dashboard.id}" />
					</c:url>
					"
					   class="btn btn-danger"
					>
						<i class="bi bi-trash"></i>
					</a>
					</c:if>
				</td>

			</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

<jsp:include page="pagination.jsp" />

