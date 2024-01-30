<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시페이지</title>
<style type="text/css">
#container {
	display: flex;
	flex-direction: column;
	align-items: center;
}

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

input {
	width: 100% 100%;
}

#footer {
	align-items: center;
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
		<div id="container">
			<div class="menu_bar">
				<jsp:include page="../main/index.jsp" flush="false" />
			</div>
			<h1 align="center">임시페이지입니다</h1>
			<hr>

			<table>
				<caption>컴포넌트로 이동</caption>
				<tr>
					<th><a href="top.do">top (최상단 컴포넌트)</a></th>
					<th><a href="menubar.do">메뉴바</a></th>
					<th><a href="footer.do">footer</a></th>
					<th><a href="index.do">index</a></th>
				</tr>
				<tr>
					<th><a href="#">header</a></th>
					<th><a href="#">temp</a></th>
					<th><a href="#">temp</a></th>
					<th><a href="#">temp</a></th>
				</tr>

				<tr>
					<th><a href="#">temp</a></th>
					<th><a href="#">temp</a></th>
					<th><a href="#">temp</a></th>
					<th><a href="#">temp</a></th>
				</tr>
				<tr>
					<th><a href="#">temp</a></th>
					<th><a href="#">temp</a></th>
					<th><a href="#">temp</a></th>
					<th><a href="#">temp</a></th>
				</tr>

			</table>
			<br>
			<hr>
			<table>
				<caption>페이지로 이동</caption>
				<tr>
					<th><a href="login.do">로그인페이지</a></th>
					<th><a href="regist.do">회원가입페이지</a></th>
					<th><a href="#">메인페이지</a></th>
					<th><a href="#">마이페이지</a></th>
				</tr>
				<tr>
					<th><a href="#">temp</a></th>
					<th><a href="#">temp</a></th>
					<th><a href="#">temp</a></th>
					<th><a href="#">temp</a></th>
				</tr>
				<tr>
					<th><a href="#">temp</a></th>
					<th><a href="#">temp</a></th>
					<th><a href="#">temp</a></th>
					<th><a href="#">temp</a></th>
				</tr>
				<tr>
					<th><a href="#">temp</a></th>
					<th><a href="#">temp</a></th>
					<th><a href="#">temp</a></th>
					<th><a href="#">temp</a></th>
				</tr>
				<tr>
					<th><a href="#">temp</a></th>
					<th><a href="#">temp</a></th>
					<th><a href="#">temp</a></th>
					<th><a href="#">temp</a></th>
				</tr>
			</table>
		</div>
		<!-- 푸터 -->
		<div id="footer"><jsp:include page="../temp/footer.jsp"
				flush="false" />
		</div>
	</div>
</body>
</html>