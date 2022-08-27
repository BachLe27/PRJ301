<%-- 
    Document   : AllNotification
    Created on : Jun 14, 2022, 9:37:53 PM
    Author     : bachl
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!--add success-->
<c:if test="${!empty sessionScope.create}">
    <%@include file="Create.jsp" %>
    <c:remove var="create" scope="session" ></c:remove>
    <c:remove var="createName" scope="session" ></c:remove>
</c:if>

<!--update success-->
<c:if test="${!empty sessionScope.update}">
    <%@include file="Update.jsp" %>
    <c:remove var="update" scope="session" ></c:remove>
    <c:remove var="updateName" scope="session" ></c:remove>
</c:if>

<!--delete -->
<c:if test="${!empty sessionScope.delete}">
    <%@include file="Delete.jsp" %>
    <c:remove var="delete" scope="session" ></c:remove>
    <c:remove var="deleteName" scope="session" ></c:remove>
</c:if>


<c:if test="${!empty sessionScope.invalidCredential}">
    <%@include file="InvalidCredential.jsp" %>
    <c:remove var="invalidCredential" scope="session" ></c:remove>
</c:if>
    
<c:if test="${!empty sessionScope.sendedEmail}">
    <%@include file="SendedMail.jsp" %>
    <c:remove var="sendedEmail" scope="session" ></c:remove>
</c:if>