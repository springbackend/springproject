<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
	function sendCheckValue() {
		let openJoinfrm = opener.document.joinForm;
		if (document.checkIdForm.chResult.value == "N") {
			alert("�ٸ� ���̵� �Է����ּ���.");
			openJoinfrm.id.focus();
			window.close();
		} else {
			// �ߺ�üũ ����� idCheck ���� ����
			openJoinfrm.idDuplication.value = "idCheck";
			openJoinfrm.dbCheckId.disabled = true;
			openJoinfrm.dbCheckId.style.opacity = 0.6;
			openJoinfrm.dbCheckId.style.cursor = "default";
			window.close();
		}
	}
</script>
</head>
<body>
	<b><font size="4" color="gray">ID �ߺ� Ȯ��</font></b>
	<br>

	<form name="checkIdForm">
		<input type="text" name="id" value="${user_id}" id="userId" disabled>
		<c:choose>
			<c:when test="${result==1}">
				<p style="color: red">�̹� ��� ���� ���̵��Դϴ�.</p>
				<input type="hidden" name="chResult" value="N" />
			</c:when>
			<c:when test="${result==0 }">
				<p style="color: red">��밡���� ���̵��Դϴ�.</p>
				<input type="hidden" name="chResult" value="Y" />
			</c:when>
			<c:otherwise>
				<p>���� �߻�(-1)</p>
				<input type="hidden" name="chResult" value="N" />
			</c:otherwise>
		</c:choose>

		<input type="button" onclick="window.close()" value="���" /><br>
		<input type="button" onclick="sendCheckValue()" value="����ϱ�" />

	</form>
</body>
</html>