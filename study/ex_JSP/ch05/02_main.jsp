<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>include_action.jsp</title>
</head>
<body>
<H2>include_action.jsp에서 footer.jsp 호출</H2>
<HR>
	include_actiton.jsp에서 호출한 메시지입니다.<br>
	<jsp:include page="footer.jsp">
		<jsp:param name="email" value="test@test.com" />
		<jsp:param name="tel" value="010-0000-0000" />
	</jsp:include>
</body>
</html>
