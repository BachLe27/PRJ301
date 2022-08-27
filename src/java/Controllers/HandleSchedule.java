/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers;

import DAL.LocationDAO;
import DAL.ScheduleDAO;
import Models.PostStatus;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author bachl
 */
@WebServlet(name = "HandleSchedule", urlPatterns = {"/HandleSchedule"})
public class HandleSchedule extends HttpServlet {

    ScheduleDAO scheduleDAO;
    LocationDAO locationDAO;
    @Override
    public void init() {
        scheduleDAO = new ScheduleDAO();
        locationDAO = new LocationDAO();
    }
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet HandleSchedule</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HandleSchedule at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        processRequest(request, response);
        int status = Integer.parseInt(request.getParameter("status"));

        HttpSession ses = request.getSession();

        String prefixNoti = "lịch gác ";

        switch (status) {
            case PostStatus.CREATE_STATUS:
                Models.Schedule newSchedule = getSchedule(request);
                System.out.println(newSchedule.isActive());
                ses.setAttribute("create", true);
                ses.setAttribute("createName", prefixNoti);

                scheduleDAO.createSchedule(newSchedule);
                break;
            case PostStatus.UPDATE_STATUS:
                Models.Schedule modifiedSchedule = getSchedule(request);

                ses.setAttribute("update", true);
                ses.setAttribute("updateName", prefixNoti);

                scheduleDAO.updateSchedule(modifiedSchedule);
                break;

            case PostStatus.DELETE_STATUS:
                // delete
                String id = request.getParameter("id");

                ses.setAttribute("deleteName", prefixNoti);
                ses.setAttribute("delete", true);

                scheduleDAO.deleteSchedule(id);
                break;
            default:
                throw new AssertionError();
        }

        scheduleDAO.loadSchedule();
        
        ses.setAttribute("scheduleDAO", scheduleDAO);

        response.sendRedirect("Home");
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
    
    
    private Models.Schedule getSchedule(HttpServletRequest request) {
        int id = 0;
        
        if (request.getParameter("id") != null) {
            id = Integer.parseInt(request.getParameter("id"));
        }
        
        boolean active = false;
        
        String activeParam = request.getParameter("active");
        
        if (!activeParam.equals("null")) {
            active = (activeParam.equals("1")) ;
        } 
        
//        String name = request.getParameter("name");
        int locationId = Integer.parseInt(request.getParameter("locationId"));
        
        String date = request.getParameter("date");
        
        int shiftId = Integer.parseInt(request.getParameter("shiftId"));
        
        Models.Schedule schedule = new Models.Schedule(id, locationId, date, shiftId, active);
        return schedule;
    }
    
}
