package dataAccess;
import entity.EvacPoint;


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

    // U - Update
    public static void update(EvacPoint evacPoint) {
        FAWHibernate.update(evacPoint);
    }

    // D - Delete
    public static void delete(EvacPoint evacPoint) {
        FAWHibernate.delete(evacPoint);
    }
}
