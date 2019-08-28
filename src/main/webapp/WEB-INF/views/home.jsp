<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Home</title>
</head>
<% String path = request.getContextPath();
   pageContext.setAttribute("path", path);
%>
<body>
<h1>
	Hello world!  
</h1>

<!-- iframe 요소를 이용하면 해당 웹 페이지 안에 어떠한 제한 없이 또 다른 하나의 웹 페이지를 삽입할 수 있습니다 -->
<iframe width="640" height="360" frameborder="0" src="https://joont.tistory.com/18"></iframe>

	<a href="${path}/upload/uploadForm">업로드테스트</a>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
