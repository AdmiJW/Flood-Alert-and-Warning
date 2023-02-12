package controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import dataAccess.GeoDA;
import enums.StationStatusType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import dataAccess.DashboardDA;
import entity.Dashboard;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import utils.AlertUtil;
import utils.AuthUtil;
import utils.pagination.Paginator;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

import static enums.UserType.ADMIN;

@Controller
@RequestMapping("/Dashboard")
public class DashboardController {

//	@GetMapping("")
//	protected String getDashboard(){
//		return "Dashboard";
//	}

	@GetMapping("")
	protected String getDashboard(
			HttpServletRequest request,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page,
			@RequestParam(value = "search", required = false, defaultValue = "") String search
	)  {
 		List<Dashboard> dashboard = DashboardDA.getByName(search);
		Paginator<Dashboard> paginator = new Paginator<>(dashboard, 5);

		request.setAttribute("paginator", paginator);
		request.setAttribute("currentPage", page);

		if (dashboard == null || dashboard.size() == 0)
			AlertUtil.setWarningAlert(request, "No reports yet");

		return "Dashboard";
	}

	@GetMapping("AddDashboard")
	protected String addDashboardForm(
			HttpServletRequest request,
			RedirectAttributes redirectAttributes
	) throws JsonProcessingException {

		if (AuthUtil.getCurrentUser(request) == null) {
			AlertUtil.setWarningAlert(redirectAttributes, "You must be logged in first.");
			return "redirect:/Login";
		}

		if (AuthUtil.getCurrentUser(request).getUserType() != ADMIN) {
			AlertUtil.setDangerAlert(redirectAttributes, "You are not authorized to use this function.");
			return "redirect:/";
		}

		ObjectMapper mapper = new ObjectMapper();
		request.setAttribute("states", GeoDA.getAllStates());
		request.setAttribute("districts", mapper.writeValueAsString(GeoDA.getAllDistricts()));
		request.setAttribute("locations", mapper.writeValueAsString(GeoDA.getAllLocations()));

		return "AddDashboard";
	}

	@GetMapping("Update")
	protected String getUpdateForm(
			HttpServletRequest request,
			RedirectAttributes redirectAttributes,
			@RequestParam("id") Long id
	) {
		if (AuthUtil.getCurrentUser(request) == null) {
			AlertUtil.setWarningAlert(redirectAttributes, "You must be logged in first.");
			return "redirect:/Login";
		}
		if (AuthUtil.getCurrentUser(request).getUserType() != ADMIN) {
			AlertUtil.setDangerAlert(redirectAttributes, "You are not authorized to use this function.");
			return "redirect:/";
		}

		Dashboard d = DashboardDA.getById(id);

		if (d == null) {
			AlertUtil.setWarningAlert(redirectAttributes, "Station not found.");
			return "redirect:/";
		}
		request.setAttribute("dashboard",d);
		return "UpdateDashboard";
	}

	@PostMapping("AddDashboard")
	protected String addDashboard(
			HttpServletRequest request,
			RedirectAttributes redirectAttributes,
			@RequestParam("location") Long location,
			@RequestParam(value = "water", required = false) float water,
			@RequestParam(value = "rainfall", required = false) int rainfall,
			@RequestParam(value = "date", required = false) String date,
			@RequestParam(value = "status", required = false) StationStatusType status
	)  {

		Dashboard d = new Dashboard();
		d.setLocation(GeoDA.getLocationById(location));
		d.setWater(water);
		d.setRainfall(rainfall);
		d.setDate(date);
		d.setStatus(status);
		DashboardDA.addDashboard(d);

		AlertUtil.setSuccessAlert(redirectAttributes, "You have successfully added a station at " + d.getLocation().getName() + ".");
		return "redirect:/Dashboard/AddDashboard";
	}

	@PostMapping("Update")
	protected String updateDashboard(
			HttpServletRequest request,
			RedirectAttributes redirectAttributes,
			@RequestParam("id") Long  id,
			@RequestParam("water") float water,
			@RequestParam("rainfall") int rainfall,
			@RequestParam("status") StationStatusType status,
			@RequestParam("date") String date
	)  {

		Dashboard d = DashboardDA.getById(id);
		d.setWater(water);
		d.setRainfall(rainfall);
		d.setStatus(status);
		d.setDate(date);
		DashboardDA.update(d);

		AlertUtil.setSuccessAlert(redirectAttributes, "You have successfully updated a station at " + d.getLocation().getName() + ".");
		return "redirect:/Dashboard";
	}

	@GetMapping("DeleteDashboard")
	protected String deleteDashboard(
			HttpServletRequest request,
			RedirectAttributes redirectAttributes,
			@RequestParam("id") Long id
	)  {
		if (AuthUtil.getCurrentUser(request) == null) {
			AlertUtil.setWarningAlert(redirectAttributes, "You must be logged in to subscribe to a location.");
			return "redirect:/Login";
		}

		if (AuthUtil.getCurrentUser(request).getUserType() != ADMIN) {
			AlertUtil.setDangerAlert(redirectAttributes, "You are not authorized to use this function.");
			return "redirect:/";
		}

		Dashboard d = DashboardDA.getById(id);

		if (d == null) {
			AlertUtil.setWarningAlert(redirectAttributes, "Station not found.");
			return "redirect:/";
		}

		DashboardDA.delete(d);
		AlertUtil.setSuccessAlert(redirectAttributes, "You have successfully deleted the station " + d.getLocation().getName() + ".");
		return "redirect:/";
	}
}