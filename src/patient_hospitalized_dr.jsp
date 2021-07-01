<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>의사 검색</title></head>
<script type="text/javascript">
	function setDrText(){
		opener.document.getElementById("drInput").value=document.getElementById("charged_dr").value
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
				query="SELECT doctor.name, employee_id, department.name FROM doctor JOIN department ON doctor.belong_d = department.id where doctor.name=\""+text+"\";";
			}
			else if(menu.equals("department")){
				query="SELECT doctor.name, employee_id, department.name FROM doctor JOIN department ON doctor.belong_d = department.id where department.name=\""+text+"\";";
			}
			else if(menu.equals("employeeid")){
				query="SELECT doctor.name, employee_id, department.name FROM doctor JOIN department ON doctor.belong_d = department.id where doctor.employee_id=\""+text+"\";";
			}
		}
		else{
			query="SELECT doctor.name, employee_id, department.name FROM doctor JOIN department ON doctor.belong_d = department.id;";
		}
			rs=stmt.executeQuery(query);

			while(rs.next()){
				String dname, did, dbelong;
				dname=rs.getString("name");
				did=rs.getString("employee_id");
				dbelong=rs.getString("department.name");
		
%>
			<td><%= dbelong %></td><td><%= dname %></td><td><%= did %></td>
			<td>
				<input type="hidden" name="dname" value="<%= dname %>">
				<input type="hidden" name="did" value="<%= did %>">
				<input type="hidden" name="dbelong" value="<%= dbelong %>">
				<input type="button" value="선택" onclick="setDrText()">
			</td>
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
</font>
</center>
</body>
</html>
