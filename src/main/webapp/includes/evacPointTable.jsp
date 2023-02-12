<!--
	Parameter: EvacPoint model
-->
<%@
	page language="java"
	contentType="text/html;
	charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div class='table-responsive my-4 mx-auto' style='max-width: 1000px;'>
	<table class="table table-dark table-striped table-hover">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">Evacuation Point</th>
				<th scope="col">Location</th>
				<th scope="col">Current Occupancy</th>
				<th scope="col">Max Capacity</th>
				<th scope='col'></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${paginator.getPage(currentPage)}" var="evacPoint" varStatus="loop">
				<tr>
					<th scope="row">${evacPoint.id}</th>
					<td>${evacPoint.pointName}</td>
					<td>${evacPoint.location.district.name},${evacPoint.location.district.state.name}</td>
					<td>${evacPoint.currentOccupancy}</td>
					<td>${evacPoint.capacity}</td>
					<c:choose>
						<c:when test="${isAdmin}">
							<td class='text-end'>
								<a class='btn btn-primary' href='/FAW/Evacuation/View?id=${evacPoint.id}'>
									<i class="bi bi-pencil-fill"></i>
								</a>
							</td>
						</c:when>
						<c:otherwise>
							<td class='text-end'>
								<a class='btn btn-primary' href='/FAW/Evacuation/View?id=${evacPoint.id}'>
									<i class="bi bi-binoculars"></i>
								</a>
							</td>
						</c:otherwise>
					</c:choose>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>


<jsp:include page="pagination.jsp" />


