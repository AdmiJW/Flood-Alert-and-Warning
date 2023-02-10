package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/Dashboard")
public class DashboardController {

	@GetMapping("")
	protected String getDashboard() {
		return "Dashboard";
	}
	
	@GetMapping("Update")
	protected String getUpdateDashboard() {
		return "UpdateDashboard";
	}
}