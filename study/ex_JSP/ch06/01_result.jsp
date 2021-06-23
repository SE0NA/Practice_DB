<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<!DOCTYPE html>
<html>
<head><title></title></head>
<body>
	<center>
		<H2>request 테스트 결과-1</H2>
		<HR>
		<table border=1 cellspacing="1" cellpadding="5">
		<tr>
		<td>이름</td>
		<td><%= request.getParameter("username") %></td>
		<tr>
		<td>직업</td>
		<td><%= request.getParameter("job") %></td>
		<tr>
		<td>관심분야</td>
		<td>
		<%
			// getParameterValues 메서드를 이용해 "favorite"로 설정된
			// 폼의 체크박스들을 모두 읽어옴
			String favorites[] = request.getParameterValues("favorite");
			// 배열의 크기만큼 루프를 돌면서 값을 출력
			for(String favorite : favorites){
				out.println(favorite+"<BR>");
			}
			%></td>
		</table>
		<HR>
		<H2>request 테스트 결과=2</H2>
		<table border=0><tr><td>
		1. 클라이언트 IP 주소 : <%= request.getRemoteAddr() %><BR>
		2. 요청 메서드 : <%= request.getMethod() %><BR>
		<%
			Cookie cookie[] = request.getCookies();
		%>
		3. <%= cookie[0].getName() %>에 설정된 쿠키 값 : <%= cookie[0].getValue() %><BR>
		4. 프로토콜 : <%= request.getProtocol() %>
		</td></tr>
		</table>
	</center>
</body>
</html>
