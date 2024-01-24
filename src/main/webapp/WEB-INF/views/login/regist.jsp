<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>

<script type="text/javascript">
	function send(f) {
		alert("요청됨");
		f.submit();
	}
</script>
</head>
<body>
	<form action="" method="post">
		<table border="1">
			<caption>회원가입페이지</caption>
			<tr>
				<th>아이디</th>
				<td><input id="id"></td>
				<td><input type="button" value="중복확인"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="pwd"></td>
				<td></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" id="checkpwd"></td>
				<td></td>
			</tr>

			<tr>
				<th>이메일</th>
				<td><input id="email"></td>
				<td></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="성별" value="male"><label>남성</label>
					<input type="radio" name="성별" value="female"><label>여성</label></td>
				<td></td>
			</tr>
			<tr>
				<td colspan="3"><input type="button" value="가입하기"
					onclick="send(this.form);"> <input type="button"
					value="취소" onclick='history.go(-1);'></td>
			</tr>
			<!-- reCAPTCHA 추가 -->
		</table>
		<!-- 간편한 로그인을 위해 주소,전화번호는 나중에 결제페이지에서 추가적으로 넣는게 어떤가 싶음-->
	</form>
</body>
</html>