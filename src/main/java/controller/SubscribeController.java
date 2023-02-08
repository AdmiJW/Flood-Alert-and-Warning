package controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import dataAccess.GeoDA;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/Subscribe")
public class SubscribeController {

	@GetMapping("")
	protected String getSubscribeForm(
		HttpServletRequest request
	) throws JsonProcessingException {
		// Pass in the states, districts and locations
		// Pass states as List<State>
		// Pass districts and locations as JSON, as they will be used in the frontend
		ObjectMapper mapper = new ObjectMapper();
		request.setAttribute("states", GeoDA.getAllStates() );
		request.setAttribute("districts", mapper.writeValueAsString( GeoDA.getAllDistricts() ) );
		request.setAttribute("locations", mapper.writeValueAsString( GeoDA.getAllLocations() ) );
		return "Subscribe";
	}
	
	@GetMapping("Subscriptions")
	protected String getSubscriptionsPage(
		HttpServletRequest request
	) {

		return "Subscriptions";
	}
}