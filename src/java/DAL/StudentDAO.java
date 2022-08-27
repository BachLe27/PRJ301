/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAL;

import Models.Student;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author bachl
 */
public class StudentDAO extends DAO {
    
    private ArrayList<Student> students;

    public StudentDAO() {
    }

    public StudentDAO(ArrayList<Student> students) {
        this.students = students;
    }
    
    public ArrayList<Student> getStudents() {
        return students;
    }

    public void loadStudent() {
        String sql = "Select * from Student_HE163411";

        students = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                
                String id = rs.getString(1).trim();
                String name = rs.getString(2).trim();
                String birthday = rs.getString(3).trim();
                boolean gender = rs.getBoolean(4);
                int classId = rs.getInt(5);
                String phone = rs.getString(6).trim();
                
                students.add(new Student(id, name, birthday, gender, classId, phone));
            }
        } catch (Exception e) {
            status = "Error Load Student: " + e.getMessage();
        }
    }

    public void createStudent(Student newStudent) {
        String sql = "insert into Student_HE163411 values(?, ?, ?, ?, ?, ?)";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, newStudent.getId().trim());
            ps.setString(2, newStudent.getName().trim());
            ps.setString(3, newStudent.getBirthday() + "");
            ps.setString(4, newStudent.isGender() + "");
            ps.setString(5, newStudent.getClassId() + "");
            ps.setString(6, newStudent.getPhone() + "");
            ps.execute();

        } catch (Exception e) {
            status = "Error insert Student: " + e.getMessage();
        }
    }

    public void updateStudent(Student modifiedStudent) {
        String sql = "UPDATE Student_HE163411 set name=?, birthday=?, gender=?, classId=?, phone=? where id=?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, modifiedStudent.getName().trim());
            ps.setString(2, modifiedStudent.getBirthday() + "");
            ps.setString(3, (modifiedStudent.isGender() == true ? "1" : "0"));
            ps.setString(4, modifiedStudent.getClassId() + "");
            ps.setString(5, modifiedStudent.getPhone().trim());
            ps.setString(6, modifiedStudent.getId() + "");
//            System.out.println(modifiedStudent);

            ps.execute();

        } catch (Exception e) {
            status = "Error Update Class: " + e.getMessage();
        }
    }

    public void deleteStudent(String id) {
        String sql = "delete from Student_HE163411 where id=?";
//        System.out.println(name);
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id.trim());
            ps.execute();
        } catch (Exception e) {
            status = "Error delete Student: " + e.getMessage();
        }
    }
    
    public void loadStudentByClassId(String searchId) {
        String sql = "Select * from Student_HE163411 where id=?";

        students = new ArrayList<>();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, searchId);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                String id = rs.getString(1).trim();
                String name = rs.getString(2).trim();
                String birthday = rs.getString(3).trim();
                boolean gender = rs.getBoolean(4);
                int classId = rs.getInt(5);
                String phone = rs.getString(6).trim();
                
                students.add(new Student(id, name, birthday, gender, classId, phone));
            }
        } catch (Exception e) {
            status = "Error Load Student: " + e.getMessage();
        }
    }
}
