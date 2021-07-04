<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<%
	String eid=request.getParameter("id");
	String name, id, employed, belong, job;
	Class.forName("com.mysql.jdbc.Driver");
	
	String db_url = "jdbc:mysql://localhost/hospital";
	String db_user = "patient_manage";
	String db_password = "1234";
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	name=null;	id=null;	employed=null;	belong=null;	job=null;
	
	try{
		conn = DriverManager.getConnection(db_url, db_user, db_password);
		stmt = conn.createStatement();
		
		String query="SELECT member.name, member.id, employed, department.name, job FROM member JOIN department ON member.belong=department.id where employee_id="+eid+";";
		rs=stmt.executeQuery(query);
		if(rs.next()){
			name=rs.getString("member.name");
			id=rs.getString("member.id");
			employed=rs.getString("employed");
			belong=rs.getString("department.name");
			job=rs.getString("job");
		}
		
	} catch(Exception e){
		System.out.println("err: "+e);
	}
%>

<script type="text/javascript">

</script>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>직원 정보</title></head>
<body bgcolor=#EAEAEA>
<center>
<font color="#000000" face="나눔고딕">
<H3>직원 정보</H3>

<table bgcolor="#FFFFFF" cellpadding="5">
	<tr width="100">
		<td bgcolor="#B2EBF4" align=center>사원번호</td>
		<td width="300"><%= eid %></td>
	</tr>
	<tr width="100">
		<td bgcolor="#B2EBF4" align=center>이름</td>
		<td width="300"><%= name %></td>
	</tr>
	<tr>
		<td bgcolor="#B2EBF4" align=center>주민등록번호</td>
		<td><%= id %></td>
	</tr>
	<tr width="100">
		<td bgcolor="#B2EBF4" align=center>소속</td>
		<td width="300"><%= belong %></td>
	</tr>
	<tr>
		<td bgcolor="#B2EBF4" align=center>구분</td>
		<td><%= job %></td>
	</tr>
	<tr>
		<td bgcolor="#B2EBF4" align=center>입사일</td>
		<td><%= employed %></td>
	</tr>
</table>
<br>
<input type="button" value="확인" onclick="history.back()">
</font>
<H6>Practice_DB hospital 2021</H6>
</center>
</body>
</html>
