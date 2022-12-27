package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/")
public class AuthController {

	@GetMapping("Login")
	protected ModelAndView getLogin() {
		return new ModelAndView("Login");
	}
	
	@GetMapping("Register")
	protected ModelAndView getEditDashboard() {
		return new ModelAndView("Register");
	}
}