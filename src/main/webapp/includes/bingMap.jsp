<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!-- This component display the map using Bing Map API -->
<!-- Receive parameter:
1.Action:PinAllEvac, PinOneEvac, PinAllFlood
QueryAllLocation, QueryLocation
-->

<!-- API Map parameter here -->


<% 
	String mapCallBack = "GetMap", floodOrEvac = "test";
	if (request.getParameter("action") != null){
		String action = request.getParameter("action");
		mapCallBack = "GetAllPin";
		if (action.equals("pinAllFlood")){ 
			floodOrEvac = "Flood";
		}
		else if (action.equals("pinAllEvac")){ 
			floodOrEvac = "Evac";
		}
	}
	
	String height = request.getParameter("height");
	String width = request.getParameter("width");
%>

<script type="text/javascript">
	var FloodOrEvac = `<%= floodOrEvac%>`;
	var queryOption = "No query option";
	if(FloodOrEvac == "Flood") queryOption = "Flood location querying...";
	else if (FloodOrEvac== "Evac") queryOption = "Evac location querying...";
</script>
<script  src="public/scripts/subscribePage.js"></script>
<script type='text/javascript' src='http://www.bing.com/api/maps/mapcontrol?callback=<%= mapCallBack %>' async defer></script>

<div 
	id="myMap" 
	class='m-auto'
	style="
		position:relative;
		height:<%=height%>;
		width:<%=width%>;
	"
>
</div>