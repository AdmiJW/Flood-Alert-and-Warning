package dataAccess;

import entity.Report;
import entity.State;
import entity.User;
import enums.ReviewType;
import entity.District;
import entity.Location;
import org.hibernate.Session;

import controller.ReportsController;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.List;

public class ReportsDA {
	// C - Create
	public static void add(Report report) {
		FAWHibernate.add(report);
	}

	public static void addAll(List<Report> reportList) {
		FAWHibernate.addMany(reportList);
	}

	// R - Read
	public static List<Report> getAll() {
		return FAWHibernate.getAll(Report.class);
	}

	public static Report getReportById(Long id) {
		return FAWHibernate.getById(Report.class, id);
	}

	public static List<Report> getReportsByUser(User user) {
		Session session = FAWHibernate.getSessionWithTransaction();

		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<Report> criteria = builder.createQuery(Report.class);
		Root<Report> root = criteria.from(Report.class);

		criteria.select(root).where(builder.equal(root.get("user"), user));
		List<Report> reports = session.createQuery(criteria).getResultList();

		FAWHibernate.commitAndCloseSession(session);
		return reports;
	}

	public static List<Report> getReportsByDate(String start_date, String end_date) {
		Session session = FAWHibernate.getSessionWithTransaction();

		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<Report> criteria = builder.createQuery(Report.class);
		Root<Report> root = criteria.from(Report.class);
		
		if (start_date != "" && end_date != "") {
			criteria.select(root).where(builder.between(root.get("submission_date"), start_date,end_date));
		} else if (start_date != "") {
			criteria.select(root).where(builder.greaterThanOrEqualTo(root.get("submission_date"), start_date));
		} else if (end_date != "") {
			criteria.select(root).where(builder.lessThanOrEqualTo(root.get("submission_date"), end_date));
		}

		List<Report> reports = session.createQuery(criteria).getResultList();

		FAWHibernate.commitAndCloseSession(session);
		return reports;
	}

	public static List<Report> getReportsBySubString(String substr) {

		Session session = FAWHibernate.getSessionWithTransaction();

		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<Report> criteria = builder.createQuery(Report.class);
		Root<Report> root = criteria.from(Report.class);
		if (!substr.equals("-")) {
			criteria.select(root)
					.where(
							builder.or(
									builder.like(root.get("user").get("username"), "%" + substr + "%"),
									builder.like(root.get("detail"), "%" + substr + "%"),
									builder.like(root.get("user").get("phone"), "%" + substr + "%"),
									builder.like(root.get("district").get("name"), "%" + substr + "%"),
									builder.like(root.get("location").get("name"), "%" + substr + "%")));
		}
		List<Report> reports = session.createQuery(criteria).getResultList();
		FAWHibernate.commitAndCloseSession(session);
		return reports;
	}

	public static List<Report> getReportsByReviewStatus(String review_status) {
		Session session = FAWHibernate.getSessionWithTransaction();

		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<Report> criteria = builder.createQuery(Report.class);
		Root<Report> root = criteria.from(Report.class);

		criteria.select(root).where(builder.equal(root.get("review_status"), review_status));
		List<Report> reports = session.createQuery(criteria).getResultList();

		FAWHibernate.commitAndCloseSession(session);
		return reports;
	}

	public static List<Report> getReportsByState(State state) {
		Session session = FAWHibernate.getSessionWithTransaction();

		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<Report> criteria = builder.createQuery(Report.class);
		Root<Report> root = criteria.from(Report.class);

		criteria.select(root).where(builder.equal(root.get("state"), state));
		List<Report> reports = session.createQuery(criteria).getResultList();

		FAWHibernate.commitAndCloseSession(session);
		return reports;
	}

	public static List<Report> getReportsByDistrict(District district) {
		Session session = FAWHibernate.getSessionWithTransaction();

		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<Report> criteria = builder.createQuery(Report.class);
		Root<Report> root = criteria.from(Report.class);

		criteria.select(root).where(builder.equal(root.get("district"), district));
		List<Report> reports = session.createQuery(criteria).getResultList();

		FAWHibernate.commitAndCloseSession(session);
		return reports;
	}

	public static List<Report> getReportsByLocation(Location location) {
		Session session = FAWHibernate.getSessionWithTransaction();

		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<Report> criteria = builder.createQuery(Report.class);
		Root<Report> root = criteria.from(Report.class);

		criteria.select(root).where(builder.equal(root.get("location"), location));
		List<Report> reports = session.createQuery(criteria).getResultList();

		FAWHibernate.commitAndCloseSession(session);
		return reports;
	}

	// U - Update
	public static void update(Report report) {
		FAWHibernate.update(report);
	}

	// D - Delete
	public static void delete(Report report) {
		FAWHibernate.delete(report);
	}
}
