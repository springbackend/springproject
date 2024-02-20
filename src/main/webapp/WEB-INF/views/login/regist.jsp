<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- 
	보완해야하는부분
	
	이메일 검증
	회원가입 실패 예외처리
	 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<script type="text/javascript" src="/beauty/resources/js/httpRequest.js"></script>
<script type="text/javascript">
	function check() {
		let joinForm = document.joinForm;
		let id = joinForm.id.value;
		let button = document.getElementById("idDuplication");
		//아이디정규식
		let regExp = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;

		if (id.length == 0 || id == "") {
			alert("아이디를 입력해주세요.");
			joinForm.id.focus();
			return;
		} else if (id.length < 5) {
			alert("아이디는 5글자 이상이여야 합니다");
			return;
		} else if (regExp.test(id)) {
			alert("특수문자는 입력할 수 없습니다.");
			return;
		} else {
			let url = "checkid.do";
			let param = "id=" + id;
			sendRequest(url, param, resultCheck, "POST");
			document.getElementById("id").readOnly = true;
			button.disabled = true;
			/* window.open("/beauty/checkid.do?id=" + id, "",
					"width=500,height=300"); 
			${contextPath}
			 */

		}
	}
	function resultCheck() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			let result = decodeURI(decodeURIComponent(xhr.responseText));
			if (result == "can") {
				alert("사용하실수 있는 아이디입니다");
				button.disabled = true;
			}
			if (result == "cant") {
				alert("중복된 아이디 입니다");
				document.getElementById("id").readOnly = false;
				button.disabled = false;
			}
		}

	}
	function join(f) {
		let joinForm = document.joinForm;
		let id = joinForm.id.value;
		let name = joinForm.name.value;
		let pwd = joinForm.pwd.value;
		let rePwd = joinForm.rePwd.value;
		let pnum = joinForm.pnum.value;
		let email = joinForm.email.value;
		//아직 미완성
		let button_state = document.getElementById("idDuplication").value;
		let idCheck = true;
		let selectedGenderElement = document
				.querySelector('input[name="gender"]:checked');
		//비밀번호 정규식
		let regpwd = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/;
		//이메일 정규식
		//let regex = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/;
		//유효성 검증로직
		if (document.getElementById("id").readOnly != true) {
			alert("아이디 중복체크를 해주세요.");
			return;
		} else if (name.length == 0 || name == "") {
			alert("닉네임을 입력해주세요");
			joinForm.name.focus();
			return;
		} else if (pwd.length == 0 || pwd == "") {
			alert("비밀번호를 입력해주세요");
			joinForm.pwd.focus();
			return;
		} else if (!regpwd.test(pwd)) {
			alert("비밀번호는 영문 숫자 조합 8자리 이상이여야 합니다");
			return;
		} else if (rePwd.length == 0 || rePwd == "") {
			alert("비밀번호를 다시 입력해주세요.");
			joinForm.rePwd.focus();
			return;
		} else if (pnum.length == 0 || pnum == "") {
			alert("전화번호를 입력하세요");
			return;
		} else if (rePwd != pwd) {
			alert("입력하신 비밀번호가 다릅니다.");
			return;
		} else if (email.length == 0 || email == "") {
			alert("이메일을 입력해주세요");
			joinForm.email.focus();
			return;
		} 
	/* else if (regex.test(email)) {
				alert("이메일을 제대로 입력해주세요");
			}  */else if (selectedGenderElement == null) {
			alert("성별을 선택하세요.");
			return;
		} else {
			let gender = selectedGenderElement.value;
			url = "/beauty/joinuser.do";
			let param = "id=" + id + "&name=" + name + "&pwd=" + pwd
					+ "&email=" + email + "&gender=" + gender + "&pnum=" + pnum;
			sendRequest(url, param, resultFn, "post");
		}
	}
	function resultFn() {
		//회원가입 결과
		if (xhr.readyState == 4 && xhr.status == 200) {
			let result = decodeURI(decodeURIComponent(xhr.responseText));
			// encodeURIComponent();
			alert(result);
			if (result == "성공") {
				alert("가입을 환영합니다!");
				//	회원가입에 성공했습니다. 윈도우 호출
				location.href = "/beauty/login.do";
				/* window.open(link); */
			} else {
				alert("서비스 문제로 회원가입에 실패했습니다 \n 처음부터 다시 해주시길바랍니다.");
				location.href = "beauty/regist.do";
			}
		}
	}
</script>
</head>
<body>
	<jsp:include page="../comp/top.jsp"></jsp:include>
	<h1 align="center">회원가입</h1>
	<form name="joinForm" class="nav justify-content-center">

		<div
			style="width: 400px; border-color: aqua; border-radius: 40px; padding: 20px;"
			class="nav-item border">
			<div class="col">
				<div class="col">
					<label for="id">아이디</label> <input class="form-control" type="text"
						id="id">
					<div style="margin-top: 10px;"></div>
					<button class="btn btn-primary" type="button" id="idDuplication"
						onclick="check();">중복확인</button>
					<div style="margin-bottom: 10px;"></div>
				</div>
				<div class="col">
					<label for="name">닉네임</label>
					<div>
						<input class="form-control" type="text" id="name">
					</div>
				</div>
				<div class="col">
					<label for="pwd">비밀번호</label>
					<div>
						<input class="form-control" type="password" id="pwd">
					</div>
				</div>

				<div class="col">
					<label for="repwd">비밀번호 확인</label>
					<div>
						<input class="form-control" type="password" id="rePwd">
					</div>
				</div>
				<div class="col">
					<label for="pnum">전화번호</label>
					<div>
						<input class="form-control" id="pnum" type="text">
					</div>
				</div>
				<div class="col">
					<label for="email">이메일</label>
					<div>
						<input class="form-control" id="email">
					</div>
				</div>
				<div class="col">
					<div style="margin-top: 10px; margin-bottom: 10px;">성별</div>
					<div class="row" style="margin-left: 10px;">
						<div>
							<input type="radio" name="gender" id="gen1" value="남성"><label
								for="gen1">남성</label>
						</div>
						<div style="width: 100px"></div>
						<div>
							<input type="radio" name="gender" id="gen2" value="여성"><label
								for="gen2">여성</label>
						</div>
					</div>
					<div class="col" style="margin: 10px;">
						<div class="mb-4">
							<input class="btn btn-primary btn-lg btn-block" type="button"
								value="가입하기" onclick="join(this.form);">
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 간편한 로그인을 위해 주소,전화번호는 나중에 결제페이지에서 추가적으로 넣는게 어떤가 싶음-->
	</form>
	<jsp:include page="../comp/footer.jsp" flush="false" />
</body>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>