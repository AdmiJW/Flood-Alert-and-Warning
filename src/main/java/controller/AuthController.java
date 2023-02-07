package controller;

import entity.User;
import enums.UserType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import utils.AlertUtil;
import utils.AuthUtil;

import javax.servlet.http.HttpServletRequest;


@Controller
@RequestMapping("/")
public class AuthController {

	@GetMapping("Login")
	protected String getLogin(
		HttpServletRequest request
	) {
		if (AuthUtil.getCurrentUser(request) != null) return "redirect:/";
		return "Login";
	}

	@PostMapping("Login")
	protected String postLogin(
		HttpServletRequest request,
		RedirectAttributes redirectAttributes,
		@RequestParam("emailusername") String emailusername,
		@RequestParam("password") String password,
		@RequestParam(value = "remember", required = false) String remember
	) {
		if (AuthUtil.getCurrentUser(request) != null) return "redirect:/";

		try {
			User user = AuthUtil.logIn(request, emailusername, password, remember != null);
			if (remember != null) request.getSession().setMaxInactiveInterval(60 * 60 * 24 * 7);
			AlertUtil.setSuccessAlert(redirectAttributes, "Welcome back, " + user.getUsername() + "!");
			return "redirect:/";
		} catch (Exception e) {
			AlertUtil.setDangerAlert(redirectAttributes, e.getMessage());
			e.printStackTrace();
			return "redirect:/Login";
		}
	}
	
	@GetMapping("Register")
	protected String getEditDashboard(
		HttpServletRequest request
	) {
		if (AuthUtil.getCurrentUser(request) != null) return "redirect:/";
		return "Register";
	}

	@PostMapping("Register")
	protected String postEditDashboard(
		HttpServletRequest request,
		RedirectAttributes redirectAttributes,
		User user
	) {
		if (AuthUtil.getCurrentUser(request) != null) return "redirect:/";

		try {
			user.setUserType(UserType.USER);
			AuthUtil.register(user);
			AlertUtil.setSuccessAlert(redirectAttributes, "Successfully registered! Please log in.");
			return "redirect:/Login";
		} catch (Exception e) {
			AlertUtil.setDangerAlert(redirectAttributes, "Error: " + e.getMessage());
			e.printStackTrace();
			return "redirect:/Register";
		}
	}

	@GetMapping("Logout")
	protected String getLogout(
		HttpServletRequest request
	) {
		AuthUtil.logOut(request);
		return "redirect:/";
	}
}