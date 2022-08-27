<%-- 
    Document   : checkDAO
    Created on : Jun 26, 2022, 8:26:19 AM
    Author     : bachl
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<c:if test="${empty sessionScope.DAO}">
    <c:redirect url="Home"/>
</c:if>
