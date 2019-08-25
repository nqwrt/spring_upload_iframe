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

	<a href="${path}/upload/uploadForm">업로드테스트</a>

<P>  The time on the server is ${serverTime}. </P>
</body>
</html>
