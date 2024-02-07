<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>${vo.subject}</title>
		
		<style>
			body{background-color:#FFC567;}
			h1{color:#00A56B;}
			.board{border:2px solid black;
				   border-radius:30px;
			       margin:auto;
				   width:80%;
				   padding:15px;
				   background-color:white;}
			
			.top{height:50px;
				 border:1px solid green;
				 position:relative;
				 margin-bottom:5px;}
				       
			.name{position:absolute;
				   left:5px;}
				   
			.date{position:absolute; 
				  right:5px; }
				   
			.subject{height:60px;
				     border:1px solid red;
				     padding:5px;
				     font-size:30px;}
			
			.content{border:1px solid blue;
					 margin:5px;
					 padding:10px;} 
			
			.tag-box{height:30px;
					 margin:5px;}
			
			.tag{display:inline;
				 border:none;
				 border-radius:10px;
				 background-color:#EAEAEB;
				 padding:5px;}
			.line{border:2px solid lightgray}
			
			/* 댓글 달기 스타일 */
			#c_content{width:99%;
						   height:130px;
						   border:2px solid #ccc;
						   resize:none;
						   padding:10px;
						   font-size:20px;}
			
			#comment{border:1px solid blue;}
					 
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
			
			img{border:none;
				height:25px;
				width:25px;}
		</style>
		
		<script src="/beauty/resources/js/httpRequest.js"></script>
		<script>
			window.onload = function(){
				comment_list();
			}
			
			function comment_list(){
				let url = "comment_list.do";
				let param = "b_idx=${vo.b_idx}";
				
				sendRequest(url, param, comment_list_result, "POST");
			}
			
			function comment_list_result(){
				if(xhr.readyState == 4 && xhr.status == 200){
					// data = comment_list.jsp body에 포함된 내용
					let data = xhr.responseText;
					document.getElementById("comment").innerHTML = data;
				}
			}
			
			function comment_send(){
				
				let c_content = document.getElementById("c_content").value ;
				
				let url = "comment_write.do";
				let param = "b_idx=${vo.b_idx}&content=" + c_content;
				
				sendRequest(url, param, comment_send_result, "POST");
			}
			
			function comment_send_result(){
				if(xhr.readyState == 4 && xhr.status == 200){
					let data = xhr.responseText
					
					if(data == 0){
						alert("댓글 작성 실패");
						return; 
					}
					alert("댓글 작성 완료");
					comment_list();
				}
			}
		</script>
		
	</head>
	<body>
		<h1 align="center">상세보기</h1>
		<div class="board">
			<div class="subject"><strong>${vo.subject}</strong></div>
			<div class="top">
				<b class="name">name</b>
				<b class="date">date</b>
			</div>
			<div class="content">${vo.content}</div>
			<div class="tag-box">
				<span class="tag">#${vo.t_name}</span>
				<span class="tag">#${vo.p_name}</span>
			</div>
			<!-- 구분선 -->
			<hr>
			<div class="button">
				<!-- 이미지로 바꾸기 
				     따봉이 눌리면 색이 바뀌고 숫자를 증가시킴
				     댓글을 누르면 댓글창으로 이동시켜 줌-->
				<b id="thumb" onclick="click(${vo.b_idx});"><img src="/beauty/resources/icons/thumbs_up.png"></b> <b>${vo.recommend}</b>
					<img class="comment" onclick="click(${vo.b_idx});" src="/beauty/resources/icons/comment.png"> <b>0</b>
			</div>
			
			<br>
			<hr class="line">
			
			<h2>Comments</h2>
			
			<div>
				<textarea id="c_content" placeholder="댓글을 입력해주세요."></textarea>
				<div class="btn"><button class="btn_comment" onclick="comment_send();">
						<span class="cmt">댓글 등록 </span></button></div>
			</div>
			<br>
			<div id="comment">
				
			</div>
			<br>
		</div>
	</body>
</html>