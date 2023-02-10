<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--
	Please populate the parameters using <c:param>
		paginator - Paginator object (from utils.pagination.Paginator)
		currentPage - Currently active page

	Please note that this utils.pagination component make assumptions:
		1. Pagination start with 1, 2, 3 and so on.
		2. Only total of 5 pages button will be shown.
--%>

<c:set var="rightButtonCount" value="${Math.max(2, 5 - currentPage)}" />
<c:set var="leftButtonCount" value="${4 - rightButtonCount}" />
<c:set var="firstButtonPage" value="${Math.max(1, currentPage - leftButtonCount)}" />
<c:set var="lastButtonPage" value="${Math.min(paginator.totalPages, (currentPage + rightButtonCount).intValue() )}" />

<c:set var="pagelinkCls" value="page-link h-100 d-flex align-items-center fs-6" />



<!-- Pagination -->
<nav aria-label="utils.pagination control text-center">
	<ul class="pagination justify-content-center">




		<%-- First page button, Previous page button --%>
		<c:set var="firstAndPreviousDisabled" value="${currentPage == 1? 'disabled': ''}" />
		<c:url value="" var="firstUrl">
			<c:param name="page" value="1" />
		</c:url>
		<c:url value="" var="previousUrl">
			<c:param name="page" value="${currentPage - 1}" />
		</c:url>

		<li class="page-item">
			<a class="${pagelinkCls} ${firstAndPreviousDisabled}" href="${firstUrl}" aria-label="First">
				<i class="bi bi-chevron-double-left" style="font-size: .75rem;"></i>
			</a>
		</li>
		<li class="page-item">
			<a class="${pagelinkCls} ${firstAndPreviousDisabled}" href="${previousUrl}" aria-label="Previous">
				<i class="bi bi-chevron-left" style="font-size: .75rem;"></i>
			</a>
		</li>



		<%-- Page buttons --%>
		<c:forEach var="i" begin="${firstButtonPage}" end="${lastButtonPage}">
			<li class="page-item ${i == currentPage? 'active': ''}">
				<c:url value="" var="pageUrl">
					<c:param name="page" value="${i}" />
				</c:url>

				<a class="${pagelinkCls}" href="${pageUrl}">
					${i}
				</a>
			</li>
		</c:forEach>



		<%-- Next page button, Last page button --%>
		<c:set var="nextAndLastDisabled" value="${currentPage == paginator.totalPages? 'disabled': ''}" />
		<c:url value="" var="nextUrl">
			<c:param name="page" value="${currentPage + 1}" />
		</c:url>
		<c:url value="" var="lastUrl">
			<c:param name="page" value="${paginator.totalPages}" />
		</c:url>

		<li class="page-item">
			<a class="${pagelinkCls} ${nextAndLastDisabled}" href="${nextUrl}" aria-label="Next">
				<i class="bi bi-chevron-right" style="font-size: .75rem;"></i>
			</a>
		</li>
		<li class="page-item">
			<a class="${pagelinkCls} ${nextAndLastDisabled}" href="${lastUrl}" aria-label="Last">
				<i class="bi bi-chevron-double-right" style="font-size: .75rem;"></i>
			</a>
		</li>

	</ul>
</nav>