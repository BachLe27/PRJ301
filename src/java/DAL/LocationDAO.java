/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Location;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.HashMap;

/**
 *
 * @author bachl
 */
public class LocationDAO extends DAO {

//    private ArrayList<Location> locations;
    private HashMap<Integer, Location> locations;

    public LocationDAO() {
    }

    public LocationDAO(HashMap<Integer, Location> locations) {
        this.locations = locations;
    }
    
    public HashMap<Integer, Location> getLocations() {
        return locations;
    }

    public void setLocations(HashMap<Integer, Location> locations) {
        this.locations = locations;
    }

    public void loadLocation() {
        String sql = "Select * from Location_HE163411";

        locations = new HashMap<>();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2).trim();
                int numOfGuard = rs.getInt(3);
                locations.put(id, new Location(id, name, numOfGuard));
            }
        } catch (Exception e) {
            status = "Error Load Location: " + e.getMessage();
        }
    }

    public void createLocation(Location newLocation) {
        String sql = "insert into Location_HE163411 values(?, ?)";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, newLocation.getName().trim());
            ps.setString(2, newLocation.getNumOfGuard() + "");
            ps.execute();

        } catch (Exception e) {
            status = "Error insert Class: " + e.getMessage();
        }
    }

    public void deleteLocation(String id) {
        String sql = "delete from Location_HE163411 where id=?";
//        System.out.println(name);
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id.trim());
            ps.execute();
        } catch (Exception e) {
            status = "Error delete Class: " + e.getMessage();
        }
    }

    public void updateLocation(Location modifiedLocation) {
        String sql = "UPDATE Location_HE163411 set name=?, numOfGuard=? where id =?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, modifiedLocation.getName().trim());
            ps.setString(2, modifiedLocation.getNumOfGuard() + "");
            ps.setString(3, modifiedLocation.getId() + "");

            ps.execute();

        } catch (Exception e) {
            status = "Error Update Class: " + e.getMessage();
        }
    }
}
