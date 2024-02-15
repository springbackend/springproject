<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	
		<style>
			.user_profile{font-size:18px;}
			.user_info{font-size:16px;
					   margin-left:83px;
					   color:gray;}
			pre{font-size:16px;
				margin-left:60px;}
				
			.avatar{width:50px;
				height:50px;}
			.user_profile strong{margin-left:60px;}
			
			.reply{margin-left:90%;}
					   
		</style>
	</head>
	<body>
		<c:forEach var="vo" items="${list}">
			<div class="user_profile">
				ㄴ
				<img class="avatar" src="/board/resources/icons/profile_picture.png">
				<strong>김길동</strong>
			</div>
			<div class="user_info">22세/여자/여름 쿨톤</div>
			<pre>${vo.content}</pre>
			<hr>
			<br>
		</c:forEach>
	</body>
</html>