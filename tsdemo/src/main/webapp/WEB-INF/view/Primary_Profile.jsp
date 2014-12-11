<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
	tr.head {background-color: #3399FF}
	tr.odd {background-color: #66CCFF}
	tr.even {background-color: #FFFFFF}
</style>
<title>Primary School Profile Test Test</title>
	<script type="text/javascript" src="<c:url value="/script/jquery-2.1.1.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/script/highcharts.js"/>"></script>
	<script type="text/javascript" src="http://code.highcharts.com/modules/exporting.js"></script>
	<script type="text/javascript">
		var sContextPath = '<c:url value="/"/>';
		$(function() {
			$.ajax({
	            type: 'GET',
	            url: sContextPath + '/getSchoolname',
	            data: {},
	            contentType: 'application/json; charset=utf-8',
	            dataType: 'json',
	            success: function (data) {
	                $.each(data, function(idx, obj) {
	                	$('#selectSchoolname').append(new Option(obj, obj));
	                });
	                //$('#selectSchoolname').options.selectedIndex = 1;
	              	initData();
	            },
	            error: function (xhr, err) {
	                if (xhr.readyState != 0 && xhr.status != 0) {
	                    alert('readyState: ' + xhr.readyState + '\nstatus: ' + xhr.status);
	                    alert('responseText: ' + xhr.responseText);
	                }
	            },
	            async: false
	        });
			
			$('#selectSchoolname').change(function() {
				initData();
			});				
		});
		function initData() {
			var param = { 'sSchoolNameText': $('#selectSchoolname option:selected').text()}
			getSchoolData(param);
			getChartData(param);
		}
		
		function getSchoolData(param) {
			$.ajax({
	            type: 'GET',
	            url: sContextPath + '/getSchoolData',
	            data: param,
	            contentType: 'application/json; charset=utf-8',
	            dataType: 'json',
	            success: function (data) {
	            	setProfileData(data);
	               // drawChart(data);
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
		
		function setProfileData(data) {
			for (i=0;i<=36;i++){				
				$('#span'+i).text(data[i]);
			}				
		}
		
		function getChartData(param) {
			$.ajax({
	            type: 'GET',
	            url: sContextPath + '/getChartData',
	            data: param,
	            contentType: 'application/json; charset=utf-8',
	            dataType: 'json',
	            success: function (data) {
	                drawChart(data);
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

		
		function drawChart(data) {
			$('#divChartContainer').highcharts({
		        chart: {
		            type: 'column'
		        },
		        title: {
		            text: 'Scottish Index of Multiple Deprivation'
		        },
		        subtitle: {
		            text: ''
		        },
		        xAxis: {
		            //categories: [ '0%', '5%', '10%', '15%','20%','25%','30%'],
		            categories: [ '1', '2', '3','4','5','6','7','8','9','10'],
		            title:{text: 'Deciles' }
		        },
		        yAxis: {
		            min: 0,
		            title: {
		                text: '% Pupils in Each Decile (Census 2013)'
		            }
		        },
		        tooltip: {
		            headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
		            pointFormat: '<tr><td nowrap style="color:{series.color};padding:0">{series.name}: </td>' +
		                '<td style="padding:0"><b>{point.y:.0f}</b></td></tr>',
		            footerFormat: '</table>',
		            shared: true,
		            useHTML: true
		        },
		        plotOptions: {
		            column: {
		                pointPadding: 0.2,
		                borderWidth: 0
		            }
		        },
		        series: data,
		        credits: {
		            enabled: false
		        }
		    });
		}
		
		
		
		function goToCreateURL(object) {
			var sSchoolNameText = $('#selectSchoolname option:selected').text();
			return object.href += sSchoolNameText;
		}

</script>		
</head>
<body>
 <h1>Primary School Profile</h1>
			
			

<div id="divCriteria">
	<h2>Select School </h2>
	<select id="selectSchoolname"></select>
</div>
 
 <h2> <a onclick="goToCreateURL(this)" href="${pageContext.request.contextPath}/user/SchoolRoll/">School Roll</a> </h2>
 
	<table>
		<tr>
				<td>Total School Roll</td>			
		 		<td><span id="span0"></span></td>	
		</tr>
		<tr>
				<td>Capacity (2010 Based)</td>			
		 		<td><span id="span1"></span></td>	
		 </tr>	
		<tr>
				<td>% Occupancy 2013/14 (based on 2010 Capacity) </td>			
		 		<td><span id="span2"></span></td>	
		 </tr> 
	</table>
	
 <h2><a onclick="goToCreateURL(this)" href="${pageContext.request.contextPath}/user/PIPS/"> PIPS </a></h2>
	 <table>
		<tr class='head'>
				<th> </th>			
		 		<th>School Start P1</th>
		 		<th>Aberdeen Start P1</th>
		 		<th>School End Start P1</th>
		 		<th>Aberdeen End P1</th>
		 			
		 </tr>
		<tr class='even'>
				<td>Reading</td>			
		 		<td><span id="span3"></span></td>
		 		<td><span id="span4"></span></td>
		 		<td><span id="span5"></span></td>
		 		<td><span id="span6"></span></td>
		 </tr>
		<tr  class='odd'>
				<td>Mathematics</td>			
		 		<td><span id="span7"></span></td>
		 		<td><span id="span8"></span></td>
		 		<td><span id="span9"></span></td>
		 		<td><span id="span10"></span></td>
		 </tr>	 
	</table>
	<table>
		<tr class='head'>
				<th> </th>			
		 		<th>School P3</th>
		 		<th>Aberdeen P3</th>		 			
		 </tr>
		<tr>
				<td>Reading</td>			
		 		<td><span id="span11"></span></td>
		 		<td><span id="span12"></span></td>
		 </tr>	
		<tr class='odd'>
				<td>Mathematics</td>			
		 		<td><span id="span13"></span></td>
		 		<td><span id="span14"></span></td>
		 </tr>	 
	</table>
		<table>
		<tr class='head'>
				<th> </th>			
		 		<th>School P5</th>
		 		<th>Aberdeen P5</th>		 			
		 </tr>
		<tr>
				<td>Reading</td>			
		 		<td><span id="span15"></span></td>
		 		<td><span id="span16"></span></td>
		 </tr>	
		<tr class='odd'>
				<td>Mathematics</td>			
		 		<td><span id="span17"></span></td>
		 		<td><span id="span18"></span></td>
		 </tr>	 
	</table>
	<table>
		<tr class='head'>
				<th> </th>			
		 		<th>School P7</th>
		 		<th>Aberdeen P7</th>		 			
		 </tr>
		<tr>
				<td>Reading</td>			
		 		<td><span id="span19"></span></td>
		 		<td><span id="span20"></span></td>
		 </tr>	
		<tr class='odd'>
				<td>Mathematics</td>			
		 		<td><span id="span21"></span></td>
		 		<td><span id="span22"></span></td>
		 </tr>	 
	</table>
	
<h2> <a onclick="goToCreateURL(this)" href="${pageContext.request.contextPath}/user/Attendance/">Attendance</a> </h2>

	 <table>
		<tr class='head'>
				<th> </th>			
		 		<th>School</th>
		 		<th>City</th>	 		
		</tr>
		<tr>
				<td>% Authorised Absence</td>			
		 		<td><span id="span23"></span></td>
		 		<td><span id="span24"></span></td>
		</tr>	
		<tr class='odd'>
				<td>% Unauthorised Absence</td>			
		 		<td><span id="span25"></span></td>
		 		<td><span id="span26"></span></td>
		</tr>	 
		<tr>
				<td>% Total Absence</td>			
		 		<td><span id="span27"></span></td>
		 		<td><span id="span28"></span></td>
		 </tr>	 		 
	</table>
	
	<h2> <a onclick="goToCreateURL(this)" href="${pageContext.request.contextPath}/user/Exclusions/">Exclusions Annual</a> </h2>
	 <table>
		<tr class='head'>
				<th> </th>			
		 		<th>School</th>
		 		<th>City</th>	 		
		</tr>
		<tr>
				<td>Data of Days Lost Per 1000 Pupils </td>			
		 		<td><span id="span29"></span></td>
		 		<td><span id="span30"></span></td>
		</tr>	
		<tr class='odd'>
				<td>Data of Removals from the Register</td>			
		 		<td><span id="span31"></span></td>
		 		<td><span id="span32"></span></td>
		</tr>	 
	</table>
	
	<h2><a onclick="goToCreateURL(this)" href="${pageContext.request.contextPath}/user/Violent/"> Violent Incidents  Annual</a></h2>
	
	 <table>
		<tr class='head'>
				<th> </th>			
		 		<th>School</th>
		 		<th>City</th>	 		
		</tr>
		<tr>
				<td>Data of Violent Incidents Reported </td>			
		 		<td><span id="span33"></span></td>
		 		<td><span id="span34"></span></td>
		</tr>	
		<tr class='odd'>
				<td>Data of Violent Incidents Reported Per 100 </td>			
		 		<td><span id="span35"></span></td>
		 		<td><span id="span36"></span></td>
		</tr>	 
	</table>
	
<br>
<h2> <a onclick="goToCreateURL(this)" href="${pageContext.request.contextPath}/user/SIMD/">Scottish Index of Multiple Deprivation</a></h2>
<br>	
<div id="divChartContainer">
</div>

<h2> <a onclick="goToCreateURL(this)" href="${pageContext.request.contextPath}/user/Ethnicity/">Ethnicity</a></h2>
<br>
<h2> <a onclick="goToCreateURL(this)" href="${pageContext.request.contextPath}/user/Nationality/">Nationality</a></h2>
<br>
<h2> <a onclick="goToCreateURL(this)" href="${pageContext.request.contextPath}/user/Occupancy/">Occupancy</a></h2>

</body>
</html>