<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>forward_action.jsp</title></head>
<body>
	<H2>forward_action.jsp에서 footer.jsp 호출</H2>
	<HR>
	forward_action.jsp에서 호출한 메시지입니다.<BR>
	<jsp:forward page="footer.jsp">
	<jsp:param name="email" value="test@test.com"/>
	<jsp:param name="tel" value="010-0000-0000"/>
	</jsp:forward>
</body>
</html>
