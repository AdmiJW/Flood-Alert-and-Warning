<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<%--
	To use this template, the parameters are:
		- path: a list of path to be included, like 'FAW/Subscribe/My Subscriptions'.
		- urls: the full url, like 'FAW/Subscribe/MySubscriptions'. If not provided, the path will be used
				like urls.
--%>

<%
	String path = request.getParameter("path");
	String url = request.getParameter("url") == null? path : request.getParameter("urls");

	request.setAttribute("pathArray", path.split("/"));
	request.setAttribute("urlArray", url.split("/"));
%>

<nav class='container py-2 my-3 bg-light rounded-3' aria-label="breadcrumb">
	<ol class="breadcrumb m-0">

		<%-- Root --%>
		<li class="breadcrumb-item">
			<a href="<c:url value="/" />">FAW</a>
		</li>

		<c:set var="url" value="" />

		<c:forEach var="path" items="${pathArray}" varStatus="loop">
			<c:choose>
				<%-- Last element - current page --%>
				<c:when test="${loop.last}">
					<li class="breadcrumb-item active" aria-current="page">
						${path}
					</li>
				</c:when>
				<%-- Intermediate route --%>
				<c:otherwise>
					<c:set var="url" value="${url}/${urlArray[loop.index]}/" />

					<li class="breadcrumb-item">
						<a href="<c:url value="${url}" />">
							${path}
						</a>
					</li>
				</c:otherwise>
			</c:choose>
		</c:forEach>

	</ol>
</nav>