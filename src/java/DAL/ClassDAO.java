/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Classes;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.TreeSet;

/**
 *
 * @author bachl
 */
public class ClassDAO extends DAO {

    private HashMap<Integer, Classes> classes;
    
    private TreeSet<Integer> sessionSet; // session

    public HashMap<Integer, Classes> getClasses() {
        return classes;
    }

    public void setClasses(HashMap<Integer, Classes> classes) {
        this.classes = classes;
    }

    public TreeSet<Integer> getSessionSet() {
        return sessionSet;
    }

    public void setSessionSet(TreeSet<Integer> sessionSet) {
        this.sessionSet = sessionSet;
    }

    public void loadClasses() {
        String sql = "select * from Classes_HE163411 order by major";
        
        classes = new HashMap<>();
        sessionSet = new TreeSet<>();
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String name = rs.getString(2).trim();
                String major = rs.getString(3).trim();
                int session = rs.getInt(4);
                classes.put(id, new Classes(id, name, major, session));
                sessionSet.add(session);
            }
        } catch (SQLException e) {
            status = "Error at ead Student: " + e.getMessage();
        }
    }

    public void createClass(Classes newClass) {
        String sql = "insert into Classes_HE163411 values(?, ?, ?)";
        
        System.out.println(newClass);
        
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, newClass.getName().trim());
            ps.setString(2, newClass.getMajor().trim());
            ps.setString(3, newClass.getSession() + "");

            ps.execute();

        } catch (Exception e) {
            status = "Error insert Class: " + e.getMessage();
        }
    }

    public void updateClass(Classes modifiedClass) {
        String sql = "UPDATE Classes_HE163411 set name=?, major=?, session=? where id =?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, modifiedClass.getName().trim());
            ps.setString(2, modifiedClass.getMajor().trim());
            ps.setString(3, modifiedClass.getSession() + "");
            ps.setString(4, modifiedClass.getId() + "");

            ps.execute();

        } catch (Exception e) {
            status = "Error Update Class: " + e.getMessage();
        }
    }

    public void deleteClass(String id) {
        String sql = "delete from Student_HE163411 where classId=?"
                + " delete from Classes_HE163411 where id=?";
        
//        System.out.println(id);
//        System.out.println(name);
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id.trim());
            ps.setString(2, id.trim());
            ps.execute();
        } catch (Exception e) {
            status = "Error delete Class: " + e.getMessage();
        }
    }
}
