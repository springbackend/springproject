<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>

<script type="text/javascript">
	function check() {
		let joinForm = document.joinForm;
		let id = joinForm.id.value;
		if (id.length == 0 || id == "") {
			alert("아이디를 입력해주세요.");
			joinForm.id.focus();
		} else {
			window.open("${contextPath}/dbCheckid.do?user_id=" + id, "",
					"width=500,height=300");
		}

	}
	function join(f) {

		let joinForm = document.joinForm;
		let name = joinForm.name.value;
		let id = joinForm.id.value;
		let pwd = joinForm.pwd.value;
		let rePwd = joinForm.rePwd.value;
		let email = joinForm.email.value;

		//유효성 검증로직
		if (name.length == 0 || name == "") {
			alert("이름을 입력해주세요");
			joinForm.name.focus();
		} else if (joinForm.idDuplication.value != "idCheck") {
			alert("아이디 중복체크를 해주세요.");
		} else if (pwd.length == 0 || pwd == "") {
			alert("비밀번호를 입력해주세요");
			joinForm.pwd.focus();
		} else if (rePwd.length == 0 || rePwd == "") {
			alert("비밀번호를 다시 입력해주세요.");
			joinForm.rePwd.focus();

		} else if (rePwd != pwd) {
			alert("입력하신 비밀번호가 다릅니다.");
		} else if (email.length == 0 || email == "") {
			alert("이메일을 입력해주세요");
			joinForm.email.focus();
		} else {
			joinForm.method = "post";
			joinForm.action = "${contextPath}/joinMember.do"
		}

	}
</script>
</head>
<body>
	<form name="joinForm">
		<table border="1" align="center">
			<caption>회원가입페이지</caption>
			<tr>
				<th>아이디</th>
				<td><input id="id"></td>
				<td><input type="button" value="중복확인" onclick="check();"></td>
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
					onclick="join(this.form);"> <input type="button" value="취소"
					onclick='history.go(-1);'></td>
			</tr>
			<!-- reCAPTCHA 추가 -->
		</table>
		<!-- 간편한 로그인을 위해 주소,전화번호는 나중에 결제페이지에서 추가적으로 넣는게 어떤가 싶음-->
	</form>

	<jsp:include page="../temp/footer.jsp" flush="false" />
</body>
</html>