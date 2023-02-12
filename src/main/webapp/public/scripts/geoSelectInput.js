

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

	const districtsOptions = {};
	const locationsOptions = {};

	districts?.forEach(district => {
		if (districtsOptions[district.state.id] === undefined) districtsOptions[district.state.id] = [];
		districtsOptions[district.state.id].push(getOption(district.id, district.name));
	});

	locations?.forEach(location => {
		if (locationsOptions[location.district.id] === undefined) locationsOptions[location.district.id] = [];
		locationsOptions[location.district.id].push(getOption(location.id, location.name));
	});


	// On state selected, change district and location select elements
	stateSelect?.addEventListener('change', (event) => {
		const state = event.target.value;

		// Clear district and location select elements
		if (districtSelect) districtSelect.innerHTML = '';
		if (locationSelect) locationSelect.innerHTML = '';

		// Add default disabled option
		districtSelect?.appendChild(getDefaultDisabledOption('Select district'));
		locationSelect?.appendChild(getDefaultDisabledOption('Select location'));

		// Add districts to district select element
		if (districtsOptions[state] === undefined) return;
		for (const district of districtsOptions[state]) districtSelect.appendChild(district);
	});


	// On district selected, change location select element
	districtSelect?.addEventListener('change', (event) => {
		const district = event.target.value;

		// Clear location select element
		if (locationSelect) locationSelect.innerHTML = '';

		// Add default disabled option
		locationSelect?.appendChild(getDefaultDisabledOption('Select location'));

		// Add locations to location select element
		if (locationsOptions[district] === undefined) return;
		for (const location of locationsOptions[district]) locationSelect.appendChild(location);
	});
});