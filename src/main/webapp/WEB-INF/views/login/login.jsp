<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인페이지</title>
<style>
</style>
<script type="text/javascript" src="/beauty/resources/js/httpRequest.js"></script>
<script type="text/javascript">
	function send(f) {

		let id = document.getElementById("id").value;
		let pwd = document.getElementById("pwd").value;
		let yuji = document.querySelector('#yuji').checked;
		if (id.trim() == "" || id == null) {
			alert('아이디를 입력하세요');
			return;
		} else if (pwd.trim() == "" || pwd == null) {
			alert('패스워드를 입력하세요');
			return;
		}

		let url = "login.do";
		let param = "id=" + id + "&pwd=" + pwd + "&yuji=" + yuji;
		sendRequest(url, param, resultFn, "POST");
	}
	function resultFn() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			alert(xhr.responseText);
			location.href = "/beauty/main.do";
		}
	}
</script>
</head>
<body>

	<!-- 로고이미지 위치 -->
	<jsp:include page="../comp/top.jsp"></jsp:include>
	<form action="" method="post">
		<div align="center">
			<img src="resources/images/logo.png" class="rounded" width="200px"
				alt="로고">
		</div>
		<div class="d-flex justify-content-center">
			<div align="center" class="border"
				style="width: 500px; border-color: aqua; border-radius: 40px; padding: 20px; margin-top: 50px;">
				<table>
					<tr>
						<td><div class="input-group">
								<span class="input-group-text" style="width: 100px;">아이디</span>
								<input class="form-control" id="id" type="text">
							</div></td>
						<td rowspan="2"><button type="button" style="height: 80px;"
								class="btn btn-primary" onclick="send(this.form);">로그인하기</button></td>
					</tr>
					<tr>
						<td>
							<div class="input-group">
								<span class="input-group-text" style="width: 100px;">패스워드</span>
								<input class="form-control" id="pwd" type="text">
							</div>
						</td>
					</tr>
					<tr>

						<td align="left">
							<div style="margin-top: 20px;"></div>
							<div class="form-check form-switch">
								<input class="form-check-input" type="checkbox" role="switch"
									id="yuji"> <label for="flexSwitchCheckDefault">로그인
									상태 유지</label>
							</div>

						</td>

					</tr>
				</table>
				<div style="margin-top: 20px;"></div>
				<input class="btn btn-primary" type="button" value="회원가입하기"
					onclick="location.href='regist.do'"> <input
					class="btn btn-primary" type="button" value="아이디 찾기"
					onclick="location.href='findid.do'"> <input
					class="btn btn-primary" type="button" value="비밀번호 찾기"
					onclick="location.href='findpwd.do'">
			</div>
		</div>
	</form>
	<hr style="margin-top: 30px;">
	<table style="text-align: center;">
		<tr>
			<td><a href="#">미니로고</a></td>
			<td><a href="#">문의하기</a></td>
		</tr>
	</table>
</body>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>