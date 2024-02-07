<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
	
		<style>
			.user_profile{font-size:22px;}
			.user_info{font-size:20px;
					   margin-left:50px;}
			pre{font-size:16px;
				margin-left:50px;}
		</style>
	</head>
	<body>
		<c:forEach var="vo" items="${list}">
			<div class="user_profile"><strong>(PIC) Name</strong></div>
			<div class="user_info">user info</div>
			<pre>${vo.content}</pre>
			<hr>
		</c:forEach>
	</body>
</html>