<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>�ߺ�Ȯ��</title>

<script type="text/javascript">
	function sendCheckValue() {
		let openJoinfrm = opener.document.joinForm;
		if (document.checkIdForm.chResult.value == "N") {
			alert("�̹� �����ϴ� ���̵��Դϴ�.\n�ٸ� ���̵� �Է����ּ���.");
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
	<div align="center" style="margin-top: 30px;">
		<b><font size="4" color="gray">ID �ߺ� Ȯ��</font></b> <br>
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
			<input type="button" class="btn btn-primary" onclick="window.close()"
				value="���" /> <input type="button" class="btn btn-primary"
				style="margin-left: 20px;" onclick="sendCheckValue()" value="����ϱ�" />

		</form>
	</div>
</body>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</html>