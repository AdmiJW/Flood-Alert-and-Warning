package utils;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import enums.AlertType;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


// Sets alert messages to be displayed on the next page via RedirectAttributes
public class AlertUtil {

	private AlertUtil() {}


	// Sets the alert as a request attribute, which will be available on the current page
	public static void setAlert(
		HttpServletRequest request,
		AlertType alertType,
		String message
	) {
		request.setAttribute(alertType.getName(), message);
	}


	// Sets the alert as a flash attribute, which will be available on the next page
	public static void setAlert(
		RedirectAttributes redirectAttributes,
		AlertType alertType,
		String message
	) {
		redirectAttributes.addFlashAttribute(alertType.getName(), message);
	}


	// Primary alert
	public static void setPrimaryAlert(HttpServletRequest request, String message) {
		setAlert(request, AlertType.PRIMARY, message);
	}

	public static void setPrimaryAlert(RedirectAttributes redirectAttributes, String message) {
		setAlert(redirectAttributes, AlertType.PRIMARY, message);
	}


	// Secondary alert
	public static void setSecondaryAlert(HttpServletRequest request, String message) {
		setAlert(request, AlertType.SECONDARY, message);
	}

	public static void setSecondaryAlert(RedirectAttributes redirectAttributes, String message) {
		setAlert(redirectAttributes, AlertType.SECONDARY, message);
	}


	// Success alert
	public static void setSuccessAlert(HttpServletRequest request, String message) {
		setAlert(request, AlertType.SUCCESS, message);
	}

	public static void setSuccessAlert(RedirectAttributes redirectAttributes, String message) {
		setAlert(redirectAttributes, AlertType.SUCCESS, message);
	}


	// Danger alert
	public static void setDangerAlert(HttpServletRequest request, String message) {
		setAlert(request, AlertType.DANGER, message);
	}

	public static void setDangerAlert(RedirectAttributes redirectAttributes, String message) {
		setAlert(redirectAttributes, AlertType.DANGER, message);
	}


	// Warning alert
	public static void setWarningAlert(HttpServletRequest request, String message) {
		setAlert(request, AlertType.WARNING, message);
	}

	public static void setWarningAlert(RedirectAttributes redirectAttributes, String message) {
		setAlert(redirectAttributes, AlertType.WARNING, message);
	}


	// Info alert
	public static void setInfoAlert(HttpServletRequest request, String message) {
		setAlert(request, AlertType.INFO, message);
	}

	public static void setInfoAlert(RedirectAttributes redirectAttributes, String message) {
		setAlert(redirectAttributes, AlertType.INFO, message);
	}


	// Light alert
	public static void setLightAlert(HttpServletRequest request, String message) {
		setAlert(request, AlertType.LIGHT, message);
	}

	public static void setLightAlert(RedirectAttributes redirectAttributes, String message) {
		setAlert(redirectAttributes, AlertType.LIGHT, message);
	}


	// Dark alert
	public static void setDarkAlert(HttpServletRequest request, String message) {
		setAlert(request, AlertType.DARK, message);
	}

	public static void setDarkAlert(RedirectAttributes redirectAttributes, String message) {
		setAlert(redirectAttributes, AlertType.DARK, message);
	}
}
