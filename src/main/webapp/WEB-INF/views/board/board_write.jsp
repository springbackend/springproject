<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>새글 쓰기</title>
		
		<script src="/beauty/resources/js/httpRequest.js"></script>
		<!-- <script src="/resources/js/httpRequest.js"></script> -->
		
		<style>
			body{background-color:#FFC567;}
			h1{color:#00A56B;}
			
			.outer{border:3px solid black;
				   border-radius:30px;
			       margin:auto;
				   width:75%;
				   padding:15px;
				   background-color:white;}
			
			input{width:50%;
				  height:30px;
				  font-size:16px;
				  padding:5px;}
			   
			textarea{resize:none;
					 width:95%;
					 height:150px;
					 font-size:16px;
					 padding:10px;}
			
			/* 드롭다운 옵션 디자인 */
			.dropdown{display:inline-block;}
						   
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
				   z-index: 1;}
			
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
			details {
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
			}
		</style>
		
		<script>
			function send(f){
				
				//necessary?
				let subject = f.subject.value;
				let content = f.content.value;
				let t_idx = f.t_idx.value;
				let p_idx = f.p_idx.value;
				
				//return해도 제목과 내용 안없어지게 하기
				if(subject == ''){
					alert("제목을 입력해주세요.");
					return;
				}
				
				if(content == ''){
					alert("내용을 입력해주세요.");
					return;
				}
				if(t_idx == 'Choose tone'){
					alert("톤을 선택해주세요.");
					return;
				}
				
				if(p_idx == 'Choose product'){
					alert("제품을 선택해주세요.");
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
				<div class="box">
					<div class="top">
						<b>제목</b> <input name="subject" placeholder="제목을 입력해주세요.">
					</div>
					<br>
					<div class="middle">
						<textarea name="content" placeholder="내용을 입력해주세요."></textarea>
					</div>
					<br>
					<div class="dropdown">
						<select name="t_idx">
							<option disabled selected>Choose tone</option>
							<option value="1">봄 웜</option>
							<option value="2">여름 쿨</option>
							<option value="3">가을 웜</option>
							<option value="4">겨울 쿨</option>
						</select>
					</div>
					<br><br>
					<!-- <div class="dropdown">
						<select name="p_idx">
							<option disabled selected>Choose product</option>
							<option value="1">립</option>
							<option value="2">아이셰도우</option>
							<option value="3">블러셔</option>
							<option value="4">파운데이션</option>
						</select>
					</div> -->
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
					</details>
				</div>
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





















