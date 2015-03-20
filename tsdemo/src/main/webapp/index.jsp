<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css" />">
<meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
<title>Welcome</title>
</head>
<body>
 	<div id ="container">
 		<div id="header">
 			<h1> Aberdeen City Council Digital Data Observatory Project</h1>
 		</div>
 		<div id = "content">
 			<div id="nav">
 			<%@ include file="/css/menu.txt" %>
<!--  				<h3>Navigation</h3> -->
<!--  				<ul> -->
<%--  					<li><a href="${pageContext.request.contextPath}/">Home</a></li> --%>
<%--  					<li><a href="${pageContext.request.contextPath}/user/listXLSX">Population by Ward</a></li>					 --%>
<%--  					<li><a href="${pageContext.request.contextPath}/user/primaryProfile.html">Primary School Profile</a></li> --%>
<%--  					<li><a href="${pageContext.request.contextPath}/user/listXLSX.html">Secondary School Profile</a></li> --%>
<%--  					<li><a href="${pageContext.request.contextPath}/user/listXLSX.html">High School Profile</a></li> --%>
<%--  					<li><a href="${pageContext.request.contextPath}/user/NationalityData.html">Nationality Data</a></li>					 --%>
<!--  				</ul> -->
 			</div> 		
			<div id="main"> 		
				<h2> Home Page</h2>	
				<p>Welcome to Aberdeen data Observatory Project</p>	
			</div>
 		</div>
 		<div id="footer">
 			Aberdeen City Council 
 		</div>
 	</div>
 		
<!-- 	<!-- <a href="${pageContext.request.contextPath}/user/list.html">List all data</a> -->
<!-- 	<br>  -->  
<%-- 	<a href="${pageContext.request.contextPath}/user/listXLSX">Population by Ward</a> --%>
<!-- 	<br> -->
<%-- 	<a href="${pageContext.request.contextPath}/user/primaryProfile.html">Primary School Profile</a> --%>
<!-- 	<br> -->
<%-- 	<a href="${pageContext.request.contextPath}/user/listXLSX.html">Secondary School Profile</a> --%>
<!-- 	<br> -->
<%-- 	<a href="${pageContext.request.contextPath}/user/listXLSX.html">High School Profile</a> --%>
<!-- 	<br> -->
<%-- 	<a href="${pageContext.request.contextPath}/user/NationalityData.html">Nationality Data</a> --%>
	
</body>
</html>
