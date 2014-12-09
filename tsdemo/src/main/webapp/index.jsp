<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<meta charset="utf-8">
<title>Welcome</title>
</head>
<body>
	<%-- <a href="${pageContext.request.contextPath}/user/list.html">List all data</a>
	<br>  --%>
	<a href="${pageContext.request.contextPath}/user/listXLSX">Population by Ward</a>
	<br>
	<a href="${pageContext.request.contextPath}/user/primaryProfile.html">Primary School Profile</a>
	<br>
	<a href="${pageContext.request.contextPath}/user/listXLSX.html">Secondary School Profile</a>
	<br>
	<a href="${pageContext.request.contextPath}/user/listXLSX.html">High School Profile</a>
	
</body>
</html>
