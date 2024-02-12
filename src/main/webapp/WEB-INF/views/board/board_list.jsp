<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판</title>
		
		<style>
			body{background-color:#FFC567;}
			h1{color:#00A56B;}
			
			.btn{text-align:right;
				 margin-right:90px;
				 vertical-align:middle}
				 
			.btn_write{display: inline-block;
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
				 
			.write{cursor: pointer;
				      display: inline-block;
				      position: relative;
				      transition: 0.5s;}
						
			.write:after {content:'\00bb';
						 position:absolute;
						 opacity:0;
						 top:0;
						 right:-20px;
						 transition:0.5s;}
						  		
			.btn_write:hover .write {padding-right: 15px;}
			
			.btn_write:hover .write:after {opacity: 1; right: 0;}
				   
			.board{position:relative;
				   border:2px solid black;
				   border-radius:30px;
			       margin:auto;
				   width:60%;
				   padding:15px;
				   background-color:white;}
			
			.outer{cursor:pointer;}
			
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
				  top:15px;}
				   
			.subject{height:90px;
				     font-size:18px;
				     padding:3px;
				     margin-bottom:5px;}
			
			.content{height:50px;
					 margin-left:10px;
					 padding:10px;} 
			
			.tag-box{height:30px;}
			
			.tag{display:inline;
				 border:none;
				 border-radius:10px;
				 background-color:#EAEAEB;
				 padding:5px;}
			
			.bottom{position:relative}
				 
			.comment, #thumb{cursor:pointer;
							 left:15px;}
			
			.readhit{position:absolute;
					 right:20px;
					 padding:3px;}
			
			img{border:none;
				height:25px;
				width:25px;
				cursor:pointer;}
		</style>
		
		<script src="/beauty/resources/js/httpRequest.js"></script>
		<script>
			
			function view(b_idx){
				location.href = "board_view.do?b_idx=" + b_idx +"&page=${empty param.page ? 1 : param.page}";
			}
			
			function like(b_idx){
				//user table 만들어서 thumb_nail true/false
				
				url = "like.do";
				param = "b_idx=" + b_idx;
				sendRequest(url, param, like_result, "POST");
			}
			
			function like_result(){
				if(xhr.readyState == 4 && xhr.status == 200){
					let data = xhr.responseText;
					alert(data);
					//like 수 증가 refresh가 맨 위 게시글 밖에 안됨
					document.getElementById("like_num").innerHTML = data;
					/* if(data == "like"){
						document.getElementById("thumb").innerHTML = 
							"<img src='/board/resources/icons/thumbs_up_click.png' onclick='click(${vo.b_idx});'>";
					}else if(data == "dislike"){
						 document.getElementById("thumb").innerHTML = 
							"<img src='/board/resources/icons/thumbs_up.png' onclick='click(${vo.b_idx});'>";
					} */
					
				}
			}
		</script>
		
	</head>
	<body>
		<h1 align="center">BOARD</h1>
		
		<!-- <div class="outer"> -->
		<c:forEach var="vo" items="${list}">
			<%-- <div class="board" onclick="location.href='board_view.do?b_idx=${vo.b_idx}
													&page=${empty param.page ? 1 : param.page}'"> --%>
			<div class="board">
				<div class="outer" onclick="view(${vo.b_idx});">
					<div class="top">
						<b><img class="avatar" src="/beauty/resources/icons/profile_picture.png"></b>
						<b class="name">홍길동</b>
						<b class="date">${fn:split(vo.regdate, ' ')[0]}</b>
					</div>
					<div class="subject">
						<strong>${vo.subject}</strong>
						<div class="content">${vo.content}</div>
					</div>
					<div class="tag-box">
						<span class="tag">#${vo.t_name}</span>
						<span class="tag">#${vo.p_name}</span>
					</div>
				</div>
				<!-- 구분선 -->
				<hr>
				<div id="bottom">
					<!-- 이미지로 바꾸기 
					     따봉이 눌리면 색이 바뀌고 숫자를 증가시킴
					     댓글을 누르면 댓글창으로 이동시켜 줌-->
					<b id="thumb" onclick="like(${vo.b_idx}, ${vo.recommend});"><img src="/beauty/resources/icons/thumbs_up.png"></b>
						<b id="like_num">${vo.recommend}</b>
					<img class="comment" onclick="view(${vo.b_idx});" src="/beauty/resources/icons/comment.png">
						<b>${vo.comment_count}</b>
					<b class="readhit"><img src="/beauty/resources/icons/view.webp">${vo.readhit}</b>
				</div>
			</div>
			<br>
		</c:forEach>
		
		<div align="center">${pageMenu}</div>
		<div class="btn"><button class="btn_write" onclick="location.href='board_write.do'">
						<span class="write">New Post </span></button></div>
		
		<!-- </div> -->
	</body>
</html>























