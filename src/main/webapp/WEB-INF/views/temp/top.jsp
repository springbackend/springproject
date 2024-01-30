<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
* {
	margin: 0;
	padding: 0;
	font-family: Pretendard, -apple-system, BlinkMacSystemFont, system-ui,
		Roboto, "Helvetica Neue", "Segoe UI", "Apple SD Gothic Neo",
		"Noto Sans KR", "Malgun Gothic", "Apple Color Emoji", "Segoe UI Emoji",
		"Segoe UI Symbol", sans-serif;
}

.topbannber {
	display: flex;
	flex-direction: row;
	box-shadow: 0 2px 4px 0 rgba(0, 0, 0, .1);
	letter-spacing: -.3px;
	font-size: 14px;
	justify-content: space-between;
	align-items: center;
	padding: 0 16px;
	height: 40px;
	width: 100%;
	box-shadow: 0 2px 4px 0 rgba(0, 0, 0, .1);
}

.left_banner {
	
}

.right_banner {
	text-decoration: none;
	color: inherit;
}

ul {
	display: flex;
	margin: 25px;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
	padding-inline-end: 60px;
	flex-flow: row nowrap;
}

li {
	list-style: none;
}
</style>
</head>
<body>
	<section class="lab-inter">
		<div class="topbannber">
			<div class="left_banner">
				<ul class="leftui">
					<li><a href="#">로고</a></li>

					<li><a href="#">로고2</a></li>
					<li></li>
				</ul>
			</div>
			<div class="right_banner">
				<ul class="rightui">
					<li><a href="login.do">로그인</a></li>
					<p>/</p>
					<li><a href="#">회원가입</a></li>
					<li></li>
				</ul>
			</div>
		</div>
	</section>

</body>
</html>