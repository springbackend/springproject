<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

<title>Insert title here</title>
</head>
<script src="/beauty/resources/js/httpRequest.js"></script>
<script type="text/javascript">
document.addEventListener('DOMContentLoaded', function() {
	$('.dropdown-toggle').dropdown('update');
    let searchInput = document.getElementById('searchInput');

    searchInput.addEventListener('input', function() {
        let inputVal = this.value;
        // 사용자 정의 함수 호출
        searchkeyword(inputVal);
    });
});

function searchkeyword(keyword) {
	
	let url = "search_keyword.do";
	let param = "keyword="+keyword;
	sendRequest(url,param,resultKeyword,'post');
}

function resultKeyword() {
	 if (xhr.readyState == 4 && xhr.status == 200) {
	        let data = xhr.responseText;
	        let productNames = JSON.parse(data); // JSON 문자열을 문자열 배열로 변환

	        // 드롭다운 메뉴를 찾고 기존 항목을 지움
	        let dropdownMenu = document.querySelector('#searchResultsDropdown');
	        dropdownMenu.innerHTML = '';
	        if (productNames.length > 0) {
	            productNames.forEach(function(productName) {
	            	 let dropdownItem = document.createElement('a');
	                 dropdownItem.classList.add('dropdown-item');
	                 dropdownItem.href = 'search_list.do?keyword='+productName; // 여기에 실제 제품 페이지나 기능을 연결 가능
	                 dropdownItem.textContent = productName; // 직접 문자열을 사용

	                // 드롭다운 메뉴에 항목을 추가
	                dropdownMenu.appendChild(dropdownItem);
	            });

	            // 드롭다운 메뉴를 보이도록
	            $(dropdownMenu).addClass('show');
	        } else {
	            // 검색 결과가 없을 경우 드롭다운 메뉴를 숨김
	            $(dropdownMenu).removeClass('show');
	        }
	    }
}
function search_list(f) {
	let keyword = f.keyword.value.trim();
	if(keyword == ''){
		alert('검색어를 입력하세요');
		return;
	}
	f.submit();
}
</script>
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
          <a class="nav-link" href="temp.do">홈</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#">추천</a><!-- 로그인시에는 회원의 어울리는 퍼스널컬러 상품,비로그인시에는 무난?한 상품 -->
        </li>
        <li class="nav-item">
          <a class="nav-link" href="product_best_list.do">베스트</a><!-- 잘팔린 상품 -->
        </li>
      </ul>

      <!-- 검색폼 -->
      <form class="form-inline ml-auto" action="search_list.do" method="get">
    <div class="dropdown">
        <input type="text" class="form-control dropdown-toggle" placeholder="Search" id="searchInput" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" name="keyword">
        <div class="dropdown-menu" id="searchResultsDropdown" aria-labelledby="searchInput">
        
        </div>
    </div>
    <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="search_list(this.form)">검색</button>
</form>
    </div>
  </nav>
</div>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>