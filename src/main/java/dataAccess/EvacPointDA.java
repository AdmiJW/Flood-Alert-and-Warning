package dataAccess;
import entity.EvacPoint;
import org.hibernate.Session;


import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.List;

public class EvacPointDA {
    // C - Create
    public static void add(EvacPoint evacPoint) {
        FAWHibernate.add(evacPoint);
    }
    // R - Read
    public static List<EvacPoint> getAll() {
        return FAWHibernate.getAll(EvacPoint.class);
    }
    public static EvacPoint getById(Long id) {
        return FAWHibernate.getById(EvacPoint.class, id);
    }

    public static List<EvacPoint> getByName(String search) {

        Session session = FAWHibernate.getSessionWithTransaction();

        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<EvacPoint> criteria = builder.createQuery(EvacPoint.class);
        Root<EvacPoint> root = criteria.from(EvacPoint.class);
        Predicate pred1 = builder.like(root.get("location").get("name"), "%"+ search + "%");
        Predicate pred2 = builder.like(root.get("location").get("district").get("name"), "%"+ search + "%");
        Predicate pred3 = builder.like(root.get("location").get("state").get("name"), "%"+ search + "%");

        criteria.select(root).where(builder.or(pred1,pred2,pred3));
        List<EvacPoint> evacPoints = session.createQuery(criteria).getResultList();
        FAWHibernate.commitAndCloseSession(session);

        return evacPoints;
    }
    // U - Update
    public static void update(EvacPoint evacPoint) {
        FAWHibernate.update(evacPoint);
    }

    // D - Delete
    public static void delete(EvacPoint evacPoint) {
        FAWHibernate.delete(evacPoint);
    }
}
