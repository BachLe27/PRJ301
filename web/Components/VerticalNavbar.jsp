<%-- 
    Document   : VerticalNavbar
    Created on : Jun 8, 2022, 10:20:15 AM
    Author     : bachl
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% String activePage = request.getAttribute("activePage") + ""; %>

<nav class="nav nav-pills flex-column navbar-light bg-light vertical-navbar border-end">
    <a class="nav-link mt-3 <%=(activePage.equals("1") ? "active" : "")%>" aria-current="page" href="/ScheduGuard/Home">
        <i class="bi bi-calendar3"></i>
        <span>Lịch gác</span>
    </a>
    <c:if test="${sessionScope.user != '3.guest'}">    
    <a class="nav-link my-1 <%=(activePage.equals("2") ? "active" : "")%>" href="/ScheduGuard/Location">
        <i class="bi bi-pin-map"></i>
        <span>Điểm gác</span>
    </a>
    <a class="nav-link my-1 <%=(activePage.equals("3") ? "active" : "")%>" href="/ScheduGuard/Student">
        <i class="bi bi-people"></i>
        <span>Danh sách sinh viên</span>
    </a>
    <a class="nav-link my-1 <%=(activePage.equals("4") ? "active" : "")%>" href="/ScheduGuard/Classes">
        <i class="bi bi-list-columns"></i>
        <span>Danh sách lớp</span>
    </a>
    </c:if>
        
    <c:set var="user" value="${sessionScope.user}" /> 
    <c:set var="role" value="${fn:substring(user, 0, 1)}"/>
    
    <c:if test="${role == '0'}">
        <a class="nav-link my-1 <%=(activePage.equals("5") ? "active" : "")%>" href="/ScheduGuard/Account">
            <i class="bi bi-person-video2"></i>
            <span>Quản lý tài khoản</span>
        </a>
    </c:if>
</nav>
