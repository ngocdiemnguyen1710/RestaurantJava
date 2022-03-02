<%-- 
    Document   : bookParty
    Created on : Apr 28, 2021, 8:05:01 PM
    Author     : HP
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="form"
           uri="http://www.springframework.org/tags/form" %>

<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h1 class="text-center text-danger">Đặt tiệc</h1>
<c:url value="/bookParty/add" var="action" />
<form:form method="POST" 
           action="${action}" 
           modelAttribute="bookParty">

  <div class="form-group">
        <label for="">Tên Khách Hàng</label>
            <form:select path="customer" cssClass="form-control">
            <c:forEach items="${customer}" var="cus">
                <option value="${cus[0]}">${cus[2]}</option>
            </c:forEach>
        </form:select>
        
    </div>
 
    <div class="form-group">
        <label for="service">Dịch vụ</label>
        <form:select path="services" cssClass="form-control">
            <c:forEach items="${services}" var="ser">
                <option value="${ser.serviceId}">${ser.name}</option>
            </c:forEach>
        </form:select>
    </div>
    <div class="form-group">
        <label for="event">Sự kiện</label>
        <form:select path="event" cssClass="form-control">
            <c:forEach items="${event}" var="ev">
                <option value="${ev.eventId}">${ev.name}</option>
            </c:forEach>
        </form:select>
    </div>
     <div class="form-group">
        <label for="hall">Sảnh</label>
        <form:select path="hall" cssClass="form-control">
            <c:forEach items="${hall}" var="ha">
                <option value="${ha.hallId}">${ha.name}</option>
            </c:forEach>
        </form:select>
    </div>
    <div class="form-group">
        <label for="">Ngày tổ chức</label>
        <form:input type="date" cssClass="form-control" path="dateUse"  />
    </div>
    <div class="form-group">
        <label for="">Số lượng khách</label>
        <form:input cssClass="form-control" path="numberGuest" />
    </div>
  
    <div class="form-group">
        <label for="">Ghi Chú</label>
        <form:input cssClass="form-control" path="description"/>
    </div>
   

    <div class="form-group">
        <form:hidden path="id" />
        <input type="submit" value="Gửi thông tin" 
               class="btn btn-danger" />
        
    </div>
</form:form>

<script src="<c:url value="/js/main.js" />"></script>
