<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" type="text/css" href="<c:url value="/css/style.css" />">
<meta name="viewport" content="width=device-width, initial-scale=1.0" charset="utf-8">
<title>Attendance</title>
	<script type="text/javascript" src="<c:url value="/script/jquery-2.1.1.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/script/highcharts.js"/>"></script>
	<script type="text/javascript" src="http://code.highcharts.com/modules/exporting.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		 
		var param = { 'sSchoolNameText': '<c:out value='${SchoolName}'/>' }
		
		getAttendanceData(param);
		
	});
	
	function getAttendanceData(param) {		
		var sContextPath = '<c:url value="/"/>';
		$.ajax({
            type: 'GET',
            url: sContextPath + 'getAttendanceData',
            data: param,
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (data) {
            	//setProfileData(data);
               drawAuthrisedAbsenceChart(data[0]);
               drawUnauthrisedAbsenceChart(data[1]);
               drawTotalAbsenceChart(data[2]);
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

		function drawAuthrisedAbsenceChart(data) {
			$('#divChartAuthrisedContainer').highcharts({
		        chart: {
		            type: 'line'
		        },
		        title: {
		            text: 'Authorised Absence'
		        },
		        subtitle: {
		            text: ''
		        },
		        xAxis: {
		            //categories: [ '0%', '5%', '10%', '15%','20%','25%','30%'],
		            categories: [ '2001/02', '2002/03', '2003/04','2004/05','2005/06','2006/07','2007/08','2008/09','2009/10','2010/11','2011/12', '2012/13'],
		            title:{text: '' }
		        },
		        yAxis: {
		            min: 0,
		            title: {
		                text: '% Authorised Absence'
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
		
		function drawUnauthrisedAbsenceChart(data) {
			$('#divChartUnauthrisedContainer').highcharts({
		        chart: {
		            type: 'line'
		        },
		        title: {
		            text: 'Unauthorised Absence'
		        },
		        subtitle: {
		            text: ''
		        },
		        xAxis: {
		            //categories: [ '0%', '5%', '10%', '15%','20%','25%','30%'],
		            categories: [ '2001/02', '2002/03', '2003/04','2004/05','2005/06','2006/07','2007/08','2008/09','2009/10','2010/11','2011/12', '2012/13'],
		            title:{text: '' }
		        },
		        yAxis: {
		            min: 0,
		            title: {
		                text: '% Authorised Absence'
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
		
		function drawTotalAbsenceChart(data) {
			$('#divChartTotalContainer').highcharts({
		        chart: {
		            type: 'line'
		        },
		        title: {
		            text: 'Total Absence'
		        },
		        subtitle: {
		            text: ''
		        },
		        xAxis: {
		            //categories: [ '0%', '5%', '10%', '15%','20%','25%','30%'],
		            categories: [ '2001/02', '2002/03', '2003/04','2004/05','2005/06','2006/07','2007/08','2008/09','2009/10','2010/11','2011/12', '2012/13'],
		            title:{text: '' }
		        },
		        yAxis: {
		            min: 0,
		            title: {
		                text: '% Authorised Absence'
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

	<div id ="container">
 		<div id="header">
 			<h1> Aberdeen City Council Digital Data Observatory Project</h1>
 		</div>
 		<div id = "content">
 			<div id="nav">
				<%@ include file="/css/menu.txt" %>
 			</div> 		
			<div id="main">
				<h2>${SchoolName}Absence</h2>
				<h3>
					<a href="">Authorised Absence</a>
				</h3>
				<br>
				<div id="divChartAuthrisedContainer"></div>
				<h3>
					<a href="">Unauthorised Absence</a>
				</h3>
				<br>
				<div id="divChartUnauthrisedContainer"></div>
				<h3>
					<a href="">Total Absence</a>
				</h3>
				<br>
				<div id="divChartTotalContainer"></div>

			</div>
 		</div>
 		<div id="footer">
 			Aberdeen City Council 
 		</div>
 	</div>



</body>
</html>