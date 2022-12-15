
<%@page import="utils.CookieUtil"%>


<%
	String primaryAlert = null, secondaryAlert = null, successAlert = null, dangerAlert = null, warningAlert = null, infoAlert = null;
	
	Cookie primaryCookie = CookieUtil.getCookie(request, "primaryAlert");
	Cookie secondaryCookie = CookieUtil.getCookie(request, "secondaryAlert");
	Cookie successCookie = CookieUtil.getCookie(request, "successAlert");
	Cookie dangerCookie = CookieUtil.getCookie(request, "dangerAlert");
	Cookie warningCookie = CookieUtil.getCookie(request, "warningAlert");
	Cookie infoCookie = CookieUtil.getCookie(request, "infoAlert");

	if (primaryCookie != null) primaryAlert = CookieUtil.getCookieValue(primaryCookie);
	if (secondaryCookie != null) secondaryAlert = CookieUtil.getCookieValue(secondaryCookie);
	if (successCookie != null) successAlert = CookieUtil.getCookieValue(successCookie);
	if (dangerCookie != null) dangerAlert = CookieUtil.getCookieValue(dangerCookie);
	if (warningCookie != null) warningAlert = CookieUtil.getCookieValue(warningCookie);
	if (infoCookie != null) infoAlert = CookieUtil.getCookieValue(infoCookie);
%>



<div class='container py-2 my-3'>
	<% if (primaryAlert != null) { %>
		<div class='alert alert-primary alert-dismissible fade show' role='alert'>
			<%= primaryAlert %>
		</div>
	<% } %>
	<% if (secondaryAlert != null) { %>
		<div class='alert alert-secondary' role='alert'>
			<%= secondaryAlert %>
		</div>
	<% } %>
	<% if (successAlert != null) { %>
		<div class='alert alert-success' role='alert'>
			<%= successAlert %>
		</div>
	<% } %>
	<% if (dangerAlert != null) { %>
		<div class='alert alert-danger' role='alert'>
			<%= dangerAlert %>
		</div>
	<% } %>
	<% if (warningAlert != null) { %>
		<div class='alert alert-warning' role='alert'>
			<%= warningAlert %>
		</div>
	<% } %>
	<% if (infoAlert != null) { %>
		<div class='alert alert-info' role='alert'>
			<%= infoAlert %>
		</div>
	<% } %>
</div>