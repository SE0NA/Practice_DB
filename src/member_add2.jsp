<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<%!	
	private boolean checkid(String id1, String id2){
		int tmp;
		if(id1.length()!=6 || id2.length()!=7)	return false;
		try{
			tmp=Integer.parseInt(id1);
			tmp=Integer.parseInt(id2);
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
	String id1=request.getParameter("id_1");
	String id2=request.getParameter("id_2");
	String departmentid=request.getParameter("departmentid");
	String job=request.getParameter("job");
	String year=request.getParameter("year");
	String month=request.getParameter("month");
	String day=request.getParameter("day");
	
	if(name==null||id1==null||id2==null||departmentid==null||job==null||year==null||month==null||day==null){
%>
		<script>
		alert('입력되지 않은 정보가 있습니다.');
		window.history.back();
		</script>
<%
	}
	else if(!checkid(id1, id2)){
%>
		<script>
		alert('주민등록번호의 입력이 잘못되었습니다.');
		window.history.back();
		</script>
<%
	else{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost/hospital";
		String mysql_id = "patient_manage";
		String mysql_pw = "1234";
		
		String id=id1+"-"+id2;
		String date=year+"-"+month+"-"+day;
		try{
			String query = "INSERT INTO member (name, id, employed, belong, job) VALUES (?, ?, ?, ?, ?, ?);";
			Connection conn=DriverManager.getConnection(url, mysql_id, mysql_pw);
			
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, date);
			pstmt.setString(4, departmentid);
			pstmt.setString(5, job);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
%>
			<!-- 신규 환자 등록 완료 안내 -->
			<script>
			alert('등록 완료!');
			location.href="member_page.jsp";
			</script>
<%
		} catch(Exception e){
			System.out.println("err: "+e);
			%>
			<!-- 신규 환자 등록 완료 안내 -->
			<script>
			alert('등록에 오류가 있습니다. 중복을 확인하세요.');
			window.history.back();
			</script>
<%
		}
	}
%>
