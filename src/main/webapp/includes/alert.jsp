<%@page import="utils.AlertUtil"%>
<%@page import="enums.AlertType"%>



<div class='container py-2 my-3'>
	<% 
		for (AlertType type: AlertType.values()) { 
			if (AlertUtil.getAlert(request, type) != null) {
	%>
		<div class='alert <%= type.name %> alert-dismissible fade show' role='alert'>
			<%= AlertUtil.getAlert(request, type) %>
		</div>
	<%
			}
		}
	%>
</div>