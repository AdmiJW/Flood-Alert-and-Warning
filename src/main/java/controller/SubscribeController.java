package controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import dataAccess.GeoDA;
import dataAccess.SubscriptionDA;
import entity.Subscription;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import utils.AlertUtil;
import utils.AuthUtil;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/Subscribe")
public class SubscribeController {

	@GetMapping("")
	protected String getSubscribeForm(
		HttpServletRequest request,
		RedirectAttributes redirectAttributes
	) throws JsonProcessingException {
		if (AuthUtil.getCurrentUser(request) == null) {
			AlertUtil.setWarningAlert(redirectAttributes, "You must be logged in to subscribe to a location.");
			return "redirect:/Login";
		}

		// Pass in the states, districts and locations
		// Pass states as List<State>
		// Pass districts and locations as JSON, as they will be used in the frontend
		ObjectMapper mapper = new ObjectMapper();
		request.setAttribute("states", GeoDA.getAllStates() );
		request.setAttribute("districts", mapper.writeValueAsString( GeoDA.getAllDistricts() ) );
		request.setAttribute("locations", mapper.writeValueAsString( GeoDA.getAllLocations() ) );
		return "Subscribe";
	}

	@PostMapping("")
	protected String postSubscribeForm(
		HttpServletRequest request,
		RedirectAttributes redirectAttributes,
		@RequestParam(value = "email", required = false) String email,
		@RequestParam(value = "sms", required = false) String sms,
		@RequestParam("location") Long location
	) {
		if (AuthUtil.getCurrentUser(request) == null) {
			AlertUtil.setWarningAlert(redirectAttributes, "You must be logged in to subscribe to a location.");
			return "redirect:/Subscribe";
		}

		boolean emailBool = email != null;
		boolean smsBool = sms != null;

		if (!emailBool && !smsBool) {
			AlertUtil.setWarningAlert(redirectAttributes, "You must select at least one notification method.");
			return "redirect:/Subscribe";
		}

		Subscription s = new Subscription();
		s.setLocation( GeoDA.getLocationById(location) );
		s.setUser( AuthUtil.getCurrentUser(request) );
		s.setIsEmailSubscription(emailBool);
		s.setIsSmsSubscription(smsBool);
		SubscriptionDA.add(s);

		AlertUtil.setSuccessAlert(redirectAttributes, "You have successfully subscribed to " + s.getLocation().getName() + ".");
		return "redirect:/Subscribe";
	}




	
	@GetMapping("Subscriptions")
	protected String getSubscriptionsPage(
		HttpServletRequest request,
		RedirectAttributes redirectAttributes
	) {
		if (AuthUtil.getCurrentUser(request) == null) {
			AlertUtil.setWarningAlert(redirectAttributes, "You must be logged in to subscribe to a location.");
			return "redirect:/Login";
		}

		List<Subscription> subscriptions = SubscriptionDA.getByUser( AuthUtil.getCurrentUser(request) );
		request.setAttribute("subscriptions", subscriptions);

		if (subscriptions == null || subscriptions.size() == 0)
			AlertUtil.setWarningAlert(request, "You have not subscribed to any locations yet.");

		return "Subscriptions";
	}

	@GetMapping("Unsubscribe")
	protected String getUnsubscribePage(
		HttpServletRequest request,
		RedirectAttributes redirectAttributes,
		@RequestParam("id") Long id
	) {
		if (AuthUtil.getCurrentUser(request) == null) {
			AlertUtil.setWarningAlert(redirectAttributes, "You must be logged in to subscribe to a location.");
			return "redirect:/Login";
		}

		Subscription s = SubscriptionDA.getById(id);

		if (s == null) {
			AlertUtil.setWarningAlert(redirectAttributes, "Subscription not found.");
			return "redirect:/Subscribe/Subscriptions";
		}

		if ( !s.getUser().getId().equals( AuthUtil.getCurrentUser(request).getId() ) ) {
			AlertUtil.setWarningAlert(redirectAttributes, "You do not have permission to unsubscribe from this location.");
			return "redirect:/Subscribe/Subscriptions";
		}

		SubscriptionDA.delete(s);
		AlertUtil.setSuccessAlert(redirectAttributes, "You have successfully unsubscribed from " + s.getLocation().getName() + ".");
		return "redirect:/Subscribe/Subscriptions";
	}
}