<%--
  Created by IntelliJ IDEA.
  User: Ethan
  Date: 12/2/2023
  Time: 5:54 pm
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

<!-- Header -->
<c:import url="/includes/header.jsp">
    <c:param name="title" value="FAW" />
</c:import>
<body>
<div class="min-vh-100">

    <c:import url="/includes/navbar.jsp"/>

    <c:import url="/includes/breadcrumb.jsp">
        <c:param name="path" value="MyProfile"/>
    </c:import>

    <c:import url="/includes/alert.jsp" />

    <main class="container my-4">
        <h1 class='text-center fw-bold'>
            My Profile
            <i class="bi bi-person-circle"></i>
        </h1>

        <p class='lead text-center text-muted'>
            Profile information will be secured with us
        </p>

        <form
                class="bg-light rounded shadow-sm m-auto p-3 my-4"
                style="max-width: 500px;"
                method="POST"
                action='<c:url value="/Profile/UpdateProfile" />'
        >
            <div class="mb-2">
                <label for="username" class="form-label fw-bold">Username</label>
                <br>
                <input type="text" class="form-control" id="username" name="username" value="${user.username}">
            </div>
            <div class="mb-2">
                <label for="email" class="form-label fw-bold">Email</label>
                <br>
                <input type="text" class="form-control" id="email" name="email" value="${user.email}">
            </div>
            <div class="mb-2">
                <label for="phone" class="form-label fw-bold">Phone Number</label>
                <br>
                <input type="text" class="form-control" id="phone" name="phone" value="${user.phone}">
            </div>

            <button type="submit" class="btn btn-primary">Update</button>
        </form>

        <div class="mx-auto d-flex justify-content-center w-25">
            <a href="<c:url value="/Profile" />" class="btn btn-danger d-block m-auto"
               style="max-width: 600px;">Back
            </a>
        </div>

    </main>


</div>
</body>
</html>