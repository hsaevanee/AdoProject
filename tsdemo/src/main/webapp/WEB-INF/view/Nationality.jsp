<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css" />">
<meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
<title>Nationality</title>
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
				<h2>${SchoolName}Nationality</h2>
				<h3>Nationality - Primary Schools (%pupils)</h3>
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
					<c:forEach var="Nationaldata" items="${Nationality}"
						varStatus="loopStatus">
						<tr class="${loopStatus.index % 2 == 0 ? 'even' : 'odd'}">
							<td>${Nationaldata.name}</td>
							<c:forEach var="data" items="${Nationaldata.data}"
								varStatus="loopStatus">
								<td>${data}</td>
							</c:forEach>
						</tr>
					</c:forEach>
				</table>
				<p>
				Source: Pupil Census <br> *In 2011 the Scottish Government
				introduced a new code list for Nationality, hence the historic data
				is not comparable.
				</p>
			</div>
		</div>
		<div id="footer">Aberdeen City Council</div>
	</div>
</body>
</html>