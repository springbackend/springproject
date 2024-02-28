<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>새글 쓰기</title>
		
		<script src="/board/resources/js/httpRequest.js"></script>
		<!-- <script src="/resources/js/httpRequest.js"></script> -->
		
		<style>
			.outer{border:1px solid #eee;
				   box-shadow:0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
				   /* border-right:6px solid #ff66c4;
				   border-left:6px solid #ff66c4; */
			       margin:auto;
				   width:50%;
				   padding:15px;
				   background-color:white;}
			
			input{width:50%;
				  height:30px;
				  font-size:16px;
				  padding:5px;
				  border:1px solid #ccc;}
			   
			textarea{resize:none;
					 width:95%;
					 height:150px;
					 font-size:16px;
					 padding:10px;
					 border:1px solid #ccc;}
			
			/* 드롭다운 옵션 디자인 */
			/* .dropdown{display:inline-block;}
						   
			select{background-color: #00A56B;
						    color: white;
						    padding: 5px;
						    font-size: 20px;
						    border: none;
						    cursor: pointer;
						    width:200px;
						    height:40px;
						    border-radius:4px;}
			
			option{background-color:#f9f9f9;
				   color:black;
				   box-border:none;
				   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
				   z-index: 1;} */
				   
				   
			.check{width:80%;}
			
			.check div{font-size:20px;
					   margin-bottom:10px;
					   padding:4px;
					   border-bottom:1px solid #ff66c4;
					   width:70px;}
			
			.check-container {
				  /* display: block; */
				  position: relative;
				  padding-left: 35px;
				  margin-bottom: 12px;
				  margin-right:20px;
				  margin:8px 20px 12px 0;
				  cursor: pointer;
				  font-size: 15px;
				  -webkit-user-select: none;
				  -moz-user-select: none;
				  -ms-user-select: none;
				  user-select: none;
				}
				
				/* Hide the browser's default checkbox */
				.check-container input {
				  position: absolute;
				  opacity: 0;
				  cursor: pointer;
				  height: 0;
				  width: 0;
				}
				
				/* Create a custom checkbox */
				.checkmark {
				  position: absolute;
				  top: 0;
				  left: 0;
				  height: 25px;
				  width: 25px;
				  background-color: #eee;
				}
				
				/* On mouse-over, add a grey background color */
				.check-container:hover input ~ .checkmark {
				  background-color: #ccc;
				}
				
				/* When the checkbox is checked, add a blue background */
				.check-container input:checked ~ .checkmark {
				  background-color: #ff66c4;
				}
				
				/* Create the checkmark/indicator (hidden when not checked) */
				.checkmark:after {
				  content: "";
				  position: absolute;
				  display: none;
				}
				
				/* Show the checkmark when checked */
				.check-container input:checked ~ .checkmark:after {
				  display: block;
				}
				
				/* Style the checkmark/indicator */
				.check-container .checkmark:after {
				  left: 9px;
				  top: 5px;
				  width: 5px;
				  height: 10px;
				  border: solid white;
				  border-width: 0 3px 3px 0;
				  -webkit-transform: rotate(45deg);
				  -ms-transform: rotate(45deg);
				  transform: rotate(45deg);
				}
			
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
			
			/* TEST================================================================= */
			/* details {
			    display: inline-block;
			    width: 250px;
			    background-color: white;
			    cursor: pointer;
			}
			
			summary {
			    border:none;
			    border-collapse:collapse;
			    border-radius:4px;
			    padding:4px;
			    padding-left:10px;
			    width:189px;
			    height:30px;
			    font-size: 20px;
			    background-color:#00A56B;
			    color:white;
			    cursor: pointer;
			}
			details[open] > summary::marker {
			    color: var(--blue);
			}
			
			summary:focus,
			summary:active {
			    box-shadow: 0 0 5px 1px var(--blue);
			}
			/* background-color:#f9f9f9;
				   color:black;
				   box-border:none;
				   box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
				   z-index: 1; */
			ul {
			    list-style: none;
			    margin: 0px;
			    padding: 5px;
			    margin-top: 2px;
			   /*  border: 1px solid #ccc;
			    box-shadow: 0px 8px 10px 0px rgba(0,0,0,0.2); */
			}
			li {
			    margin: 0px;
			    padding: 0px;
			}
			li > label {
			    cursor: pointer;
			    display: inline-block;
			    width: 100%;
			}
			li > label:hover,
			li > label:has(input:checked) {
			    background-color: var(--dk-gray);
			    color: black;
			} */
		</style>
		
		<script>
			function onCheck(checkbox, name){
			    let checkboxes = document.getElementsByName(name);
			    for(let i = 0; i < checkboxes.length; i++){
			    	if(checkboxes[i].value != checkbox) {
			    		checkboxes[i].checked = false;
			    	}
			    }
			}
			function send(f){
				//necessary?
				let subject = f.subject.value;
				let content = f.content.value;
				let t_checkboxes = document.getElementsByName('tone');
				let p_checkboxes = document.getElementsByName('product');
				let t_idx = 0;
				let p_idx = 0;
				
				for(let i = 0; i < t_checkboxes.length; i++){
					if(t_checkboxes[i].checked == true){
						alert("i: " + i + " t_cb: " + t_checkboxes[i].value);
						t_idx = t_checkboxes[i].value;
					}
				}
				
				for(let i = 0; i < p_checkboxes.length; i++){
					if(p_checkboxes[i].checked == true){
						alert("i: " + i + " p_cb: " + p_checkboxes[i].value);
						p_idx = p_checkboxes[i].value;
					}
				}
				
				//return해도 제목과 내용 안없어지게 하기
				if(subject == ''){
					alert("제목을 입력해주세요.");
					return;
				}
				
				if(content == ''){
					alert("내용을 입력해주세요.");
					return;
				}
				if(t_idx == 0){
					alert("톤을 선택해주세요.");
					return;
				}
				
				if(p_idx == 0){
					alert("제품을 선택해주세요.");
					return;
				}
				
				f.submit();
				
				//Ajax 안됨
				//let url = "board_upload.do";
				//let param = "subject=" + subject + "&content=" + content;
				
				//sendRequest(url, param, send_result, "POST");
			}
			
			function send_result(){
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
		<!-- 로그인 여부 확인 -->
		<%-- <c:if test=${login eq 0}>
			<jsp:include page="/WEB-INF/views/login/login.jsp">
		</c:if> --%>
		
		<h1 align="center">New Post</h1>
		<form action="board_upload.do" method="POST">
			<div class="outer">
				<div class="box">
					<div class="top">
						<b>제목</b> <input name="subject" placeholder="제목을 입력해주세요.">
					</div>
					<br>
					<div class="middle">
						<textarea name="content" placeholder="내용을 입력해주세요."></textarea>
					</div>
					<br>
					<div class="check">
						<div>톤</div>
						<label for="spring" class="check-container">봄 웜톤
						  <input type="checkbox" id="spring" name="tone" value="1" onclick="onCheck(this.value, this.name);">
						  <span class="checkmark"></span>
						</label>
						<label for="summer" class="check-container">여름 쿨톤
						  <input type="checkbox" id="summer" name="tone" value="2" onclick="onCheck(this.value, this.name);">
						  <span class="checkmark"></span>
						</label>
						<label for="fall" class="check-container">가을 웜톤
						  <input type="checkbox" id="fall" name="tone" value="3" onclick="onCheck(this.value, this.name);">
						  <span class="checkmark"></span>
						</label>
						<label for="winter" class="check-container">겨울 쿨톤
						  <input type="checkbox" id="winter" name="tone" value="4" onclick="onCheck(this.value, this.name);">
						  <span class="checkmark"></span>
						</label>
					</div>
					<br>
					<div class="check">
						<div>제품</div>
						<label for="lip" class="check-container">립
						  <input type="checkbox" id="lip" name="product" value="1" onclick="onCheck(this.value, this.name);">
						  <span class="checkmark"></span>
						</label>
						<label for="eyeshadow" class="check-container">아이셰도우
						  <input type="checkbox" id="eyeshadow" name="product" value="2" onclick="onCheck(this.value, this.name);">
						  <span class="checkmark"></span>
						</label>
						<label for="cheek" class="check-container">블러셔
						  <input type="checkbox" id="cheek" name="product" value="3" onclick="onCheck(this.value, this.name);">
						  <span class="checkmark"></span>
						</label>
						<label for="foundation" class="check-container">파운데이션
						  <input type="checkbox" id="foundation" name="product" value="4" onclick="onCheck(this.value, this.name);">
						  <span class="checkmark"></span>
						</label>
					</div>
					<br>
					<!-- <div class="dropdown">
						<select name="t_idx">
							<option disabled selected>Choose tone</option>
							<option value="1">봄 웜</option>
							<option value="2">여름 쿨</option>
							<option value="3">가을 웜</option>
							<option value="4">겨울 쿨</option>
						</select>
					</div>
					<br><br>
					<div class="dropdown">
						<select name="p_idx">
							<option disabled selected>Choose product</option>
							<option value="1">립</option>
							<option value="2">아이셰도우</option>
							<option value="3">블러셔</option>
							<option value="4">파운데이션</option>
						</select>
					</div>
					<details>
						<summary>Choose Product</summary>
						<ul>
							<li>
								<label>
									<input type="checkbox" value="1">립
								</label>
							</li>
							<li>
								<label>
									<input type="checkbox" value="2">아이셰도우
								</label>
							</li>
							<li>
								<label>
									<input type="checkbox" value="3">블러셔
								</label>
							</li>
							<li>
								<label>
									<input type="checkbox" value="4">파운데이션
								</label>
							</li>
						</ul>
					</details> -->
					<hr>
				</div>
				
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





















