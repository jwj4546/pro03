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
			    <li><a href="${path2 }">Member</a></li>
			    <li class="is-active"><a href="#" aria-current="page">My Page</a></li>
			  </ul>
			</nav>
    	</div>
 	    <section class="page" id="page1">
    		<h2 class="page-title">마이페이지</h2>
    		<hr>
    		<div class="page-wrap">
	    		<div class="clr-fix">
	                <table class="table">
	                    <tbody>
		                    <tr>
		                        <th>아이디</th>
		                        <td>${cus.id }</td>
		                    </tr>
		                    <tr>
		                        <th>비밀번호</th>
		                        <td>********
		                    </tr>
		                    <tr>
		                        <th>이름</th>
		                        <td>${cus.name }</td>
		                    </tr>
		                    <tr>
		                        <th>이메일</th>
		                        <td>${cus.email }</td>
		                    </tr>
		                    <tr>
		                        <th>전화번호</th>
		                        <td>${cus.tel }</td>
		                    </tr>
		                    <tr>
		                        <th>주소</th>
		                        <td>
		                            기본 주소 : ${cus.addr1 } <br>
		                            상세 주소 : ${cus.addr2 }
		                        </td>
		                    </tr>
		                    <tr>
		                        <td colspan="2">
		                        	<div class="buttons">
			                            <c:if test="${cus.id=='admin' }">
			                                <a href="${path2 }/admin/memberDelete.do?id=${aid }" class="button is-danger is-dark">직권 강퇴</a>
			                            </c:if>
			                            <c:if test="${!empty cus.id }">
			                            	<a href="${path2 }/member/myUpdate.do" class="button is-warning">회원 정보수정</a>
			                                <a href="${path2 }/member/memberDelete.do?id=${cus.id }" class="button is-danger is-dark">회원 탈퇴</a>
			                            </c:if>
			                            <c:if test="${cus.id=='admin' }">
			                                <a href="${path2 }/admin/list.do" class="button is-primary">회원 목록</a>
			                            </c:if>
			                        </div>    
		                        </td>
		                    </tr>
	                    </tbody>
	                </table>
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