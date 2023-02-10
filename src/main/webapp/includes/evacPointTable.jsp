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
				<th scope="col">Capacity</th>
				<th scope='col'></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td>Universiti Teknologi Malaysia</td>
				<td>Skudai, Johor</td>
				<td>200</td>
				<td class='text-end'>
					<a class='btn btn-primary' href='/FAW/Evacuation/Update'>
						<i class="bi bi-pencil-fill"></i>
					</a>
				</td>
			</tr>
			
			<tr>
				<th scope="row">1</th>
				<td>SK Sri Kencana</td>
				<td>Kluang, Johor</td>
				<td>300</td>
				<td class='text-end'>
					<a class='btn btn-primary' href='/FAW/Evacuation/Update'>
						<i class="bi bi-pencil-fill"></i>
					</a>
				</td>
			</tr>
			
			<tr>
				<th scope="row">1</th>
				<td>DEWAN SERBAGUNA KG. PARIT SENTANG BATU</td>
				<td>Batu Pahat, Johor</td>
				<td>150</td>
				<td class='text-end'>
					<a class='btn btn-primary' href='/FAW/Evacuation/Update'>
						<i class="bi bi-pencil-fill"></i>
					</a>
				</td>
			</tr>
		</tbody>
	</table>
</div>


<jsp:include page="pagination.jsp" />


