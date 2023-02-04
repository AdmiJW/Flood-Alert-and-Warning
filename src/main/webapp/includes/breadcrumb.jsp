<%@page 
	import="java.util.Arrays"
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<%--<%--%>
<%--	// By default the breadcrumb retrieves the URI path from request.getAttribute("breadcrumbURL").--%>
<%--	// Please see interceptor.BreadCrumbInterceptor--%>
<%--	// But if you provide a parameter of "path", it will prioritize that instead.--%>
<%--	String path = (String)request.getAttribute("breadcrumbURL");--%>
<%--	if (request.getParameter("path") != null) path = request.getParameter("path");--%>

<%--	// Abstract tokens from URI, slash '/' as the separator--%>
<%--	String[] rawTokens = path.substring(1).split("/");--%>
<%--	--%>
<%--	// The tokens are processed as follows:--%>
<%--	//		1. Remove occurrences of ".jsp"--%>
<%--	//		2. Replace underscore '_' to space ' '--%>
<%--	//		3. Change cases to Capitalized (First letter uppercase, rest lowercase)--%>
<%--	String[] processedTokens = Arrays.stream( rawTokens )--%>
<%--		.map(s -> s.replaceAll(".jsp", ""))--%>
<%--		.map(s -> s.replace('_', ' '))--%>
<%--		.map(s -> s.substring(0,1).toUpperCase() + s.substring(1).toLowerCase())--%>
<%--		.toArray(length -> new String[length]);--%>
<%--	--%>
<%--	// For every token, build its url--%>
<%--	int len = rawTokens.length;--%>
<%--	String[] urls = new String[len];--%>
<%--	StringBuilder sb = new StringBuilder("/");--%>
<%--	--%>
<%--	for (int i = 0; i < len; ++i) {--%>
<%--		sb.append(rawTokens[i] + "/");--%>
<%--		urls[i] = sb.toString();--%>
<%--	}--%>
<%--%>--%>


<nav class='container py-2 my-3 bg-light rounded-3' aria-label="breadcrumb">
	<ol class="breadcrumb m-0">
	
<%--		<!-- Previous paths -->--%>
<%--		<% for (int i = 0; i < len - 1; ++i) { %>--%>
<%--			<li class="breadcrumb-item">--%>
<%--				<a href="<%= urls[i] %>">--%>
<%--					<%= processedTokens[i] %>--%>
<%--				</a>--%>
<%--			</li>--%>
<%--		<% } %>--%>
<%--		--%>
<%--		<!--  Current path -->--%>
<%--		<li class="breadcrumb-item active" aria-current="page"><%= processedTokens[len - 1] %></li>--%>
	</ol>
</nav>