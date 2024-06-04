<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path2" value="${pageContext.servletContext.contextPath }" />
<!DOCTYPE>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>리뷰</title>
	<jsp:include page="../include/head.jsp"></jsp:include>
	<style>
	#tb1 { width:1400px; height:auto;}
	.item1 { width:10%; }
	.item2 { width:60%; }
	.item3 { width:20%; }
	.item4 { width:10%;}
	</style>
</head>
<body>
	<!-- 헤더 부분 include -->
	<header id="hd-wrap" class="container is-fullhd">
		<jsp:include page="../include/hd.jsp"></jsp:include>
	</header>
	<div class="container">
	<main class="contents">
	<h2 class="page-title">리뷰 목록</h2>
    		<div>
	    		<div>
	    			<br>
					<table class="table" id="tb1">
						<thead>
							<tr>
								<th class="item1">번호</th>
								<th class="item2">제목</th>
								<th class="item3">작성일</th>
								<th class="item4">별점</th>
							</tr>
						</thead>
						<tbody>
							<c:if test="${not empty list }">
								<c:forEach var="dto" items="${list }">
								<tr>
									<td>${dto.no }</td>
									<td>
										<a href="${path2 }/review/detail.do?no=${dto.no }">${dto.title }</a>
<%-- 									<c:if test="${empty cus }">
										<strong>${dto.title }</strong>
										</c:if>
										<c:if test="${not empty cus }">
										<a href="${path2 }/notice/detail.do?bno=${dto.bno }">${dto.title }</a>
										</c:if>  --%>
									</td>
									<td>${dto.resdate }</td>
									<td style="color:gold;">
										<c:forEach begin="1" end="${dto.starRating }">
											★
										</c:forEach>
									</td>
								</tr>
								</c:forEach>
							</c:if>
							<c:if test="${empty list }">
								<tr>
									<td colspan="4"><strong>리뷰가 존재하지 않습니다.</strong></td>
								</tr>
							</c:if>
						</tbody>
					</table>
				</div>
			</div>
			<div class="buttons">
					  <a href="${path2 }/review/insert.do" class="button is-danger">글 등록</a>
					</div>
			<c:if test="${cus.id.equals('admin') }">
					<div class="buttons">
					  <a href="${path2 }/review/delReview.do" class="button is-danger">글</a>
					</div>
			</c:if>
	</main>
	</div>
	<!-- footer 부분 include -->
	<footer class="footer" id="ft">
		<jsp:include page="../include/ft.jsp"></jsp:include>
		</footer>
</body>
</html>