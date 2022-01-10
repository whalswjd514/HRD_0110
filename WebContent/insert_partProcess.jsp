<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="DBConn.jsp" %>
<%
	request.setCharacterEncoding("utf-8");
	PreparedStatement pstmt=null;
	String partCode=request.getParameter("partCode");
	String partName=request.getParameter("partName");
	String model=request.getParameter("model");
	String standard=request.getParameter("standard");
	String unit=request.getParameter("unit");
	String purchase=request.getParameter("purchase");
	String sales=request.getParameter("sales");
	String memo=request.getParameter("memo");
			
	try{
		String sql="insert into part0110 values(?,?,?,?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, partCode);
		pstmt.setString(2, partName);
		pstmt.setString(3, model);
		pstmt.setString(4, standard);
		pstmt.setString(5, unit);
		pstmt.setString(6, purchase);
		pstmt.setString(7, sales);
		pstmt.setString(8, memo);
		pstmt.executeUpdate();
		System.out.println("데이터 등록 성공");
%>
		<script>
			alert("데이터 등록을 성공하였습니다!");
			location.href="select_part.jsp";
		</script>
<%
	}catch(SQLException e){
		System.out.println("데이터 등록 실패");
		e.printStackTrace();
	}
%>
		<script>
			alert("데이터 등록을 실패하였습니다!");
			histoty.back(-1);
		</script>
</body>
</html>