

<%
	// By default the breadcrumb retrieves the URI path from request.getRequestURI
	// But if you provide a parameter of "path", it will prioritize that instead.
	
	String path = request.getRequestURI();
	if (request.getParameter("path") != null) path = request.getParameter("path");
	
	String[] tokens = path.split("/");
	String[] urls = new String[tokens.length];
	
	StringBuilder sb = new StringBuilder();
	
	for (int i = 0; i < tokens.length; ++i) {
		sb.append(tokens[i] + "/");
		urls[i] = sb.toString();
	}
%>


<nav class='container py-2 my-3 bg-light rounded-4' aria-label="breadcrumb">
	<ol class="breadcrumb m-0">
	
		<!-- Previous paths -->
		<% for (int i = 0; i < urls.length - 1; ++i) { %>
			<li class="breadcrumb-item">
				<a href="<%= urls[i] %>">
					<%= tokens[i] %>
				</a>
			</li>
		<% } %>
		
		<!--  Current path -->
		<li class="breadcrumb-item active" aria-current="page"><%= tokens[tokens.length - 1] %></li>
	</ol>
</nav>