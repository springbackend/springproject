<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>임시페이지</title>
<style type="text/css">
th {
	height: 40px;
	display: table-cell;
}

input {
	width: 100% 100%;
}

table {
	margin: auto;
	padding: auto;
}
</style>
</head>
<body>
	<jsp:include page="../temp/top.jsp" flush="false" />
	<jsp:include page="../main/index.jsp" flush="false" />
	<h1 align="center">임시페이지입니다</h1>
	<hr>

	<table border="1">
		<caption>컴포넌트로 이동</caption>
		<tr>
			<th><a href="top">최상단 컴포넌트(임시완료)</th>
			<th><a href="#">메뉴바</a></th>
			<th><a href="footer">footer</a></th>
			<th><a href="index">index</a></th>
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
	<br>
	<hr>
	<table border="1">
		<caption>페이지로 이동</caption>
		<tr>
			<th><a href="login">로그인페이지</a></th>
			<th><a href="regist">회원가입페이지</a></th>
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
			<td><a href="#">temp</a></td>
			<td><a href="#">temp</a></td>
			<td><a href="#">temp</a></td>
			<td><a href="#">temp</a></td>
		</tr>
		<tr>
			<th><a href="#">temp</a></th>
			<th><a href="#">temp</a></th>
			<th><a href="#">temp</a></th>
			<th><a href="#">temp</a></th>
		</tr>
		<tr>
			<td><a href="#">temp</a></td>
			<td><a href="#">temp</a></td>
			<td><a href="#">temp</a></td>
			<td><a href="#">temp</a></td>
		</tr>
	</table>

	<jsp:include page="../temp/footer.jsp" flush="false" />
</body>
</html>