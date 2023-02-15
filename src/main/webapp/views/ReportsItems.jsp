<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:forEach items="${reports}" var="report" varStatus="loop">

	<div class="d-grid py-4 gap-4 justify-content-center"
		style='grid-template-columns: repeat( auto-fit, minmax(250px, 350px) );'>

		<div class="card rounded-4 overflow-hidden">
			<img src="${report.media_path}" class="card-img-top" alt="flood" />


			<div class="card-body">
				<div class="card-title">
					<h3>${report.user.username}</h3>
				</div>

				<div class="card-desc text-muted">
					<span class="card-date">${report.submission_date}</span> <br>
					<span class="card-location">${report.location.name}</span><br>
					<span class="card-location">${report.district.name},
						${report.state.name}</span><br>
				</div>

				<p class="card-text mt-4">
					${report.detail}
				</p>
			</div>
		</div>

	</div>
</c:forEach>
