<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>새글 쓰기</title>
		
		<!-- <script src="/board/resources/js/httpRequest.js"></script> -->
		<script src="/resources/js/httpRequest.js"></script>
		
		<style>
			body{background-color:#FFC567;}
			h1{color:#00A56B;}
			
			.outer{border:3px solid black;
				   border-radius:30px;
			       margin:auto;
				   width:75%;
				   height:390px;
				   padding:15px;
				   background-color:white;}
			
			.table{height:320px;}
			
			th{text-align:center;
			   width:10%;}
			   
			textarea{resize:none;}
			
			/* 드롭다운 옵션 디자인 */
			.dropdown{position:relative;
					  display:inline-block;}
					  
			.dropdown_btn{background-color: #00A56B;
						  color: white;
						  padding: 5px;
						  font-size: 20px;
						  border: none;
						  cursor: pointer;
						  width:200px;
						  border-radius:4px;}
						  
			.dropdown_tone{display: none;
						   position: absolute;
						   background-color: #f9f9f9;
						   min-width: 160px;
						   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
						   z-index: 1;}
			
			.dropdown_tone a {color: black;
								 padding: 12px 16px;
								 text-decoration: none;
								 display: block;}
			
			.dropdown_tone a:hover {background-color: #f1f1f1}
			
			.dropdown:hover .dropdown_tone {display: block;}
			
			.dropdown:hover .dropdown_btn {background-color: #3e8e41;}
			
			/* 취소 & 업로드 버튼 디자인 */
			.btn_send, .btn_back{display: inline-block;
				 border-radius: 4px;
				 color: #FFFFFF;
				 border: none;
				 text-align: center;
				 font-size: 15px;
				 padding: 10px;
				 width: 90px;
				 transition: all 0.5s;
				 cursor: pointer;
				 margin: 2px;}
				 
			.btn_send{background-color: #00A56B;}
			
			.btn_back{background-color: #f4511e;}
				 
			.send, .back {cursor: pointer;
				   display: inline-block;
				   position: relative;
				   transition: 0.5s;}
						
			.send:after {content:'\00bb';
						 position:absolute;
						 opacity:0;
						 top:0;
						 right:-20px;
						 transition:0.5s;}
						  		
			.btn_send:hover .send {padding-right: 15px;}
			
			.btn_send:hover .send:after {opacity: 1; right: 0;}
			 
			/* .back {cursor: pointer;
				   display: inline-block;
				   position: relative;
				   transition: 0.5s;} */
			 
			.back:after {content:'\00ab';
						 position:absolute;
						 opacity:0;
						 top:0;
						 left:-20px;
						 transition:0.5s;}
						  		
			.btn_back:hover .back {padding-left: 15px;}
			
			.btn_back:hover .back:after {opacity: 1; left: 0;}
		</style>
		
		<script>
			function send(f){
				
				//necessary?
				let subject = f.subject.value;
				let content = f.content.value;
				
				//return해도 제목과 내용 안없어지게 하기
				if(subject == ''){
					alert("제목을 입력해주세요.");
					return;
				}
				
				if(content == ''){
					alert("내용을 입력해주세요.");
					return;
				}
				
				f.method = "POST";
				f.action = "board_upload.do";
				f.submit();
				
				//Ajax 안됨
				//let url = "board_upload.do";
				//let param = "subject=" + subject + "&content=" + content;
				
				//sendRequest(url, param, send_result, "POST");
			}
			
			function send_result(){
				alert("ARE U HERE");
				if(xhr.readyState == 4 && xhr.status == 200){
					let data = xhr.responseText;
					alert("in?")
					if(data == "Fail"){
						alert("글 업로드에 실패하였습니다. 관리자에게 문위해 주십시오.");
						return;
					}else{
						document.write("in else?");
						alert("글 업로드에 성공하였습니다!");
						location.href = "/board_list.do";
					}
				}
			}			
			
			function back(){
				document.write("hi");
				location.href='board_list.do';
			}
		</script>
		
	</head>
	<body> 
		<h1 align="center">New Post</h1>
		<form>
			<div class="outer">
				<table class="table" align="center">
					<tr>
						<th>제목</th>
						<td><input name="subject"></td>
					</tr>
					<tr>
						<td colspan="2"><textarea name="content" rows="10" cols="100"></textarea></td>
					</tr>
					
					<tr>
						<td colspan="2">
							<div class="dropdown">
								<button class="dropdown_btn">Choose Tone</button>
								<div class="dropdown_tone">
									<a href="#">봄 웜톤</a>
									<a href="#">여름 쿨톤</a>
									<a href="#">가을 웜톤</a>
									<a href="#">겨울 쿨톤</a>
								</div>
							</div>
							
						</td>
					</tr>
					<tr>
						<td colspan="2">
							<div class="dropdown">
								<button class="dropdown_btn">Choose Product</button>
								<div class="dropdown_tone">
									<a href="#">립</a>
									<a href="#">아이셰도우</a>
									<a href="#">블러셔</a>
									<a href="#">파운데이션</a>
								</div>
							</div>
						</td>
					</tr>
				</table>
				<hr>
				
				<div align="right">
					<button class="btn_back" onclick="back();" style="vertical-align:middle" >
						<span class="back"> Back</span></button>
					<button class="btn_send" onclick="send(this.form);" style="vertical-align:middle">
						<span class="send">Upload </span></button>
				</div>
				
			</div>
		</form>
		
	</body>
</html>

<!-- <div class="table" align="center">
				<div class="subject">
					<b>제목</b>
					<input id="subject">
				</div>
				
				<div class="content">
					<b>내용</b>
					<textarea id="content"></textarea>
				</div>
				
				<div class="tone">
					<div class="dropdown">
						<button class="dropdown_btn">Tone</button>
						<div class="dropdown_tone">
							<a href="#">봄 웜톤</a>
							<a href="#">여름 쿨톤</a>
							<a href="#">가을 웜톤</a>
							<a href="#">겨울 쿨톤</a>
						</div>
					</div>
				</div>
				
				<div class="product">
					<div class="dropdown">
						<button class="dropdown_btn">Product</button>
						<div class="dropdown_tone">
							<a href="#">립</a>
							<a href="#">아이셰도우</a>
							<a href="#">블러셔</a>
							<a href="#">파운데이션</a>
						</div>
					</div>
				</div>
			</div> -->





















