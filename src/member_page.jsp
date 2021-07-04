<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>직원 관리 시스템</title></head>
<body bgcolor=#EAEAEA>
<center>
<font color="#000000" face="나눔고딕">
<H3>직원 관리 시스템</H3>
<table>
	<tr>
	<td>
		<form name="search_m" method="post">
			<input type="text" name="search_name" placeholder="이름" >
			<input type="submit" value="검색">
		</form></td>
	<td><button onclick="location='member_add.jsp'">신규</button></td>
	<td><button onclick="location.href=location.href">초기화</button></td>
	</tr>
</table>
<BR>
<div style="overflow-y:auto;">
<table bgcolor="#FFFFFF">
	<tr align=center bgcolor="#B2EBF4">
		<td>부서</td><td>사원번호</td><td>구분</td><td>이름</td><td></td>
	</tr>
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
		
		String query;
		if(request.getMethod().equals("POST")){
			String name=request.getParameter("search_name");
			query="SELECT member.name, employee_id, department.name, job FROM member JOIN department ON member.belong=department.id where name=\""+name+"\" ORDER BY employee_id;";
		}
		else{
			query="SELECT member.name, employee_id, department.name, job FROM member JOIN department ON member.belong=department.id;";
		}
		rs=stmt.executeQuery(query);

		while(rs.next()){
			String name, eid, employed, belong, job;
			name=rs.getString("member.name");
			eid=rs.getString("employee_id");
			belong=rs.getString("department.name");
			job=rs.getString("job");
%>
	<tr>
		<td><%= belong %></td>
		<td align=center><%= eid %></td>
		<td align=center><%= job %></td>
		<td><%= name %></td>
		<td align=center>
			<form method=post action="this_member.jsp" >
				<input type=hidden name="id" value="<%=eid%>">
				<input type=submit value="정보">
			</form>
		</td>
	</tr>
<%
		}	// end of while
%>
</table>
</div>
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
