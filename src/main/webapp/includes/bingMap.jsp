<!-- This component display the map using Bing Map API -->
<!-- Receive parameter: 
	1.Action:PinAllEvac, PinOneEvac, PinAllFlood
		QueryAllLocation, QueryLocation
-->

<!-- API Map parameter here -->
<% 
	String action = request.getParameter("action");

	String height = request.getParameter("height");
	String width = request.getParameter("width");
%>


<!-- Load bing map script -->
<script type='text/javascript' src='http://www.bing.com/api/maps/mapcontrol?callback=GetMap' async defer></script>

<div 
	id="myMap" 
	style="
		position:relative;
		height:<%=height%>;
		width:<%=width%>;
	"
>
</div>