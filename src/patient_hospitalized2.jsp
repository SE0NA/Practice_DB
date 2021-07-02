<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String p_id, e_year, e_month, e_day, d_year, d_month, d_day, charged_dr;
	p_id=null;	e_year=null;	e_month=null; e_day=null;
	d_year=null;	d_month=null;	d_day=null;	charged_dr=null;
	
	// patient_add.jsp의 입력값 저장
	p_id=request.getParameter("id");
	e_year=request.getParameter("e_year");
	e_month=request.getParameter("e_month");
	e_day=request.getParameter("e_day");
	d_year=request.getParameter("d_year");
	d_month=request.getParameter("d_month");
	d_day=request.getParameter("d_day");
	charged_dr=request.getParameter("charged_dr");
	
	String entereddate=e_year+e_month+e_day;
	String dischargeddate=d_year+d_month+d_day;
	
	if(entereddate.compareTo(dischargeddate)>0){
%>
		<script>
		alert('입, 퇴원 날짜를 확인바랍니다.');
		window.history.back();
		</script>
<%
	}
	else if(charged_dr.equals("")){
%>
		<script>
			alert('담당의사 항목을 확인바랍니다.');
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
			String query = "INSERT INTO hospitalized (patient_id, entered, discharged, charged_dr) VALUES (?, ?, ?, ?);";
			Connection conn=DriverManager.getConnection(url, mysql_id, mysql_pw);
			String inputdate=null;
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, p_id);
			inputdate=e_year+"-"+e_month+"-"+e_day;
			pstmt.setString(2, inputdate);
			inputdate=d_year+"-"+d_month+"-"+d_day;
			pstmt.setString(3, inputdate);
			pstmt.setString(4, charged_dr);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
%>
			<!-- 신규 환자 등록 완료 안내 -->
			<script>
			alert('등록 완료!');
			location.href="patient_page.jsp";
			</script>
<%
		} catch(Exception e){
			System.out.println("err: "+e);
			%>
			<!-- 신규 환자 등록 완료 안내 -->
			<script>
			alert('등록에 오류가 있습니다. 검토가 필요합니다.');
			window.history.back();
			</script>
<%
		}
	}
%>
