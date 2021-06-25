<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.ArrayList" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>add.jsp</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	String productname = request.getParameter("product");
	ArrayList list = (ArrayList)session.getAttribute("productlist");
	if(list==null){
		list = new ArrayList();
		session.setAttribute("productlist", list);
	}
	list.add(productname);
%>
<script>
alert("<%= productname %>이(가) 추가되었습니다.");
history.go(-1);
</script>
</body>
</html>
