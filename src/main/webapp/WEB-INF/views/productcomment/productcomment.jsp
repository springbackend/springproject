<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>리뷰 보기</title>
<link
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.1/css/all.min.css"
	rel="stylesheet">
<style>
.review-card {
	margin-bottom: 20px;
}

.review-image {
	max-height: 200px;
	object-fit: cover;
}

.like-count {
	color: #f00;
}

.rating {
	color: #ffc107; /* 별의 색상 */
	font-size: 24px; /* 별의 크기 */
}

.rating i {
	margin-right: 4px; /* 별 사이의 간격 */
}
.img-responsive {
  width: 20%;
  height: auto;
}
</style>
</head>
<body>
	<div class="container mt-3">
		<h2>리뷰 목록</h2>
		<c:forEach var="pc" items="${list }">
			<div class="row">
				<!-- 리뷰 카드 예시 -->
				<div class="col-md">
					<div class="card review-card">
					<h5 class="card-title">${pc.u_id }</h5>
					<div class="rating">
								<c:set var="pc_star" value="${pc.pc_star }" />
								<c:forEach begin="1" end="${pc_star}" var="i">
									<i class="fas fa-star"></i>
								</c:forEach>
								<c:forEach begin="${pc_star + 1}" end="5" var="i">
									<i class="far fa-star"></i>
								</c:forEach>
								<span style="color: black;">${fn:split( pc.pc_regidate, ' ' )[0] }</span>
					</div>
					
						<img src="resources/productimages/${pc.pc_image }" class="img-responsive"
							alt="리뷰 이미지">
						<div class="card-body">
							
							<p class="card-text">${pc.pc_content }</p>
							
							<button class="btn btn-light" onclick="send(${pc.pc_idx})">
							<c:if test="${pc.check eq false }">
								<i class="far fa-thumbs-up" ></i> 좋아요${pc.pc_good }
							</c:if>
							<c:if test="${pc.check eq true }">
								<i class="fas fa-thumbs-up" ></i> 좋아요${pc.pc_good }
							</c:if>
							</button>
						</div>
					</div>
				</div>
			</div>
		</c:forEach>
		<div class="text-center">
            ${page }
        </div>
	</div>
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>