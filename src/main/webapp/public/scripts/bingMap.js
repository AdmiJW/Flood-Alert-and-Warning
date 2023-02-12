// To use bingMap, include
// <script type='text/javascript' src='http://www.bing.com/api/maps/mapcontrol?callback=GetMap' async defer></script>
// into your page. The callback GetMap() will be called here to initialize the Bing Map SDK.

/**
 * @typedef { import('../types/MicrosoftMaps/Microsoft.Maps.All').Microsoft } Microsoft
 */


const API_KEY = 'AhlOoTZD9wvrqFrXITpeEmWuPjBNF4NgEVw3GJmtCjUhK6QKb-CXcwbPWT_wFewr';


/** @type {Microsoft.Maps.Map} */
let map;
/** @type {Microsoft.Maps.AutosuggestManager} */
let autoSuggestManager;
/** @type {Microsoft.Maps.Search.SearchManager} */
let searchManager;
/** @type {Microsoft.Maps.Infobox} */
let infobox;


// Bing Map SDK initialize function
function GetMap() {
	initializeMap();
	initializeSearchAndAutoSuggest();
}

function initializeMap() {
	map = new Microsoft.Maps.Map('#myMap', {
		credentials: API_KEY,
		mapTypeId: Microsoft.Maps.MapTypeId.road,
		zoom: 10
	});
}

function initializeSearchAndAutoSuggest() {
	Microsoft.Maps.loadModule(['Microsoft.Maps.AutoSuggest', 'Microsoft.Maps.Search'], () => {
		autoSuggestManager = new Microsoft.Maps.AutosuggestManager({ map: map });
		autoSuggestManager.attachAutosuggest('#searchBox', '#searchBoxSuggestions', suggestionSelected);
		searchManager = new Microsoft.Maps.Search.SearchManager(map);
	});
}




function GetAllPin() {
	map = new Microsoft.Maps.Map('#myMap', {
		credentials: API_KEY,
		mapTypeId: Microsoft.Maps.MapTypeId.road,
		zoom: 7
	});

	// Load searching functionality module
	Microsoft.Maps.loadModule(['Microsoft.Maps.AutoSuggest', 'Microsoft.Maps.Search'], () => {
		autoSuggestManager = new Microsoft.Maps.AutosuggestManager({ map: map });
		autoSuggestManager.attachAutosuggest('#searchBox', '#searchBoxSuggestions', suggestionSelected);
		searchManager = new Microsoft.Maps.Search.SearchManager(map);
	});

	infobox = new Microsoft.Maps.Infobox(map.getCenter(), {
		visible: false
	});
	infobox.setMap(map);

	for (var i = 0; i < 5; i++) {
		//query database lat and long based on row
		var loc = new Microsoft.Maps.Location(
			1.5333312,103.8166634
		);

		var pin = new Microsoft.Maps.Pushpin(loc);

		//Store some metadata with the pushpin.
		pin.metadata = {
			title: "title" + i,
			description: 'Remarks: ' + i
		};

		//Add a click event handler to the pushpin.
		Microsoft.Maps.Events.addHandler(pin, 'click', pushpinClicked);
		Microsoft.Maps.Events.addHandler(map, 'click', closeInfoBox);

		//Add pushpin to the map.
		map.entities.push(pin);
	}
}

//Display infobox of pinned location
function pushpinClicked(e) {
	//Make sure the infobox has metadata to display.
	if (e.target.metadata) {
		//Set the infobox options with the metadata of the pushpin.
		infobox.setOptions({
			location: e.target.getLocation(),
			title: e.target.metadata.title,
			description: e.target.metadata.description,
			visible: true
		});
	}
}

// Close infobox my clicking anywhere in map
function closeInfoBox(e) {
	infobox.setOptions({
		visible: false
	});
}



//Event listener that is fired when a place suggestion is selected.
/**
 * @param result {Microsoft.Maps.ISuggestionResult}
 */
function suggestionSelected( result ) {
	//Remove previously suggestions from the map.
	map.entities.clear();

	//Show the suggestion as a pushpin and center map over it.
	let pin = new Microsoft.Maps.Pushpin(result.location);
	map.entities.push(pin);
	map.setView({ bounds: result.bestView });
}





// Event listener that is fired when user types into the search box and press search.
// This function will search for the place that the user typed in by geocoding.
function onBingMapSearch() {
	map.entities.clear();

	//Make the geocode request.
	searchManager.geocode({
		where: document.getElementById('searchBox').value,
		callback: (r) => {
			// No results. Early return
			if (!r || !r.results || !r.results.length) return;

			let pins = [], locs = [];

			//Add a pushpin for each result to the map and create a list to display.
			r.results.forEach((result) => {
				let pin = new Microsoft.Maps.Pushpin(result.location);
				pins.push(pin);
				locs.push(result.location);

				// If the current page has a input element 'lat', fill in the values
				const latInput = document.getElementById('lat');
				const lngInput = document.getElementById('lng');
				const locationNameInput = document.getElementById('location');

				if (latInput) latInput.value = result.location.latitude;
				if (lngInput) lngInput.value = result.location.longitude;
				if (locationNameInput) locationNameInput.value = result.name;
			});

			//Add the pins to the map
			map.entities.push(pins);

			//Determine a bounding box to best view the results.
			let bounds;

			// Search returns only one result, get the best bounding box
			if (r.results.length == 1) bounds = r.results[0].bestView;
			// Otherwise get the best bounding box that show all results
			else bounds = Microsoft.Maps.LocationRect.fromLocations(locs);

			map.setView({ bounds: bounds, padding: 30 });
		},
		errorCallback: (e) => {
			console.error(e);
			window.alert('Failed searching for location: ' + e.where);
		}
	});
}
