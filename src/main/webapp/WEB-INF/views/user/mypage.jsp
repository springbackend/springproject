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
	function delete(){
		if(){
			
		let url = "info/delete.do";
		let param = "id="+id;
		sendRequest(url,param,resultFn,"POST")
		}
		
	}
	function resultFn(){
		if(xhr.status ==4 && xhr.readyStatus==200){
			alert("정상 탈퇴 되었습니다.");
		}else{
			alert("리턴오류 재시도를 해주시길바랍니다.");
		}
		
	}
	function readmywrite(){
		
		sendRequest(url.param,resultFn2,"POST");
	}
	function resultFn2(){
		if(xhr.status ==4 && xhr.readyStatus==200){
			document.querySelector().append(temp);
		}else{
			alert("조회실패");
		}
	}
	
	
</script>
</head>
<body>
	<%-- <jsp:include page="header.jsp"></jsp:include> --%>
	<%-- <jsp:include page="comp/mytab.jsp"></jsp:include> --%>
	<%-- <jsp:include page="footer.jsp"></jsp:include> --%>
	<div>
		<button onclick="readmywrite();">내글보기</button>
		<button onclick="readmywrite();">내가 작성한 댓글</button>
		<button onclick="">기타등등</button>
		<button onclick="update();">비밀번호 변경하기</button>
		<button onclick="delete();">계정삭제하기</button>
	</div>
	<div id="mywrite">
		<div></div>


	</div>
</body>
</html>