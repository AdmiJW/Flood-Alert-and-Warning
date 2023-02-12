<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- 
	Params: 
		active - Sets one of the nav link to be brighter.
                 value should be one of [ dashboard, reports, subscribe, evacuation ]. Left blank if none are active
-->


<nav class="navbar navbar-dark navbar-expand-lg bg-dark">
    <div class="container">

        <!-- Logo and Title -->
        <a class="navbar-brand me-4" href="<c:url value="/" />">
            <i class="bi bi-lightning-charge-fill me-1"></i>
            <span class="fw-bold">FAW</span>
        </a>


        <!-- Toggle button on small screens -->
        <button 
            class="navbar-toggler rounded" 
            type="button" 
            data-bs-toggle="collapse" 
            data-bs-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" 
            aria-expanded="false" 
            aria-label="Toggle navigation"
        >
            <span class="navbar-toggler-icon text-light"></span>
        </button>


        <!-- Navigation menu (Left) -->
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">

                <li class="nav-item">
                    <a
                        class="nav-link ${param.active == 'dashboard' ? 'active' : ''}"
                        href="<c:url value="/Dashboard" />"
                    >
                        Dashboard
                    </a>
                </li>

                <li class="nav-item">
                    <a
                        class="nav-link ${param.active == 'reports' ? 'active' : ''}"
                        href="<c:url value="/Reports" />"
                    >
                        Reports
                    </a>
                </li>

                <li class="nav-item">
                    <a
                        class="nav-link ${param.active == 'subscribe' ? 'active' : ''}"
                        href="<c:url value="/Subscribe" />"
                    >
                        Subscribe
                    </a>
                </li>

                <li class="nav-item">
                    <a
                        class="nav-link ${param.active == 'evacuation' ? 'active' : ''}"
                        href="<c:url value="/Evacuation" />"
                    >
                        Evacuation
                    </a>
                </li>
            </ul>


            <!-- Controls (Right) -->
            <!-- Show login/register if not logged in, else show logout button -->
            <c:choose>
                <c:when test="${not empty user}">
                    <div class="d-flex align-items-center">
                        <span class="text-white me-3 fs-6">
                            Welcome,
                            <a class="text-decoration-none w-50" href="<c:url value="/Profile" />">
                                <c:out value="${user.username}"/>
                                <i class="bi bi-person-circle"></i>
                            </a>
                        </span>

                        <a class="btn btn-primary" href="<c:url value="/Logout" />">Logout</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="d-flex">
                        <a class="btn btn-outline-info me-2" href="<c:url value="/Register"/>">Register</a>
                        <a class="btn btn-primary" href="<c:url value="/Login" />">Login</a>
                    </div>
                </c:otherwise>
            </c:choose>

        </div>
    </div>

</nav>