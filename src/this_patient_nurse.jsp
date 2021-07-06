<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%
	String hname = request.getParameter("hname");
	String dr = request.getParameter("dr");
	String drbelong = request.getParameter("drblng");
	String hentered = request.getParameter("hentered");
	String hout = request.getParameter("hout");
	String hcode = request.getParameter("code");
	String nname, neid;
	
	Class.forName("com.mysql.jdbc.Driver");
	
	String db_url = "jdbc:mysql://localhost/hospital";
	String db_user = "patient_manage";
	String db_password = "1234";
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	nname=null;	neid=null;
%>
<head><title>담당 간호사</title></head>
<font color="#000000" face="나눔고딕">
<body bgcolor="#EAEAEA">
<center>
<H4>환자</H4>
<table bgcolor="#FFFFFF">
	<tr><td bgcolor="#FAED7D">입원코드</td><td><%=hcode %></td></tr>
	<tr><td bgcolor="#FAED7D">환자명</td><td><%= hname %></td></tr>
	<tr><td bgcolor="#FAED7D">담당의사</td><td><%= dr %></td></tr>
	<tr><td bgcolor="#FAED7D">부서</td><td><%= drbelong %></td></tr>
	<tr><td bgcolor="#FAED7D">입원일</td><td><%= hentered %></td></tr>
	<tr><td bgcolor="#FAED7D">퇴원일</td><td><%= hout %></td></tr>
</table>
<BR>
<H4>담당 간호사</H4>
<table>
	<tr bgcolor="#FAED7D">
		<td align=center>사원번호</td><td align=center>이름</td>
	</tr>
	
<%		
	try{
		conn = DriverManager.getConnection(db_url, db_user, db_password);
		stmt = conn.createStatement();
		
		String query="SELECT charged_n, member.name FROM patient_nurse JOIN member ON patient_nurse.charged_n=member.employee_id where hospitalized_code=\""+hcode+"\";";
		rs=stmt.executeQuery(query);
		while(rs.next()){
			nname=rs.getString("member.name");
			neid=rs.getString("charged_n");
		
%>
	<tr>
		<td><%= nname %></td><td><%=neid %></td>
	</tr>
</table>
<%
		}
		
	} catch(Exception e){
		System.out.println("err: "+e);
	}
%>

<BR>

<form method="post" action="patient_nurse_update.jsp">
	<input type="hidden" name="hcode" value="<%= hcode %>">
	<input type="submit" value="수정">
	<input type="button" value="닫기" onlcick="window.close()">
</form>
</center>
</body>
</font>
</html>
