<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
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

.lab-int {
	letter-spacing: -.3px;
	position: sticky;
	height: 30px;
	display: flex;
	align-items: center;
	justify-content: center;
	background-color: #fff;
	border-bottom: 1px solid #f1f3f5;
	z-index: 30;
}


section header {
	width: 100%;
}

.lab-int-con {
	letter-spacing: -.3px;
	margin: 0 auto;
	display: flex;
	justify-content: space-between;
	font-size: 14px;
	padding: 0 16px;
	padding-right: 16px;
	box-shadow: 0 2px 4px 0 rgba(0, 0, 0, .1);
}

ul {
	display: flex;
	margin-block-start: 1em;
	margin-block-end: 1em;
	margin-inline-start: 0px;
	margin-inline-end: 0px;
	padding-inline-start: 40px;
	padding-inline-end: 40px;
	flex-flow: row nowrap;
}

li {
	align-items: center;
	padding: 1px;
	text-align: -webkit-match-parent;
	list-style: none;
}
</style>
</head>
<body>
	<section class="lab-inter">
		<header class="">
			<div class="lab-int-con">
				<ul class="lab-int-con-left">
					<li><a href="#">로고</a>
					<li><a> </a>
					<li><a href="#">로고2</a>
					<li>
				</ul>
				<ul class="lab-int-con-right">
					<li><a href="#">로그인</a>
					<li><a> </a>
					<li><a href="#">회원가입</a>
					<li>
				</ul>
			</div>
		</header>
	</section>



</body>
</html>