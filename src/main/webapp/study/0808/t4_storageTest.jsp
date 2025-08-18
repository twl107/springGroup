<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	int aCount = application.getAttribute("aCount")==null ? 0 : (int) application.getAttribute("aCount");
	int sCount = session.getAttribute("sCount")==null ? 0 : (int) session.getAttribute("sCount");
	
	aCount++;
	sCount++;
	
	application.setAttribute("aCount", aCount);
	session.setAttribute("sCount", sCount);
%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
	<jsp:include page="/include/bs5.jsp" />
  <title>t4_storageTest.jsp</title>
</head>
<body>
<p><br/></p>
<div class="container">
  <h2>방문카운트를 session과 application 비교하기</h2>
  <hr/>
  <p>어플리케이션 카운트 : ${aCount}</p>
  <hr/>
  <p>세션 카운트 : ${sCount}</p>
  <hr/>
  <p><a href="t4_storageTest.jsp" class="btn btn-success">방문수 증가</a></p>
</div>
<p><br/></p>
</body>
</html>