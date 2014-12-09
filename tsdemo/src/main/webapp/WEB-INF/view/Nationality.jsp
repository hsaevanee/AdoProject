<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nationality</title>
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
			<td>    </td>
			<td>${SchoolName}</td>
			<td>All Primary Schools</td>
			<td>Aberdeen City</td>
			<td>${SchoolName}</td>
			<td>All Primary Schools</td>
			<td>Aberdeen City</td>
			<td>${SchoolName}</td>
			<td>All Primary Schools</td>
			<td>Aberdeen City</td>		
		</tr>
		<c:forEach var="Nationaldata" items="${Nationality}" varStatus="loopStatus">
		<tr class="${loopStatus.index % 2 == 0 ? 'even' : 'odd'}">
			<td>${Nationaldata.name}</td>
			<c:forEach var="data" items="${Nationaldata.data}" varStatus="loopStatus">
				<td>${data}</td>
			</c:forEach>
		</tr>

			
		</c:forEach>
	</table>
	
	Source: Pupil Census 
	<br>
	*In 2011  the Scottish Government introduced a new code list for Nationality, hence the historic data is not comparable.
	
	

</body>
</html>