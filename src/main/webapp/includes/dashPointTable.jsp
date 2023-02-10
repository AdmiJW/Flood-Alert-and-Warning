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
				<th scope="col">Station</th>
				<th scope="col">Water Level (m)</th>
				<th scope="col">Rainfall (mm)</th>
				<th scope='col'></th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<th scope="row">1</th>
				<td>Sg.Triang di Triang, Bera</td>
				<td class='text-warning'>33.86m, WARNING, RISING</td>
				<td>0mm (26/12/2022)</td>
				<td class='text-end'>
					<a class='btn btn-primary' href='/FAW/Dashboard/Update'>
						<i class="bi bi-pencil-fill"></i>
					</a>
				</td>
			</tr>
			
			<tr>
				<th scope="row">2</th>
				<td>Long Jegan, Miri</td>
				<td class='text-danger'>12.59m, DANGER, RISING</td>
				<td>0mm (26/12/2022)</td>
				<td class='text-end'>
					<a class='btn btn-primary' href='/FAW/Dashboard/Update'>
						<i class="bi bi-pencil-fill"></i>
					</a>
				</td>
			</tr>
			
			<tr>
				<th scope="row">3</th>
				<td>Sebauh, Bintulu</td>
				<td>1.33m, ALERT, RECEDING</td>
				<td>0mm (26/12/2022)</td>
				<td class='text-end'>
					<a class='btn btn-primary' href='/FAW/Dashboard/Update'>
						<i class="bi bi-pencil-fill"></i>
					</a>
				</td>
			</tr>
		</tbody>
	</table>
</div>


<jsp:include page="pagination.jsp" />

