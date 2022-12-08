<!-- 
	Params: 
		visits - Number of visitors on the site		
-->


<div class="container-fluid bg-dark text-center text-white py-5 px-3">

    <p class="">
    	<i class="bi bi-people-fill me-1"></i>
        Visitors: <%= request.getParameter("visits") %>
    </p>

    <ul class="nav justify-content-center my-4 text-white">
        <li class="nav-item">
            <a class="nav-link" href="">Privacy Statement</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="">Security Policy</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="">Disclaimer</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="">FAQ</a>
        </li>
        <li class="nav-item">
            <a class="nav-link" href="">Sitemap</a>
        </li>
    </ul>

    <p class="">
        Copyright © 2019, Department of Irrigation and Drainage Malaysia. All Rights Reserved.
        <br>
        Department of Irrigation and Drainage, Km 7, Jalan Ampang, 68000 Ampang, Kuala Lumpur,
        <br>
        MalaysiaTel: (603)-4289 5585 Fax: (603)-4256 4037
        <br>
        Best viewed using Safari, Google Chrome & Firefox with resolution 1280x1024
        <br>
        Last Update: 14/11/2022 02:35
    </p>
</div>