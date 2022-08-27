package DAL;

//import Models.Location;
import Models.Schedule;
import Models.ScheduleDetails;
import Models.Shift;
import Models.Student;
import java.sql.Array;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
/**
 *
 * @author bachl
 */
public class ScheduleDAO extends DAO {

    private HashMap<Integer, Shift> shifts;
    private ArrayList<Schedule> schedules;
    private ArrayList<ScheduleDetails> scheduleDetails;

    public ScheduleDAO() {
    }

    public ScheduleDAO(HashMap<Integer, Shift> shifts, ArrayList<Schedule> schedules, ArrayList<ScheduleDetails> scheduleDetails) {
        this.shifts = shifts;
        this.schedules = schedules;
        this.scheduleDetails = scheduleDetails;
    }

    public HashMap<Integer, Shift> getShifts() {
        return shifts;
    }

    public void setShifts(HashMap<Integer, Shift> shifts) {
        this.shifts = shifts;
    }

    public ArrayList<Schedule> getSchedules() {
        return schedules;
    }

    public void setSchedules(ArrayList<Schedule> schedules) {
        this.schedules = schedules;
    }

    public ArrayList<ScheduleDetails> getScheduleDetails() {
        return scheduleDetails;
    }

    public void setScheduleDetails(ArrayList<ScheduleDetails> scheduleDetails) {
        this.scheduleDetails = scheduleDetails;
    }

    public void loadShift() {
        String sql = "select * from Shift_HE163411";

        shifts = new HashMap<>();

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                String startTime = rs.getString(2).trim().substring(0, 5);
                String endTime = rs.getString(3).trim().substring(0, 5);
                shifts.put(id, new Shift(id, startTime, endTime));
            }
        } catch (SQLException e) {
            status = "Error Load Shift: " + e.getMessage();
        }
    }

    public void createSchedule(Schedule newSchedule) {
        String sql = "insert into Schedule_HE163411 values(?, ?, ?, ?)";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, newSchedule.getLocationId() + "");
            ps.setString(2, newSchedule.getDate().trim());
            ps.setString(3, newSchedule.getShiftId() + "");
            ps.setString(4, newSchedule.isActive() ? "1" : "0");
            ps.execute();

        } catch (SQLException e) {
            status = "Error insert Schedule: " + e.getMessage();
        }
    }

    public void updateSchedule(Schedule modifiedSchedule) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public void deleteSchedule(String id) {
        String sqls[] = {"delete from ScheduleDetails_HE163411 where scheduleId = ?",
                        "delete from Schedule_HE163411 where id = ?"
                       };
        
        try {
            for (String sql : sqls) {
                PreparedStatement ps = con.prepareStatement(sql);
                ps.setString(1, id.trim());
                ps.execute();
            }
        } catch (Exception e) {
            status = "Error at delete Schedule: " + e.getMessage();
        }
    }

    public void loadSchedule() {
        schedules = new ArrayList<>();

        String sql = "select * from Schedule_HE163411 order by date desc";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                int id = rs.getInt(1);
                int locationId = rs.getInt(2);
                String date = rs.getString(3).trim();
                int shiftId = rs.getInt(4);
                boolean active = rs.getBoolean(5);
                schedules.add(new Schedule(id, locationId, date, shiftId, active));
            }
        } catch (SQLException e) {
            status = "Error at load Schedule " + e.getMessage();
        }

    }

    public void loadScheduleDetails() {
        scheduleDetails = new ArrayList<>();

        String sql = "select * from ScheduleDetails_HE163411";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                int id = rs.getInt(1);
                int scheduleId = rs.getInt(2);
                String studentId = rs.getString(3).trim();
                scheduleDetails.add(new ScheduleDetails(id, scheduleId, studentId));
            }
        } catch (SQLException e) {
            status = "Error at create Schedule details:" + e.getMessage();
        }
    }

    private void activeSchedule(int scheduleId) {
//        System.out.println("active");
        String sql = "Update Schedule_HE163411 set active=? where id=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, "1");
            ps.setString(2, scheduleId + "");
            ps.execute();
        } catch (SQLException e) {
            status = "Error at active Schedule:" + e.getMessage();
        }
    }

    public void createScheduleDetails(ScheduleDetails newScheduleDetails) {
        String sql = "insert into ScheduleDetails_HE163411 values(?, ?)";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, newScheduleDetails.getScheduleId() + "");
            ps.setString(2, newScheduleDetails.getStudentId().trim());
            ps.execute();

            checkActive(newScheduleDetails.getScheduleId());

        } catch (SQLException e) {
            status = "Error insert Schedule details: " + e.getMessage();
        }
    }

    private void checkActive(int scheduleId) {

        String checkActive = "select * from ScheduleDetails_HE163411 where scheduleId = ?";

        String guardInLocation = "select numOfGuard from Location_HE163411 where id = (select locationId from Schedule_HE163411 where id = ?)";

        try {
            PreparedStatement ps = con.prepareStatement(checkActive);
            ResultSet rs;
            ps.setString(1, scheduleId + "");
            
            rs = ps.executeQuery();
            
            int currentGuard = 0;
            
            while (rs.next()) {
                currentGuard++;
            }
            
            int numOfGuard = 0;
            
            ps = con.prepareStatement(guardInLocation);
            ps.setString(1, scheduleId + "");
            
            rs = ps.executeQuery();
            while (rs.next()) {
                numOfGuard = rs.getInt(1);
            }

            System.out.println(numOfGuard);
            
            if (numOfGuard == currentGuard) {
                activeSchedule(scheduleId);
            }
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

}
