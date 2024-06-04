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
	<style>
		#myform fieldset{
	    display: inline-block;
	    direction: rtl;
	    border:0;
	}
	#myform fieldset legend{
	    text-align: right;
	}
	#myform input[type=radio]{
	    display: none;
	}
	#myform label{
	    font-size: 1.5em;
	    color: transparent;
	    text-shadow: 0 0 0 #f0f0f0;
	}
	#myform label:hover{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#myform label:hover ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#myform input[type=radio]:checked ~ label{
	    text-shadow: 0 0 0 rgba(250, 208, 0, 0.99);
	}
	#reviewContents {
	    width: 100%;
	    height: 150px;
	    padding: 10px;
	    box-sizing: border-box;
	    border: solid 1.5px #D3D3D3;
	    border-radius: 5px;
	    font-size: 16px;
	    resize: none;
	}
	</style>
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
			    <li><a href="${path2 }/review/list.do">Review</a></li>
			    <li class="is-active"><a href="#" aria-current="page">Write</a></li>
			  </ul>
			</nav>
    	</div>
 	    <section class="page" id="page1">
    		<h2 class="page-title">리뷰 목록</h2>
    		<div class="page-wrap">
	    		<div class="clr-fix">
	    			<br>
					<form action="${path2 }/review/insertPro.do" method="post" class="mb-3" name="myform" id="myform">
						<table class="table">
							<tbody>
							<tr>
									<th><label for="title">상품명</label></th>
									<td>
										<input type="text" name="pname" id="pname" class="input" maxlength="100" required>
									</td>
								</tr>
								<tr>
									<th><label for="title">제목</label></th>
									<td>
										<input type="text" name="title" id="title" class="input" maxlength="100" required>
									</td>
								</tr>
								<tr>
									<th><label for="content">내용</label></th>
									<td>
										<textarea name="content" id="content" rows="8" cols="80" class="textarea"></textarea>
									</td>
								</tr>
								<tr>
									<th><label for="content">아이디</label></th>
									<td>
										<input type="text" name="id" id="id" class="input" maxlength="20" required>
									</td>
								</tr>
								<tr>
									<th><label for="content">별점</label></th>
									<td>
										<fieldset>
											<span class="text-bold">별점을 선택해주세요</span>
											<input type="radio" name="starRating" value="5" id="rate1"><label
												for="rate1">★</label>
											<input type="radio" name="starRating" value="4" id="rate2"><label
												for="rate2">★</label>
											<input type="radio" name="starRating" value="3" id="rate3"><label
												for="rate3">★</label>
											<input type="radio" name="starRating" value="2" id="rate4"><label
												for="rate4">★</label>
											<input type="radio" name="starRating" value="1" id="rate5"><label
												for="rate5">★</label>
										</fieldset>
									</td>
								</tr>
							</tbody>
						</table>
						<hr>
						<div class="buttons">
						  <button type="submit" class="button is-danger">글 등록</button>
						  <a href="${path2 }/review/list.do" class="button is-primary">글 목록</a>
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