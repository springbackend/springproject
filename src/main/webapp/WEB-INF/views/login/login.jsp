<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>

<script type="text/javascript">
	function send(f) {
		alert('login button 호출');
		let id = document.getElementById("id").value;
		let pwd = document.getElementById("pwd").value;
		let url = "login.do";
		let param = "id" + id + "pwd" + pwd;
		sendRedirect(url, param, resultFn, "POST");
	}
	function resultFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			alert(xhr.responseText);
		}
	}
</script>
</head>
<body>

	<!-- 로고이미지 위치 -->
	<a href="#" align="center">로고이미지</a>
	<hr>
	<form action="" method="post">
		<br>
		<table align="center">
			<tr>
				<th>아이디</th>
				<td>
					<!-- 아이디 아이콘 --> <input id="id">
				</td>
			</tr>
			<tr>
				<th>패스워드</th>
				<td>
					<!-- 패스워드 아이콘 --> <input id="pwd" type="password">
				</td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" value="로그인하기"
					onclick="send(this.form);"></td>
			</tr>
			<tr>
				<td><input type="checkbox" id="yuji"></td>
				<td>로그인 상태 유지</td>
			</tr>
			<tr>
				<td><input type="button" value="아이디 찾기"
					onclick="location.href='regist.do'"></td>
				<td><input type="button" value="비밀번호 찾기"
					onclick="location.href='regist.do'"></td>
				<td><input type="button" value="회원가입하기"
					onclick="location.href='regist.do'"></td>
			</tr>
			<tr>
				<th></th>
				<td></td>
			</tr>

		</table>
	</form>
	<hr>
	<table align="center">
		<tr>
			<td><a href="#">미니로고</a></td>
			<td><a href="#">문의하기</a></td>
		</tr>
	</table>
</body>
</html>