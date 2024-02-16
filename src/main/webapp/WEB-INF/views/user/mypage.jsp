<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<style>
</style>
<script type="text/javascript" src="/beauty/resources/js/httpRequest.js"></script>
<script type="text/javascript">
	function readmyWrite(){
		
		sendRequest(url,param,resultFn2,"POST");
	}
	function resultFn2(){
		if(xhr.status ==4 && xhr.readyState==200){
			document.querySelector().append(temp);
		}else{
			alert("조회실패");
		}
	}
	function readmyComment(){
		
		sendRequest(url,param,resultFn2,"POST");
	}
	function resultFn2(){
		//temp = JSON.parse();
		if(xhr.status ==4 && xhr.readyState==200){
			document.querySelector().append(temp);
		}else{
			alert("조회실패");
		}
	}
	function deleteaccount(){
		let pw = document.getElementById("pw").value;
		let url = "accountdelete";
		let param = "pw="+pw;
		sendRequest(url,param,resultDel,"POST");
	}	
	function resultDel(){
		if(xhr.status ==4 && xhr.readyState==200){
			alert("계정 정상삭제");
		}
	}
</script>
</head>
<body>
	<%-- <jsp:include page="header.jsp"></jsp:include> --%>
	<%-- <jsp:include page="comp/mytab.jsp"></jsp:include> --%>
	<%-- <jsp:include page="footer.jsp"></jsp:include> --%>
	<main>
		<section>
			<button onclick="readmywrite();">내글보기</button>
			<button onclick="readmywrite();">내가 작성한 댓글보기</button>
			<button onclick="update();">비밀번호 변경하기</button>
			<button onclick="delete();">계정삭제하기</button>
		</section>
		<section>
			<div id="mywrite">
			</div>
		</section>

	</main>
</body>
</html>