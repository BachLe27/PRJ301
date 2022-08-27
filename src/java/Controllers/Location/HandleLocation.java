/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Location;

import DAL.LocationDAO;
import Models.PostStatus;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author bachl
 */
public class HandleLocation extends HttpServlet {

    LocationDAO locationDAO;

    @Override
    public void init() {
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
            out.println("<title>Servlet HandleLocation</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet HandleLocation at " + request.getContextPath() + "</h1>");
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
        int status = Integer.parseInt(request.getParameter("status"));

        HttpSession ses = request.getSession();

        String prefixNoti = "điểm gác ";

        switch (status) {
            case PostStatus.CREATE_STATUS:
                Models.Location newLocation = getLocation(request);

                ses.setAttribute("create", true);
                ses.setAttribute("createName", prefixNoti + newLocation.getName());

                locationDAO.createLocation(newLocation);
                break;
            case PostStatus.UPDATE_STATUS:
                Models.Location modifiedLocation = getLocation(request);

                ses.setAttribute("update", true);
                ses.setAttribute("updateName", prefixNoti + modifiedLocation.getName());

                locationDAO.updateLocation(modifiedLocation);
                break;

            case PostStatus.DELETE_STATUS:
                // delete
                String id = request.getParameter("id");
                String name = request.getParameter("name");

                ses.setAttribute("deleteName", prefixNoti + name);
                ses.setAttribute("delete", true);

                locationDAO.deleteLocation(id);
                break;
            default:
                throw new AssertionError();
        }

        locationDAO.loadLocation();
        ses.setAttribute("locationDAO", locationDAO);

        response.sendRedirect("Location");
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
    
    private Models.Location getLocation(HttpServletRequest request) {
        int id = 0;
        
        if (request.getParameter("id") != null) {
            id = Integer.parseInt(request.getParameter("id"));
        }
        String name = request.getParameter("name");
        int numOfGuard = Integer.parseInt(request.getParameter("numOfGuard"));
        Models.Location location = new Models.Location(id, name, numOfGuard);
        return location;
    }
}
