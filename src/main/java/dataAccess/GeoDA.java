package dataAccess;


import entity.District;
import entity.Location;
import entity.State;
import org.hibernate.Session;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;


public class GeoDA {

    // C - Create
    public static void addState(State state) {
        FAWHibernate.add(state);
    }

    public static void addStates(List<State> states) {
        FAWHibernate.addMany(states);
    }

    public static void addDistrict(District district) {
        FAWHibernate.add(district);
    }

    public static void addDistricts(List<District> districts) {
        FAWHibernate.addMany(districts);
    }

    public static void addLocation(Location location) {
        FAWHibernate.add(location);
    }

    public static void addLocations(List<Location> locations) {
        FAWHibernate.addMany(locations);
    }


    // R - Read
    public static List<State> getAllStates() {
        return FAWHibernate.getAll(State.class);
    }

    public static List<District> getAllDistricts() {
        return FAWHibernate.getAll(District.class);
    }

    public static List<Location> getAllLocations() {
        return FAWHibernate.getAll(Location.class);
    }


    public static State getStateById(Long id) {
        return FAWHibernate.getById(State.class, id);
    }

    public static District getDistrictById(Long id) {
        return FAWHibernate.getById(District.class, id);
    }

    public static Location getLocationById(Long id) {
        return FAWHibernate.getById(Location.class, id);
    }


    public static State getStateByName(String name) {
        Session session = FAWHibernate.getSessionWithTransaction();

        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<State> criteria = builder.createQuery(State.class);
        Root<State> root = criteria.from(State.class);

        criteria.select(root).where(builder.equal(root.get("name"), name));
        State state = session.createQuery(criteria).getResultList().stream().findFirst().orElse(null);

        FAWHibernate.commitAndCloseSession(session);
        return state;
    }


    public static District getDistrictByName(String name) {
        Session session = FAWHibernate.getSessionWithTransaction();

        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<District> criteria = builder.createQuery(District.class);
        Root<District> root = criteria.from(District.class);

        criteria.select(root).where(builder.equal(root.get("name"), name));
        District district = session.createQuery(criteria).getResultList().stream().findFirst().orElse(null);

        FAWHibernate.commitAndCloseSession(session);
        return district;
    }


    public static Location getLocationByName(String name) {
        Session session = FAWHibernate.getSessionWithTransaction();

        CriteriaBuilder builder = session.getCriteriaBuilder();
        CriteriaQuery<Location> criteria = builder.createQuery(Location.class);
        Root<Location> root = criteria.from(Location.class);

        criteria.select(root).where(builder.equal(root.get("name"), name));
        Location location = session.createQuery(criteria).getResultList().stream().findFirst().orElse(null);

        FAWHibernate.commitAndCloseSession(session);
        return location;
    }




    // U - Update
    public static void updateState(State state) {
        FAWHibernate.update(state);
    }

    public static void updateDistrict(District district) {
        FAWHibernate.update(district);
    }

    public static void updateLocation(Location location) {
        FAWHibernate.update(location);
    }


    // D - Delete
    public static void deleteState(State state) {
        FAWHibernate.delete(state);
    }

    public static void deleteDistrict(District district) {
        FAWHibernate.delete(district);
    }

    public static void deleteLocation(Location location) {
        FAWHibernate.delete(location);
    }
}
