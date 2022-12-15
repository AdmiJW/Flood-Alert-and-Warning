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
				<td scope="row">i</td>
				<td>evacPoint.name</td>
				<td>evacPoint.location</td>
				<td>evacPoint.capacity</td>
			</tr>
		</tbody>
	</table>
</div>

<!--  
	1.Show 3 list in a scene
	2.Each page retrieive 10 row from database
-->

<ul class="pagination justify-content-center my-4">
	<!-- If previous is not null, display previous-->
	<% 	String previous="", next="";
		if(!previous.equals("")){ 
	%>
	<li class="page-item"><a class="page-link" href="#">Previous</a></li>
	<%} %>
	<li class="page-item"><a class="page-link" href="#">i</a></li>
	<li class="page-item"><a class="page-link" href="#">i+1</a></li>
	<li class="page-item"><a class="page-link" href="#">i+2</a></li>
	<!-- If next is not null, display next-->
	<% if(!next.equals("")){ %>
	<li class="page-item"><a class="page-link" href="#">Next</a></li>
	<%} %>
</ul>