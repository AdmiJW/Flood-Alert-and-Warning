

// Gets <option selected disabled value=''> {text} </option>
function getDefaultDisabledOption(text) {
	const option = document.createElement('option');
	option.value = '';
	option.innerText = text;
	option.selected = true;
	option.disabled = true;
	return option;
}


// Gets <option value='value'> {text} </option>
function getOption(value, text) {
	const option = document.createElement('option');
	option.value = value;
	option.innerText = text;
	return option;
}


// Add event listeners to state, district and location select elements once DOM is loaded
document.addEventListener('DOMContentLoaded', () => {
	const stateSelect = document.getElementById('state');
	const districtSelect = document.getElementById('district');
	const locationSelect = document.getElementById('location');
	
	console.log(locs);


	// On state selected, change district and location select elements
	stateSelect.addEventListener('change', (event) => {
		const state = event.target.value;
		const districts = locs[state];

		// Clear district and location select elements
		districtSelect.innerHTML = '';
		locationSelect.innerHTML = '';

		// Add default disabled option to district select element
		districtSelect.appendChild(getDefaultDisabledOption('Select district'));

		// Add districts to district select element
		for (const district in districts)
			districtSelect.appendChild(getOption(district, district));

		// Add default disabled option to location select element
		locationSelect.appendChild(getDefaultDisabledOption('Select location'));
	});


	// On district selected, change location select element
	districtSelect.addEventListener('change', (event) => {
		const state = stateSelect.value;
		const district = event.target.value;
		const locations = locs[state][district];

		// Clear location select element
		locationSelect.innerHTML = '';

		// Add default disabled option to location select element
		locationSelect.appendChild(getDefaultDisabledOption('Select location'));

		// Add locations to location select element
		for (const location in locations)
			locationSelect.appendChild(getOption(location, location));
	});
});