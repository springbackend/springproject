<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"  %>
 
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>게시판</title>
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css">
		<style>
			
			
			h1{display:inline-block;
			   left:50px;
			   border:1px solid red;
			   color:#00A56B;}
			
			.btn{text-align:right;
				 margin-right:90px;
				 vertical-align:middle;}
				 
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
				   /* box-shadow:5px 5px 3px #ff66c4; */
				   /* border:2px solid #ff66c4; */
				   /* border-radius:30px; */
				   border-bottom:2px solid #ff66c4;
				   border-right:6px solid #ff66c4;
			       margin:auto;
				   width:60%;
				   padding:15px;
				   background-color:white;}
			
			.middle{cursor:pointer;}
			
			.top{height:50px;
				 position:relative;
				 margin-bottom:5px;}
				       
			.name{position:absolute;
				  left:60px;
				  top:15px;
				  font-size:18px;}
			
			#avatar{font-size:40px;
					margin-left:5px;
					position:absolute;}
				   
			.date{position:absolute; 
				  right:5px;
				  top:15px;}
				   
			.subject{font-size:18px;
				     padding:3px;}
			
			.content{margin:0 0 5px 20px;
					 height:30px;
					 padding:3px;
					 width:350px;
					 overflow:hidden;
					 text-overflow:ellipsis;
					 white-space:nowrap;
					 vertical-align:middle;} 
					 
			/* Icons style */
			#comment_btn, .readhit_icon{display: inline-block;
									 	  border-radius:30%;
									 	  background-color:white;
									 	  font-size:20px;
									 	  text-align: center;
									 	  padding: 5px;
										  height:40px;
									 	  margin: 2px;}
									 	  
			#comment_btn{transition: all 0.5s;
						 border: none;
						 cursor: pointer;}
				 	  
			.comment_icon{cursor: pointer;
				 	   				  display: inline-block;
				 	   				  transition: 0.5s;}
			
			/* #comment_btn:hover{background-color:#0A75FF;}
			
			#comment_btn:hover .comment_icon{color:white;} */
			
			
			.tag-box{height:30px;}
			
			.tag{display:inline;
				 border:none;
				 border-radius:10px;
				 background-color:#EAEAEB;
				 padding:5px;}
			
			.bottom{position:relative}
				 
			.comment, #thumb{cursor:pointer;
							 left:15px;}
			
			.readhit_icon{position:absolute;
					 	  right:20px;
					 	  padding:3px;}
			
			img{border:none;
				height:25px;
				width:25px;
				cursor:pointer;}
		</style>
		
		<script src="/board/resources/js/httpRequest.js"></script>
		<script>
			
			function view(b_idx){
				location.href = "board_view.do?b_idx=" + b_idx +"&page=${empty param.page ? 1 : param.page}";
			}
		</script>
		
	</head>
	<body>
		<jsp:include page="/WEB-INF/views/main/index.jsp" />
		<jsp:include page="/WEB-INF/views/board/board_sidebar.jsp" />
		
		<c:forEach var="vo" items="${list}">
			<%-- <div class="board" onclick="location.href='board_view.do?b_idx=${vo.b_idx}
													&page=${empty param.page ? 1 : param.page}'"> --%>
			<div class="board">
				<div class="middle" onclick="view(${vo.b_idx});">
					<div class="top">
						<span id="avatar" class="bi bi-person-circle"></span>
						<b class="name">홍길동</b>
						<b class="date">${fn:split(vo.regdate, ' ')[0]}</b>
					</div>
					<div class="subject">
						<strong>${vo.subject}</strong>
					</div>
					<div class="content">${vo.content}</div>
					<div class="tag-box">
						<span class="tag">#${vo.t_name}</span>
						<span class="tag">#${vo.p_name}</span>
					</div>
				</div>
				<!-- 구분선 -->
				<hr>
				<div id="bottom">
					<button id="comment_btn" onclick="view(${vo.b_idx});">
							<span class="comment_icon">💬&nbsp;${vo.comment_count}</span></button>
					<span class="readhit_icon">👁‍🗨&nbsp;${vo.readhit}</span>
				</div>
			</div>
			<br>
		</c:forEach>
		
		<div align="center">${pageMenu}</div>

		
		<!-- </div> -->
	</body>
</html>























