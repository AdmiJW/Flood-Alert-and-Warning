package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Evacuation")
public class EvacuationController {

	@GetMapping("")
	protected ModelAndView getEvacuation() {
		return new ModelAndView("Evacuation");
	}
	
	@GetMapping("Update")
	protected ModelAndView getUpdateEvacuationPoint() {
		return new ModelAndView("UpdateEvacuationPoint");
	}
}