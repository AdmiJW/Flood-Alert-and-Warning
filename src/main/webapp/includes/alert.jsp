<%@page import="utils.AlertUtil"%>
<%@page import="enums.AlertType"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<div class='container py-2 my-3'>

	<c:forEach items="${AlertType.values()}" var="type">
		<c:if test="${requestScope[type.name] != null}">
			<div class='alert <c:out value="${type.name}"/> alert-dismissible fade show' role='alert'>
				<c:out value="${requestScope[type.name]}"/>
			</div>
		</c:if>
	</c:forEach>

</div>