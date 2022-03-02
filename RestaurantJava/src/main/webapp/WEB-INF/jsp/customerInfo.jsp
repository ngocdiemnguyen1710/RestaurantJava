<%-- 
    Document   : customerInfo
    Created on : May 10, 2021, 11:56:49 PM
    Author     : OS
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h1 class="text-center text-success m-3">Điền thông tin vào form</h1>  
<c:url value="/customerInfo/submit" var="action" />
<form:form method="post"  action="${action}" modelAttribute="customerInfo">
      <form:errors path="*" element="div" 
                 cssClass="alert alert-danger" />
  
    <div class="form-group">
        <label><spring:message code="cus.name" /></label>
        <form:input cssClass="form-control" path="name" />
    </div>
    <div class="form-group">
        <label><spring:message code="cus.phone" /></label>
        <form:input cssClass="form-control" path="phone" />
    </div>
    <div class="form-group">
        <label><spring:message code="cus.address" /></label>
        <form:input cssClass="form-control" path="address" />
    </div>
    <div class="form-group">
        <label for="user"><spring:message code="cus.username" /></label>
        <form:select path="user" cssClass="form-control" id="user">
            <c:forEach items="${user}" var="u">
                <option value="${u.id}">${u.username}</option>
            </c:forEach>
        </form:select>
    </div>
    
    <div>
        <input type="submit" class="btn btn-success" value="<spring:message code="cus.submit" />" />
    </div>
</form:form>