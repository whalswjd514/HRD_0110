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
<h1>고객 정보 조회</h1>
<table border=1 id="tab2">
	<tr>
		<th>id</th>
		<th>성명</th>
		<th>패스워드</th>
		<th>성별</th>
		<th>이메일</th>
		<th>휴대폰</th>
		<th>전화번호</th>
		<th>주소</th>
		<th>차량번호</th>
		<th>차량종류</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	
	try{
		String sql="select * from member0110";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String id=rs.getString(1);
			String name=rs.getString(2);
			String passwd=rs.getString(3);
			String gender=rs.getString(4);
			String email=rs.getString(5);
			String phone=rs.getString(6);
			String tel=rs.getString(7);
			String address=rs.getString(8);
			String carNumber=rs.getString(9);
			String carType=rs.getString(10);
%>
	<tr>
		<td><%=id %></td>
		<td><%=name %></td>
		<td><%=passwd %></td>
		<td><%=gender %></td>
		<td><%=email %></td>
		<td><%=phone %></td>
		<td><%=tel %></td>
		<td><%=address %></td>
		<td><%=carNumber %></td>
		<td><%=carType %></td>
	</tr>
<%
		}
	}catch(SQLException e){
		System.out.println("테이블 조회 실패");
		e.printStackTrace();
	}
%>
</table>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>