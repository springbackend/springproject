<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>회원가입 페이지</title>
		<script type="text/javascript" src="/beauty/resources/js/httpRequest.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
		<style>
			.outer{border:1px solid #eee;
				   width:30%;
				   border-color:#eee;
				   align-items:center; 
				   border-radius: 5px; 
				   padding: 30px; 
				   margin-top: 40px;
				   box-shadow:0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
				   height:auto;}
					
			.id-div, .pwd-div, .name-div, .pnum-div, .email-div
				 {border:1px solid #ccc;
				  width:80%;
		  		  padding:10px;
		   	 	  display:flex;
		   		  align-items:left;
		   		  border-radius:4px;
		   		  margin-bottom:5px;}
		   		  
			.id-div{display:inline-block;}
			
			#id-icon{margin-right:7px;}		
			   		  
			.pwd-div span, .name-div span, .pnum-div span, .email-div span
				{margin-right:10px;
				 color:#595959;}
			input{border:none;
				  width:80%;}
			
			input:focus{outline:none;}
			
			/* 중복확인 버튼 */
			.duplicate-btn{border-radius:50px;
						   font-size:15px;
						   padding:10px;
						   background-color:#ff66c4;
						   color:white;
						   border:none;}
			
			/* 회원가입 버튼 */
			#join-btn{width:100%;
					   height:10%;
					   border-radius:4px;
					   background-color:#ff66c4;
					   color:white;
					   border:none;
					   font-size:20px;
					   margin-bottom:5px;}
			
			#join-btn:hover{background-color:#1c5838;}
			
			.gender-check{width:80%;}
			
			.gender-container {
				  /* display: block; */
				  position: relative;
				  padding-left: 35px;
				  margin-bottom: 12px;
				  margin-right:20px;
				  margin:8px 20px 12px 0;
				  cursor: pointer;
				  font-size: 15px;
				  -webkit-user-select: none;
				  -moz-user-select: none;
				  -ms-user-select: none;
				  user-select: none;
				}
				
				/* Hide the browser's default checkbox */
				.gender-container input {
				  position: absolute;
				  opacity: 0;
				  cursor: pointer;
				  height: 0;
				  width: 0;
				}
				
				/* Create a custom checkbox */
				.checkmark {
				  position: absolute;
				  top: 0;
				  left: 0;
				  height: 25px;
				  width: 25px;
				  background-color: #eee;
				}
				
				/* On mouse-over, add a grey background color */
				.gender-container:hover input ~ .checkmark {
				  background-color: #ccc;
				}
				
				/* When the checkbox is checked, add a blue background */
				.gender-container input:checked ~ .checkmark {
				  background-color: #ff66c4;
				}
				
				/* Create the checkmark/indicator (hidden when not checked) */
				.checkmark:after {
				  content: "";
				  position: absolute;
				  display: none;
				}
				
				/* Show the checkmark when checked */
				.gender-container input:checked ~ .checkmark:after {
				  display: block;
				}
				
				/* Style the checkmark/indicator */
				.gender-container .checkmark:after {
				  left: 9px;
				  top: 5px;
				  width: 5px;
				  height: 10px;
				  border: solid white;
				  border-width: 0 3px 3px 0;
				  -webkit-transform: rotate(45deg);
				  -ms-transform: rotate(45deg);
				  transform: rotate(45deg);
				}
			
		</style>
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
			if (result == "cant") {
				alert("중복된 아이디 입니다");
				document.getElementById("name").readOnly = false;
				button.disabled = false;
			}
		}

	}
	function checkEmail() {

	}
	function checkEmailresultFn() {

	}
	function join(f) {
		let joinForm = document.joinForm;
		let button_state = document.getElementById("idDuplication").value;

		//파라미터
		let name = joinForm.name.value;
		let email = joinForm.email.value;
		let pwd = joinForm.password.value;

		//검증
		let rePwd = joinForm.confirmPassword.value;
		let idCheck = true;
		let selectedGenderElement = document
				.querySelector('input[name="gender"]:checked');
		//비밀번호 정규식
		let regpwd = /^(?=.*[a-zA-Z])(?=.*[0-9]).{8,25}$/;
		//이메일 정규식
		//let regex = /^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$/;
		//유효성 검증로직
		/* if (document.getElementById("id").readOnly != true) {
			alert("닉네임 중복체크를 해주세요.");
			return;
		} else if (name.length == 0 || name == "") {
			alert("닉네임을 입력해주세요");
			joinForm.name.focus();
			return;
		} else if (email.length == 0 || email == "") {
			alert("이메일을 입력해주세요");
			joinForm.email.focus();
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
		} else if (rePwd != pwd) {
			alert("입력하신 비밀번호가 다릅니다.");
			return;
		} else { */
		url = "/beauty/join.do";
		let param = "email=" + email + "&name=" + name + "&pwd=" + pwd;
		sendRequest(url, param, resultFn, "post");

		/* } */
	}
	function resultFn() {
		//회원가입 결과

		if (xhr.readyState == 4 && xhr.status == 200) {
			let result = decodeURI(decodeURIComponent(xhr.responseText));
			if (result == "성공") {
				alert("가입을 환영합니다!");
				location.href = "/beauty/login.do";
			} else {
				alert("서비스 문제로 회원가입에 실패했습니다 \n 처음부터 다시 해주시길바랍니다.");
				location.href = "/beauty/regist.do";
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
			
			/* 체크박스 하나만 선택 가능하게 함 */
			function onCheck(checkbox){
			    let checkboxes = document.getElementsByName('gender');
			    for(let i = 0; i < checkboxes.length; i++){
			    	if(checkboxes[i].value != checkbox) {
			    		checkboxes[i].checked = false;
			    	}
			    }
			}
		</script>
	</head>
	<body>
		<%-- <jsp:include page="/WEB-INF/views/main/index.jsp" /> --%>
		<h1 align="center">회원가입</h1>
		<form name="joinForm" class="nav justify-content-center">
			<div class="outer">
				<div class="id-div">
					<span id="id-icon" class="bi bi-person"></span>
					<input id="id" type="text" placeholder="아이디">
				</div> &nbsp;
				<button class="duplicate-btn" type="button" id="idDuplication"
							onclick="check();">중복확인</button>
						<div class="mb-3 text-start">
							<label class="form-label" for="email">이메일 주소</label><input
								class="form-control" id="email" type="email"
								placeholder="name@example.com" />
						</div>
						<div class="row g-3 mb-3">
							<div class="col-sm-6">
								<label class="form-label" for="password">비밀번호</label><input
									class="form-control form-icon-input" id="password"
									type="password" placeholder="Password" />
							</div>
							<div class="col-sm-6">
								<label class="form-label" for="confirmPassword">비밀번호 확인</label><input
									class="form-control form-icon-input" id="confirmPassword"
									type="password" placeholder="Confirm Password" />
							</div>
						</div>
						<div class="form-check mb-3">
							<input class="form-check-input" id="termsService" type="checkbox" /><label
								class="form-label fs-9 text-transform-none" for="termsService"><a
								href="#!">이용 약관 </a>과 <a href="#!">개인정보 보호방침</a>에 동의합니다 </label>
						</div>
						<button class="btn btn-primary w-100 mb-3"
							onclick="join(this.form);">회원가입</button>
						<div class="text-center">
							<a class="fs-9 fw-bold" href="login.do">기존 계정으로 로그인</a>
						</div>
					</form>
				</div>
			</div>
		</div>
		<div class="support-chat-container">
			<div class="container-fluid support-chat">
				<div class="card bg-body-emphasis">
					<div
						class="card-header d-flex flex-between-center px-4 py-3 border-bottom border-translucent">
						<h5 class="mb-0 d-flex align-items-center gap-2">
							Demo widget<span class="fa-solid fa-circle text-success fs-11"></span>
						</h5>
						<div class="btn-reveal-trigger">
							<button
								class="btn btn-link p-0 dropdown-toggle dropdown-caret-none transition-none d-flex"
								type="button" id="support-chat-dropdown"
								data-bs-toggle="dropdown" data-boundary="window"
								aria-haspopup="true" aria-expanded="false"
								data-bs-reference="parent">
								<span class="fas fa-ellipsis-h text-body"></span>
							</button>
							<div class="dropdown-menu dropdown-menu-end py-2"
								aria-labelledby="support-chat-dropdown">
								<a class="dropdown-item" href="#!">Request a callback</a><a
									class="dropdown-item" href="#!">Search in chat</a><a
									class="dropdown-item" href="#!">Show history</a><a
									class="dropdown-item" href="#!">Report to Admin</a><a
									class="dropdown-item btn-support-chat" href="#!">Close
									Support</a>
							</div>
						</div>
					</div>
					<div class="card-body chat p-0">
						<div class="d-flex flex-column-reverse scrollbar h-100 p-3">
							<div class="text-end mt-6">
								<a
									class="mb-2 d-inline-flex align-items-center text-decoration-none text-body-emphasis bg-body-hover rounded-pill border border-primary py-2 ps-4 pe-3"
									href="#!">
									<p class="mb-0 fw-semibold fs-9">I need help with something</p>
									<span class="fa-solid fa-paper-plane text-primary fs-9 ms-3"></span>
								</a><a
									class="mb-2 d-inline-flex align-items-center text-decoration-none text-body-emphasis bg-body-hover rounded-pill border border-primary py-2 ps-4 pe-3"
									href="#!">
									<p class="mb-0 fw-semibold fs-9">I can’t reorder a product
										I previously ordered</p> <span
									class="fa-solid fa-paper-plane text-primary fs-9 ms-3"></span>
								</a><a
									class="mb-2 d-inline-flex align-items-center text-decoration-none text-body-emphasis bg-body-hover rounded-pill border border-primary py-2 ps-4 pe-3"
									href="#!">
									<p class="mb-0 fw-semibold fs-9">How do I place an order?</p> <span
									class="fa-solid fa-paper-plane text-primary fs-9 ms-3"></span>
								</a><a
									class="false d-inline-flex align-items-center text-decoration-none text-body-emphasis bg-body-hover rounded-pill border border-primary py-2 ps-4 pe-3"
									href="#!">
									<p class="mb-0 fw-semibold fs-9">My payment method not
										working</p> <span
									class="fa-solid fa-paper-plane text-primary fs-9 ms-3"></span>
								</a>
							</div>
							<div class="text-center mt-auto">
								<div class="avatar avatar-3xl status-online">
									<img class="rounded-circle border border-3 border-light-subtle"
										src="resources/assets/img/team/30.webp" alt="" />
								</div>
								<h5 class="mt-2 mb-3">Eric</h5>
								<p class="text-center text-body-emphasis mb-0">Ask us
									anything – we’ll get back to you here or by email within 24
									hours.</p>
							</div>
						</div>
					</div>
					<div
						class="card-footer d-flex align-items-center gap-2 border-top border-translucent ps-3 pe-4 py-3">
						<div
							class="d-flex align-items-center flex-1 gap-3 border border-translucent rounded-pill px-4">
							<input
								class="form-control outline-none border-0 flex-1 fs-9 px-0"
								type="text" placeholder="Write message" /><label
								class="btn btn-link d-flex p-0 text-body-quaternary fs-9 border-0"
								for="supportChatPhotos"><span class="fa-solid fa-image"></span></label><input
								class="d-none" type="file" accept="image/*"
								id="supportChatPhotos" /><label
								class="btn btn-link d-flex p-0 text-body-quaternary fs-9 border-0"
								for="supportChatAttachment"> <span
								class="fa-solid fa-paperclip"></span></label><input class="d-none"
								type="file" id="supportChatAttachment" />
						</div>
						<button class="btn p-0 border-0 send-btn">
							<span class="fa-solid fa-paper-plane fs-9"></span>
						</button>
					</div>
				</div>
			</div>
			<button class="btn p-0 border border-translucent btn-support-chat">
				<span class="fs-8 btn-text text-primary text-nowrap">Chat
					demo</span><span class="fa-solid fa-circle text-success fs-9 ms-2"></span><span
					class="fa-solid fa-chevron-down text-primary fs-7"></span>
			</button>
		</div>
	</main>
	<!-- ===============================================-->
	<!--    End of Main Content-->
	<!-- ===============================================-->

	<div class="offcanvas offcanvas-end settings-panel border-0"
		id="settings-offcanvas" tabindex="-1"
		aria-labelledby="settings-offcanvas">
		<div
			class="offcanvas-header align-items-start border-bottom flex-column border-translucent">
			<div
				class="pt-1 w-100 mb-6 d-flex justify-content-between align-items-start">
				<div>
					<h5 class="mb-2 me-2 lh-sm">
						<span class="fas fa-palette me-2 fs-8"></span>Theme Customizer
					</h5>
					<p class="mb-0 fs-9">Explore different styles according to your
						preferences</p>
				</div>
				<button class="btn p-1 fw-bolder" type="button"
					data-bs-dismiss="offcanvas" aria-label="Close">
					<span class="fas fa-times fs-8"> </span>
				</button>
			</div>
			<button class="btn btn-phoenix-secondary w-100"
				data-theme-control="reset">
				<span class="fas fa-arrows-rotate me-2 fs-10"></span>Reset to
				default
			</button>
		</div>
		<div class="offcanvas-body scrollbar px-card" id="themeController">
			<div class="setting-panel-item mt-0">
				<h5 class="setting-panel-item-title">Color Scheme</h5>
				<div class="row gx-2">
					<div class="col-4">
						<input class="btn-check" id="themeSwitcherLight"
							name="theme-color" type="radio" value="light"
							data-theme-control="phoenixTheme" /><label
							class="btn d-inline-block btn-navbar-style fs-9"
							for="themeSwitcherLight"> <span
							class="mb-2 rounded d-block"><img
								class="img-fluid img-prototype mb-0"
								src="resources/assets/img/generic/default-light.png" alt="" /></span><span
							class="label-text">Light</span></label>
					</div>
					<div class="col-4">
						<input class="btn-check" id="themeSwitcherDark" name="theme-color"
							type="radio" value="dark" data-theme-control="phoenixTheme" /><label
							class="btn d-inline-block btn-navbar-style fs-9"
							for="themeSwitcherDark"> <span
							class="mb-2 rounded d-block"><img
								class="img-fluid img-prototype mb-0"
								src="resources/assets/img/generic/default-dark.png" alt="" /></span><span
							class="label-text"> Dark</span></label>
					</div>
					<div class="col-4">
						<input class="btn-check" id="themeSwitcherAuto" name="theme-color"
							type="radio" value="auto" data-theme-control="phoenixTheme" /><label
							class="btn d-inline-block btn-navbar-style fs-9"
							for="themeSwitcherAuto"> <span
							class="mb-2 rounded d-block"><img
								class="img-fluid img-prototype mb-0"
								src="resources/assets/img/generic/auto.png" alt="" /></span><span
							class="label-text"> Auto</span></label>
					</div>
				</div>
			</div>
			<div
				class="border border-translucent rounded-3 p-4 setting-panel-item bg-body-emphasis">
				<div class="d-flex justify-content-between align-items-center">
					<h5 class="setting-panel-item-title mb-1">RTL</h5>
					<div class="form-check form-switch mb-0">
						<input class="form-check-input ms-auto" type="checkbox"
							data-theme-control="phoenixIsRTL" />
					</div>
				</div>
								
				<div class="gender-check">
					<label for="gen1" class="gender-container">남성
					  <input type="checkbox" id="gen1" name="gender" value="남성" onclick="onCheck(this.value);">
					  <span class="checkmark"></span>
					</label>
					<label for="gen2" class="gender-container">여성
					  <input type="checkbox" id="gen2" name="gender" value="여성" onclick="onCheck(this.value);">
					  <span class="checkmark"></span>
					</label>
				</div>
				<p class="mb-0 text-body-tertiary">Toggle support chat</p>
			</div>
			<div class="setting-panel-item">
				<h5 class="setting-panel-item-title">Navigation Type</h5>
				<div class="row gx-2">
					<div class="col-6">
						<input class="btn-check" id="navbarPositionVertical"
							name="navigation-type" type="radio" value="vertical"
							data-theme-control="phoenixNavbarPosition" /><label
							class="btn d-inline-block btn-navbar-style fs-9"
							for="navbarPositionVertical"> <span
							class="mb-2 rounded d-block"><img
								class="img-fluid img-prototype d-dark-none"
								src="resources/assets/img/generic/default-light.png" alt="" /><img
								class="img-fluid img-prototype d-light-none"
								src="resources/assets/img/generic/default-dark.png" alt="" /></span><span
							class="label-text">Vertical</span></label>
					</div>
					<div class="col-6">
						<input class="btn-check" id="navbarPositionHorizontal"
							name="navigation-type" type="radio" value="horizontal"
							data-theme-control="phoenixNavbarPosition" /><label
							class="btn d-inline-block btn-navbar-style fs-9"
							for="navbarPositionHorizontal"> <span
							class="mb-2 rounded d-block"><img
								class="img-fluid img-prototype d-dark-none"
								src="resources/assets/img/generic/top-default.png" alt="" /><img
								class="img-fluid img-prototype d-light-none"
								src="resources/assets/img/generic/top-default-dark.png" alt="" /></span><span
							class="label-text"> Horizontal</span></label>
					</div>
					<div class="col-6">
						<input class="btn-check" id="navbarPositionCombo"
							name="navigation-type" type="radio" value="combo"
							data-theme-control="phoenixNavbarPosition" /><label
							class="btn d-inline-block btn-navbar-style fs-9"
							for="navbarPositionCombo"> <span
							class="mb-2 rounded d-block"><img
								class="img-fluid img-prototype d-dark-none"
								src="resources/assets/img/generic/nav-combo-light.png" alt="" /><img
								class="img-fluid img-prototype d-light-none"
								src="resources/assets/img/generic/nav-combo-dark.png" alt="" /></span><span
							class="label-text"> Combo</span></label>
					</div>
					<div class="col-6">
						<input class="btn-check" id="navbarPositionTopDouble"
							name="navigation-type" type="radio" value="dual-nav"
							data-theme-control="phoenixNavbarPosition" /><label
							class="btn d-inline-block btn-navbar-style fs-9"
							for="navbarPositionTopDouble"> <span
							class="mb-2 rounded d-block"><img
								class="img-fluid img-prototype d-dark-none"
								src="resources/assets/img/generic/dual-light.png" alt="" /><img
								class="img-fluid img-prototype d-light-none"
								src="resources/assets/img/generic/dual-dark.png" alt="" /></span><span
							class="label-text"> Dual nav</span></label>
					</div>
				</div>
			</div>
			<div class="setting-panel-item">
				<h5 class="setting-panel-item-title">Vertical Navbar Appearance</h5>
				<div class="row gx-2">
					<div class="col-6">
						<input class="btn-check" id="navbar-style-default" type="radio"
							name="config.name" value="default"
							data-theme-control="phoenixNavbarVerticalStyle" /><label
							class="btn d-block w-100 btn-navbar-style fs-9"
							for="navbar-style-default"> <img
							class="img-fluid img-prototype d-dark-none"
							src="resources/assets/img/generic/default-light.png" alt="" /><img
							class="img-fluid img-prototype d-light-none"
							src="resources/assets/img/generic/default-dark.png" alt="" /><span
							class="label-text d-dark-none"> Default</span><span
							class="label-text d-light-none">Default</span></label>
					</div>
					<div class="col-6">
						<input class="btn-check" id="navbar-style-dark" type="radio"
							name="config.name" value="darker"
							data-theme-control="phoenixNavbarVerticalStyle" /><label
							class="btn d-block w-100 btn-navbar-style fs-9"
							for="navbar-style-dark"> <img
							class="img-fluid img-prototype d-dark-none"
							src="resources/assets/img/generic/vertical-darker.png" alt="" /><img
							class="img-fluid img-prototype d-light-none"
							src="resources/assets/img/generic/vertical-lighter.png" alt="" /><span
							class="label-text d-dark-none"> Darker</span><span
							class="label-text d-light-none">Lighter</span></label>
					</div>
				</div>
			</div>
			<div class="setting-panel-item">
				<h5 class="setting-panel-item-title">Horizontal Navbar Shape</h5>
				<div class="row gx-2">
					<div class="col-6">
						<input class="btn-check" id="navbarShapeDefault"
							name="navbar-shape" type="radio" value="default"
							data-theme-control="phoenixNavbarTopShape" /><label
							class="btn d-inline-block btn-navbar-style fs-9"
							for="navbarShapeDefault"> <span
							class="mb-2 rounded d-block"><img
								class="img-fluid img-prototype d-dark-none mb-0"
								src="resources/assets/img/generic/top-default.png" alt="" /><img
								class="img-fluid img-prototype d-light-none mb-0"
								src="resources/assets/img/generic/top-default-dark.png" alt="" /></span><span
							class="label-text">Default</span></label>
					</div>
					<div class="col-6">
						<input class="btn-check" id="navbarShapeSlim" name="navbar-shape"
							type="radio" value="slim"
							data-theme-control="phoenixNavbarTopShape" /><label
							class="btn d-inline-block btn-navbar-style fs-9"
							for="navbarShapeSlim"> <span class="mb-2 rounded d-block"><img
								class="img-fluid img-prototype d-dark-none mb-0"
								src="resources/assets/img/generic/top-slim.png" alt="" /><img
								class="img-fluid img-prototype d-light-none mb-0"
								src="resources/assets/img/generic/top-slim-dark.png" alt="" /></span><span
							class="label-text"> Slim</span></label>
					</div>
				</div>
			</div>
			<div class="setting-panel-item">
				<h5 class="setting-panel-item-title">Horizontal Navbar
					Appearance</h5>
				<div class="row gx-2">
					<div class="col-6">
						<input class="btn-check" id="navbarTopDefault"
							name="navbar-top-style" type="radio" value="default"
							data-theme-control="phoenixNavbarTopStyle" /><label
							class="btn d-inline-block btn-navbar-style fs-9"
							for="navbarTopDefault"> <span
							class="mb-2 rounded d-block"><img
								class="img-fluid img-prototype d-dark-none mb-0"
								src="resources/assets/img/generic/top-default.png" alt="" /><img
								class="img-fluid img-prototype d-light-none mb-0"
								src="resources/assets/img/generic/top-style-darker.png" alt="" /></span><span
							class="label-text">Default</span></label>
					</div>
					<div class="col-6">
						<input class="btn-check" id="navbarTopDarker"
							name="navbar-top-style" type="radio" value="darker"
							data-theme-control="phoenixNavbarTopStyle" /><label
							class="btn d-inline-block btn-navbar-style fs-9"
							for="navbarTopDarker"> <span class="mb-2 rounded d-block"><img
								class="img-fluid img-prototype d-dark-none mb-0"
								src="resources/assets/img/generic/navbar-top-style-light.png"
								alt="" /><img class="img-fluid img-prototype d-light-none mb-0"
								src="resources/assets/img/generic/top-style-lighter.png" alt="" /></span><span
							class="label-text d-dark-none">Darker</span><span
							class="label-text d-light-none">Lighter</span></label>
					</div>
				</div>
			</div>
			<a
				class="bun btn-primary d-grid mb-3 text-white mt-5 btn btn-primary"
				href="https://themes.getbootstrap.com/product/phoenix-admin-dashboard-webapp-template/"
				target="_blank">Purchase template</a>
		</div>
	</div>
	<a class="card setting-toggle" href="#settings-offcanvas"
		data-bs-toggle="offcanvas">
		<div class="card-body d-flex align-items-center px-2 py-1">
			<div class="position-relative rounded-start"
				style="height: 34px; width: 28px">
				<div class="settings-popover">
					<span class="ripple"><span
						class="fa-spin position-absolute all-0 d-flex flex-center"><span
							class="icon-spin position-absolute all-0 d-flex flex-center"><svg
									width="20" height="20" viewBox="0 0 20 20" fill="#ffffff"
									xmlns="http://www.w3.org/2000/svg">
									<path
										d="M19.7369 12.3941L19.1989 12.1065C18.4459 11.7041 18.0843 10.8487 18.0843 9.99495C18.0843 9.14118 18.4459 8.28582 19.1989 7.88336L19.7369 7.59581C19.9474 7.47484 20.0316 7.23291 19.9474 7.03131C19.4842 5.57973 18.6843 4.28943 17.6738 3.20075C17.5053 3.03946 17.2527 2.99914 17.0422 3.12011L16.393 3.46714C15.6883 3.84379 14.8377 3.74529 14.1476 3.3427C14.0988 3.31422 14.0496 3.28621 14.0002 3.25868C13.2568 2.84453 12.7055 2.10629 12.7055 1.25525V0.70081C12.7055 0.499202 12.5371 0.297594 12.2845 0.257272C10.7266 -0.105622 9.16879 -0.0653007 7.69516 0.257272C7.44254 0.297594 7.31623 0.499202 7.31623 0.70081V1.23474C7.31623 2.09575 6.74999 2.8362 5.99824 3.25599C5.95774 3.27861 5.91747 3.30159 5.87744 3.32493C5.15643 3.74527 4.26453 3.85902 3.53534 3.45302L2.93743 3.12011C2.72691 2.99914 2.47429 3.03946 2.30587 3.20075C1.29538 4.28943 0.495411 5.57973 0.0322686 7.03131C-0.051939 7.23291 0.0322686 7.47484 0.242788 7.59581L0.784376 7.8853C1.54166 8.29007 1.92694 9.13627 1.92694 9.99495C1.92694 10.8536 1.54166 11.6998 0.784375 12.1046L0.242788 12.3941C0.0322686 12.515 -0.051939 12.757 0.0322686 12.9586C0.495411 14.4102 1.29538 15.7005 2.30587 16.7891C2.47429 16.9504 2.72691 16.9907 2.93743 16.8698L3.58669 16.5227C4.29133 16.1461 5.14131 16.2457 5.8331 16.6455C5.88713 16.6767 5.94159 16.7074 5.99648 16.7375C6.75162 17.1511 7.31623 17.8941 7.31623 18.7552V19.2891C7.31623 19.4425 7.41373 19.5959 7.55309 19.696C7.64066 19.7589 7.74815 19.7843 7.85406 19.8046C9.35884 20.0925 10.8609 20.0456 12.2845 19.7729C12.5371 19.6923 12.7055 19.4907 12.7055 19.2891V18.7346C12.7055 17.8836 13.2568 17.1454 14.0002 16.7312C14.0496 16.7037 14.0988 16.6757 14.1476 16.6472C14.8377 16.2446 15.6883 16.1461 16.393 16.5227L17.0422 16.8698C17.2527 16.9907 17.5053 16.9504 17.6738 16.7891C18.7264 15.7005 19.4842 14.4102 19.9895 12.9586C20.0316 12.757 19.9474 12.515 19.7369 12.3941ZM10.0109 13.2005C8.1162 13.2005 6.64257 11.7893 6.64257 9.97478C6.64257 8.20063 8.1162 6.74905 10.0109 6.74905C11.8634 6.74905 13.3792 8.20063 13.3792 9.97478C13.3792 11.7893 11.8634 13.2005 10.0109 13.2005Z"
										fill="#2A7BE4"></path></svg></span></span></span>
				</div>
			</div>
			<small
				class="text-uppercase text-body-tertiary fw-bold py-2 pe-2 ps-1 rounded-end">customize</small>
		</div>
	</a>

	<!-- ===============================================-->
	<!--    JavaScripts-->
	<!-- ===============================================-->
	<script src="resources/vendors/popper/popper.min.js"></script>
	<script src="resources/vendors/bootstrap/bootstrap.min.js"></script>
	<script src="resources/vendors/anchorjs/anchor.min.js"></script>
	<script src="resources/vendors/is/is.min.js"></script>
	<script src="resources/vendors/fontawesome/all.min.js"></script>
	<script src="resources/vendors/lodash/lodash.min.js"></script>
	<script
		src="https://polyfill.io/v3/polyfill.min.js?features=window.scroll"></script>
	<script src="resources/vendors/list.js/list.min.js"></script>
	<script src="resources/vendors/feather-icons/feather.min.js"></script>
	<script src="resources/vendors/dayjs/dayjs.min.js"></script>
	<script src="resources/assets/js/phoenix.js"></script>
</body>

</html>