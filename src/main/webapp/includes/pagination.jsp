<%-- 
	Please populate the parameters using <jsp:param>
		1. totalPages - The total pages 
		2. activePage - Currently active page
		3. link - The link used for redirection. The page number will be given in query params - link?page=1

	Please note that this pagination component make assumptions: 
	
		1. Pagination start with 1, 2, 3 and so on.
		2. Only total of 5 pages button will be shown.
--%>

<%
	int totalPages = Integer.parseInt( request.getParameter("totalPages") );
	int activePage = Integer.parseInt( request.getParameter("activePage") );
	String baselink = request.getParameter("link");
	
	// If current page is 1, then to the right should show 4 buttons.
	// If current page is 2, then to the right should show 3 buttons.
	// If current page is totalPages, then to the left should show 4 buttons, and so on.
	int rightButtonCount = Math.max(2, 5 - activePage);
	int leftButtonCount = 4 - rightButtonCount;
	// Remember to bound it correctly [1, totalPages]
	int firstButtonPage = Math.max(1, activePage - leftButtonCount);
	int lastButtonPage = Math.min(totalPages, activePage + rightButtonCount);
%>


<!-- Pagination -->
<nav aria-label="pagination control text-center">
	<ul class="pagination justify-content-center">
	
		<%-- Control for previous and first page --%>
		<% if (activePage != 1) { %>
			<li class="page-item">
				<a class="page-link" href="<%= baselink %>" aria-label="First">
			        <i class="bi bi-chevron-double-left"></i>
			    </a>
			</li>
			<li class="page-item">
				<a class="page-link" href="<%= baselink + "?page=" + (activePage-1) %>" aria-label="Previous">
			        <i class="bi bi-chevron-left"></i>
			    </a>
			</li>
		<% } %>
		
		
		<% for (int i = firstButtonPage; i <= lastButtonPage; ++i) { %>
			<li class="page-item <%= i == activePage? "active": "" %>">
				<a class="page-link" href="<%= baselink + "?page=" + i %>">
					<%= i %>
				</a>
			</li>
		<% } %>
		
		
		<%-- Control for next and last page --%>
		<% if (activePage != totalPages) { %>
			<li class="page-item">
				<a class="page-link" href="<%= baselink + "?page=" + (activePage+1) %>" aria-label="Next">
			        <i class="bi bi-chevron-right"></i>
			    </a>
			</li>
			<li class="page-item">
				<a class="page-link" href="<%= baselink + "?page=" + (totalPages) %>" aria-label="Last">
			        <i class="bi bi-chevron-double-right"></i>
			    </a>
			</li>
		<% } %>
	</ul>
</nav>