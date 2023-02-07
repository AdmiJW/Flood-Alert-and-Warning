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


// An extremely simple interceptor that simply counts the number of times the site is visited


@Component
public class TotalVisitedInterceptor implements HandlerInterceptor {

    private static int totalVisited = 0;

    @Override
    public boolean preHandle(
        HttpServletRequest request,
        HttpServletResponse response,
        Object handler
    ) {
        totalVisited++;

        request.setAttribute("totalVisited", totalVisited);
        return true;
    }
}
