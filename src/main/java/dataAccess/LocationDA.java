package dataAccess;
import entity.Location;

public class LocationDA {

    public static Location getById(Long id) {
        return FAWHibernate.getById(Location.class, id);
    }
}
