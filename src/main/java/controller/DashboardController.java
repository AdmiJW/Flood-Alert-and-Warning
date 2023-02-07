package controller;

import dataAccess.UserDA;
import entity.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Dashboard")
public class DashboardController {

	@GetMapping("")
	protected ModelAndView getDashboard() {
		return new ModelAndView("Dashboard");
	}
	
	@GetMapping("Update")
	protected ModelAndView getUpdateDashboard() {
		return new ModelAndView("UpdateDashboard");
	}
}