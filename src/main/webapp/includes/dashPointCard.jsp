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
					<a class="page-link" href=<%= redirectTo %>>1</a>
				</td>
				<td>
					<a class="page-link" href=<%= redirectTo %>>Sg.Triang di Triang, Bera</a>
				</td>
				<td>
					<a class="page-link" href=<%= redirectTo %>>33.86m, WARNING, RISING</a>
				</td>
				<td>
					<a class="page-link" href=<%= redirectTo %>>0mm (26/12/2022)</a>
				</td>
			</tr>
			<tr>
				<td scope="row">
					<a class="page-link" href=<%= redirectTo %>>i</a>
				</td>
				<td>
					<a class="page-link" href=<%= redirectTo %>>Long Jegan, Miri</a>
				</td>
				<td>
					<a class="page-link" href=<%= redirectTo %>>12.59m, DANGER, RISING</a>
				</td>
				<td>
					<a class="page-link" href=<%= redirectTo %>>0mm (26/12/2022)</a>
				</td>
			</tr>
			<tr>
				<td scope="row">
					<a class="page-link" href=<%= redirectTo %>>i</a>
				</td>
				<td>
					<a class="page-link" href=<%= redirectTo %>>Sebauh, Bintulu</a>
				</td>
				<td>
					<a class="page-link" href=<%= redirectTo %>>1.33m, ALERT, RECEDING</a>
				</td>
				<td>
					<a class="page-link" href=<%= redirectTo %>>0mm (26/12/2022)</a>
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


