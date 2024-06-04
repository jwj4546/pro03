<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path2" value="${pageContext.request.contextPath }" />
<nav class="navbar" role="navigation" aria-label="main navigation" style="width:1400px;">
  <div class="navbar-brand">
    <a class="navbar-item" href="${path2 }">
      <img src="${path2 }/resources/images/favicon.png" alt="Logo" id="logo" style="height:150px; width:150px;">
   </a>
    <a role="button" class="navbar-burger" aria-label="menu" aria-expanded="false" data-target="navbarBasicExample">
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
      <span aria-hidden="true"></span>
    </a>
  </div>

  <div id="navbarBasicExample" class="navbar-menu">
    <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">
          Brand
        </a>
        
        <div class="navbar-dropdown">
          <a class="navbar-item">
            VT 스토리
          </a>
          <a class="navbar-item">
            독자성분 & 라인
          </a>
          <a class="navbar-item">
            Where's VT
          </a>
        </div>
	</div>
    <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link" href="${path2 }/product/listAll.do">
          Product
        </a>
        
        <div class="navbar-dropdown">
          <a class="navbar-item" href="${path2 }/product/list.do?category=best">
            Best
          </a>
          <a class="navbar-item" href="${path2 }/product/list.do?category=type">
            유형별
          </a>
          <a class="navbar-item" href="${path2 }/product/list.do?category=worry">
            고민별
          </a>
          <a class="navbar-item" href="${path2 }/product/list.do?category=line">
            라인별
          </a>
        </div>
	</div>
    <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">
          Event
        </a>
        
        <div class="navbar-dropdown">
          <a class="navbar-item">
            이벤트
          </a>
          <a class="navbar-item">
            출석체크
          </a>
          <a class="navbar-item">
            당첨자 발표
          </a>
        </div>
	</div>
       <div class="navbar-item has-dropdown is-hoverable">
        <a class="navbar-link">
          Community
        </a>
        
          <div class="navbar-dropdown">
          <a class="navbar-item" href="${path2 }/notice/list.do">
            Notice
          </a>
          <a class="navbar-item" href="${path2 }/review/list.do">
            Review
          </a>
          <a class="navbar-item">
            Media
          </a>
          <a class="navbar-item">
            Q&A
          </a>
          <a class="navbar-item">
            FAQ
          </a>
        </div>
        </div>
      
    

    <div class="navbar-end">
                <div class="navbar-item">
                    <div class="buttons">
                    <c:if test="${!empty sid}">
                        <a href="${path2}/member/myInfo.do" class="button is-primary">
                            <strong>MyPage</strong>
                        </a>
                        <a href="${path2}/member/logout.do" class="button is-light">
                            LogOut
                        </a>
                    </c:if>
                    <c:if test="${empty sid}">
                        <a href="${path2}/member/term.do" class="button is-primary">
                            <strong>Sign up</strong>
                        </a>
                        <a href="${path2}/member/login.do" class="button is-light">
                            Log in
                        </a>
                    </c:if>
                    <c:if test="${sid.equals('admin')}">
                        <a href="${path2}/member/list.do" class="button is-light">
                            MemberList
                        </a>
                    </c:if>
                    </div>
                </div>
            </div>
</div>
</nav>