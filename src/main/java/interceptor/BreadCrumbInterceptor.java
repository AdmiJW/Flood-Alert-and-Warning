package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;



// An interceptor that adds a attribute "breadcrumbURL" that is going to be used by breadcrumb component

@Component
public class BreadCrumbInterceptor implements HandlerInterceptor {
	
	@Override
	public boolean preHandle(
		HttpServletRequest request, 
		HttpServletResponse response,
		Object handler
	) throws Exception {
		request.setAttribute("breadcrumbURL", request.getRequestURI());
		return true;
	}
}
