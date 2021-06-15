<%-- 3.2 --%>

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.Date" %>
<%@ page import="java.text.DateFormat" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<head><title>오늘 날짜</title></head>
  <body>
    <%
      DateFormat dateFormat = DateFormat.getDateInstance(DateFormat.LONG);
      String s = dateFormat.format(new Date());
      out.println("오늘은 "+s);
    %>
  </body>
</html>


  
  <%-- 결과
  오늘은 2021년 6월 16일
  --%>
