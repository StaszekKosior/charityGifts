<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/fragments/header-login-register.jsp"/>

<section class="login-page">
    <h2>Załóż konto</h2>
    <form:form method="post" modelAttribute="user">
        <div class="form-group">
            <form:label path="email"/>
            <form:input type="email" path="email" placeholder="Email"/>
            <form:errors path="email" cssStyle="color : red"/>
        </div>
        <div class="form-group">
            <form:label path="password"/>
            <form:input type="password" path="password" placeholder="Hasło"/>
            <form:errors path="password" cssStyle="color : red"/>
        </div>
<%--        <div class="form-group">--%>
<%--            <form:label path="password2"/>--%>
<%--            <form:input type="password" path="password2" placeholder="Powtórz hasło"/>--%>
<%--            <form:errors path="password2" cssStyle="color : red"/>--%>
<%--        </div>--%>

        <div class="form-group form-group--buttons">
            <a href="<c:url value="/user/login"/>" class="btn btn--without-border">Zaloguj się</a>
            <button class="btn" type="submit">Załóż konto</button>
        </div>
    </form:form>
</section>

<jsp:include page="${pageContext.request.contextPath}/WEB-INF/views/fragments/footer.jsp"/>