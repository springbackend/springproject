<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내정보</title>
<style>
</style>
<script type="text/javascript" src="/beauty/resources/js/httpRequest.js"></script>
<script type="text/javascript">
	//프로필 사진 변경하기
	//프로필 상태메시지 변경
	
	//내글보기
	function viewMyPosts(){
		//버튼 조회||닫기
		let btnElement = document.getElementById('btn_ViewMyPosts');
		if(btnElement.innerText == '닫기'){
			btnElement.innerText = '내글 조회하기';
		}else{
			btnElement.innerText = '닫기';
			let url = "viewMyPosts.do"
			let param= "";
			sendRequest(url,param,resultViewMyPosts,"POST");
		}
	}
	function resultViewMyPosts(){
		if(xhr.status ==4 && xhr.readyState==200){
			let myPostView= document.getElementById('result');
			//Text.
			//var obj = JSON.parse();
			document.getElementById("result").innerHTML = "#";
		}else{
			alert("내글보기 실패");
		}
	}
	//내가 작성한 댓글보기
	function viewMyComments(){
		
		sendRequest(url,param,resultViewMyComments,"POST");
	}
	function resultViewMyComments(){
		if(xhr.status ==4 && xhr.readyState==200){
		//document.querySelector().append(temp);
		}else{
			alert("내댓글보기 실패");
		}
	}
	//비밀번호 변경하기
	function changeMyPwd(){
		
		sendRequest(url,param,resultchangeMyPwd,"POST");
		
	}
	function resultchangeMyPwd(){
		
		if(xhr.status ==4 && xhr.readyState==200){
		}else{
			alert("비밀번호 변경 실패");
		}
	}
	//계정삭제하기
	function deleteAccount(){
		let pw = document.getElementById("pw").value;
		let url = "accountdelete";
		let param = "pw="+pw;
		sendRequest(url,param,resultDeleteAccount,"POST");
	}	
	function resultDeleteAccount(){
		if(xhr.status ==4 && xhr.readyState==200){
			alert("계정 정상삭제");
		}else{
			
			alert("계장삭제 실패");
		}
	}
</script>
</head>
<body>
	<%-- <jsp:include page="header.jsp"></jsp:include> --%>
	<%-- <jsp:include page="comp/mytab.jsp"></jsp:include> --%>
	<%-- <jsp:include page="footer.jsp"></jsp:include> --%>
	<main class="container">
		<section class="row">
			<div class="col align-self-center">
				<button onclick="#" id="#">프로필사진 변경하기</button>
			</div>
			<div class="col align-self-center">
				<button onclick="#" id="#">프로필상태메시지 변경하기</button>
			</div>
			<div class="col align-self-center">
				<button onclick="#" id="#">내상태글 변경하기</button>
			</div>
			<div class="col align-self-center">
				<button onclick="viewMyPosts();" id="btn_ViewMyPosts">내글보기</button>
			</div>
			<div class="col align-self-center">
				<button onclick="viewMyComments();" id="btn_ViewMyComments">내가
					작성한 댓글보기</button>
			</div>
			<div class="col align-self-center">
				<button onclick="changeMyPwd();" id="btn_ChangeMyPwd">비밀번호
					변경하기</button>
			</div>
			<div class="col align-self-center">
				<button onclick="deleteAccount();" id="btn_DeleteAccount">계정삭제하기</button>
			</div>
		</section>
		<section id="result"></section>

	</main>
</body>
</html>