<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>

<style>
body {
	background-color: #FFC567;
}

h1 {
	color: #00A56B;
}

.btn {
	text-align: right;
	margin-right: 90px;
}

.btn_write {
	display: inline-block;
	border-radius: 4px;
	color: #FFFFFF;
	background-color: #00A56B;
	border: none;
	text-align: center;
	font-size: 15px;
	padding: 10px;
	width: 110px;
	transition: all 0.5s;
	cursor: pointer;
	margin: 2px;
}

.write {
	cursor: pointer;
	display: inline-block;
	position: relative;
	transition: 0.5s;
}

.write:after {
	content: '\00bb';
	position: absolute;
	opacity: 0;
	top: 0;
	right: -20px;
	transition: 0.5s;
}

.btn_write:hover .write {
	padding-right: 15px;
}

.btn_write:hover .write:after {
	opacity: 1;
	right: 0;
}

/* .outer{background-color:#FFC567;
				   border:3px solid black;
				   border-radius:30px;
				   margin:auto;
				   width:80%;
				   height:800px;
				   padding-top:40px;} */
.board {
	border: 2px solid black;
	border-radius: 30px;
	margin: auto;
	width: 80%;
	height: 220px;
	padding: 15px;
	background-color: white;
}

.top {
	height: 30px;
	border: 1px solid green;
	position: relative;
	margin-bottom: 5px;
}

.name {
	position: absolute;
	left: 5px;
}

.date {
	position: absolute;
	right: 5px;
}

.subject {
	height: 90px;
	border: 1px solid red;
	padding: 3px;
	margin-bottom: 5px;
}

.content {
	height: 50px;
	border: 1px solid blue;
	margin: 5px 3px 3px 20px;
	padding: 3px;
}

.tag {
	height: 20px;
	width: 40px;
	border: 1px solid gray;
}
</style>

<script type="text/javascript" src="/beauty/resources/js/httpRequest.js"></script>
<script type="text/javascript">
	function send(f) {

		let url = "도메인";
		let param = "temp=" + temp + "&temp=" + temp;
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
	<h1 align="center">BOARD</h1>

	<!-- <div class="outer"> -->
	<c:forEach var="vo" items="${list}">
		<div class="board">
			<div class="top">
				<b class="name">Name</b> <b class="date">date</b>
			</div>
			<div class="subject">
				${vo.subject}
				<div class="content">${vo.content}</div>
			</div>
			<div class="tag">tag</div>
			<!-- 구분선 -->
			<hr>
			<div class="button">
				<!-- 이미지로 바꾸기 
					     따봉이 눌리면 색이 바뀌고 숫자를 증가시킴
					     댓글을 누르면 댓글창으로 이동시켜 줌-->
				<input type="button" value="따봉" onclick=""> <input
					type="button" value="댓글수" onclick="">
			</div>
		</div>
		<br>
	</c:forEach>

	<div class="btn">
		<button class="btn_write" onclick="location.href='board_write.do'"
			style="vertical-align: middle">
			<span class="write">New Post </span>
		</button>
	</div>

	<!-- </div> -->
</body>
</html>























