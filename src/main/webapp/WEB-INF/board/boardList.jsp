<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="ctp" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <jsp:include page="/include/bs5.jsp" />
  <title>boardList.jsp</title>
  <script>
  	'use strict';
  	
  	/* function pageSizeCheck() {																// pageSize 변경 시 1번으로 이동
  		let pageSize = $("#pageSize").val();
  		location.href = "BoardList.bo?pag=1&pageSize="+pageSize;
		} */
		
		
		// pageSize 변경 시 내가 보고있는 번호 기준으로 변경
  	function pageSizeCheck() {
			let pag = ${pag};																					// 현재 페이지 번호와 페이지 크기 가져옴
			let curPageSize = ${pageSize};
			
			let startIndexNo = (pag - 1) * curPageSize; 							// 현재 페이지의 첫번째 인덱스 계산
			
			let newPageSize = $("#pageSize").val();										// 변경한 페이지 사이즈 가져옴
			
			let newPag = Math.floor(startIndexNo / newPageSize) + 1;	// 페이지 번호 계산
			
  		location.href = "BoardList.bo?pag=" + newPag + "&pageSize=" + newPageSize;
		}
  </script>
</head>
<body>
<jsp:include page="/include/header.jsp" />
<jsp:include page="/include/nav.jsp" />
<p><br/></p>
<div class="container">
	<table class="table table-borderless">
		<tr>
			<td><h2 class="text-center mb-3">게시판 리스트</h2></td>
		</tr>
		<tr>
			<td><a href="BoardInput.bo" class="btn btn-success btn-sm">글쓰기</a></td>
			<td class="text-end">
				<select name="pageSize" id="pageSize" onchange="pageSizeCheck()" class="form-select" style="width:auto; display:inline-block;">
          <option value="5" ${pageSize == 5 ? 'selected' : ''}>5개씩 보기</option>
          <option value="10" ${pageSize == 10 ? 'selected' : ''}>10개씩 보기</option>
          <option value="15" ${pageSize == 15 ? 'selected' : ''}>15개씩 보기</option>
          <option value="20" ${pageSize == 20 ? 'selected' : ''}>20개씩 보기</option>
          <option value="30" ${pageSize == 30 ? 'selected' : ''}>30개씩 보기</option>
        </select>
			</td>
		</tr>
	</table>			
  <table class="table table-hover text-center">
  	<tr class="table-dark">
  		<th>번호</th>
  		<th>글제목</th>
  		<th>글쓴이</th>
  		<th>올린날짜</th>
  		<th>조회수</th>
  	</tr>
  	<c:forEach var="vo" items="${vos}" varStatus="st">	<!-- 반복시킬 내용 출력-->
  		<tr>
  			<td>${curScrStartNo}</td> <!-- 게시글 번호 -->
  			<td class="text-start">${vo.title}</td>
  			<td>${vo.nickName}</td>
  			<td>${vo.wDate}</td>
  			<td>${vo.readNum}</td>
  		</tr>
  		<c:set var="curScrStartNo" value="${curScrStartNo - 1}" />
  	</c:forEach>
  </table>
  <!-- 블록페이지 시작 -->
<div class="d-flex justify-content-center">
	<ul class="pagination">
	  <c:if test="${pag > 1}"><li class="page-item"><a href="BoardList.bo?pag=1&pageSize=${pageSize}" class="page-link">첫페이지</a></li></c:if>
	  <c:if test="${curBlock > 0}"><li class="page-item"><a href="BoardList.bo?pag=${(curBlock-1)*blockSize + 1}&pageSize=${pageSize}" class="page-link">이전블럭</a></li></c:if>
	  <c:forEach var="i" begin="${(curBlock*blockSize)+1}" end="${(curBlock*blockSize)+blockSize}" varStatus="st">
		  <c:if test="${i <= totPage && i == pag}"><li class="page-item"><a href="BoardList.bo?pag=${i}&pageSize=${pageSize}" class="page-link"><font color="red"><b>${i}</b></font></a></li></c:if>
		  <c:if test="${i <= totPage && i != pag}"><li class="page-item"><a href="BoardList.bo?pag=${i}&pageSize=${pageSize}" class="page-link">${i}</a></li></c:if>
	  </c:forEach>
	  <c:if test="${curBlock < lastBlock}"><li class="page-item"><a href="BoardList.bo?pag=${(curBlock+1)*blockSize + 1}&pageSize=${pageSize}" class="page-link">다음블럭</a></li></c:if>
	  <c:if test="${pag < totPage}"><li class="page-item"><a href="BoardList.bo?pag=${totPage}&pageSize=${pageSize}" class="page-link">마지막페이지</a></li></c:if>
	</ul>
</div>
<!-- 블록페이지 끝 -->
</div>
<p><br/></p>
<jsp:include page="/include/footer.jsp" />
</body>
</html>