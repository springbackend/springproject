<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시페이지</title>
<style type="text/css">
.menu_bar {
	width: 100%;
}

table, th, td {
	border: 1px solid black;
	width: 600px;
}

th, td {
	text-align: center;
	height: 40px;
	width: 100px;
}
</style>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div id="wrap">
		<!-- 헤더 -->
		<div id="header">
			<jsp:include page="../temp/top.jsp" flush="false" />
		</div>
		<!-- 컨텐츠 -->
		<div id="container col">
			<div class="menu_bar">
				<jsp:include page="../main/index.jsp" flush="false" />
			</div>
			<hr>
			<h1 align="center">임시페이지입니다</h1>
			<hr>
			<div class="row">
				<div class="col" style="width: 20px"></div>
				<div class="col">
					<table class="table">
						<caption>컴포넌트로 이동</caption>
						<tr>
							<td><a href="top.do">top</a></td>
							<td><a href="menubar.do">menubar</a></td>
							<td><a href="footer.do">footer</a></td>
							<td><a href="index.do">index</a></td>
						</tr>
						<tr>
							<th><a href="header.do">header</a></th>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
						</tr>

						<tr>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
						</tr>
						<tr>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
						</tr>

					</table>
					<br> <br> <br>
					<table class="table">
						<caption>페이지로 이동</caption>
						<tr>
							<th><a href="login.do">로그인페이지</a></th>
							<th><a href="regist.do">회원가입페이지</a></th>
							<th><a href="main.do">메인페이지</a></th>
							<th><a href="mypage.do">마이페이지</a></th>
						</tr>
						<tr>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
						</tr>
						<tr>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
						</tr>
						<tr>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
						</tr>
						<tr>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
							<th><a href="#">====</a></th>
						</tr>
					</table>
				</div>
				<div class="col" style="width: 20px"></div>
			</div>
		</div>
	</div>
	<!-- 푸터 -->
	<div>
		<jsp:include page="../temp/footer.jsp" flush="false" />
	</div>
</body>
</html>