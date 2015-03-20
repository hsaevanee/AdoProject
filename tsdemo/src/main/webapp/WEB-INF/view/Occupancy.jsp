<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Occupancy</title>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css" />">
<meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
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
						<th>School Name</th>
						<th>School Roll** 2013/14</th>
						<th>Revised Capacity 2010*</th>
						<th>School Occupancy 2013/14 based on 2010 capacities (%)</th>
					</tr>
					<c:forEach var="Occupancydata" items="${Occupancy}"
						varStatus="loopStatus">
						<tr class="${loopStatus.index % 2 == 0 ? 'even' : 'odd'}">
							<td>${Occupancydata.name}</td>
							<c:forEach var="data" items="${Occupancydata.data}"
								varStatus="loopStatus">
								<td>${data}</td>
							</c:forEach>
						</tr>
					</c:forEach>
				</table>
				<p>
				*Note: Revised Capacity 2010 figures used (Approved at ECS Committee
				18/02/10) <br> **Note: Source Pupil Census 2013
				</p>
			</div>
		</div>
		<div id="footer">Aberdeen City Council</div>
	</div>
</body>
</html>