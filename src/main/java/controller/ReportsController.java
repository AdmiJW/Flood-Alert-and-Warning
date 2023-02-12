package controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import dataAccess.GeoDA;
import dataAccess.ReportsDA;
import entity.Report;
import entity.State;
import enums.ReviewType;
import utils.AlertUtil;
import utils.AuthUtil;
import utils.FileUtil;

import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//TODO: Add user authentication for report page
//TODO: Add delete option
//TODO: Add date picker
//TODO: Complete Search Bar
//TODO: Update review status for admin
@Controller
public class ReportsController {

	@GetMapping("/Reports")
	protected String getReports(HttpServletRequest request) {
		HttpSession session=request.getSession(true);
		session.setMaxInactiveInterval(60*60*24);
		List<Report> reports=ReportsDA.getAll();
		request.setAttribute("reports", reports);
		return "Reports";
	}

	@GetMapping("/Reports/Add")
	protected String getAddReports(HttpServletRequest request, RedirectAttributes redirectAttributes ) throws JsonProcessingException {
		if(AuthUtil.getCurrentUser(request)!=null){
		// Pass in the states, districts and locations
		// Pass states as List<State>
		// Pass districts and locations as JSON, as they will be used in the frontend
		ObjectMapper mapper = new ObjectMapper();
		request.setAttribute("states", GeoDA.getAllStates());
		request.setAttribute("districts", mapper.writeValueAsString(GeoDA.getAllDistricts()));
		request.setAttribute("locations", mapper.writeValueAsString(GeoDA.getAllLocations()));

		return "ReportsAdd";
		}
		else{
			AlertUtil.setWarningAlert(redirectAttributes, "You must be logged in first.");
			return "redirect:/Login";
		}
	}

	@PostMapping("/Reports/Add")
	protected String postAddReports(
			HttpServletRequest request,
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "state") Long state,
			@RequestParam(value = "district") Long district,
			@RequestParam(value = "location") Long location,
			@RequestParam(value = "report_media") MultipartFile report_media,
			@RequestParam(value = "report_detail") String report_detail)
			throws JsonProcessingException {
		System.out.println(request.getParameter("phone_number"));
		Report rep = new Report();
		rep.setUser(AuthUtil.getCurrentUser(request));
		rep.setDetail(report_detail);
		rep.setDistrict(GeoDA.getDistrictById(district));
		rep.setLocation(GeoDA.getLocationById(location));
		rep.setState(GeoDA.getStateById(state));
		rep.setSubmission_date(LocalDate.now().toString());
		rep.setReview_status(ReviewType.Pending);
		try {
			rep.setMedia_path(FileUtil.store(report_media, rep.getUser().getUsername() + "/" +rep.getId()+"_" + rep.getSubmission_date()).toString());
		} catch (IOException e) {
			System.out.println("Error occur when reading image files!\n" + e.getStackTrace());
		}
		 
		ReportsDA.add(rep);

		AlertUtil.setSuccessAlert(redirectAttributes,
				"Your report is submitted successfully and would be reviewed afterwards");
		return "redirect:/Reports";
	}

	// @RequestMapping("/session")
	// public void trySession(HttpServletRequest request, HttpServletResponse
	// response){
	// HttpSession session=request.getSession(true);
	// session.setAttribute("noredirect","true");
	// response.setContentType("text/plain");
	// }

	@GetMapping("/Reports/Search")
	protected void searchReport(@RequestParam String search_key	, HttpServletRequest request,HttpServletResponse response){
		HttpSession session=request.getSession(true);
		session.setMaxInactiveInterval(60*60*24);
		List<Report> reports=ReportsDA.getReportsBySubString(search_key);
		session.setAttribute("reports",reports);
		response.setContentType("text/plain");
	}

	@GetMapping("Admin")
	protected ModelAndView getEditDashboard() {
		return new ModelAndView("ReportsEdit");
	}
}