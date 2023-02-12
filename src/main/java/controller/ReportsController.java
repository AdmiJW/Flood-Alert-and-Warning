package controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import dataAccess.GeoDA;
import dataAccess.ReportsDA;
import entity.Report;
import entity.State;
import enums.ReviewType;
import utils.AlertUtil;
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

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class ReportsController {

	@GetMapping("/Reports")
	protected String getReports(HttpServletRequest request) {
		return "Reports";
	}

	@GetMapping("/Reports/Add")
	protected String getAddReports(HttpServletRequest request) throws JsonProcessingException {
		// Pass in the states, districts and locations
		// Pass states as List<State>
		// Pass districts and locations as JSON, as they will be used in the frontend
		ObjectMapper mapper = new ObjectMapper();
		request.setAttribute("states", GeoDA.getAllStates());
		request.setAttribu	te("districts", mapper.writeValueAsString(GeoDA.getAllDistricts()));
		request.setAttribute("locations", mapper.writeValueAsString(GeoDA.getAllLocations()));

		return "ReportsAdd";
	}

	@PostMapping("/Add")
	protected String postAddReports(
			HttpServletRequest request,
			RedirectAttributes redirectAttributes,
			@RequestParam("reporter_name") String reporter_name,
			@RequestParam("phone_number") String phone_number,
			@RequestParam("state") Long state,
			@RequestParam("district") Long district,
			@RequestParam("location") Long location,
			@RequestParam("report_media") MultipartFile report_media,
			@RequestParam("report_detail") String report_detail,
			@RequestParam("submission_date") String submission_date) throws JsonProcessingException {

		Report rep = new Report();
		rep.setReporter_name(reporter_name);
		rep.setDetail(report_detail);
		rep.setDistrict(GeoDA.getDistrictById(district));
		rep.setLocation(GeoDA.getLocationById(location));
		rep.setState(GeoDA.getStateById(state));
		rep.setSubmission_date(submission_date);
		rep.setPhone_no(phone_number);
		rep.setReview_status(ReviewType.Pending);
		try {
			FileUtil.store(report_media,reporter_name+"/"+rep.getId()+"_"+rep.getSubmission_date()); 
		} catch (IOException e) {
			System.out.println("Error occur when reading image files!\n" + e.getStackTrace());
		}
		// rep.setMedia_path(FileUtil.loadFilePath(new
		// String(rep.getId()+"_"+reporter_name+"_"+submission_date));
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

	@GetMapping("Admin")
	protected ModelAndView getEditDashboard() {
		return new ModelAndView("ReportsEdit");
	}
}