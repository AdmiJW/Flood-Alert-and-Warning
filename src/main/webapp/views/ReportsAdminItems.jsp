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
					<c:choose>
						<c:when test="${report.review_status=='Pending'}">
							<div class='mt-4'>
								<a href="<c:url value='/Reports/Review'>
													<c:param name='review_type' value='Approved'/>
													<c:param name='reportID' value='${report.id}'/>
												</c:url>" class="btn btn-success">Approve</a>
								<a href="<c:url value='/Reports/Review'>
													<c:param name='review_type' value='Denied'/>
													<c:param name='reportID' value='${report.id}'/>
												</c:url>" class="btn btn-danger">Deny</a>
							</div>
						</c:when>
						<c:when test="${report.review_status=='Approved'}">
							<div class='mt-4'>
								<a href="<c:url value='/Reports/Review'>
									<c:param name='review_type' value='Pending'/>
									<c:param name='reportID' value='${report.id}'/>
								</c:url>" class="btn btn-success">Approved</a>
							</div>
						</c:when>
						<c:when test="${report.review_status=='Denied'}">
							<div class='mt-4'>
								<a href="<c:url value='/Reports/Review'>
									<c:param name='review_type' value='Pending'/>
									<c:param name='reportID' value='${report.id}'/>
								</c:url>" class="btn btn-danger">Denied</a>
							</div>
						</c:when>
					</c:choose>
				</div>
			</div>

		</div>
	</c:forEach>