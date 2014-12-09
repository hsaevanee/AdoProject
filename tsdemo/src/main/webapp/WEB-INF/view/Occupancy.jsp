<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Occupancy</title>
<style type="text/css">
	tr.head {background-color: #3399FF}
	tr.odd {background-color: #66CCFF}
	tr.even {background-color: #FFFFFF}
</style>
</head>
<body>
<h1>${SchoolName} Nationality</h1>
<br>
<h2>Nationality - Primary Schools (%pupils)</h2>

	<table>
		<tr class='head'>
			<td>School Name</td>
			<td>School Roll** 2013/14</td>
			<td>Revised Capacity 2010*</td>
			<td>School Occupancy 2013/14 based on 2010 capacities (%)</td>
		</tr>
		<c:forEach var="Occupancydata" items="${Occupancy}" varStatus="loopStatus">
		<tr class="${loopStatus.index % 2 == 0 ? 'even' : 'odd'}">
			<td>${Occupancydata.name}</td>
			<c:forEach var="data" items="${Occupancydata.data}" varStatus="loopStatus">
				<td>${data}</td>
			</c:forEach>
		</tr>
		<tr><td></td></tr>
		</c:forEach>
	</table>
*Note: Revised Capacity  2010 figures used (Approved at ECS Committee 18/02/10)
<br>
**Note: Source Pupil Census 2013

</body>
</html>