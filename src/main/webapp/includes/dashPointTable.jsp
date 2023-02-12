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



<%--<div class='table-responsive my-4 mx-auto' style='max-width: 1000px;'>--%>
<%--	<table class="table table-dark table-striped table-hover">--%>
<%--		<thead>--%>
<%--			<tr>--%>
<%--				<th scope="col">#</th>--%>
<%--				<th scope="col">Station</th>--%>
<%--				<th scope="col">Water Level (m)</th>--%>
<%--				<th scope="col">Rainfall (mm)</th>--%>
<%--				<th scope='col'></th>--%>
<%--			</tr>--%>
<%--		</thead>--%>
<%--		<tbody>--%>
<%--			<tr>--%>
<%--				<th scope="row">1</th>--%>
<%--				<td>Sg.Triang di Triang, Bera</td>--%>
<%--				<td class='text-warning'>33.86m, WARNING, RISING</td>--%>
<%--				<td>0mm (26/12/2022)</td>--%>
<%--				<td class='text-end'>--%>
<%--					<a class='btn btn-primary' href='/FAW/Dashboard/Update'>--%>
<%--						<i class="bi bi-pencil-fill"></i>--%>
<%--					</a>--%>
<%--				</td>--%>
<%--			</tr>--%>
<%--			--%>
<%--			<tr>--%>
<%--				<th scope="row">2</th>--%>
<%--				<td>Long Jegan, Miri</td>--%>
<%--				<td class='text-danger'>12.59m, DANGER, RISING</td>--%>
<%--				<td>0mm (26/12/2022)</td>--%>
<%--				<td class='text-end'>--%>
<%--					<a class='btn btn-primary' href='/FAW/Dashboard/Update'>--%>
<%--						<i class="bi bi-pencil-fill"></i>--%>
<%--					</a>--%>
<%--				</td>--%>
<%--			</tr>--%>
<%--			--%>
<%--			<tr>--%>
<%--				<th scope="row">3</th>--%>
<%--				<td>Sebauh, Bintulu</td>--%>
<%--				<td>1.33m, ALERT, RECEDING</td>--%>
<%--				<td>0mm (26/12/2022)</td>--%>
<%--				<td class='text-end'>--%>
<%--					<a class='btn btn-primary' href='/FAW/Dashboard/Update'>--%>
<%--						<i class="bi bi-pencil-fill"></i>--%>
<%--					</a>--%>
<%--				</td>--%>
<%--			</tr>--%>
<%--		</tbody>--%>
<%--	</table>--%>
<%--</div>--%>

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
			<th>
				<c:if test="${user.userType=='ADMIN'}">
				<a class='btn btn-primary' href='/FAW/Dashboard/AddDashboard'>
					<i class="bi bi-clipboard-plus"></i>
				</a>
				</c:if>
			</th>
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
					<c:out value="${dashboard.water}"/>
				</td>
				<td>
				<c:out value="${dashboard.status}" />
				</td>
				<td>
					<c:out value="${dashboard.rainfall}" />
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

