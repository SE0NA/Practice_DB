<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<% request.setCharacterEncoding("utf-8"); %>
<%
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String id=request.getParameter("userid");
	String pw=request.getParameter("userpw");
	System.out.println("try login | id: "+id +"  pw: "+pw);
	
	try{
		String jdbcDriver = "jdbc:mysql://localhost/hospital";
		
		Class.forName("com.mysql.jdbc.Driver");
		con=DriverManager.getConnection(jdbcDriver, id, pw);
		
		System.out.println(id + " 로그인 성공");		
	}
	catch(Exception e){
		System.out.println(e);
		out.println("<script> alert('로그인 실패')</script>");
	}
	
%>
