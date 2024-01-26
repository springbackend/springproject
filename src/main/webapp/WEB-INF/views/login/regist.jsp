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
		let button = document.getElementById("idDuplication");
		//정규식
		let regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;
		//유효성 검증후에 controller로 보내서 중복아이디 있는지 확인시킴
		if (id.length == 0 || id == "") {
			alert("아이디를 입력해주세요.");
			joinForm.id.focus();
		} else if (id.length < 5) {
			alert("아이디는 5글자 이상이여야 합니다");
		} else if (regExp.test(id)) {
			alert("특수문자는 입력할 수 없습니다.");
		} else {
			window.open("${contextPath}/dbCheckid.do?user_id=" + id, "",
					"width=500,height=300");
			document.getElementById("id").readOnly = true;
			button.disabled = true;
		}
	}
	function join(f) {
		let joinForm = document.joinForm;
		let name = joinForm.name.value;
		let id = joinForm.id.value;
		let pwd = joinForm.pwd.value;
		let rePwd = joinForm.rePwd.value;
		let email = joinForm.email.value;
		let idCheck = true;
		let selectedGenderElement = document
				.querySelector('input[name="gender"]:checked');
		let regpwd = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/;
		let regemail = /^[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,}$/i;

		/* 		alert("name:" + name + "\nid" + id + "\npwd" + pwd + "\nrePwd " + rePwd
		 + "gender" + selectedGender); */
		//유효성 검증로직
		if (document.getElementById("id").readOnly != true) {
			alert("아이디 중복체크를 해주세요.");
		} else if (name.length == 0 || name == "") {
			alert("닉네임을 입력해주세요");
			joinForm.name.focus();
		} else if (pwd.length == 0 || pwd == "") {
			alert("비밀번호를 입력해주세요");
			joinForm.pwd.focus();
		} else if (!regpwd.test(pwd)) {
			alert("비밀번호는 영문 숫자 조합 8자리 이상이여야 합니다");
		} else if (rePwd.length == 0 || rePwd == "") {
			alert("비밀번호를 다시 입력해주세요.");
			joinForm.rePwd.focus();
		} else if (rePwd != pwd) {
			alert("입력하신 비밀번호가 다릅니다.");
		} else if (email.length == 0 || email == "") {
			alert("이메일을 입력해주세요");
			joinForm.email.focus();
		} else if (regemail.test(email)) {
			alert("이메일을 제대로 입력해주세요.");
		} else if (selectedGenderElement == null) {
			alert("성별을 선택하세요.");
		} else {
			let gender = selectedGenderElement.value;
			alert("유효성 통과");
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
				<td><input type="text" id="id"></td>
				<td><button type="button" id="idDuplication" onclick="check();">중복확인</button>
					<label></label></td>
			</tr>
			<tr>
				<td colspan="3"><a>특수문자,공백 제외 </a></td>
			</tr>
			<tr>
				<th>닉네임</th>
				<td><input id="name"></td>
				<td></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" id="pwd"></td>
				<td></td>
			</tr>
			<tr>
				<th>비밀번호 확인</th>
				<td><input type="password" id="rePwd"></td>
				<td></td>
			</tr>

			<tr>
				<th>이메일</th>
				<td><input id="email"></td>
				<td></td>
			</tr>
			<tr>
				<th>성별</th>
				<td><input type="radio" name="gender" id="gen1" value="남성">남성
					<input type="radio" name="gender" id="gen2" value="여성">여성</td>
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