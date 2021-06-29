<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>환자 관리 시스템</title></head>
<body bgcolor=#EAEAEA>
<center>
<font color="#000000" face="나눔고딕">
<H3>환자 관리 시스템</H3>
<table>
	<tr>
	<td>
		<form name="search_p" method="post" action="patient_search.jsp">
			<input type="text" name="patient_name" placeholder="이름" >
			<input type="submit" value="검색">
		</form></td>
	<td><button onclick="location='add_patient.jsp'">신규</button></td>
</table>
<BR>

<table bgcolor="#FFFFFF" width="700">
<%
	Class.forName("com.mysql.jdbc.Driver");

	String db_url = "jdbc:mysql://localhost/hospital";
	String db_user = "patient_manage";
	String db_password = "1234";
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		conn = DriverManager.getConnection(db_url, db_user, db_password);
		stmt=conn.createStatement();
		
		String query="SELECT name, id FROM patient;";
		rs=stmt.executeQuery(query);
%>
	<tr align=center>
		<td>이름</td><td>주민등록번호</td><td></td><td></td><td></td>	
	</tr>
<%
		while(rs.next()){
			String p_name, p_id;
			p_name=rs.getString("name");
			p_id=rs.getString("id");
%>
	<tr>
		<td><%= p_name %></td>
		<td><%= p_id %></td>
		<td><input type="button" value="확인" onclick="location=windows.open('this_patient.jsp','환자 정보')" id=<%=p_id%>></td>	
	</tr>
<%
		}	// end of while
%>
</table>
<%
		rs.close();
		stmt.close();
		conn.close();
	} catch(SQLException e) {
		System.out.println("err: "+e);
	}
%>
</font>
<H6>Practice_DB hospital 2021</H6>
</center>
</body>
</html>
