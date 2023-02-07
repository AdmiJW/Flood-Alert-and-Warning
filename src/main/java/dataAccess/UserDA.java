package dataAccess;


import entity.User;
import org.hibernate.Session;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;


public class UserDA {

    // C - Create
    public static void add(User user) {
        FAWHibernate.add(user);
    }

    // R - Read
    public static List<User> getAll(Long id) {
        return FAWHibernate.getAll(User.class);
    }

    public static User getById(Long id) {
        return FAWHibernate.getById(User.class, id);
    }

    public static User getByUsername(String username) {
        Session session = FAWHibernate.getSessionWithTransaction();

        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<User> criteria = builder.createQuery(User.class);
        Root<User> root = criteria.from(User.class);

        criteria.select(root).where(builder.equal(root.get("username"), username));
        User user = session.createQuery(criteria).getResultList().stream().findFirst().orElse(null);

        FAWHibernate.commitAndCloseSession(session);
        return user;
    }


    // U - Update
    public static void update(User user) {
        FAWHibernate.update(user);
    }

    // D - Delete
    public static void delete(User user) {
        FAWHibernate.delete(user);
    }

}
