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
			    <li class="is-active"><a href="#" aria-current="page">목록</a></li>
			  </ul>
			</nav>
    	</div>
 	    <section class="page" id="page1">
    		<h2 class="page-title">상품 목록</h2>
    		
    		<div class="tab_box">
	    		<div class="tabs">
				  <ul>
                        <li><a href="${path2 }/product/listAll.do" class="navbar-item" title="전체">
                            전체 상품
                        </a></li>
                        <li><a href="${path2 }/product/list.do?category=best" class="navbar-item" title="Best">
                            Best
                        </a></li>
                        <li><a href="${path2 }/product/list.do?category=type" class="navbar-item" title="타입별">
                            타입별
                        </a></li>
                        <li><a href="${path2 }/product/list.do?category=worry" class="navbar-item" title="고민별">
                            고민별
                        </a></li>
                        <li><a href="${path2 }/product/list.do?category=line" class="navbar-item" title="라인별">
                            라인별
                        </a></li>
				  </ul>
				</div>
    		</div>
    		
    		<div class="page-wrap">
	    		<div class="clr-fix">
	    			<br>
					<ul class="columns list" id="list1" >
						<c:if test="${not empty list }">
							<c:forEach var="dto" items="${list }">
							<li class="column" >
									<div class="item_box">
										<a href="${path2 }/product/detail.do?pno=${dto.pno }" class="item_wrap">
										<img src="${path2 }/resources/upload/${dto.img3 }" class="item_pic"/>
										<h4 class="list_category">${dto.category }</h4>
										<h3 class="list_title">${dto.pname }</h3><br>
										<p class="list_price"><strong>${dto.price }</strong></p>
										</a>
									</div>
							</li>
							</c:forEach>
						</c:if>
						<c:if test="${empty list }">
							<li>
								<p><strong>상품이 존재하지 않습니다.</strong></p>
							</li>
						</c:if>
					</ul>
					<script>
					$(document).ready(function(){
						/* $("#list1").DataTable({
							order:[[0,"desc"]]
						}); */
					});
					</script>
					<hr>
					<c:if test="${cus.id.equals('admin') }">
					<div class="buttons">
					  <a href="${path2 }/product/insert.do" class="button is-danger">상품 등록</a>
					</div>
					</c:if>
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