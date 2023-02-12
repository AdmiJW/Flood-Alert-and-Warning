package controller;

import dataAccess.GeoDA;
import entity.Location;
import enums.UserType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import utils.AlertUtil;
import utils.AuthUtil;
import utils.pagination.Paginator;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import dataAccess.EvacPointDA;
import entity.EvacPoint;


@Controller
@RequestMapping("/Evacuation")
public class EvacuationController {

	@GetMapping("")
	protected String getEvacuation(
			HttpServletRequest request,
			@RequestParam(value = "page", required = false, defaultValue = "1") Integer page
	) {
		if(AuthUtil.getCurrentUser(request) == null){
			AlertUtil.setPrimaryAlert(request, "You are Anonymous.");
		} else if (AuthUtil.getCurrentUser(request).getUserType().equals(UserType.ADMIN)){
			request.setAttribute("isAdmin", true);
		} else {
			AlertUtil.setPrimaryAlert(request, "Hi, " + AuthUtil.getCurrentUser(request).getUsername() + ". Subscribe us to get latest updates.");
		}

		List<EvacPoint> evacPoints = EvacPointDA.getAll();
		Paginator<EvacPoint> paginator = new Paginator<>(evacPoints, 10);;
		request.setAttribute("paginator", paginator);
		request.setAttribute("currentPage", page);

		if(evacPoints.size() == 0 || evacPoints == null)
			AlertUtil.setWarningAlert(request, "No evacuation points found.");

		return "Evacuation";
	}

	@GetMapping("/AddEvacPoint")
	protected String getAddEvacPoint(
			HttpServletRequest request
	) {
		return "EvacuationForm";
	}

	@PostMapping("/AddEvacPoint")
	protected String postAddEvacPoint(
		HttpServletRequest request,
		RedirectAttributes redirectAttributes
	){
		String name = request.getParameter("pointName");
		Long locationId = Long.valueOf(request.getParameter("location"));
		int currentOccupancy = Integer.parseInt(request.getParameter("currentOccupancy"));
		int capacity = Integer.parseInt(request.getParameter("capacity"));
		String remarks = request.getParameter("remarks");
		if (currentOccupancy > capacity){
			AlertUtil.setDangerAlert(request, "Current occupancy cannot be greater than capacity. Please try again.");
			return "redirect:/Evacuation";
		}
		EvacPoint evacPoint = new EvacPoint();
		evacPoint.setPointName(name);
		evacPoint.setLocation(GeoDA.getLocationById(locationId));
		evacPoint.setCurrentOccupancy(currentOccupancy);
		evacPoint.setCapacity(capacity);
		evacPoint.setRemarks(remarks);
		EvacPointDA.add(evacPoint);
		AlertUtil.setSuccessAlert(request, "Evacuation point added successfully.");

		return "redirect:/Evacuation";
	}

	
	@GetMapping("View")
	protected String getViewEvacuationPoint(
			HttpServletRequest request,
			@RequestParam("id") int id
	) {
		if(AuthUtil.getCurrentUser(request) == null){
			AlertUtil.setPrimaryAlert(request, "You are Anonymous.");
		} else if (AuthUtil.getCurrentUser(request).getUserType().equals(UserType.ADMIN)){
			AlertUtil.setPrimaryAlert(request, "You can only update OCCUPANCY, CAPACITY and REMARKS of evacuation points.");
			request.setAttribute("isAdmin", true);
		} else {
			AlertUtil.setPrimaryAlert(request, "Hi, " + AuthUtil.getCurrentUser(request).getUsername() + ". Subscribe us to get latest updates.");
		}
		Long idLong = Long.valueOf(id);
		EvacPoint evacPoint = EvacPointDA.getById(idLong);
		request.setAttribute("evacPoint", evacPoint);


		return "UpdateEvacuationPoint";
	}

	@PostMapping("")
	protected String postUpdateForm(
		HttpServletRequest request,
		RedirectAttributes redirectAttributes
	){
		int id = Integer.parseInt(request.getParameter("pointId"));
		Long idLong = Long.valueOf(id);
		EvacPoint evacPoint = EvacPointDA.getById(idLong);
		if (evacPoint == null){
			AlertUtil.setDangerAlert(redirectAttributes, "Evacuation point not found.");
			return "redirect:/Evacuation";
		}

		int currentOccupancy = Integer.parseInt(request.getParameter("currentOccupancy"));
		int capacity = Integer.parseInt(request.getParameter("capacity"));
		String remarks = request.getParameter("remarks");
		if (currentOccupancy > capacity){
			AlertUtil.setDangerAlert(request, "Current occupancy cannot be greater than capacity. Please try again.");
			return "redirect:/Evacuation";
		}
		evacPoint.setCurrentOccupancy(currentOccupancy);
		evacPoint.setCapacity(capacity);
		evacPoint.setRemarks(remarks);
		EvacPointDA.update(evacPoint);
		AlertUtil.setSuccessAlert(redirectAttributes, "Evacuation point updated successfully.");
		return "redirect:/Evacuation";
	}

	@GetMapping("Delete")
		protected String getDeleteEvacuationPoint(
				HttpServletRequest request,
				RedirectAttributes redirectAttributes,
				@RequestParam("id") Long id
	){
		if (!AuthUtil.getCurrentUser(request).getUserType().equals(UserType.ADMIN)){
			AlertUtil.setDangerAlert(redirectAttributes, "You are not authorized to delete evacuation points.");
			return "redirect:/Evacuation";
		}
		EvacPoint evacPoint = EvacPointDA.getById(id);

		if (evacPoint == null){
			AlertUtil.setDangerAlert(redirectAttributes, "Evacuation point not found.");
			return "redirect:/Evacuation";
		}

		EvacPointDA.delete(evacPoint);
		AlertUtil.setSuccessAlert(redirectAttributes, "Evacuation point deleted successfully.");
		return "redirect:/Evacuation";

	}
}