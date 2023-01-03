
<!-- 
	Params: 
		route - put either (dashboard/reports/evacuation/subscribe) or leave blank if none of above
		username - put if user is logged in.
-->


<nav class="navbar navbar-dark navbar-expand-lg bg-dark">

    <div class="container-fluid" style="max-width: 1296px;">

        <!-- Logo and Title -->
        <a class="navbar-brand me-4" href="/FAW">
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
                    	class="nav-link <%= (request.getParameter("route").equals("dashboard"))? "active": "" %>" 
                    	href="/FAW/Dashboard"
                    >
                    	Dashboard
                    </a>
                </li>
                <li class="nav-item">
                    <a
                    	class="nav-link <%= (request.getParameter("route").equals("reports"))? "active": "" %>" 
                    	href="/FAW/Reports"
                    >
                    	Reports
                    </a>
                </li>
                <li class="nav-item">
                    <a 
                    	class="nav-link <%= (request.getParameter("route").equals("subscribe"))? "active": "" %>" 
                    	href="/FAW/Subscribe"
                    >
                    	Subscribe
                    </a>
                </li>
                <li class="nav-item">
                    <a 
                    	class="nav-link <%= (request.getParameter("route").equals("evacuation"))? "active": "" %>" 
                    	href="/FAW/Evacuation"
                    >
                    	Evacuation
                    </a>
                </li>
            </ul>


            <!-- Controls (Right) -->
            <!-- Show login/register if not logged in, else show logout button -->
            <%
				String username = request.getParameter("username");
            	if (username == null || username.isEmpty()) {
			%>
	            <div class="d-flex">
	                <a class="btn btn-outline-info me-2" href="/FAW/Register">Register</a>
	                <a class="btn btn-primary" href="/FAW/Login">Login</a>
	            </div>
			<% } else { %>
	            <div class="d-flex align-items-center">
	                <span class="text-white me-3 fs-5">Welcome, <b><%= username %></b></span>
	                <a class="btn btn-primary" href="/FAW/Logout">Logout</a>
	            </div>
			<% } %>

        </div>
    </div>

</nav>