<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>신규 직원</title></head>
<body bgcolor=#EAEAEA>
<center>
<font color="#000000" face="나눔고딕">
<H3>신규 환자</H3>
<style type="text/css">
table{
	border-collapse: collapse;
	border: 1px solid black;
}
</style>
<form method="post" action="member_add2.jsp">
<table bgcolor="#FFFFFF" cellpadding="5">
	<tr>
		<td align=center>이름</td>
		<td><input type=text name="name"></td>
	</tr>
	<tr>
		<td align=center>주민등록번호</td>
		<td><input type=text name="id_1" maxlength="6">
			-
			<input type=password name="id_2" placeholder="********" maxlength="7"></td>
	</tr>
	<tr>
		<td align=center>부서</td>
		<td>부서코드: <input type="text" name="departmentid"/></td>
	</tr>
	<tr>
		<td align=center>구분</td>
		<td><input type=radio name="job" value="DR">의사
			<input type=radio name="job" value="NURSE">간호사</td>
	</tr>
	<tr>
		<td align=center>입사일</td>
		<td>
			<select name="year">
				<option value="2021">2021년</option>
				<option value="2022">2022년</option>
				<option value="2023">2023년</option>
				<option value="2024">2024년</option>
				<option value="2025">2025년</option>
			</select>
			/
			<select name="month">
				<option value="01">1월</option><option value="02">2월</option>
				<option value="03">3월</option><option value="04">4월</option>
				<option value="05">5월</option><option value="06">6월</option>
				<option value="07">7월</option><option value="08">8월</option>
				<option value="09">9월</option><option value="10">10월</option>
				<option value="11">11월</option><option value="12">12월</option>
			</select>
			/
			<select name="day">
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
	<td colspan="2" align=center><input type="submit" value="등록">
			             <input type="button" value="취소" onclick="location.href='member_page.jsp'"></td>
	</tr>
</table>
</form>
</font>
<H6>Practice_DB hospital 2021</H6>
</center>
</body>
</html>
