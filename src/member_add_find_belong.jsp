<%@ page language="java" contentType="text/html; charset=UTF-8"
    import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>부서 검색</title></head>

<body bgcolor="#EAEAEA">
<center>
<font color="#000000" face="나눔고딕">
<H2>의사 검색</H2>
<form method="post">
	<table>
		<tr>
			<td><select name="menu">
					<option value="name">부서명</option>
					<option value="id">부서코드</optioin>
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
		<tr bgcolor="#B2EBF4" align="center">
			<td>부서코드</td><td>부서명</td><td>위치</td><td>책임자</td><td></td>
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
			if(menu.equals("name")){	// 부서명 검색
				query="SELECT name, department.id, place, manager FROM department where name=\""+text+"\";";
			}
			else if(menu.equals("id")){	// 부서코드 검색
				query="SELECT name, department.id, place, manager FROM department where id=\""+text+"\";";
			}
		}
		else{
			query="SELECT name, id, place, manager FROM department;";
		}
			rs=stmt.executeQuery(query);

			while(rs.next()){
				String name, id, place, dr;
				name=rs.getString("name");
				id=rs.getString("id");
				place=rs.getString("place");
				dr=rs.getString("manager");
%>
		<tr>
			<td><%= id %></td><td><%= name %></td><td><%= place %></td><td><%= dr %></td>
			<td>
				<input type="hidden" id="text" value="<%= name%>"/>
				<input type="hidden" id="departmentid" value="<%= id %>"/>
				<button type="button" onclick="find_belong_ok();">선택</button>
				<script type="text/javascript">
					// member_add.jsp로 전송할 부분
				</script>
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
