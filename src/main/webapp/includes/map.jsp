<!-- This component display the map using Bing Map API -->
<!-- Receive parameter: 
	1.Action:PinAllEvac, PinOneEvac, PinAllFlood
		QueryAllLocation, QueryLocation
-->
<% 
	String action = request.getParameter("action");
%>


<!-- API Map parameter here -->
<% 
	String KEY = "AhlOoTZD9wvrqFrXITpeEmWuPjBNF4NgEVw3GJmtCjUhK6QKb-CXcwbPWT_wFewr";
	String setLang = "&setLang=en-US",setMkt = "&setMkt=en-US";
	String APIPathURL="http://www.bing.com/api/maps/mapcontrol?callback=GetMap";
	APIPathURL = APIPathURL + setLang + setMkt;
%>

<head>
	<script type='text/javascript' src=<%= APIPathURL %> async defer></script>
	<script type='text/javascript'>
		var map, searchManager;
		
		function GetMap() {
			map = new Microsoft.Maps.Map('#myMap', {
				credentials: '<%= KEY %>',
				mapTypeId: Microsoft.Maps.MapTypeId.road,
				zoom: 10
			});
			 Microsoft.Maps.loadModule(['Microsoft.Maps.AutoSuggest', 'Microsoft.Maps.Search'], function () {
	            var manager = new Microsoft.Maps.AutosuggestManager({ map: map });
	            manager.attachAutosuggest('#searchBox', '#searchBoxContainer', suggestionSelected);

	            searchManager = new Microsoft.Maps.Search.SearchManager(map);
	        });
		}
		
		 function suggestionSelected(result) {
		        //Remove previously results from the map.
		        map.entities.clear();
	
		        //Show the suggestion as a pushpin and center map over it.
		        var pin = new Microsoft.Maps.Pushpin(result.location);
		        map.entities.push(pin);
		        map.setView({ bounds: result.bestView });
		        document.getElementById('output').innerHTML = 'Selection:<br/>' + result.name;
		    }
		 function geocode() {
		        //Remove previously results from the map.
		        map.entities.clear();

		        //Get the users query and geocode it.
		        var query = document.getElementById('searchBox').value;

		        var searchRequest = {
		            where: query,
		            callback: function (r) {
		                if (r && r.results && r.results.length > 0) {
		                    var pin, pins = [], locs = [], output = 'Results:<br/>';

		                    //Add a pushpin for each result to the map and create a list to display.
		                    for (var i = 0; i < r.results.length; i++) {
		                        //Create a pushpin for each result.
		                        pin = new Microsoft.Maps.Pushpin(r.results[i].location, {
									
		                            text: i + 'EvacPoint'

		                        });

		                        pins.push(pin);
		                        locs.push(r.results[i].location);

		                        output += i + ') ' + r.results[i].name + '<br/>';
		                    }

		                    //Add the pins to the map
		                    map.entities.push(pins);

		                    //Display list of results
		                    document.getElementById('output').innerHTML = output;

		                    //Determine a bounding box to best view the results.
		                    var bounds;

		                    if (r.results.length == 1) {
		                        bounds = r.results[0].bestView;
		                    } else {
		                        //Use the locations from the results to calculate a bounding box.
		                        bounds = Microsoft.Maps.LocationRect.fromLocations(locs);
		                    }

		                    map.setView({ bounds: bounds, padding: 30 });
		                }
		            },
		            errorCallback: function (e) {
		                document.getElementById('output').innerHTML = "No results found.";
		            }
		        };

		        //Make the geocode request.
		        searchManager.geocode(searchRequest);
		    }
		
	</script>
</head>

<div id='searchBoxContainer' class='mb-2 w-50 d-flex justify-content-start'>
 	
 	<div class="input-group-prepend">
    	<button class="btn btn-outline-secondary" type="button" value='Search' onclick='geocode()'>Search</button>
  	</div>
  	<input type='text' id='searchBox' class="form-control" placeholder="Search Location Here..." aria-label="Search Location Here..." aria-describedby="basic-addon2"/>
</div>

<div id='output' style="margin-left:10px;float:left;">test one</div>
<div id="myMap" style="height:600px;"></div>