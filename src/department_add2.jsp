<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<%!	
	private boolean checkint(String x){
		int tmp;
		try{
			tmp=Integer.parseInt(x);
		} catch(Exception e){
			return false;
		}
		return true;
	}
%>
<%
	request.setCharacterEncoding("UTF-8");

	// patient_add.jsp의 입력값 저장
	String name=request.getParameter("name");
	String place=request.getParameter("place");
	String total_bed=request.getParameter("total_bed");
	String managerid=request.getParameter("managerid");
	
	if(name==null||place==null||total_bed==null){
%>
		<script>
		alert('입력되지 않은 항목이 있습니다.');
		window.history.back();
		</script>
<%
	}
	else if(!checkint(total_bed)){
%>
		<script>
		alert('총병상수 입력이 잘못되었습니다.');
		window.history.back();
		</script>
<%
	}
	else{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost/hospital";
		String mysql_id = "patient_manage";
		String mysql_pw = "1234";
		
		try{
			String query = "INSERT INTO department(name, place, total_bed) VALUES (?, ?, ?);";
			Connection conn=DriverManager.getConnection(url, mysql_id, mysql_pw);
			
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, place);
			pstmt.setInt(3, Integer.parseInt(total_bed));
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
%>
			<!-- 신규 부서 등록 완료 안내 -->
			<script>
			alert('등록 완료!');
			location.href="department_page.jsp";
			</script>
<%
		} catch(Exception e){
			System.out.println("err: "+e);
			%>
			<!-- 신규 부서 등록 완료 안내 -->
			<script>
			alert('등록에 오류가 있습니다. 중복을 확인하세요.');
			window.history.back();
			</script>
<%
		}
	}
%>
