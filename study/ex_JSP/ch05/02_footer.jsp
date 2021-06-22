<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head><title>footer.jsp</title>
</head>
<body>
footer.jsp에서 출력한 메시지입니다.
<HR>
	<%= request.getParameter("email") %>,
	<%= request.getParameter("tel") %>
</body>
</html>
