/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controllers.Student;

import DAL.DAO;
import DAL.StudentDAO;
import Models.PostStatus;
import Models.Student;
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
@WebServlet(name = "HandleStudent", urlPatterns = {"/HandleStudent"})
public class HandleStudent extends HttpServlet {
    
    StudentDAO studentDAO;
    
    @Override
    public void init() {
        studentDAO = new StudentDAO();
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
//        processRequest(request, response);
        String classId = request.getParameter("classId");
        HttpSession ses = request.getSession();
        studentDAO.loadStudentByClassId(classId);
        ses.setAttribute("studentDAO", studentDAO);
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
        
        String prefixNoti = "sinh viên ";
        
        switch (status) {
            case PostStatus.CREATE_STATUS:
                Models.Student newStudent = getStudent(request);
                
                ses.setAttribute("create", true);
                ses.setAttribute("createName", prefixNoti + newStudent.getName());
                
                studentDAO.createStudent(newStudent);
                break;
            case PostStatus.UPDATE_STATUS: 
                Models.Student modifiedStudent = getStudent(request);
                
                ses.setAttribute("update", true);
                ses.setAttribute("updateName", prefixNoti + modifiedStudent.getName());
                
                studentDAO.updateStudent(modifiedStudent);
                
                ses.setAttribute("currentClass", modifiedStudent.getClassId());
                break;
                
            case PostStatus.DELETE_STATUS: 
                // delete
                String id = request.getParameter("id");
                String name = request.getParameter("name");

                ses.setAttribute("deleteName", prefixNoti + name);
                ses.setAttribute("delete", true);
                
                studentDAO.deleteStudent(id);
                break;
            default:
                throw new AssertionError();
        }
        
        studentDAO.loadStudent();
        ses.setAttribute("studentDAO", studentDAO);
        
        response.sendRedirect("Student");
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

    private Models.Student getStudent(HttpServletRequest request) {
        
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String birthday = request.getParameter("birthday");
        boolean gender = request.getParameter("gender").equals("1");
        int classId = Integer.parseInt(request.getParameter("classId")); 
        String phone = request.getParameter("phone");
        
        Models.Student student = new Student(id, name, birthday, gender, classId, phone);
        return student;
    }


}
