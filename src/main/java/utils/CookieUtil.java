package utils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieUtil {
	
	
	public static Cookie getCookie(HttpServletRequest request, String name) {
		for (Cookie c: request.getCookies()) {
			if (c.getName().equals(name)) 
				return c;
		}
		return null;
	}
	
	
	public static String getCookieValue(Cookie cookie) throws UnsupportedEncodingException {
		return URLDecoder.decode(cookie.getValue(), "UTF-8");
	}
	
	
	public static void setCookie(
		HttpServletResponse response,
		String name,
		String value
	)
	throws UnsupportedEncodingException
	{
		Cookie c = new Cookie(name, URLEncoder.encode(value, "UTF-8"));
		c.setPath("/");
		response.addCookie(c);
	}
	
	
	public static void deleteCookie(HttpServletResponse response, Cookie cookie) {
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
	}
	
	
}
