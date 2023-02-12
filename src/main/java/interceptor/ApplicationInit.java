package interceptor;


import com.fasterxml.jackson.databind.ObjectMapper;
import dataAccess.*;
import entity.*;
import enums.StationStatusType;
import enums.UserType;
import org.springframework.stereotype.Component;
import utils.FileUtil;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.util.*;


// Not an interceptor, but rather a bean responsible for initializing the application
@Component
public class ApplicationInit {

    private ServletContext ctx;

    public ApplicationInit(ServletContext ctx) {
        this.ctx = ctx;
    }



    // Application initialization logic goes here
    @PostConstruct
    public void init() throws IOException {
        initAdmin();
        initUser();
        initGeoDB();
        initDashboards();
        initEvacPoint();
        initializeFileService();
    }


    private void initializeFileService() throws IOException {
        FileUtil.init();
    }


    private void initAdmin() {
        User u = UserDA.getByUsername("admin");
        if (u != null) return;

        u = new User();
        u.setUsername("admin");
        u.setPassword("admin");
        u.setUserType(UserType.ADMIN);
        u.setEmail("admin@email.com");
        u.setPhone("1234567890");

        UserDA.add(u);
    }
    private void initUser() {
        User u = UserDA.getByUsername("user");
        if (u != null) return;

        u = new User();
        u.setUsername("user");
        u.setPassword("user");
        u.setUserType(UserType.USER);
        u.setEmail("user@email.com");
        u.setPhone("1234567890");

        UserDA.add(u);
    }


    private void initGeoDB() throws IOException {
        Map<Long, State> statesMap = new HashMap<>();
        Map<Long, District> districtsMap = new HashMap<>();

        File statesJSONFile = new File( ctx.getRealPath("public/data/states.json") );
        File districtsJSONFile = new File( ctx.getRealPath("public/data/districts.json") );
        File locationsJSONFile = new File( ctx.getRealPath("public/data/locations.json") );
        ObjectMapper mapper = new ObjectMapper();
        List<State> statesList = Arrays.asList( mapper.readValue(statesJSONFile, State[].class ) );
        List<District> districtsList = Arrays.asList( mapper.readValue(districtsJSONFile, District[].class ) );
        List<Location> locationsList = Arrays.asList( mapper.readValue(locationsJSONFile, Location[].class ) );

        // Save the State[] to the database first
        GeoDA.addStates(statesList);
        // Map the saved states to a map
        statesList = GeoDA.getAllStates();
        for (State s : statesList) statesMap.put(s.getId(), s);

        // Map the State in the District object to the saved State object
        for (District d : districtsList)
            d.setState( statesMap.get(d.getState().getId()) );
        // Save the District[] to the database
        GeoDA.addDistricts(districtsList);
        // Map the saved districts to a map
        districtsList = GeoDA.getAllDistricts();
        for (District d : districtsList) districtsMap.put(d.getId(), d);

        // Map the District in the Location object to the saved District object
        for (Location l : locationsList) {
            District d = districtsMap.get(l.getDistrict().getId());
            l.setDistrict( d );
            l.setState( d.getState() );
        }
        // Save the Location[] to the database
        GeoDA.addLocations(locationsList);
        // Map the saved locations to a map

    }


    private void initDashboards() {
        Map<Long, Location> locationsMap = new HashMap<>();
        List<Location> locationsList = GeoDA.getAllLocations();
        List<Dashboard> dashboardList = new ArrayList<>();

        for (Location l : locationsList) locationsMap.put(l.getId(), l);

        // Create Dashboard Stations
        for (Location l: locationsList) {
            Dashboard dashboard = new Dashboard();
            dashboard.setLocation(l);
            dashboard.setDate( LocalDate.now().toString() );
            dashboard.setRainfall( (int) (Math.random() * 100) );
            dashboard.setWater( (float) (Math.random() * 21) );
            dashboard.setStatus( StationStatusType.values()[(int) (Math.random() * StationStatusType.values().length)] );
            dashboardList.add(dashboard);
        }

        DashboardDA.addDashboard(dashboardList);
    }

    private void initEvacPoint(){
        EvacPoint evacPoint = EvacPointDA.getById(1L);
        if (evacPoint != null) return;

        Location l = new Location();
        District d = GeoDA.getDistrictById(2L);
        l.setName("Universiti Teknologi Malaysia, Johore");
        l.setDistrict(d);
        l.setState(d.getState());
        l.setLat(1.55201);
        l.setLng(103.6328);
        GeoDA.addLocation(l);

        evacPoint = new EvacPoint();
        evacPoint.setPointName("Universiti Teknologi Malaysia");
        evacPoint.setLocation(l);
        evacPoint.setCurrentOccupancy(10);
        evacPoint.setCapacity(100);
        evacPoint.setRemarks("This is a test evac point");
        evacPoint.setLat(1.55201);
        evacPoint.setLng(103.6328);
        EvacPointDA.add(evacPoint);

    }
}
