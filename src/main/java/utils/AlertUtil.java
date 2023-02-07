package utils;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import enums.AlertType;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


// Sets alert messages to be displayed on the next page via RedirectAttributes
public class AlertUtil {

	private AlertUtil() {}


	public static void setAlert(
		RedirectAttributes redirectAttributes,
		AlertType alertType,
		String message
	) {
		redirectAttributes.addFlashAttribute(alertType.getName(), message);
	}

	public static void setPrimaryAlert(RedirectAttributes redirectAttributes, String message) {
		setAlert(redirectAttributes, AlertType.PRIMARY, message);
	}

	public static void setSecondaryAlert(RedirectAttributes redirectAttributes, String message) {
		setAlert(redirectAttributes, AlertType.SECONDARY, message);
	}

	public static void setSuccessAlert(RedirectAttributes redirectAttributes, String message) {
		setAlert(redirectAttributes, AlertType.SUCCESS, message);
	}

	public static void setDangerAlert(RedirectAttributes redirectAttributes, String message) {
		setAlert(redirectAttributes, AlertType.DANGER, message);
	}

	public static void setWarningAlert(RedirectAttributes redirectAttributes, String message) {
		setAlert(redirectAttributes, AlertType.WARNING, message);
	}

	public static void setInfoAlert(RedirectAttributes redirectAttributes, String message) {
		setAlert(redirectAttributes, AlertType.INFO, message);
	}

	public static void setLightAlert(RedirectAttributes redirectAttributes, String message) {
		setAlert(redirectAttributes, AlertType.LIGHT, message);
	}

	public static void setDarkAlert(RedirectAttributes redirectAttributes, String message) {
		setAlert(redirectAttributes, AlertType.DARK, message);
	}
}
