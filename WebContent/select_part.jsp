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
<h1>부품 정보 조회</h1>
<table border=1 id="tab2">
	<tr>
		<th>no</th>
		<th>부품번호</th>
		<th>부품명</th>
		<th>모델명</th>
		<th>규격</th>
		<th>단위</th>
		<th>매입가격</th>
		<th>매출가격</th>
		<th>메모</th>
	</tr>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	ResultSet rs=null;
	int no=0;
	
	try{
		String sql="select * from part0110";
		pstmt=conn.prepareStatement(sql);
		rs=pstmt.executeQuery();
		while(rs.next()){
			String partCode=rs.getString(1);
			String partName=rs.getString(2);
			String model=rs.getString(3);
			String standard=rs.getString(4);
			String unit=rs.getString(5);
			String purchase=rs.getString(6);
			String sales=rs.getString(7);
			String memo=rs.getString(8);
			no++;
%>
	<tr>
		<td><%=no %></td>
		<td><%=partCode %></td>
		<td><%=partName %></td>
		<td><%=model %></td>
		<td><%=standard %></td>
		<td><%=unit %></td>
		<td><%=purchase %></td>
		<td><%=sales %></td>
		<td><%=memo %></td>
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