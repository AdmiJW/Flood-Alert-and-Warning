package dataAccess;

import entity.Dashboard;
import entity.State;
import entity.Subscription;
import org.hibernate.Session;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

public class DashboardDA {

    // C - Create
    public static void addDashboard(Dashboard dashboard){ FAWHibernate.add(dashboard);}

    public static void addDashboard(List<Dashboard> dashboard) {
        FAWHibernate.addMany(dashboard);
    }

    // R - Read
    public static List<Dashboard> getAll() {return FAWHibernate.getAll(Dashboard.class);}

    public static List<Dashboard> getByName(String search)
    {
        Session session = FAWHibernate.getSessionWithTransaction();

        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Dashboard> criteria = builder.createQuery(Dashboard.class);
        Root<Dashboard> root = criteria.from(Dashboard.class);

        Predicate pred1 = builder.like(root.get("location").get("name"), "%"+ search + "%");
        Predicate pred2 = builder.like(root.get("location").get("district").get("name"), "%"+ search + "%");
        Predicate pred3 = builder.like(root.get("location").get("state").get("name"), "%"+ search + "%");

        criteria.select(root).where(builder.or(pred1,pred2,pred3));
        List<Dashboard> subscriptions = session.createQuery(criteria).getResultList();

        FAWHibernate.commitAndCloseSession(session);
        return subscriptions;

    }

    public static Dashboard getById(Long id) {return FAWHibernate.getById(Dashboard.class, id);}

    // U - Update
    public static void update(Dashboard dashboard) {FAWHibernate.update(dashboard);}

    // D - Delete
    public static void delete(Dashboard dashboard) {FAWHibernate.delete(dashboard);}


}
