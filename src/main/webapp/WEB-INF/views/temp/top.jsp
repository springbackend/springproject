<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	
</script>
<style>
</style>
</head>
<body>
	<section class="lab-inter">
		<div class="row align-items-center shadow p-3 mb-5 bg-body rounded"
			style="height: 60px;">
			<div class="col" style="width: 200px;" align="left">
				<div>
					<a href="temp.do">temp페이지</a> <a href="main.do">메인</a>
				</div>
			</div>
			<%-- 			<div style="background-color: red; width: 50px;">${sessionScope.status}</div> --%>

			<c:choose>
				<c:when test="${sessionScope.status eq 'succes'}">
					<div class="col" style="width: 200px;" align="right">

						<a href="logout.do">로그아웃</a> <a href="#">${sessionScope.nickname}님
							환영합니다.</a>
					</div>
				</c:when>
				<c:otherwise>
					<div class="col" style="width: 200px;" align="right">
						<a href="login.do">로그인</a> <a>/</a> <a href="#">회원가입</a>
					</div>
				</c:otherwise>
			</c:choose>
		</div>
	</section>

</body>
</html>