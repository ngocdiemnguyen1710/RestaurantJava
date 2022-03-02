

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<h1 class="text-center text-success p-3">ĐĂNG KÝ</h1>

<c:if test="${errMsg != null}">
    <div class="alert alert-danger">
        ${errMsg}
    </div>
</c:if>
<form:form action="${action}" modelAttribute="user" method="post" >
        <form:errors path="*" cssClass="alert alert-danger" element="div" />
    <div class="form-group">
        <label for="username">Tên đăng nhập</label>
        <form:input id="username" 
                    class="form-control"
                    path="username" />
        <form:errors path="username" cssClass="text-danger" />
    </div>
    <div class="form-group">
        <lable for="password">Mật khẩu</lable>
        <form:password id="password" 
                    class="form-control"
                    path="password" />
        <form:errors path="password" cssClass="text-danger" />
    </div>
    <div class="form-group">
        <lable for="confirm">Xác nhận mật khẩu</lable>
        <form:password id="confirm" 
                    class="form-control"
                    path="confirmPassword" />
        <form:errors path="confirmPassword" cssClass="text-danger" />
    </div>
    <div class="form-group">
        <input type="submit" value="Đăng ký" class="btn btn-danger" />
    </div>
</form:form>