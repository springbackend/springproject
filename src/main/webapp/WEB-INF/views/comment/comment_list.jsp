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
					   margin-left:60px;
					   color:gray;}
			pre{font-size:16px;
				margin-left:60px;}
				
			.avatar{width:50px;
				height:50px;}
			.user_profile strong{margin-left:60px;}
			
			.reply{}
			
			#reply_btn{display: inline-block;
				 	  border-radius:30%;
				 	  background-color:white;
				 	  font-size:20px;
				 	  text-align: center;
				 	  padding: 5px;
					  height:40px;
				 	  margin: 2px; 
				 	  margin-left:90%;
				 	  transition: all 0.5s;
					  border: none;
					  cursor: pointer;}
				 	  
			.reply_icon{cursor: pointer;
 	   				    display: inline-block;
 	   				    transition: 0.5s;}
			
			#reply_btn:hover{background-color:#0A75FF;}
			
			#reply_btn:hover .reply_icon{color:white;}
					   
		</style>
	</head>
	<body>
		<c:forEach var="vo" items="${list}">
			<div class="user_profile">
				<img class="avatar" src="/board/resources/icons/profile_picture.png">
				<strong>김길동</strong>
			</div>
			<div class="user_info">22세/여자/여름 쿨톤</div>
			<pre>${vo.content}</pre>
			<div>
				<button id="reply_btn" onclick="location.href='reply_form.do?c_idx=${vo.c_idx}'">
					<span class="reply_icon">💬&nbsp;${vo.reply_count}</span></button>
			</div>
			
			<hr>
			<br>
		</c:forEach>
	</body>
</html>