package utils;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import enums.AlertType;



/**
 * @author Jun Wei
 * 
 * Alert Utility class that encapsulates logic to handle with alerts through the use of cookies
 */
public class AlertUtil {
	/**
	 * @param request HttpServletRequest
	 * @param type AlertType
	 * @return cookie's value, decoded using URLDecoder with UTF-8 encoding
	 * @throws UnsupportedEncodingException
	 */
	public static void setAlert(HttpServletResponse response, AlertType type, String message) throws UnsupportedEncodingException {
		CookieUtil.setCookie(response, type.name, message);
	}


	/**
	 * @param request HttpServletRequest
	 * @param type AlertType
	 * @return cookie's value, decoded using URLDecoder with UTF-8 encoding
	 * @throws UnsupportedEncodingException
	 */
	public static String getAlert(HttpServletRequest request, AlertType type) throws UnsupportedEncodingException {
		return CookieUtil.getCookieValue(request, type.name);
	}
	
	
	/**
	 * @param request HttpServletRequest
	 * @param type AlertType
	 * @return cookie's value, decoded using URLDecoder with UTF-8 encoding
	 */
	public static void clearAlerts(HttpServletRequest request, HttpServletResponse response) {
		for (AlertType a: AlertType.values())
			CookieUtil.deleteCookie(request, response, a.name);
	}
}
