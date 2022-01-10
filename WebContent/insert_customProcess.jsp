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
	String id=request.getParameter("id");
	String name=request.getParameter("name");
	String passwd=request.getParameter("passwd1");
	String gender=request.getParameter("gender");
	String email=request.getParameter("email1")+"@"+request.getParameter("email2");
	String phone=request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
	String tel=request.getParameter("tel1")+"-"+request.getParameter("tel2")+"-"+request.getParameter("tel3");
	String address=request.getParameter("address");
	String carNumber=request.getParameter("carNumber");
	String carType=request.getParameter("carType");
	try{
		String sql="insert into member0110 values(?,?,?,?,?,?,?,?,?,?)";
		pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		pstmt.setString(3, passwd);
		pstmt.setString(4, gender);
		pstmt.setString(5, email);
		pstmt.setString(6, phone);
		pstmt.setString(7, tel);
		pstmt.setString(8, address);
		pstmt.setString(9, carNumber);
		pstmt.setString(10, carType);
		pstmt.executeUpdate();
		System.out.println("데이터 등록 성공");
%>
		<script>
			alert("데이터 등록을 성공하였습니다!");
			location.href="select_custom.jsp";
		</script>
<%	
	}catch(SQLException e){
		System.out.println("데이터 등록 실패");
		e.printStackTrace();
	}
%>
		<script>
			alert("데이터 등록을 실패하였습니다!");
			history.back(-1);
		</script>
</body>
</html>