<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../comp/top.jsp"></jsp:include>
	<!-- 홈페이지 기본 내비게이션바-->
	<jsp:include page="index.jsp" />
	<main>
		여기에 아직 어떤 카테고리 띄울지는 모르지만, 상품들 띄울예정(보여질것들:사진,가격,상품이름) 예)베스트 상품 5개, 할인중인
		상품 5개, 추천 상품 5개 (카테고리는 상관없이)
		<!--  -->
		<!--  -->
		<!--  -->
		<!-- 	<div id="carouselExampleAutoplaying" class="carousel slide"
		data-bs-ride="carousel">
		<div class="carousel-inner">
			<div class="carousel-item active">
				<img src="resources/images/logo.png" alt="...">
			</div>
			<div class="carousel-item">
				<img src="resources/images/logotemp.png" alt="...">
			</div>
			<div class="carousel-item">
				<img src="resources/images/temp.png" alt="...">
			</div>
		</div>
		<button class="carousel-control-prev" type="button"
			data-bs-target="#carouselExampleAutoplaying" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Previous</span>
		</button>
		<button class="carousel-control-next" type="button"
			data-bs-target="#carouselExampleAutoplaying" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span> <span
				class="visually-hidden">Next</span>
		</button>
	</div>
 -->
		<section>
			<div id="carouselExampleControls" class="carousel slide"
				data-bs-ride="carousel">
				<ul class="carousel-indicators">
					<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
					<li data-target="#myCarousel" data-slide-to="1"></li>
					<li data-target="#myCarousel" data-slide-to="2"></li>
				</ul>
				<div class="carousel-inner">
					<div class="carousel-item active">
						<img src="resources/images/logotemp.png" width="1100" height="500">
					</div>
					<div class="carousel-item ">
						<img src="resources/images/logo.png" width="1100" height="500">
					</div>
					<div class="carousel-item">
						<img src="resources/images/temp.png" width="1100" height="500">
					</div>
				</div>
				<button class="carousel-control-prev" type="button"
					data-bs-target="#carouselExampleControls" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</button>
				<button class="carousel-control-next" type="button"
					data-bs-target="#carouselExampleControls" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</button>
			</div>
		</section>
	</main>
	<%-- <jsp:include page="../comp/footer.jsp"></jsp:include> --%>
</body>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>