<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>�ӽ�������</title>
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
		<!-- ��� -->
		<div id="header">
			<jsp:include page="../temp/top.jsp" flush="false" />
		</div>
		<!-- ������ -->
		<div id="container">
			<div class="menu_bar">
				<jsp:include page="../main/index.jsp" flush="false" />
			</div>
			<h1 align="center">�ӽ��������Դϴ�</h1>
			<hr>

			<table>
				<caption>������Ʈ�� �̵�</caption>
				<tr>
					<th><a href="top.do">top (�ֻ�� ������Ʈ)</a></th>
					<th><a href="menubar.do">�޴���</a></th>
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
				<caption>�������� �̵�</caption>
				<tr>
					<th><a href="login.do">�α���������</a></th>
					<th><a href="regist.do">ȸ������������</a></th>
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
		<!-- Ǫ�� -->
		<div id="footer"><jsp:include page="../temp/footer.jsp"
				flush="false" />
		</div>
	</div>
</body>
</html>