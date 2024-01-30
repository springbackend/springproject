<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

	<div class="container mt-4">
		<div class="row">
		<c:forEach var="product" items="${list }">
			<div class="col-md-4 mb-3">
				<div class="card">
					<img src="상품이미지URL" class="card-img-top" alt="상품 이미지">
					<div class="card-body">
						<h5 class="card-title">${product.p_name }</h5>
						<p class="card-text">${product.p_content }</p>
						<a href="#" class="btn btn-primary">자세히 보기</a>
					</div>
				</div>
			</div>
		</c:forEach>
		
			
		</div>
		 <div class="text-center">
        ${page }
   		 </div>
	</div>

	<!-- 부트스트랩 JS 파일 동적기능이 동작 -->
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	
</body>
</html>