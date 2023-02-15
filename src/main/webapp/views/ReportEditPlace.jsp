<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- Select state -->
<div class="mb-2">
	<label for="state" class="form-label fw-bold">State:</label>

	<select class="form-select" name='state' id='state' required aria-label="Select state">
		<option selected value=''>${selected_state}</option>

		<c:forEach items="${states}" var="state">
			<option value="${state.id}">${state.name}</option>
		</c:forEach>
	</select>
</div>
<!-- Select district -->
<div class="mb-2">
	<label for="district" class="form-label fw-bold">District:</label>

	<select class="form-select" name='district' id='district' required
		aria-label="Select district">
		<option selected disabled value=''>Select district</option>
	</select>
</div>

<!-- Select POI -->
<div class="mb-2">
	<label for="location" class="form-label fw-bold">Location:</label>

	<select class="form-select" name='location' id='location' required
		aria-label="Select location">
		<option selected disabled value=''>Select location</option>
	</select>
</div>