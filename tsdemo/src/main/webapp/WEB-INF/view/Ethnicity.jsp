
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css" />">
<meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
<title>Ethnicity</title>
<style type="text/css">
	tr.head {background-color: #3399FF}
	tr.odd {background-color: #66CCFF}
	tr.even {background-color: #FFFFFF}
</style>
</head>
<body>



	<div id="container">
		<div id="header">
			<h1>Aberdeen City Council Digital Data Observatory Project</h1>
		</div>
		<div id="content">
			<div id="nav">
				<%@ include file="/css/menu.txt" %>	
			</div>
			<div id="main">
				<h2>${SchoolName}Ethnic Background</h2>
				<h3>Ethnic Background - Primary Schools (%pupils)</h3>
				<table>
					<tr>
						<th></th>
						<th>${SchoolName}</th>
						<th>All Primary Schools</th>
						<th>Aberdeen City</th>
						<th>${SchoolName}</th>
						<th>All Primary Schools</th>
						<th>Aberdeen City</th>
						<th>${SchoolName}</th>
						<th>All Primary Schools</th>
						<th>Aberdeen City</th>
					</tr>
					<c:forEach var="Edata" items="${EthnicData}" varStatus="loopStatus">
						<tr>
							<td>${Edata.name}</td>
							<c:forEach var="data" items="${Edata.data}"
								varStatus="loopStatus">
								<td>${data}</td>
							</c:forEach>
						</tr>


					</c:forEach>
				</table>
				<p>
				Source: Pupil Census <br> *In 2011 the Scottish Government
				introduced a new code list for Ethnicity, hence the historic data is
				not comparable
				</p>
			</div>
		</div>
		<div id="footer">Aberdeen City Council</div>
	</div>
</body>
</html>