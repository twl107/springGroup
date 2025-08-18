<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <jsp:include page="/include/bs5.jsp" />
  <title>testMenu.jsp</title>
</head>
<body>
<p><br/></p>
<p>연습 : ${aTest}</p>
<div class="container">
  <p><a href="${ctp}/study2/Test1">Test1</a></p>
  <p><a href="${ctp}/study2/Test2">Test2</a></p>
  <p><a href="${ctp}/study2/T3">Test3</a></p>
  <p><a href="${ctp}/study2/Test4">Test4</a></p>
  <p><a href="${ctp}/study2/filter/T1_filter">T1_filter</a></p>
  <p><a href="${ctp}/study2/init/login">init login테스트</a></p>
  <p><a href="${ctp}/javaGroup">init login테스트2</a></p>
</div>
<p><br/></p>
</body>
</html>