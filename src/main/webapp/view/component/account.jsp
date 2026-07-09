<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:choose>
  <c:when test="${sessionScope.user == null}">
    <a href="${pageContext.request.contextPath}/login">
      <i class="fas fa-user"></i> Đăng nhập
    </a>

    <a href="${pageContext.request.contextPath}/register">
      <i class="fas fa-user-plus"></i> Đăng ký
    </a>
  </c:when>

  <c:otherwise>
    <span style="color: white">Xin chào ${sessionScope.user.fullName}</span>

    <a href="${pageContext.request.contextPath}/logout">
      Đăng xuất
    </a>
  </c:otherwise>
</c:choose>