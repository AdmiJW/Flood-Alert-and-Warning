package interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.commons.text.WordUtils;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import java.util.Arrays;


// An interceptor that processes the requestURI and convert it into breadcrumb consumable format
// and store it into the request attribute "breadcrumbElements"
//
// This interceptor expects the requestURI to have no spaces at all, such as home, about,

@Component
public class BreadCrumbInterceptor implements HandlerInterceptor {


    @Getter @Setter
    @AllArgsConstructor
    @ToString
    static class BreadcrumbElement {
        private String name;
        private String url;
    }


	
	@Override
	public boolean preHandle(
		HttpServletRequest request, 
		HttpServletResponse response,
		Object handler
	) throws Exception {

		// Split the URI into parts delimited by "/". Do not include the initial starting "/" at index 0
		String requestURI = request.getRequestURI();

		BreadcrumbElement[] breadcrumbElements = Arrays
            .stream( requestURI.substring(1).split("/") )
            .map( BreadCrumbInterceptor::toBreadcrumbElement )
            .map( BreadCrumbInterceptor::splitBreadCrumbNameByCamelCase )
            .map( BreadCrumbInterceptor::capitalizeBreadCrumbName )
            .toArray( BreadcrumbElement[]::new );

        System.out.println( "breadcrumbElements: " + Arrays.toString( breadcrumbElements ) );

		request.setAttribute("breadcrumbElements", request.getRequestURI());
		return true;
	}



    // Pipelines
    private static BreadcrumbElement toBreadcrumbElement(String s) {
        return new BreadcrumbElement( s, s );
    }

    private static BreadcrumbElement splitBreadCrumbNameByCamelCase(BreadcrumbElement b) {
        StringBuilder sb = new StringBuilder();

        for (char c : b.getName().toCharArray()) {
            if (Character.isUpperCase(c) && sb.length() > 0) sb.append(' ');
            sb.append(c);
        }

        return new BreadcrumbElement( sb.toString(), b.getUrl() );
    }

    private static BreadcrumbElement capitalizeBreadCrumbName(BreadcrumbElement b) {
        return new BreadcrumbElement( WordUtils.capitalizeFully(b.getName()), b.getUrl() );
    }
}
