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
	}
</script>
</head>
<body>

	<!-- 로고이미지 위치 -->
	<form action="" method="post">
		<br>
		<table>
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
				<td><input type="checkbox" id="yuji"></td>
				<td>로그인 상태 유지</td>
			</tr>
			<tr>
				<td><input type="button" value="로그인하기"
					onclick="send(this.form);"></td>
				<td><input type="button" value="회원가입하기"
					onclick="location.href='regist.do'"></td>
			</tr>
			<tr>
				<th></th>
				<td></td>
			</tr>

		</table>
	</form>
</body>
</html>