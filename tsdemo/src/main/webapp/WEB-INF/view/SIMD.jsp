<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css" />">
<meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
<title>Scottish Index of Multiple Deprivation</title>
	<script type="text/javascript" src="<c:url value="/script/jquery-2.1.1.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/script/highcharts.js"/>"></script>
	<script type="text/javascript" src="http://code.highcharts.com/modules/exporting.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		 
		var param = { 'sSchoolNameText': '<c:out value='${SchoolName}'/>' }
		
		getSIMDData(param);
		
	});
	
	function getSIMDData(param) {		
		var sContextPath = '<c:url value="/"/>';
		$.ajax({
            type: 'GET',
            url: sContextPath + 'getChartData',
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
		            line: {
		                dataLabels: {
		                    enabled: true
		                },
		                enableMouseTracking: false
		            }
		        },

		        series: data,
		        credits: {
		            enabled: false
		        }
		    });
		}
		


</script>		
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
				<h2>${SchoolName}</h2>
				<h3>Scottish Index of Multiple Deprivation</h3>
				<br>
				<div id="divChartContainer"></div>
				<p>Scottish Index of Multiple Deprivation ( SIMD) 2012
					identifies small area concentrations of multiple deprivation across
					all of Scotland in a consistent way. The school census data was
					collected and matched at an individual pupil level to each data
					zone and decile (decile1 being the 10% most deprived areas in
					Scotland upto decile 10 the least deprived). Pupil level data was
					then analysed by school to produce the tables and charts above.
					This gives the distribution of pupils in each school by the
					datazone and respective decile. NB data includes pupils who live in
					Aberdeenshire but attend City schools.</p>
			</div>
		</div>
		<div id="footer">Aberdeen City Council</div>
	</div>

</body>
</html>