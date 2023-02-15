package controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import dataAccess.GeoDA;
import dataAccess.ReportsDA;
import dataAccess.SubscriptionDA;
import entity.Report;
import entity.State;
import entity.Subscription;
import enums.ReviewType;
import enums.UserType;
import org.springframework.web.bind.annotation.*;
import utils.AlertUtil;
import utils.AuthUtil;
import utils.FileUtil;

import org.hibernate.Session;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Controller
public class ReportsController {

	@GetMapping("/Reports")
	protected String getReports(HttpServletRequest request) {
		List<Report> reports = ReportsDA.getAll();
		if (AuthUtil.getCurrentUser(request) == null) {
			reports.removeIf(
					r -> (r.getReview_status() == ReviewType.Denied.getName()
							|| r.getReview_status() == ReviewType.Expired.getName()));
			request.setAttribute("reports", reports);
			return "Reports";
		} else {
			if (AuthUtil.getCurrentUser(request).getUserType().name == "ADMIN") {
				request.setAttribute("reports", reports);
				return "ReportsAdminEdit";
			} else {
				reports.removeIf(
						r -> (r.getReview_status() == ReviewType.Denied.getName()
								|| r.getReview_status() == ReviewType.Expired.getName()));
				request.setAttribute("reports", reports);
				return "Reports";
			}
		}
	}

