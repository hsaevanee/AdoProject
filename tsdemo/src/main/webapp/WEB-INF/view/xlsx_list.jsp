<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
<!-- <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> -->
<link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css" />">
<meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
<title>Insert title here</title>
</head>
<body>

<div id ="container">
 		<div id="header">
 			<h1> Aberdeen City Council Digital Data Observatory Project</h1>
 		</div>
	<div id = "content">
		<div id="nav">
 			<%@ include file="/css/menu.txt" %>	
  		</div> 		
		<div id="main">
			<h2>Population by Ward</h2>
			<div>			
			<table>
				<thead>
				<tr>
					<c:forEach var="xlsxColName" items="${XLSXcolName}">
						<th>${xlsxColName}</th>
					</c:forEach>
				</tr>
				</thead>
				<c:forEach var="xlsxSamepleData" items="${listXLSXSamepleData}"
					varStatus="loopStatus">
					<tr class="${loopStatus.index % 2 == 0 ? 'even' : 'odd'}">
						<td>${xlsxSamepleData.wardCode}</td>
						<td>${xlsxSamepleData.wardName}</td>
						<td>${xlsxSamepleData.allAges}</td>
						<td>${xlsxSamepleData.age0to4}</td>
						<td>${xlsxSamepleData.age5to9}</td>
						<td>${xlsxSamepleData.age10to15}</td>
						<td>${xlsxSamepleData.age16to19}</td>
						<td>${xlsxSamepleData.age20to24}</td>
						<td>${xlsxSamepleData.age25to29}</td>
						<td>${xlsxSamepleData.age30to34}</td>
						<td>${xlsxSamepleData.age35to39}</td>
						<td>${xlsxSamepleData.age40to44}</td>
						<td>${xlsxSamepleData.age45to49}</td>
						<td>${xlsxSamepleData.age50to54}</td>
						<td>${xlsxSamepleData.age55to59}</td>
						<td>${xlsxSamepleData.age60to64}</td>
						<td>${xlsxSamepleData.age65to69}</td>
						<td>${xlsxSamepleData.age70to74}</td>
						<td>${xlsxSamepleData.age75to79}</td>
						<td>${xlsxSamepleData.age80to84}</td>
						<td>${xlsxSamepleData.age85to89}</td>
						<td>${xlsxSamepleData.age90toOver}</td>
					</tr>

				</c:forEach>
			</table>
			</div>
		</div>
		 <div id="footer">
 			Aberdeen city Council, Marishall Colleage
 		</div>
	</div>
</div>
</body>
</html>