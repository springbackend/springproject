<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
		
		<style>
			@font-face {
			    font-family: 'Pretendard-Regular';
			    src: url('https://cdn.jsdelivr.net/gh/Project-Noonnu/noonfonts_2107@1.1/Pretendard-Regular.woff') format('woff');
			    font-weight: 400;
			    font-style: normal;
			}
			
			body{font-family:'Pretendard-Regular';}
		
			/* .user_profile{font-size:18px; border:1px solid red;
				height:50px;
				 position:relative;
				 margin-bottom:5px;}  */
			
			/* .user_info{font-size:16px;
					   color:gray;} */
					   
			pre{font-size:16px;
				margin-left:60px;
				font-family:'Pretendard-Regular';}
				
			/* .name{font-size:18px;
				  margin-bottom:20px;}
			
			#avatar{font-size:40px;
					margin-left:5px;
					color:#525b75;} */
					
			.user_profile{height:50px;
				 position:relative;
				 margin-bottom:5px;}
				       
			.name{position:absolute;
				  left:60px;
				  top:2px;
				  font-size:18px;}
				  
			.user_info{position:absolute;
					   font-size:16px;
					   color:gray;
					   left:60px;
				  		top:28px;}
			
			#avatar{font-size:40px;
					margin-left:5px;
					position:absolute;
					color:#525b75;}
				   
			
			/* #reply_btn{display: inline-block;
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
					  cursor: pointer;} */
			/* #reply_btn{display:inline-block;
				border-radius: 4px;
				border:none;
				text-align:center;
				padding: 10px;
				transition: all 0.5s;
				cursor:pointer;
				margin:2px;
				width:13%;
				font-family: 'Pretendard-Regular';
				font-weight:600;
				font-size:16px;
				background-color: #3874ff;
				color:white;} */
					  
			.reply_icon{cursor: pointer;
 	   				    font-size:20px;
						color:#525b75;}
						
			.bottom{position:relative;}
			
			.reply_icon{position:absolute;
						right:15px;} 
			
		/* 	#reply_btn:hover{background-color:#004dff;} */
			
			/* #reply_btn:hover .reply_icon{color:white;} */
					   
		</style>
	</head>
	<body>
		<c:forEach var="vo" items="${list}">
			<div style="border-bottom:2px solid #e5e8ee;">
				<div class="user_profile">
					<span id="avatar" class="bi bi-person-circle"></span>
					<b class="name">김길동</b>
					<div class="user_info">22세/여자/여름 쿨톤</div><!-- User info -->
				</div>
				<pre>${vo.content}</pre>
				<div class="bottom">
					<%-- <button id="reply_btn" onclick="location.href='reply_list.do?c_idx=${vo.c_idx}'">
						<span class="reply_icon"><i class="bi bi-chat-fill"></i>&nbsp;${vo.reply_count}</span></button> --%>
					<span class="reply_icon" onclick="location.href='reply_form.do?c_idx=${vo.c_idx}'">
						<i class="bi bi-chat-fill"></i>&nbsp;${vo.reply_count}</span>
				</div>
			</div>
			
			<!-- 
			
			<hr>
			<br> -->
		</c:forEach>
	</body>
</html>