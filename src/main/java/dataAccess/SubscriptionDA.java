package dataAccess;


import entity.Subscription;
import entity.User;
import org.hibernate.Session;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;


public class SubscriptionDA {

    // C - Create
    public static void add(Subscription subscription) {
        FAWHibernate.add(subscription);
    }

    // R - Read
    public static List<Subscription> getAll() {
        return FAWHibernate.getAll(Subscription.class);
    }

    public static Subscription getById(Long id) {
        return FAWHibernate.getById(Subscription.class, id);
    }

    public static List<Subscription> getByUser(User user) {
        Session session = FAWHibernate.getSessionWithTransaction();

        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Subscription> criteria = builder.createQuery(Subscription.class);
        Root<Subscription> root = criteria.from(Subscription.class);

        criteria.select(root).where(builder.equal(root.get("user"), user));
        List<Subscription> subscriptions = session.createQuery(criteria).getResultList();

        FAWHibernate.commitAndCloseSession(session);
        return subscriptions;
    }


    // U - Update
    public static void update(Subscription subscription) {
        FAWHibernate.update(subscription);
    }

    // D - Delete
    public static void delete(Subscription subscription) {
        FAWHibernate.delete(subscription);
    }

}
