<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<%
	String pid=request.getParameter("id");
	String pname, psex, pzipcode, paddress1, paddress2, pinsurancecode;
	Class.forName("com.mysql.jdbc.Driver");
	
	String db_url = "jdbc:mysql://localhost/hospital";
	String db_user = "patient_manage";
	String db_password = "1234";
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	pname=null;	psex=null;	pzipcode=null;	paddress1=null;
	paddress2=null;	pinsurancecode=null;
	
	try{
		conn = DriverManager.getConnection(db_url, db_user, db_password);
		stmt = conn.createStatement();
		
		String query="SELECT name, id, sex, address.address1, address2, insurancecode FROM patient JOIN address ON patient.zipcode = address.zipcode where id=\""+pid+"\";";
		rs=stmt.executeQuery(query);
		if(rs.next()){
			pname=rs.getString("name");
			psex=rs.getString("sex");
			paddress1=rs.getString("address1");
			paddress2=rs.getString("address2");
			pinsurancecode=rs.getString("insurancecode");
		}
		
	} catch(Exception e){
		System.out.println("err: "+e);
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>환자 정보</title></head>
<body bgcolor=#EAEAEA>
<center>
<font color="#000000" face="나눔고딕">
<H3>환자 정보</H3>

<table bgcolor="#FFFFFF" cellpadding="5">
	<tr width="100">
		<td bgcolor="#FAED7D" align=center>이름</td>
		<td width="300"><%= pname %></td>
	</tr>
	<tr>
		<td bgcolor="#FAED7D" align=center>주민등록번호</td>
		<td><%= pid %></td>
	</tr>
	<tr>
		<td bgcolor="#FAED7D" align=center>성별</td>
		<td><%= psex %></td>
	</tr>
	<tr>
		<td bgcolor="#FAED7D" align=center>주소</td>
		<td><%= paddress1 %> (<%= paddress2 %>)</td>
	</tr>
	<tr>
		<td bgcolor="#FAED7D" align=center>보험코드</td>
		<td>
		<% if(pinsurancecode!=null){ %> <%= pinsurancecode %> <% } %>
		</td>
	</tr>
</table>

<!-- 입원정보 -->
<div style="overflow-y:auto; over-flow-x:auto; margin:20px">
	<table bgcolor="#FFFFFF" width="400">
		<tr bgcolor="#FAED7D" align=center>
			<td>입원일</td><td>퇴원일</td><td>담당의</td><td>담당부서</td>
		</tr>
		<%
			try{
				conn = DriverManager.getConnection(db_url, db_user, db_password);
				stmt=conn.createStatement();
	
				String query;
				if(request.getMethod().equals("POST")){
					String name=request.getParameter("search_name");
					query="SELECT entered, out, doctor.name, doctor.belong_d FROM hospitalized JOIN doctor ON hospitalized.charged_dr = doctor.employee_id where patient_id=\""+pid+"\";";
					rs=stmt.executeQuery(query);
				}
				while(rs.next()){
					String hentered, hout, hdr, hdrblng;
					hentered=rs.getString("entered");
					hout=rs.getString("out");
					hdr=rs.getString("doctor.name");
					hdrblng=rs.getString("doctor.belong_d");
		%>
		<tr>
			<td><%= hentered %></td>
			<td><%= hout %></td>
			<td><%= hdr %></td>
			<td><%= hdrblng %></td>
		</tr>
		<%
				}	// end of while

				rs.close();
				stmt.close();
				conn.close();
			} catch(SQLException e) {
				System.out.println("err: "+e);
			}
		%>
		</table>
	</div>
</div>

</font>
<H6>Practice_DB hospital 2021</H6>
</center>
</body>
</html>
