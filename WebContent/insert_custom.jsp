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
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int no=0;
	
	try{
		String sql="select id_seq.nextval from dual";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		if(rs.next()){
			no=rs.getInt(1)+1;
		}else{
			no=0;
		}
	}catch(SQLException e){
		System.out.println("시퀀스 조회 실패");
	}
%>
<form name=form method="post" action="insert_customProcess.jsp">
<h1>고객 정보 등록 화면</h1>
<table border=1 id="tab1">
	<tr>
		<th>아이디</th>
		<td><input type="text" name="id" value="<%=no %>">자동증가</td>
	</tr>
	<tr>
		<th>이름</th>
		<td><input type="text" name="name"></td>
	</tr>
	<tr>
		<th>비밀번호</th>
		<td><input type="password" name="passwd1"></td>
	</tr>
	<tr>
		<th>비밀번호확인</th>
		<td><input type="password" name="passwd2"></td>
	</tr>
	<tr>
		<th>성별</th>
		<td><input type="radio" name="gender" value="남" checked>남
			<input type="radio" name="gender" value="여">여
		</td>
	</tr>
	<tr>
		<th>이메일</th>
		<td>
			<input type="text" name="email1">@
			<select name="email2">
				<option value="naver.com">naver.com</option>
				<option value="daum.net">daum.net</option>
				<option value="gmail.com">gmail.com</option>
				<option value="korea.com">korea.com</option>
			</select>
		</td>
	</tr>
	<tr>
		<th>핸드폰</th>
		<td>
			<select name="phone1">
				<option value="010">010</option>
				<option value="011">011</option>
				<option value="012">012</option>
				<option value="013">013</option>
			</select>-
			<input type="text" name="phone2" id="in1">-
			<input type="text" name="phone3" id="in1">
		</td>
	</tr>
	<tr>
		<th>전화번호</th>
		<td>
			<input type="text" name="tel1" id="in1">-
			<input type="text" name="tel2" id="in1">-
			<input type="text" name="tel3" id="in1">
		</td>
	</tr>
	<tr>
		<th>주소</th>
		<td><input type="text" name="address" id="in2"></td>
	</tr>
	<tr>
		<th>차량번호</th>
		<td><input type="text" name="carNumber"></td>
	</tr>
	<tr>
		<th>차량종류</th>
		<td><input type="text" name="carType"></td>
	</tr>
	<tr>
		<td colspan=2 align=center>
			<input type="button" value="고객등록" onclick="check()">
			<input type="reset" value="다시작성">
		</td>
	</tr>
</table>
</form>
<script>
	function check(){
		if(document.form.name.value==""){
			alert("이름을 입력하세요.");
			document.form.name.focus();
		}else if(document.form.passwd1.value==""){
			alert("비밀번호를 입력하세요.");
			document.form.passwd1.focus();
		}else if(document.form.passwd2.value==""){
			alert("확인 비밀번호를 입력하세요.");
			document.form.passwd2.focus();
		}else if(document.form.passwd1.value!=document.form.passwd2.value){
			alert("비밀번호가 일치하지 않습니다.");
			document.form.passwd2.focus();
		}else{
			document.form.submit();
		}
	}
</script>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>