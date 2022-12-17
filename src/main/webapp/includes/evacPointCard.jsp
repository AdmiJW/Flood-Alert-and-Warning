<!--
	Parameter: EvacPoint model
-->
<%@ 
	page language="java" 
	contentType="text/html; 
	charset=ISO-8859-1" 
	pageEncoding="ISO-8859-1" 
%>

<div class="bg-dark text-center text-white py-5 px-3 mb-4">
	<table class="table table-striped table-dark">
		<thead>
			<tr>
				<th scope="col">#</th>
				<th scope="col">Evacuation Point</th>
				<th scope="col">Location</th>
				<th scope="col">Capacity</th>
			</tr>
		</thead>
		<tbody>
			<tr>
			<!-- 
				Retrieve the data from database 
				1. Retrieve only index 1 to 10
			-->
			<% 
				String redirectTo = "/Flood_Alert_and_Warning/evacuationPointEdit.jsp";
				
			%>
				<td scope="row">
					<a class="page-link" href=<%= redirectTo %>>i</a>
				</td>
				<td>
					<a class="page-link" href=<%= redirectTo %>>evacPoint.name</a>
				</td>
				<td>
					<a class="page-link" href=<%= redirectTo %>>evacPoint.location</a>
				</td>
				<td>
					<a class="page-link" href=<%= redirectTo %>>evacPoint.capacity</a>
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


