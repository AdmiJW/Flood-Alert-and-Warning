// To use bingMap, include <script type='text/javascript' src='http://www.bing.com/api/maps/mapcontrol?callback=GetMap' async defer></script>
// into your page. The callback GetMap() will be called here.


const API_KEY = 'AhlOoTZD9wvrqFrXITpeEmWuPjBNF4NgEVw3GJmtCjUhK6QKb-CXcwbPWT_wFewr';

let map;
let searchManager;


// Init function that is called by BingMap script to load the map into a specified div.
function GetMap() {
	// Load Bing Map
	map = new Microsoft.Maps.Map('#myMap', {
		credentials: API_KEY,
		mapTypeId: Microsoft.Maps.MapTypeId.road,
		zoom: 10
	});

	// Load searching functionality module
	Microsoft.Maps.loadModule(['Microsoft.Maps.AutoSuggest', 'Microsoft.Maps.Search'], ()=> {
		let manager = new Microsoft.Maps.AutosuggestManager({ map: map });
		manager.attachAutosuggest('#searchBox', '#searchBoxSuggestions', suggestionSelected);
		searchManager = new Microsoft.Maps.Search.SearchManager(map);
	});
}


// Event listener that is fired when a place suggestion is selected.
function suggestionSelected(result) {
	//Remove previously suggestions from the map.
	map.entities.clear();

	//Show the suggestion as a pushpin and center map over it.
	var pin = new Microsoft.Maps.Pushpin(result.location);
	map.entities.push(pin);
	map.setView({ bounds: result.bestView });
}


// Event listener that is fired when user types into the search box and press search.
// This function will search for the place that the user typed in by geocoding.
function geocode() {
	//Remove previously results from the map.
	map.entities.clear();

	let searchRequest = {
		where: document.getElementById('searchBox').value,
		callback: (r)=> {
			// No results. Return
			if (!r || !r.results || !r.results.length) return;
			
			let pin, pins = [], locs = [];

			//Add a pushpin for each result to the map and create a list to display.
			for (let i = 0; i < r.results.length; i++) {
				//Create a pushpin for each result.
				pin = new Microsoft.Maps.Pushpin(r.results[i].location);

				pins.push( pin );
				locs.push( r.results[i].location );
			}

			//Add the pins to the map
			map.entities.push(pins);

			//Determine a bounding box to best view the results.
			var bounds;

			if (r.results.length == 1) 
				bounds = r.results[0].bestView;
			else
				//Use the locations from the results to calculate a bounding box.
				bounds = Microsoft.Maps.LocationRect.fromLocations(locs);

			map.setView({ bounds: bounds, padding: 30 });
		},
		errorCallback: (e)=> {
			console.log('Error: No search results found');
		}
	};

	//Make the geocode request.
	searchManager.geocode(searchRequest);
}