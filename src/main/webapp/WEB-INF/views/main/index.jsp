<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>

<body>
<!--  -->
<div class="container">
  <!-- 로그인과 회원가입 링크 -->
		<%-- <div align="right">
      	 <c:if test="${empty mem}">  <!-- 로그인 세션이 null이면 로그인 회원가입 -->
        <a href="#">로그인</a> /
        <a href="#">회원가입</a>
       </c:if>
       <c:if test="${!empty mem }"> <!-- 로그인 세션이 null이 아니면 마이페이지,장바구니 -->
       <a href="#">마이페이지</a>
       <a href="#">장바구니</a>
       </c:if>
    </div> --%>
		<nav class="navbar navbar-expand-md bg-dark navbar-dark">
    <!-- 내비게이션 링크 -->
    <div class="collapse navbar-collapse" id="collapsibleNavbar">
      <ul class="navbar-nav">
       <li class="nav-item dropdown">
	      <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
	        카테고리
	      </a>
	      <div class="dropdown-menu">
	        <a class="dropdown-item" href="#">카테고리</a>
	        <a class="dropdown-item" href="#">카테고리</a>
	        <a class="dropdown-item" href="#">카테고리</a><!-- 카테고리 미정 -->
	      </div>
	 
	    </li>
        <li class="nav-item">
          <a class="nav-link" href="#">홈</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">추천</a><!-- 로그인시에는 회원의 어울리는 퍼스널컬러 상품,비로그인시에는 무난?한 상품 -->
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">베스트</a><!-- 잘팔린 상품 -->
        </li>
      </ul>

      <!-- 검색폼 -->
      <form class="form-inline ml-auto" action="search_list.do" method="get">
         <input class="form-control mr-sm-2" type="text" placeholder="검색" name="keyword"><!-- 세션으로 검색기록뜨게 하거나 힘들면 테이블로 만들고싶음(세션이나 쿠키로아마 가능할듯싶습니다.)  -->
        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>
      </form>
    </div>
  </nav>
</div>
</body>
</html>