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
	<title>목록</title>
	<jsp:include page="../include/head.jsp"></jsp:include>
</head>
<body>
	<!-- 헤더 부분 include -->
	<header id="hd-wrap" class="container is-fullhd">
		<jsp:include page="../include/hd.jsp"></jsp:include>
	</header>
	<div class="container">
	<main class="contents">
		<div id="breadcrumb" class="container breadcrumb-wrap clr-fix" style="height:60px; line-height:60px;">
	    	<nav class="breadcrumb" aria-label="breadcrumbs">
			  <ul>
			    <li><a href="${path2 }">Home</a></li>
			    <li><a href="${path2 }/product/list.do">상품</a></li>
			    <li class="is-active"><a href="#" aria-current="page">자세히 보기</a></li>
			  </ul>
			</nav>
    	</div>
 	    <section class="page" id="page1">
    		<h2 class="page-title">상품 정보 자세히 보기</h2>
    		<div class="page-wrap">
 				<div class="clr-fix">
					<table id="tb1" class="table" width="1200">
						<tbody>
							<tr class="tr1">
								<td colspan="2"><img src="${path2}/resources/upload/${product.img }" alt="${product.pname }" class="product_main"/></td>
							</tr>
							<tr>
								<th>상품 카테고리</th>
								<td>
									<p>
										<strong title="${product.category }">
										<c:if test="${product.category.equals('Best')}">
											Best
										</c:if>
										<c:if test="${product.category.equals('type')}">
											타입별
										</c:if>
										<c:if test="${product.category.equals('worry')}">
											고민별
										</c:if>
										<c:if test="${product.category.equals('line')}">
											라인별
										</c:if>
										</strong>
									</p>
								</td>
							</tr>
							<tr>
								<th>상품명</th>
								<td>${product.pname }</td>
							</tr>
							<tr>
								<th>상품 설명</th>		
								<td>${product.com }</td>
							</tr>
							<tr>
								<td colspan="2"><img src="${path2}/resources/upload/${product.img2 }" alt="${product.pname } 상품 설명 이미지"/></td>
							</tr>
						</tbody>
					</table>
					<hr>
					<div class="buttons">
					  <c:if test="${cus.id.equals('admin') }">
					  <a href="${path2 }/product/insert.do" class="button is-danger">상품 등록</a>
					  <a href="${path2 }/product/update.do?pno=${product.pno }" class="button is-warning">상품 수정</a>
					  <a href="${path2 }/product/delProduct.do?pno=${product.pno }" class="button is-danger is-dark">상품 삭제</a>
					  </c:if>
					  <a href="${path2 }/product/listAll.do" class="button is-primary">상품 목록</a>
					</div>
				</div>
    		</div>
    	</section>
	</main>
	</div>
	<!-- footer 부분 include -->
	<footer class="footer" id="ft">
		<jsp:include page="../include/ft.jsp"></jsp:include>
	</footer>												
</body>
</html>