<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%!
	// 멤버 변수 선언
	int num1, num2 = 0;
	int result = 0;
	String op ="";
	
	// 연산자별 처리를 위한 메서드 선언
	public int calculator(){
		if(op.equals("+")){
			result = num1 + num2;
		}
		else if(op.equals("-")){
			result = num1 - num2;
		}
		else if(op.equals("*")){
			result = num1 * num2;
		}
		else if(op.equals("/")){
			result = num1 / num2;
		}
		return result;
	}
%>

<%
	// 웹페이지 요청이 POST인 경우에만 수행
	// 즉, 폼을 통해 전달된 것만 수행
	// 초기 로딩 시 오류 방지
	if(request.getMethod().equals("POST")){
		// 문자열 형태 → int로 변환
		num1 = Integer.parseInt(request.getParameter("num1"));
		num2 = Integer.parseInt(request.getParameter("num2"));
		op = request.getParameter("operator");
	}
%>
    
<!DOCTYPE html>
<html>
<head><title>계산기</title></head>
<body>
	<center>
	<H3>계산기</H3>
	<HR>
	<form name=form1 method=post>
	<INPUT TYPE="text"  NAME="num1" width=200 size="5">
	<SELECT NAME = "operator">
		<option selected>+</option>
		<option>-</option>
		<option>*</option>
		<option>/</option>
	</SELECT>
	<INPUT TYPE="text" NAME="num2" width=200 size="5">
	<input type="submit" value="계산" name="B1">
	<input type="reset" value="초기화" name="B2">
	</form>
	<HR>계산결과 : <%= calculator() %>
	</center>
</body>
</html>
