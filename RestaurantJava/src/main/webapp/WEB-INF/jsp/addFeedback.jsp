<%-- 
    Document   : addFeedback
    Created on : Apr 27, 2021, 6:11:02 PM
    Author     : OS
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<h1 class="text-center text-success m-3">Thêm Bình Luận</h1>  

<c:url value="/addFeedback/add" var="action" />

<form:form method="post"  action="${action}" modelAttribute="addFeedback">
    <form:errors path="*" element="div" 
                 cssClass="alert alert-danger" />
    <div class="form-group">
        <label><spring:message code="addfb.name" /></label>
        <form:select path="customer" cssClass="form-control">
            <c:forEach items="${customer}" var="cus">
                <option value="${cus[0]}">${cus[2]}</option>
            </c:forEach>
        </form:select>
    </div>
    
    <div class="form-group">
        <label><spring:message code="addfb.date" /></label>
        <fieldset disabled>
        <form:input type="date" cssClass="form-control" path="date" placeholder="yyyy/mm/dd"/>
        </fieldset>
    </div>
    
    <div class="form-group">
        <label><spring:message code="addfb.description" /></label>
        <textarea class="form-control" path="description" placeholder="Nhập nội dung..." rows="3" cols="3" ></textarea>
    </div>
    <div class="form-group text-right">
        <input type="submit" class="btn btn-success" value="<spring:message code="addfb.submit" />" />
    </div>
</form:form>

