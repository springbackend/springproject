<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ӽ�������</title>
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
	<h1 align="center">�ӽ��������Դϴ�</h1>
	<hr>

	<table border="1">
		<caption>������Ʈ�� �̵�</caption>
		<tr>
			<th><a href="top">�ֻ�� ������Ʈ(�ӽÿϷ�)</th>
			<th><a href="#">�޴���</a></th>
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
		<caption>�������� �̵�</caption>
		<tr>
			<th><a href="login">�α���������</a></th>
			<th><a href="regist">ȸ������������</a></th>
			<th><a href="#">����������</a></th>
			<th><a href="#">����������</a></th>
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