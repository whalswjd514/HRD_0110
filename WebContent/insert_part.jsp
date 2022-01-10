<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<form name="form" method="post" action="insert_partProcess.jsp">
<h1>부품 정보 등록 화면</h1>
<table border=1 id="tab1">
	<tr>
		<th>부품번호</th>
		<td colspan=3><input type="text" name="partCode" id="in2"></td>
	</tr>
	<tr>
		<th>부품명</th>
		<td colspan=3><input type="text" name="partName" id="in2"></td>
	</tr>
	<tr>
		<th>모델명</th>
		<td colspan=3><input type="text" name="model" id="in2"></td>
	</tr>
	<tr>
		<th>규격</th>
		<td colspan=3><input type="text" name="standard" id="in2"></td>
	</tr>
	<tr>
		<th>단위</th>
		<td colspan=3><input type="text" name="unit" id="in2"></td>
	</tr>
	<tr>
		<th>매입가</th>
		<td><input type="text" name="purchase"></td>
		<th>매출가</th>
		<td><input type="text" name="sales"></td>
	</tr>
	<tr>
		<th>메모</th>
		<td colspan=3><textarea cols="50" rows="10" id="in2"></textarea></td>
	</tr>
	<tr>
		<td colspan=4 align=center>
			<input type="button" value="부품등록" onclick="check()">
			<input type="reset" value="다시작성">
		</td>
	</tr>
</table>
</form>
<script>
	function check(){
		if(document.form.partCode.value==""){
			alert("부품번호를 입력하세요.");
			document.form.partCode.focus();
		}else if(document.form.partName.value==""){
			alert("부품명을 입력하세요.");
			document.form.partName.focus();
		}else{
			document.form.submit();
		}
	}
</script>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>