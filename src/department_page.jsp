<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>부서 관리 시스템</title></head>
<body bgcolor=#EAEAEA>
<center>
<font color="#000000" face="나눔고딕">
<H3>부서 관리 시스템</H3>
<table>
	<tr>
	<td>
		<form name="search_m" method="post">
			<input type="text" name="search_name" placeholder="부서명" >
			<input type="submit" value="검색">
		</form></td>
	<td><button onclick="location='department_add.jsp'">신규</button></td>
	<td><button onclick="location.href=location.href">초기화</button></td>
	</tr>
</table>
<BR>
<div style="overflow-y:auto;">
<table bgcolor="#FFFFFF">
	<tr align=center bgcolor="#B2EBF4">
		<td>부서코드</td><td width="150">부서명</td><td width="70">위치</td><td>총병상수</td><td>사용병상수</td><td width="70">책임자</td><td></td>
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
			String text=request.getParameter("search_name");
			query="SELECT id, name, place, total_bed, using_bed, manager FROM department where name=\""+text+"\";;";
		}
		else{
			query="SELECT id, name, place, total_bed, using_bed, manager FROM department;";
		}
		rs=stmt.executeQuery(query);

		while(rs.next()){
			String name, id, place, total_bed, using_bed, managername, managereid;
			name=rs.getString("name");
			id=rs.getString("id");
			place=rs.getString("place");
			total_bed=rs.getString("total_bed");
			using_bed=rs.getString("using_bed");
			managereid=rs.getString("manager");
%>
	<tr>
		<td align=right><%= id %></td>
		<td><%= name %></td>
		<td align=center><%= place %></td>
		<td align=center><%= total_bed %></td>
		<td align=center><%= using_bed %></td>
		<td allign=center><%=managereid%></td>
		<td align=center>
			<form method=post action="this_departmet_update.jsp" >
				<input type=hidden name="id" value="<%=id%>">
				<input type=submit value="수정">
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
