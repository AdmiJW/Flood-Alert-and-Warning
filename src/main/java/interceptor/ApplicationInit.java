package interceptor;


import com.fasterxml.jackson.databind.ObjectMapper;
import dataAccess.GeoDA;
import dataAccess.ReportsDA;
import dataAccess.UserDA;
import entity.District;
import entity.Location;
import entity.Report;
import entity.State;
import entity.User;
import enums.UserType;
import org.springframework.stereotype.Component;
import utils.FileUtil;

import javax.annotation.PostConstruct;
import javax.servlet.ServletContext;
import java.io.File;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


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
        initGeoDB();
        initReports();
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
    }

    private void initReports()throws IOException{
        File statesJSONFile = new File( ctx.getRealPath("public/data/reports.json") );
        ObjectMapper mapper = new ObjectMapper();
        List<Report> reportList = Arrays.asList( mapper.readValue(statesJSONFile, Report[].class ) );
        ReportsDA.add(reportList.get(0));
    };
}
