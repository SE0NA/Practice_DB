<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	int neid=-1;
	int hcode=-1;
	
	neid=Integer.parseInt(request.getParameter("add_nurse_id"));
	hcode=Integer.parseInt(request.getParameter("hcode"));
	
	if(neid==-1){
%>
		<script>
		alert('추가할 간호사의 사원번호를 입력하시오.');
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
			String query = "INSERT INTO patient_nurse(hospitalized_code, charged_n) VALUES (?, ?);";
			Connection conn=DriverManager.getConnection(url, mysql_id, mysql_pw);
			
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, hcode);
			pstmt.setInt(2, neid);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
%>
			<script>
			alert('등록 완료!');
			window.location=document.referrer;
			</script>
<%
		} catch(Exception e){
			System.out.println("err: "+e);
			%>
			<script>
			alert('등록에 오류가 있습니다. 중복을 확인하세요.');
			window.history.back();
			</script>
<%
		}
	}
%>
