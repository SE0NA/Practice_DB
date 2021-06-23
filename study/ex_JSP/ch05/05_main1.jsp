<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>scriptlet1.jsp</title></head>
<body>
<div align="center">
	<H2>스크립트릿 테스트1 : 1-10까지 출력</H2>
	<HR>
	<%
		for(int i=1; i<=10; i++){
			out.println(i+"<BR>");
		}
	%>
</div>
</body>
</html>
