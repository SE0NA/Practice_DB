<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>환자 입원</title></head>
<%
	String id=request.getParameter("p_id");

	String name, sex;
	Class.forName("com.mysql.jdbc.Driver");

	String db_url = "jdbc:mysql://localhost/hospital";
	String db_user = "patient_manage";
	String db_password = "1234";
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	name=null;	sex=null;
	
	try{
		conn = DriverManager.getConnection(db_url, db_user, db_password);
		stmt = conn.createStatement();
		
		String query="SELECT name, sex FROM patient where id=\""+id+"\";";
		rs=stmt.executeQuery(query);
		if(rs.next()){
			name=rs.getString("name");
			sex=rs.getString("sex");
		}
		
	} catch(Exception e){
		System.out.println("err: "+e);
	}
%>
<body bgcolor=#EAEAEA>
<center>
<font color="#000000" face="나눔고딕">

<H3>환자 입원</H3>
<style type="text/css">
table{
	border-collapse: collapse;
	border: 1px solid black;
}
</style>

<form method=post action="patient_hospitalized2.jsp">
<table bgcolor="#FFFFFF" cellpadding="5">
	<tr>
		<td colspan="2" align=center bgcolor="#FAED7D">환자</td>
	</tr>
	<tr>
		<td align=center>이름</td>
		<td><%= name %></td>
	</tr>
	<tr>
		<td align=center>주민등록번호</td>
		<td><%= id %></td>
	</tr>
	<tr>
		<td colspan="2" align=center bgcolor="#FAED7D">입원 등록</td>
	</tr>
	<tr>
		<td align=center>입원일</td>
		<td><input type= name="entered"></td>
	</tr>
	<tr>
		<td align=center>퇴원일</td>
		<td><input type="" name="out"></td>
	</tr>
	<tr>
		<td align=center>담당의사</td>
		<td><input type="" a name="entered"></td>
	</tr>
	<tr>
	<td colspan="3" align=center><input type="submit" value="등록">
								 <input type="button" value="취소" onclick="location.href='patient_page.jsp'"></td>
	</tr>
</table>
</form>
</font>
<H6>Practice_DB hospital 2021</H6>
</center>
</body>
</html>
