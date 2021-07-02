<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.sql.*" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>환자 입원</title></head>
<%
	String name=request.getParameter("name");
	String id=request.getParameter("id");
	
	String sex=null;
	Class.forName("com.mysql.jdbc.Driver");

	String db_url = "jdbc:mysql://localhost/hospital";
	String db_user = "patient_manage";
	String db_password = "1234";
	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	try{
		conn = DriverManager.getConnection(db_url, db_user, db_password);
		stmt = conn.createStatement();
		
		String query="SELECT sex FROM patient where id=\""+id+"\";";
		rs=stmt.executeQuery(query);
		if(rs.next()){
			sex=rs.getString("sex");
		}
	} catch(Exception e){
		System.out.println("err: "+e);
	}
%>

<!-- 담당의사 불러오기 -->
<script type="text/javascript">
	var openWin;
	function openDr(){
		openWin=window.open("patient_hospitalized_dr.jsp", "담당의사 검색", "width=400, height=300, resizable=no, scrollbars=yes");
	}
</script>

<body bgcolor=#EAEAEA>
<center>
<font color="#000000" face="나눔고딕">

<H3>환자 입원</H3>
<style type="text/css">
table{
	border-collapse: collapse;
	border: 1px solid black;
}
</style>

<form method=post action="patient_hospitalized2.jsp">
<table bgcolor="#FFFFFF" cellpadding="5">
	<tr>
		<td colspan="2" align=center bgcolor="#FAED7D">환자</td>
	</tr>
	<tr>
		<td align=center>이름</td>
		<td><%= name %></td>
	</tr>
	<tr>
		<td align=center>주민등록번호</td>
		<td><%= id %><input type="hidden" name="id" value="<%= id %>"></td>
	</tr>
	<tr>
		<td align=center>성별</td>
		<td><%= sex %></td>
	</tr>
	<tr>
		<td colspan="2" align=center bgcolor="#FAED7D">입원 등록</td>
	</tr>
	<tr>
		<td align=center>입원일</td>
		<td>
			<select name="e_year">
				<option value="2021">2021년</option>
				<option value="2022">2022년</option>
				<option value="2023">2023년</option>
				<option value="2024">2024년</option>
				<option value="2025">2025년</option>
			</select>
			/
			<select name="e_month">
				<option value="01">1월</option><option value="02">2월</option>
				<option value="03">3월</option><option value="04">4월</option>
				<option value="05">5월</option><option value="06">6월</option>
				<option value="07">7월</option><option value="08">8월</option>
				<option value="09">9월</option><option value="10">10월</option>
				<option value="11">11월</option><option value="12">12월</option>
			</select>
			/
			<select name="e_day">
				<option value="01">1일</option><option value="02">2일</option>
				<option value="03">3일</option><option value="04">4일</option>
				<option value="05">5일</option><option value="06">6일</option>
				<option value="07">7일</option><option value="08">8일</option>
				<option value="09">9일</option><option value="10">10일</option>
				<option value="11">11일</option><option value="12">12일</option>
				<option value="13">13일</option><option value="14">14일</option>
				<option value="15">15일</option><option value="16">16일</option>
				<option value="17">17일</option><option value="18">18일</option>
				<option value="19">19일</option><option value="20">20일</option>
				<option value="21">21일</option><option value="22">22일</option>
				<option value="23">23일</option><option value="24">24일</option>
				<option value="25">25일</option><option value="26">26일</option>
				<option value="27">27일</option><option value="28">28일</option>
				<option value="29">29일</option><option value="30">30일</option>
				<option value="31">31일</option>
			</select>
		</td>
	</tr>
	<tr>
		<td align=center>퇴원일</td>
		<td>
			<select name="d_year">
				<option value="2021">2021년</option>
				<option value="2022">2022년</option>
				<option value="2023">2023년</option>
				<option value="2024">2024년</option>
				<option value="2025">2025년</option>
			</select>
			/
			<select name="d_month">
				<option value="01">1월</option><option value="02">2월</option>
				<option value="03">3월</option><option value="04">4월</option>
				<option value="05">5월</option><option value="06">6월</option>
				<option value="07">7월</option><option value="08">8월</option>
				<option value="09">9월</option><option value="10">10월</option>
				<option value="11">11월</option><option value="12">12월</option>
			</select>
			/
			<select name="d_day">
				<option value="01">1일</option><option value="02">2일</option>
				<option value="03">3일</option><option value="04">4일</option>
				<option value="05">5일</option><option value="06">6일</option>
				<option value="07">7일</option><option value="08">8일</option>
				<option value="09">9일</option><option value="10">10일</option>
				<option value="11">11일</option><option value="12">12일</option>
				<option value="13">13일</option><option value="14">14일</option>
				<option value="15">15일</option><option value="16">16일</option>
				<option value="17">17일</option><option value="18">18일</option>
				<option value="19">19일</option><option value="20">20일</option>
				<option value="21">21일</option><option value="22">22일</option>
				<option value="23">23일</option><option value="24">24일</option>
				<option value="25">25일</option><option value="26">26일</option>
				<option value="27">27일</option><option value="28">28일</option>
				<option value="29">29일</option><option value="30">30일</option>
				<option value="31">31일</option>
			</select>
		</td>
	</tr>
	<tr>
		<td align=center>담당의사</td>
		<td><input type="text" id="drtextInput">
			<input type="hidden" id="dridInput" name="charged_dr">
			<input type="button" value="검색" onclick="openDr()">
		</td>
	</tr>
	<tr>
	<td colspan="3" align=center><input type="submit" value="등록">
								 <input type="button" value="취소" onclick="history.back()"></td>
	</tr>
</table>
</form>
</font>
<H6>Practice_DB hospital 2021</H6>
</center>
</body>
</html>
