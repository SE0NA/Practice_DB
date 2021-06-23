<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head><title> </title></head>
<body>
지금 보이는 화면은 page_control_end.jsp에서 출력된 결과입니다.
<HR>
이름: <%= request.getParameter("username") %><BR>
전화번호: <%= request.getParameter("tel") %>
</body>
</html>
