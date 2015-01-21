<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.util.Set"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Nationality</title>
<style type="text/css">
	tr.head {background-color: #3399FF}
	tr.odd {background-color: #66CCFF}
	tr.even {background-color: #FFFFFF}
</style>
	<script type="text/javascript" src="<c:url value="/script/jquery-2.1.1.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/script/highcharts.js"/>"></script>
	<script type="text/javascript" src="http://code.highcharts.com/modules/exporting.js"></script>
	<script type="text/javascript">
		var sContextPath = '<c:url value="/"/>';
		$(function() {
			$('#buttonGetData').click(function() {
				// get all checked checkbox
				var arrCheckboxChecked = [];
				$("#formNationalCriteria input:checkbox:checked").each(function() {
				    arrCheckboxChecked.push($(this).val());
				});
				// create 'NationalParams' object as a parameter to controller
				var mNationalParams = { listCondition: arrCheckboxChecked };
				getNationalData(mNationalParams);
			});
		});
		
		function getNationalData(mNationalParams) {
			$.ajax({
	            type: 'POST',
	            url: sContextPath + '/user/getQueryNationalityData',
	            data: JSON.stringify(mNationalParams),
	            contentType: 'application/json; charset=utf-8',
	            dataType: 'json',
	            success: function (data) {
	            	// controller return 'NationalData' object in json format, add more properties as you want..
	            	// using jquery to create html table
	            	setNationalDataToTable(data)    
	            },
	            error: function (xhr, err) {
	                if (xhr.readyState != 0 && xhr.status != 0) {
	                    alert('readyState: ' + xhr.readyState + '\nstatus: ' + xhr.status);
	                    alert('responseText: ' + xhr.responseText);
	                }
	            },
	            async: false
	        });
		}
		
		function setNationalDataToTable(listNationalData) {
			// remove all existing header & row
			//$("#tableNationalData").html("");
			
			// create header
			var sTableHtml = "<thead><tr><th rowspan='2'>Nationality</th>";
			$.each(listNationalData[0].listSexData, function(index, item){
				sTableHtml += ("<th colspan='2'>" + item.year + "</th>");
			})
			sTableHtml += "</tr><tr>";
			$.each(listNationalData[0].listSexData, function(index, item){
				sTableHtml += "<th>Female</th>";
				sTableHtml += "<th>Male</th>";
			})
			sTableHtml += "</tr></thead>";
			
			// create row data
			sTableHtml += "<tbody>";
			$.each(listNationalData, function(index, item){
				sTableHtml += ("<tr><td>" + item.nationality + "</td>");
				$.each(item.listSexData, function(index, item){
					sTableHtml += ("<td>" + item.totalFemale + "</td>");
					sTableHtml += ("<td>" + item.totalMale + "</td>");						
				})
				sTableHtml += ("<td><input type='checkbox' name='CheckDataitem' id='item' value='" + index + "'/></td>");
				sTableHtml += "</tr>";
			})
			sTableHtml += ("<tr><td><button onclick='myFunction()'><label>Bar Chart</label></button></td></tr>");
			sTableHtml += "</tbody>";
			$("#tableNationalDataContainer").append(sTableHtml);			
		}	
		
		function myFunction() {
		    alert("I am an alert box!");
		    var arrCheckboxDataChecked = [];
		    $("#tableNationalDataContainer input:checkbox:checked").each(function() {
				arrCheckboxDataChecked.push($(this).val());
				//alert(publishData[0].listSexData);
			});
			// create 'NationalParams' object as a parameter to controller
			Chartdata = { listDataChecked: arrCheckboxDataChecked };
			alert("I am an alert checkbox!"+Chartdata);
		   
		}

	</script>

</head>
<body>
<h1>Nationality - Primary Schools (%pupils)</h1>

	<form id="formNationalCriteria">

	<table>
			<tr>
				<td> Select Year </td>
				<c:forEach var="Ydata" items="${syears}" varStatus="loopStatus">
					<td>
						<input type="checkbox" name="years" value="${Ydata}"/> <c:out value="${Ydata}" />
					</td>
				</c:forEach>	
			</tr>
	
			<tr>
				<td> Select Gender </td>
				<c:forEach var="data" items="${sgender}" varStatus="loopStatus">
					<c:if test="${data =='F'}">
					<td>
						<input type="checkbox" name="gender" value="${data}"/>Female
					</td>
					</c:if>
					<c:if test="${data =='M'}">
					<td>
						<input type="checkbox" name="gender" value="${data}"/>Male
					</td>
					</c:if>
					
				</c:forEach>	
			</tr>
			
			<tr>
				<td> Select Nationality </td>
				<c:forEach var="Ndata" items="${snational}" varStatus="loopStatus">
					<c:if test="${Ndata =='01'}">
						<td><input type="checkbox" name="nationality" value="01"/> Scottish</td>						
					</c:if>
					<c:if test="${Ndata =='02'}">
						<td><input type="checkbox" name="nationality" value="02"/> English</td>						
					</c:if>
					<c:if test="${Ndata =='03'}">
						<td><input type="checkbox" name="nationality" value="03"/> Northern Irish</td>						
					</c:if>
					<c:if test="${Ndata =='04'}">
						<td><input type="checkbox" name="nationality" value="04"/> Welsh</td>						
					</c:if>
					<c:if test="${Ndata =='05'}">
						<td><input type="checkbox" name="nationality" value="05"/> British</td>						
					</c:if>
					<c:if test="${Ndata =='10'}">
						<td><input type="checkbox" name="nationality" value="10"/> Other</td>						
					</c:if>
					<c:if test="${Ndata =='98'}">
						<td><input type="checkbox" name="nationality" value="98"/> Not Disclosed</td>						
					</c:if>
					<c:if test="${Ndata =='99'}">
						<td><input type="checkbox" name="nationality" value="99"/> Not Known</td>						
					</c:if>		
					
				</c:forEach>	
			</tr>

			<tr><td><button id="buttonGetData"><label>Get Data</label></button></td></tr>
	</table>		
	<div id="tableNationalDataContainer"></div>
</form>

</body>
</html>