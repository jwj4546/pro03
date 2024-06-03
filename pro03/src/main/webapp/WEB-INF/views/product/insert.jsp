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
			    <li class="is-active"><a href="#" aria-current="page">상품 등록</a></li>
			  </ul>
			</nav>
    	</div>
 	    <section class="page" id="page1">
    		<h2 class="page-title">상품 등록</h2>
    		<div class="page-wrap">
	    		<div class="clr-fix">
	    			<br>
					<form action="${path2 }/product/insertPro.do" method="post" enctype="multipart/form-data">
						<table class="table">
							<tbody>
								<tr>
									<th><label for="category">카테고리</label></th>
									<td>
										<select name="category" id="category" required>
											<option value="">선택 안함</option>
											<option value="best">Best</option>
											<option value="type">타입별</option>
											<option value="worry">고민별</option>
											<option value="line">라인별</option>
										</select>
									</td>
								</tr>
								<tr>
									<th><label for="pname">상품명</label></th>
									<td>
										<input type="text" name="pname" id="pname" class="input" maxlength="100" required>
									</td>
								</tr>
								<tr>
									<th><label for="com">상품 설명</label></th>
									<td>
										<textarea name="com" id="com" rows="8" cols="80" maxlength="3000" class="textarea"></textarea>
									</td>
								</tr>
								<tr>
									<th><label for="com">가격</label></th>
									<td>
										<input type="number" min="0" step="100" value="500" name="price" id="price" class="input" />
									</td>
								</tr>
								<tr>
									<th><label for="img">상품 메인이미지</label></th>
									<td>
										<input type="file" name="img" id="img" accept="image/*" required/>
									</td>
								</tr>
								<tr>
									<th><label for="img">상품 상세 이미지</label></th>
									<td>
										<input type="file" name="img2" id="img2" accept="image/*" required/>
									</td>
								</tr>
								<tr>
									<th><label for="img">상품 썸네일 이미지</label></th>
									<td>
										<input type="file" name="img3" id="img3" accept="image/*" required/>
									</td>
								</tr>
							</tbody>
						</table>
						<hr>
						<div class="buttons">
						  <button type="submit" class="button is-danger">상품 등록</button>
						  <a href="${path2 }/product/listAll.do" class="button is-primary">상품 목록</a>
						</div>
					</form>
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