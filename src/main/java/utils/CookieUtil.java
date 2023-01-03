package utils;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



/**
 * @author Jun Wei
 *
 * Cookie Utility class that encapsulates logic to handle with cookies, 
 * such as setting cookie, getting cookie value and deleting cookie
 * 
 * Those methods are better used in controller and not in JSP, as it may cause unexpected behaviour.
 */
public class CookieUtil {
	
	//============================
	// GET COOKIES
	//============================
	
	/**
	 * @param request HttpServletRequest
	 * @param name Name of the cookie to obtain
	 * @return Cookie object, or null if not found
	 */
	public static Cookie getCookie(HttpServletRequest request, String name) {
		if (request.getCookies() == null) return null;
		
		for (Cookie c: request.getCookies()) {
			if (c.getName().equals(name)) return c;
		}
		return null;
	}
	
	
	/**
	 * @param cookie The cookie to get the value for.
	 * @return cookie's value, decoded using URLDecoder with UTF-8 encoding
	 * @throws UnsupportedEncodingException
	 */
	public static String getCookieValue(Cookie cookie) throws UnsupportedEncodingException {
		if (cookie == null) return null;
		return URLDecoder.decode(cookie.getValue(), "UTF-8");
	}
	
	
	/**
	 * @param request HttpServletRequest
	 * @param name Name of the cookie to obtain
	 * @return cookie's value, decoded using URLDecoder with UTF-8 encoding
	 * @throws UnsupportedEncodingException
	 */
	public static String getCookieValue(HttpServletRequest request, String name) throws UnsupportedEncodingException {
		Cookie c = getCookie(request, name);
		if (c == null) return null;
		return getCookieValue(c);
	}
	
	
	
	//============================
	// SET COOKIES
	//============================
	
	/**
	 * Sets the cookie, where the value is encoded with UTF-8 using URLEncoder.
	 * The maxAge will be set to -1, indicating it is a session cookie
	 * 
	 * @param response HttpServletResponse
	 * @param name Name of the cookie to set
	 * @param value Value of the cookie to set
	 * @throws UnsupportedEncodingException
	 */
	public static void setCookie(
		HttpServletResponse response,
		String name,
		String value
	) throws UnsupportedEncodingException {
		setCookie(response, name, value, -1);
	}
	
	
	/**
	 * Sets the cookie, where the value is encoded with UTF-8 using URLEncoder.
	 * 
	 * @param response HttpServletResponse
	 * @param name Name of the cookie to set
	 * @param value Value of the cookie to set
	 * @param maxAge max age of the cookie from now, in seconds.
	 * @throws UnsupportedEncodingException
	 */
	public static void setCookie(
		HttpServletResponse response,
		String name,
		String value,
		int maxAge
	)
	throws UnsupportedEncodingException
	{
		Cookie c = new Cookie(name, URLEncoder.encode(value, "UTF-8"));
		c.setPath("/");
		c.setMaxAge(maxAge);
		response.addCookie(c);
	}
	
	
	
	//============================
	// DELETE COOKIES
	//============================
		
	/**
	 * @param response HttpServletResponse
	 * @param cookie The cookie to be deleted
	 */
	public static void deleteCookie(HttpServletResponse response, Cookie cookie) {
		if (cookie == null) return;
		cookie.setMaxAge(0);
		cookie.setPath("/");
		response.addCookie(cookie);
	}
	
	
	/**
	 * @param request HttpServletRequest
	 * @param response HttpServletResponse
	 * @param name The name of cookie to be deleted
	 */
	public static void deleteCookie(HttpServletRequest request, HttpServletResponse response, String name) {
		Cookie c = getCookie(request, name);
		if (c == null) return;
		deleteCookie(response, c);
	}
	
}
