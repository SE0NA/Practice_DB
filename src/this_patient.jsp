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

<script type="text/javascript">

</script>


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
			<td>코드</td><td>입원일</td><td>퇴원일</td><td>담당의</td><td>부서</td><td></td>
		</tr>
		<%
			try{
				conn = DriverManager.getConnection(db_url, db_user, db_password);
				stmt=conn.createStatement();
	
				String query;
				if(request.getMethod().equals("POST")){
					String name=request.getParameter("search_name");
					query="SELECT hospitalized_id, entered, discharged, member.name, department.name FROM hospitalized JOIN member ON hospitalized.charged_dr=member.employee_id JOIN department ON member.belong=department.id where hospitalized.patient_id=\""+pid+"\";";
					rs=stmt.executeQuery(query);
				}
				while(rs.next()){
					String hcode, hentered, hout, hdr, hdrblng;
					hcode=rs.getString("hospitalized_id");
					hentered=rs.getString("entered");
					hout=rs.getString("discharged");
					hdr=rs.getString("member.name");
					hdrblng=rs.getString("department.name");
		%>
		<tr>
			<td align=right><%= hcode %></td>
			<td align=center><%= hentered %></td>
			<td align=center><%= hout %></td>
			<td align=center><%= hdr %></td>
			<td align=center><%= hdrblng %></td>
			<td align=center>
				<form method="post" action="this_patient_nurse.jsp">
					<input type="hidden" name="hname" value="<%= pname %>">
					<input type="hidden" name="dr" value="<%= hdr %>">
					<input type="hidden" name="drblng" value="<%= hdrblng %>">
					<input type="hidden" name="hentered" value="<%= hentered %>">
					<input type="hidden" name="hout" value="<%= hout %>">
					<input type="hidden" name="code" value="<%= hcode %>">
					<input type="submit" value="보기">
				</form>
			</td>
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
	<form method=post action="patient_hospitalized.jsp">
		<input type=hidden name="name" value="<%=pname %>">
		<input type=hidden name="id" value="<%=pid%>">
		<input type=submit value="입원">
		<input type="button" value="뒤로" onclick="history.back()">
	</form>
</div>

</font>
<H6>Practice_DB hospital 2021</H6>
</center>
</body>
</html>