	@GetMapping("/Reports/Add")
	protected String getAddReports(HttpServletRequest request, RedirectAttributes redirectAttributes)
			throws JsonProcessingException {
		if (AuthUtil.getCurrentUser(request) != null) {
			// Pass in the states, districts and locations
			// Pass states as List<State>
			// Pass districts and locations as JSON, as they will be used in the frontend
			ObjectMapper mapper = new ObjectMapper();
			request.setAttribute("states", GeoDA.getAllStates());
			request.setAttribute("districts", mapper.writeValueAsString(GeoDA.getAllDistricts()));
			request.setAttribute("locations", mapper.writeValueAsString(GeoDA.getAllLocations()));

			return "ReportsAdd";
		} else {
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
		rep.setReview_status(ReviewType.Pending.getName());
		try {
			rep.setMedia_path(FileUtil
					.store(report_media,
							rep.getUser().getUsername() + "/" + rep.getId() + "_" + rep.getSubmission_date())
					.toString());
		} catch (IOException e) {
			System.out.println("Error occur when reading image files!\n" + e.getStackTrace());
		}

		ReportsDA.add(rep);

		AlertUtil.setSuccessAlert(redirectAttributes,
				"Your report is submitted successfully and would be reviewed afterwards");
		return "redirect:/Reports";
	}

	@GetMapping("/Reports/Search")
	protected ModelAndView searchReport(
			@RequestParam(value = "search_key", required = false) String search_key,
			@RequestParam(value = "start_date", required = false) String start_date,
			@RequestParam(value = "end_date", required = false) String end_date,
			@RequestParam(value = "from_profile", required = false) String from_profile,
			HttpServletRequest request) {
		List<Report> reports = (from_profile == "true") ? ReportsDA.getReportsByUser(AuthUtil.getCurrentUser(request))
				: new ArrayList<Report>();
		// "" is used due to empty parameter sent by html page
		if (search_key != "") {
			reports = ReportsDA.getReportsBySubString(search_key);
		}
		if (start_date != "" || end_date != "") {
			List<Report> reports2 = ReportsDA.getReportsByDate(start_date, end_date);
			reports2.removeAll(reports);
			reports.addAll(reports2);
		}
		if (search_key == "" && start_date == "" && end_date == "") {
			reports = ReportsDA.getAll();
		}
		// request.setAttribute("reports", reports);
		// return "/Reports";
		ModelAndView model = new ModelAndView((from_profile == "true") ? "ReportsHistory" : "ReportsItems");
		model.addObject("reports", reports);
		return model;

	}

	@GetMapping("/Reports/Delete/{reportId}")
	protected String deleteReport(
			HttpServletRequest request,
			RedirectAttributes redirectAttributes,
			@PathVariable("reportId") Long reportId) {
		if (AuthUtil.getCurrentUser(request) == null) {
			AlertUtil.setDangerAlert(redirectAttributes, "You are not authorized to perform this action.");
			return "redirect:/Login";
		}

		Report report = ReportsDA.getReportById(reportId);

		if (report == null) {
			AlertUtil.setWarningAlert(redirectAttributes, "Report not found.");
			return "redirect:/Reports";
		}

		if (!report.getUser().getId().equals(AuthUtil.getCurrentUser(request).getId())
				&& AuthUtil.getCurrentUser(request).getUserType() != UserType.ADMIN) {
			AlertUtil.setWarningAlert(redirectAttributes, "You do not have permission to delete this report.");
			return "redirect:/Reports";
		}

		ReportsDA.delete(report);
		AlertUtil.setSuccessAlert(redirectAttributes, "You have successfully deleted the report.");
		return "redirect:/Reports";
	}

	@GetMapping("/Reports/{reportId}")
	protected String getSingleReport(
			HttpServletRequest request,
			RedirectAttributes redirectAttributes,
			@PathVariable("reportId") Long reportId) throws JsonProcessingException {
		if (AuthUtil.getCurrentUser(request) == null) {
			AlertUtil.setDangerAlert(redirectAttributes, "You are not authorized to perform this action.");
			return "redirect:/Login";
		}
		Report report = ReportsDA.getReportById(reportId);
		request.setAttribute("report", report);

		ObjectMapper mapper = new ObjectMapper();
		request.setAttribute("states", GeoDA.getAllStates());
		request.setAttribute("districts", mapper.writeValueAsString(GeoDA.getAllDistricts()));
		request.setAttribute("locations", mapper.writeValueAsString(GeoDA.getAllLocations()));

		return "ReportsUserEdit";
	}

	@PostMapping("/Reports/{reportId}")
	protected String postSingleReport(
			HttpServletRequest request,
			RedirectAttributes redirectAttributes,
			@RequestParam(value = "state") Long state,
			@RequestParam(value = "district") Long district,
			@RequestParam(value = "location") Long location,
			@RequestParam(value = "report_media", required = false) MultipartFile report_media,
			@RequestParam(value = "report_detail") String report_detail,
			@PathVariable(value="reportId")Long reportId)
			throws JsonProcessingException {
		System.out.println(request.getParameter("phone_number"));
		Report rep = ReportsDA.getReportById(reportId);
		if(report_detail!=""){
			rep.setDetail(report_detail);
		}
		rep.setDistrict(GeoDA.getDistrictById(district));
		rep.setLocation(GeoDA.getLocationById(location));
		rep.setState(GeoDA.getStateById(state));
		rep.setSubmission_date(LocalDate.now().toString());
		rep.setReview_status(ReviewType.Pending.getName());
		if (report_media.getSize() != 0) {
			try {
				rep.setMedia_path(FileUtil
						.store(report_media,
								rep.getUser().getUsername() + "/" + rep.getId() + "_" + rep.getSubmission_date())
						.toString());
			} catch (IOException e) {
				System.out.println("Error occur when reading image files!\n" + e.getStackTrace());
			}
		}

		ReportsDA.update(rep);

		AlertUtil.setSuccessAlert(redirectAttributes,
				"Your report is submitted successfully and would be reviewed afterwards");
		return "redirect:/Reports/History";
	}

	@GetMapping("/Reports/UpdatedPlaces")
	protected ModelAndView getUpdatedPlaces(@RequestParam(value = "selected_state") String selected_state,
			HttpServletRequest request,
			RedirectAttributes redirectAttributes) throws JsonProcessingException {
		if (AuthUtil.getCurrentUser(request) == null) {
			AlertUtil.setDangerAlert(redirectAttributes, "You are not authorized to perform this action.");
			return new ModelAndView("redirect:/Login");
		}
		ObjectMapper mapper = new ObjectMapper();
		request.setAttribute("states", GeoDA.getAllStates());
		request.setAttribute("districts", mapper.writeValueAsString(GeoDA.getAllDistricts()));
		request.setAttribute("locations", mapper.writeValueAsString(GeoDA.getAllLocations()));

		ModelAndView model = new ModelAndView("ReportEditPlace", "selected_state", selected_state);
		return model;
	}

	@GetMapping("/Reports/History")
	protected ModelAndView getReportHistory(HttpServletRequest request,
	RedirectAttributes redirectAttributes) {
		if (AuthUtil.getCurrentUser(request) == null) {
			AlertUtil.setWarningAlert(redirectAttributes, "You must be logged in first.");
			return new ModelAndView("redirect:/Login");
		}
		List<Report> reports = ReportsDA.getReportsByUser(AuthUtil.getCurrentUser(request));
		ModelAndView model = new ModelAndView("Reports", "reports", reports);
		model.addObject("from_profile", "true");
		return model;
	}

	@GetMapping("/Reports/Review")
	protected String updateReviewStatus(@RequestParam(value = "reportID") Long reportID,
			@RequestParam(value = "review_type") String review_type,
			HttpServletRequest request,
			RedirectAttributes redirectAttributes) {
		if (AuthUtil.getCurrentUser(request) == null) {
			AlertUtil.setWarningAlert(redirectAttributes, "You must be logged in first.");
			return "redirect:/Login";
		}

		if (AuthUtil.getCurrentUser(request).getUserType() != UserType.ADMIN) {
			AlertUtil.setDangerAlert(redirectAttributes, "You are not authorized to use this function.");
			return "redirect:/";
		}
		Report report = ReportsDA.getReportById(reportID);
		report.setReview_status(review_type);
		ReportsDA.update(report);
		return "redirect:/ReportsAdminEdit";
	}

	@GetMapping("/Reports/ReviewType/{review_type}")
	protected String getReportsBasedReview(HttpServletRequest request,
			@PathVariable("review_type") String review_type,
			RedirectAttributes redirectAttributes) {
		if (AuthUtil.getCurrentUser(request) == null) {
			AlertUtil.setWarningAlert(redirectAttributes, "You must be logged in first.");
			return "redirect:/Login";
		}

		if (AuthUtil.getCurrentUser(request).getUserType() != UserType.ADMIN) {
			AlertUtil.setDangerAlert(redirectAttributes, "You are not authorized to use this function.");
			return "redirect:/";
		}
		List<Report> reports = ReportsDA.getReportsByReviewStatus(review_type);
		request.setAttribute("reports", reports);
		return "ReportsAdminEdit";
	}
}