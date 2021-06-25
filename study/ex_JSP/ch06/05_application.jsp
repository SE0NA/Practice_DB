<%@ page contentType="text/html; charset=UTF-8" import="java.io.*" %>

<html>
<head><title> </title></head>
<body>
<center>
	<H2>application 예제</H2>
	<HR>
	1. 서버 정보: <%= application.getServerInfo() %> <BR>
	2. 서블릿 API 버전 정보: <%= application.getMajorVersion()+"."+application.getMinorVersion() %> <BR>
	3. application.jsp 파일의 실제 경로: <%= application.getRealPath("application.jsp") %> <BR>
	
	<HR>
	setAttribute로 username 변수에 "홍길동" 설정 <P>
	<% application.setAttribute("username", "홍길동");
			application.log("username=홍길동");
			application.setAttribute("count",1);
	%>
	
	<a href="application_result.jsp">확인하기</a>
</center>
</body>
</html>
