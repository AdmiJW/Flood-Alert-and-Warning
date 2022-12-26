<!--
	Parameter: EvacPoint model
-->
<%@ 
	page language="java" 
	contentType="text/html; 
	charset=ISO-8859-1" 
	pageEncoding="ISO-8859-1" 
%>

<div class='table-responsive my-4 mx-auto' style='max-width: 1000px;'>
	<table class="table table-dark table-striped table-hover">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">Station</th>
				<th scope="col">Water Level (m)</th>
				<th scope="col">Rainfall (mm)</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			<!-- Page redirection based on the Station  -->
			<% 
				String redirectTo = "/Flood_Alert_and_Warning/dashboard.jsp";
				
			%>
				<td scope="row">
					<a class="page-link" href=<%= redirectTo %>>i</a>
				</td>
				<td>
					<a class="page-link" href=<%= redirectTo %>>dashPoint.station</a>
				</td>
				<td>
					<a class="page-link" href=<%= redirectTo %>>dashPoint.waterlevel</a>
				</td>
				<td>
					<a class="page-link" href=<%= redirectTo %>>dashPoint.rainfall</a>
				</td>
			</tr>
		</tbody>
	</table>
</div>


<jsp:include page="pagination.jsp">
	<jsp:param value="10" name="totalPages"/>
	<jsp:param value="1" name="activePage"/>
	<jsp:param value="Evacuation/EvacuationPoint" name="link"/>
</jsp:include>


