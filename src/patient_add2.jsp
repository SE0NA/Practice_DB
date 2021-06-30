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

	private boolean checkzipcode(String zipcode){
		int tmp;
		if(zipcode.length()!=5)	return false;
		try{
			tmp=Integer.parseInt(zipcode);
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
	String sex=request.getParameter("sex");
	String zipcode=request.getParameter("zipcode");
	String address2=request.getParameter("address2");
	String insurancecode=request.getParameter("insurancecode");
	
	if(name==null||id1==null||id2==null||sex==null||zipcode==null||address2==null){
		%>
		<script>
		alert('필수 정보가 입력되지 않았습니다.');
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
	}
	else if(!checkzipcode(zipcode)){
		%>
		<script>
		alert('우편번호의 입력이 잘못되었습니다.');
		window.history.back();
		</script>
		<%
	}
	else{
		Class.forName("com.mysql.jdbc.Driver");
		String url="jdbc:mysql://localhost/hospital";
		String mysql_id = "patient_manage";
		String mysql_pw = "1234";
		
		String id=id1+"-"+id2;
		
		try{
			String query = "INSERT INTO patient (name, id, sex, zipcode, address2, insurancecode) VALUES (?, ?, ?, ?, ?, ?)";
			Connection conn=DriverManager.getConnection(url, mysql_id, mysql_pw);
			
			PreparedStatement pstmt = conn.prepareStatement(query);
			pstmt.setString(1, name);
			pstmt.setString(2, id);
			pstmt.setString(3, sex);
			pstmt.setString(4, zipcode);
			pstmt.setString(5, address2);
			pstmt.setString(6, insurancecode);
			
			pstmt.executeUpdate();
			
			pstmt.close();
			conn.close();
		} catch(Exception e){
			System.out.println("err: "+e);
		}
%>
		<!-- 신규 환자 등록 완료 안내 -->
		<script>
		alert('등록 완료!');
		location.href="patient_page.jsp";
		</script>
<%
	}
%>
