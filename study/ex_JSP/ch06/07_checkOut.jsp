<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>checkOut.jsp</title>
</head>
<body>
<center>
	<H2>계산</H2>
	선택한 상품 목록
	<HR>
	<%
		ArrayList list = (ArrayList)session.getAttribute("productlist");
		if(list==null){
			out.println("선택한 상품이 없습니다.");
		}
		else{
			for(Object productname:list){
				out.println(productname+"<BR>");
			}
		}
	%>
</center>
</body>
</html>
