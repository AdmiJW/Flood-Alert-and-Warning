<%--
  Created by IntelliJ IDEA.
  User: Ethan
  Date: 12/2/2023
  Time: 5:09 pm
  To change this template use File | Settings | File Templates.
--%>
<%@page
        language="java"
        contentType="text/html;
	charset=ISO-8859-1"
        pageEncoding="ISO-8859-1"
%><%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Profile Page</title>
</head>
<c:import url="/includes/header.jsp">
    <c:param name="title" value="FAW"/>
</c:import>

<body>
<div class="min-vh-100">

    <c:import url="/includes/navbar.jsp"/>

    <c:import url="/includes/breadcrumb.jsp">
        <c:param name="path" value="MyProfile"/>
    </c:import>

    <c:import url="/includes/alert.jsp" />

    <main class="container my-3">
        <h1 class='text-center fw-bold'>
            My Profile
            <i class="bi bi-person-circle"></i>
        </h1>

        <p class='lead text-center text-muted'>
            Profile information will be secured with us
        </p>

        <div class="bg-light rounded shadow-sm m-auto p-3 my-4" style="max-width: 600px;">
            <div class="mb-2">
                <label for="username" class="form-label fw-bold">Username</label>
                <p class="" id="username"><c:out value="${user.username}"/></p>
            </div>
            <div class="mb-2">
                <label for="email" class="form-label fw-bold">Email</label>
                <p class="" id="email"><c:out value="${user.email}"/></p>
            </div>
            <div class="mb-2">
                <label for="phone" class="form-label fw-bold">Phone Number</label>
                <p class="" id="phone"><c:out value="${user.phone}"/></p>
            </div>
        </div>

        <div class="mx-auto d-flex justify-content-center w-25">
            <a href="<c:url value="/Profile/UpdateForm" />" class="btn btn-primary d-block m-auto"
               style="max-width: 600px;">Update Profile</a>
            <a href="<c:url value="/" />" class="btn btn-danger d-block m-auto" style="max-width: 600px;">Back</a>
        </div>

    </main>


</div>
</body>
</html>
