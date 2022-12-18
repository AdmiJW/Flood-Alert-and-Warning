package model;

import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletContext;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.exc.StreamReadException;
import com.fasterxml.jackson.databind.DatabindException;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;



// Singleton model, since it should be readonly data
public class Locations extends HashMap<String, HashMap<String, HashMap<String, MapCoordinate>>> {
	private static final long serialVersionUID = 1L;
	private static Locations instance = null;
	
	private Locations() {}
	
	
	// Singleton pattern
	// If there is an instance already, return it as it is
	// Else read the json file and parse into one instance. This requires the ServletContext object.
	public static Locations getInstance(ServletContext ctx) throws StreamReadException, DatabindException, IOException {
		if (instance == null) {
			String locationsPath = ctx.getRealPath("data/locations.json");
			File json = new File(locationsPath);
			instance = new ObjectMapper().readValue(json, Locations.class);			
		}
		
		return instance;
	}
	
	
	
	public List<String> getStates() {
		return new ArrayList<>(this.keySet() );
	}
	
	public List<String> getDistricts(String state) {
		return new ArrayList<>( this.get(state).keySet() );
	}
	
	public List<String> getLocations(String state, String district) {
		return new ArrayList<>( this.get(state).get(district).keySet() );
	}
	
	public MapCoordinate getCoordinate(String state, String district, String location) {
		return this.get(state).get(district).get(location);
	}
	
	
	public String asJSON() throws JsonProcessingException {
		return new ObjectMapper().writeValueAsString(this);
	}
}