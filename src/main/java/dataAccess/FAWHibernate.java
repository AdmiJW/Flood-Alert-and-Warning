package dataAccess;


import entity.*;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import java.util.List;


public class FAWHibernate {

    // Please add the entity/model classes here
    private static final Class[] ENTITY_CLASSES = {
        User.class,
        State.class,
        District.class,
        Location.class,
        Subscription.class,
        Report.class,
    };

    // Singleton SessionFactory
    private static SessionFactory sessionFactory;

    // Private constructor
    private FAWHibernate() {}


    // Gets the Singleton SessionFactory
    public static SessionFactory getSessionFactory() {
        if (sessionFactory == null) initializeSessionFactory();
        return sessionFactory;
    }

    // Gets a new Session, with beginTransaction() called
    public static Session getSessionWithTransaction() {
        Session session = getSessionFactory().openSession();
        session.beginTransaction();
        return session;
    }

    // Commits the transaction and closes the Session
    public static void commitAndCloseSession(Session session) {
        session.getTransaction().commit();
        session.close();
    }




    // C - Create
    public static <T> void add(T object) {
        Session session = getSessionWithTransaction();
        session.save(object);
        commitAndCloseSession(session);
    }

    public static <T> void addMany(List<T> objects) {
        Session session = getSessionWithTransaction();
        for (Object object : objects) session.save(object);
        commitAndCloseSession(session);
    }

    // R - Read
    public static <T> List<T> getAll(Class<T> type) {
        Session session = getSessionWithTransaction();
        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<T> criteria = builder.createQuery(type);
        criteria.from(type);
        List<T> data = session.createQuery(criteria).getResultList();
        commitAndCloseSession(session);
        return data;
    }

    public static <T> T getById(Class<T> entityClass, Long id) {
        Session session = getSessionWithTransaction();
        T object = session.get(entityClass, id);
        commitAndCloseSession(session);
        return object;
    }

    // U - Update
    public static <T> void update(T object) {
        Session session = getSessionWithTransaction();
        session.update(object);
        commitAndCloseSession(session);
    }

    // D - Delete
    public static <T> void delete(T object) {
        Session session = getSessionWithTransaction();
        session.delete(object);
        commitAndCloseSession(session);
    }




    // Called once, when the class static is first accessed. Obey the singleton pattern.
    private static void initializeSessionFactory() {
        Configuration configuration = new Configuration();
        configuration.configure("hibernate.cfg.xml");

        for (Class entityClass : ENTITY_CLASSES)
            configuration.addAnnotatedClass(entityClass);

        sessionFactory = configuration.buildSessionFactory();
    }
}
