<%@ 
	page language="java" 
	contentType="text/html; 
	charset=ISO-8859-1" 
	pageEncoding="ISO-8859-1" 
%>

<!DOCTYPE html>
<html>

<!-- Header -->
<jsp:include page="includes/header.jsp">
	<jsp:param name="title" value="FAW" />
</jsp:include>


<body>

	<!-- Navbar -->
	<jsp:include page="includes/navbar.jsp">
		<jsp:param name="route" value="dashboard/reports/evacuation/subscribe" />
		<jsp:param name="username" value="" />
	</jsp:include>
	
	<!-- Breadcrumb -->
	<jsp:include page="includes/breadcrumb.jsp" />
	
	<!-- Alert -->
	<jsp:include page="includes/alert.jsp" />
	

	<!-- Dummy content -->
	<div class='container'>
		<h2 class='fw-bold py-4'>MAP PLACE HERE</h2>
	</div>
	
	<div>
		<h2 class='fw-bold py-4'>Dashboard</h2>
		<input type="text" name="station"/>
		<button class="btn" type="submit" value="search"></button>
		<p>Table of Stations</p>
		<table>
		<tr>
			<td>#</td>
			<td>Station</td>
			<td>Water Level (m)</td>
			<td>Rainfall (mm)</td>
		</tr>
		<tr>
			<td>#</td>
			<td>Station</td>
			<td>Water Level (m)</td>
			<td>Rainfall (mm)</td>
		</tr>
		<tr>
			<td>#</td>
			<td>Station</td>
			<td>Water Level (m)</td>
			<td>Rainfall (mm)</td>
		</tr>
		<tr>
			<td>#</td>
			<td>Station</td>
			<td>Water Level (m)</td>
			<td>Rainfall (mm)</td>
		</tr>
		<tr>
			<td>#</td>
			<td>Station</td>
			<td>Water Level (m)</td>
			<td>Rainfall (mm)</td>
		</tr>
		<tr>
			<td>#</td>
			<td>Station</td>
			<td>Water Level (m)</td>
			<td>Rainfall (mm)</td>
		</tr>
		</table>
	<p>Nav bar here<p>
	</div>


	<!-- Footer -->
	<jsp:include page="includes/footer.jsp">
		<jsp:param name="visits" value="123" />
	</jsp:include>


</body>
</html>