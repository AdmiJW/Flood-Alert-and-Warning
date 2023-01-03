package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/Subscribe")
public class SubscribeController {

	@GetMapping("")
	protected ModelAndView getSubscribeForm() {
		return new ModelAndView("Subscribe");
	}
	
	@GetMapping("Subscriptions")
	protected ModelAndView getSubscriptionsPage() {
		return new ModelAndView("Subscriptions");
	}
}