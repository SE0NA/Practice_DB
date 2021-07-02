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
		<form name="search_p" method="post">
			<input type="text" name="search_name" placeholder="이름" >
			<input type="submit" value="검색">
		</form></td>
	<td><button onclick="location='patient_add.jsp'">신규</button></td>
	<td><button onclick="location.href=location.href">초기화</button></td>
	</tr>
</table>
<BR>
<div style="overflow-y:auto;">
<table bgcolor="#FFFFFF">
	<tr align=center bgcolor="#FAED7D">
		<td width="100">이름</td><td width="200">주민등록번호</td><td colspan="2" width="100"></td>
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
			query="SELECT name, id FROM patient where name=\""+name+"\";";
		}
		else{
			query="SELECT name, id FROM patient;";
		}
		rs=stmt.executeQuery(query);

		while(rs.next()){
			String p_name, p_id;
			p_name=rs.getString("name");
			p_id=rs.getString("id");
%>
	<tr>
		<td><%= p_name %></td>
		<td><%= p_id %></td>
		<td align=center>
			<form method=post action="this_patient.jsp" >
				<input type=hidden name="id" value="<%=p_id%>">
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
