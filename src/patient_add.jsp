<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>신규 환자</title></head>
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
<form method="post" action="patient_add2.jsp">
<table bgcolor="#FFFFFF" cellpadding="5">
	<tr>
		<td align=center>이름</td>
		<td><input type=text name="name"></td>
	</tr>
	<tr>
		<td align=center>주민등록번호</td>
		<td><input type=text name="id_1" maxlength="6">-<input type=password name="id_2" placeholder="*******" maxlength="6"></td>
	</tr>
	<tr>
		<td align=center>성별</td>
		<td><input type=radio name="sex" value="M">남자
			<input type=radio name="sex" value="F">여자</td>
	</tr>
	<tr>
		<td align=center>우편번호</td>
		<td><input type=text name="zipcode" maxlength="5"></td>
	</tr>
	<tr>
		<td align=center>주소</td>
		<td><input type="text" name="address2"></td>
	</tr>
	<tr>
		<td align=center>보험코드</td>
		<td><input type="text" name="insurancecode"></td>
	</tr>
	<tr>
	<td colspan="3" align=center><input type="submit" value="등록">
				     <input type="button" value="취소" onclick="history.back(-1);"></td>
	</tr>
</table>
</form>
</font>
<H6>Practice_DB hospital 2021</H6>
</center>
</body>
</html>
