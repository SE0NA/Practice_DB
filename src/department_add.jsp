<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head><title>신규 직원</title></head>
<body bgcolor=#EAEAEA>
<center>
<font color="#000000" face="나눔고딕">
<H3>신규 부서</H3>
<style type="text/css">
table{
	border-collapse: collapse;
	border: 1px solid black;
}
</style>

<form method=post action="department_add2.jsp">
<table bgcolor="#FFFFFF" cellpadding="5">
	<tr>
		<td align=center>이름</td>
		<td><input type=text name="name"></td>
	</tr>
	<tr>
		<td align=center>위치</td>
		<td><input type="text" name="place">
		</td>
	</tr>
	<tr>
		<td align=center>총병상수</td>
		<td><input type="text" name="total_bed"></td>
	</tr>

	<tr>
	<td colspan="2" align=center><input type="submit" value="등록">
								               <input type="button" value="취소" onclick="location.href='department_page.jsp'"></td>
	</tr>
</table>
</form>
</font>
<H6>Practice_DB hospital 2021</H6>
</center>
</body>
</html>
