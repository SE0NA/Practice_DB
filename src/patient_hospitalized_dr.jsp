<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>의사 검색</title></head>
<script type="text/javascript">
	function setDrText(){
		opener.document.getElementById("drtextInput").value=document.getElementById("dtext").value;
		opener.document.getElementById("dridInput").value=document.getElementById("did").value;
		self.close();
	}
</script>

<body bgcolor="#EAEAEA">
<center>
<font color="#000000" face="나눔고딕">
<H2>의사 검색</H2>
<form method="post">
	<table>
		<tr>
			<td><select name="menu">
					<option value="name">이름</option>
					<option value="department">부서</optioin>
					<option value="employeeid">사원번호</option>
				</select>
			</td>
			<td>
				<input type="text" name="search_text">
			</td>
			<td>
				<input type="submit" value="검색">
			</td>
		</tr>
	</table>
</form>

<div>
	<table cellpadding="5" bgcolor="#FFFFFF">
		<tr bgcolor="#FAED7D" align="center">
			<td width="120">부서</td><td width="80">이름</td><td width="100">사원번호</td><td width="50"></td>
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
		
		String query=null;
		
		if(request.getMethod().equals("POST")){
			String text=null;
			String menu=null;
			text=request.getParameter("search_text");
			menu=request.getParameter("menu");
			if(menu.equals("name")){	// 이름 검색
				query="SELECT member.name, employee_id, department.name FROM member JOIN department ON member.belong = department.id where member.name=\""+text+"\";";
			}
			else if(menu.equals("department")){
				query="SELECT member.name, employee_id, department.name FROM member JOIN department ON member.belong = department.id where department.name=\""+text+"\";";
			}
			else if(menu.equals("employeeid")){
				query="SELECT member.name, employee_id, department.name FROM member JOIN department ON member.belong = department.id where member.employee_id=\""+text+"\";";
			}
		}
		else{
			query="SELECT member.name, employee_id, department.name FROM member JOIN department ON member.belong = department.id;";
		}
			rs=stmt.executeQuery(query);
			while(rs.next()){
				String dname, did, dbelong;
				dname=rs.getString("name");
				did=rs.getString("employee_id");
				dbelong=rs.getString("department.name");
		
%>
		<tr>
			<td><%= dbelong %></td><td><%= dname %></td><td><%= did %></td>
			<td>
				<input type="hidden" id="dtext" value="<%= dname %>(<%= dbelong%>)">
				<input type="hidden" id="did" value="<%= did %>">
				<input type="button" value="선택" onclick="setDrText()">
			</td>
		</tr>
<%
			}	// end of while
		rs.close();
		stmt.close();
		conn.close();
		
%>
	</table>
</div>
<%
	} catch(SQLException e) {
		System.out.println("err: "+e);
	}
%>
	<input type="button" value="취소" onclick="window.close()">
</font>
</center>
</body>
</html>
