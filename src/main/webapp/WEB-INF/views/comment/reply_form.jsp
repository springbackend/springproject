<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>대댓글</title>
		
		<style>
			.board{border:2px solid black;
				   border-radius:30px;
			       margin:auto;
				   width:60%;
				   padding:15px;
				   background-color:white;}
			
			.top{height:50px;
				 position:relative;
				 margin-bottom:5px;}
				       
			.name{position:absolute;
				  left:60px;
				  top:15px;
				  font-size:18px;}
			
			.avatar{width:50px;
					height:50px;
					position:absolute;}
				   
			.date{position:absolute; 
				  right:5px; 
				  top:15px;
				  font-size:18px;}
			
			.content{margin:5px;
					 padding:10px;} 
			
			.line{border:2px solid lightgray}
			
			/* 댓글 달기 스타일 */
			#reply_content{width:96%;
					   height:130px;
						   border:2px solid #ccc;
						   resize:none;
						   padding:10px;
						   font-size:20px;}
			
			/* #comment{border:1px solid blue;} */
					 
			.btn{text-align:right;
				 align:right;
				 vertical-align:middle}
				 
			.btn_comment{display: inline-block;
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
				 margin: 2px;}
				 
			.cmt{cursor: pointer;
				      display: inline-block;
				      position: relative;
				      transition: 0.5s;}
						
			.cmt:after {content:'\00bb';
						 position:absolute;
						 opacity:0;
						 top:0;
						 right:-20px;
						 transition:0.5s;}
						  		
			.btn_comment:hover .cmt {padding-right: 15px;}
			
			.btn_comment:hover .cmt:after {opacity: 1; right: 0;}
			
			.bottom{position:relative;}
			
			.readhit{position:absolute;
					 right:20px;
					 padding:3px;}
			
			img{border:none;
				height:25px;
				width:25px;
				cursor:pointer;}
		</style>
		
		<script src="/board/resources/js/httpRequest.js"></script>
		<script>
			window.onload = function(){
				reply_list();
			}
		
			function reply_list(){
				let url = "reply_list.do";
				let param = "c_idx=${vo.c_idx}";
				
				sendRequest(url, param, reply_list_result, "POST");
			}
			
			function reply_list_result(){
				if(xhr.readyState == 4 && xhr.status == 200){
					// data = comment_list.jsp body에 포함된 내용
					let data = xhr.responseText;
					document.getElementById("replies").innerHTML = data;
				}
			}
		
			function reply(){
				let reply_content = document.getElementById("reply_content").value ;
				
				if(reply_content == ''){
					alert("내용을 입력해주세요.");
					return;
				}
				
				let url = "reply.do";
				let param = "c_idx=${vo.c_idx}&b_idx=${vo.b_idx}&content=" + reply_content;
				
				sendRequest(url, param, reply_result, "POST");
			}
			
			function reply_result(){
				if(xhr.readyState == 4 && xhr.status == 200){
					let data = xhr.responseText
					
					if(data == 0){
						alert("댓글 작성 실패");
						return; 
					}
					alert("댓글 작성 완료");
					document.getElementById("textbox").innerHTML = '<textarea id="reply_content" placeholder="댓글을 입력해주세요."></textarea>';
					reply_list();
				}
			}
		</script>
		
	</head>
	<body>
		<h1 align="center">댓글</h1>
		<div class="board">
			<div class="top">
				<b><img class="avatar" src="/board/resources/icons/profile_picture.png"></b>
				<b class="name">홍길동</b>
				<b class="date">${fn:split(vo.regdate, ' ')[0]}</b>
			</div>
			<div class="content">${vo.content}</div>
			<!-- 구분선 -->
			<hr>
			<div class="bottom">
				<input type="button" value="삭제" onclick="board_delete(${c_idx});">
				<input type="button" value="수정" onclick="update(this.form);">
			</div>
			<br>
			<hr class="line">
			
			<h2>Comments</h2>
			<div id="textbox">
				<textarea id="reply_content" placeholder="댓글을 입력해주세요."></textarea>
			</div>
			<div class="btn"><button class="btn_comment" onclick="reply(this.form);">
					<span class="cmt">댓글 등록 </span></button></div>
			
			<br>
			<div id="replies">
				
			</div>
			<br>
		</div>
	</body>
</html>