package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Reports")
public class ReportsController {

	@GetMapping("")
	protected ModelAndView getLogin() {
		return new ModelAndView("Reports");
	}
	
	@GetMapping("Admin")
	protected ModelAndView getEditDashboard() {
		return new ModelAndView("ReportsEdit");
	}
}