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
<title>PIPS</title>
	<script type="text/javascript" src="<c:url value="/script/jquery-2.1.1.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/script/highcharts.js"/>"></script>
	<script type="text/javascript" src="http://code.highcharts.com/modules/exporting.js"></script>
	
	<script type="text/javascript">
	$(document).ready(function() {
		 
		var param = { 'sSchoolNameText': '<c:out value='${SchoolName}'/>' }
		
		getPIPSData(param);
		
	});
	
	function getPIPSData(param) {		
		var sContextPath = '<c:url value="/"/>';
		$.ajax({
            type: 'GET',
            url: sContextPath + 'getPIPSData',
            data: param,
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (data) {            	
            	drawReadingChart(data[0]);  
            	drawMathChart(data[1]);
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

		function drawReadingChart(data) {
			$('#divChartReadingContainer').highcharts({
		        chart: {
		            type: 'line'
		        },
		        title: {
		            text: 'Reading PIPS P1'
		        },
		        subtitle: {
		            text: ''
		        },
		        xAxis: {
		            //categories: [ '0%', '5%', '10%', '15%','20%','25%','30%'],
		            categories: [ '1997/98', '1998/99','1999/00','2000/01','2001/02','2002/03','2003/04','2004/05','2006/07','2008/09', '2010/11','2011/12','2012/13','2013/14'],
		            title:{text: '' }
		        },
		        yAxis: {
		            min: 0,
		            title: {
		                text: 'Average PIPS Score'
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

		        series: data,
		        credits: {
		            enabled: false
		        },
		        exporting: {
		            type: 'image/jpeg'

		        }
		    });
		}
		
		function drawMathChart(data) {
			$('#divChartMathContainer').highcharts({
		        chart: {
		            type: 'line'
		        },
		        title: {
		            text: 'Mathematics PIPS P1'
		        },
		        subtitle: {
		            text: ''
		        },
		        xAxis: {
		            //categories: [ '0%', '5%', '10%', '15%','20%','25%','30%'],
		            categories: [ '1997/98', '1998/99','1999/00','2000/01','2001/02','2002/03','2003/04','2004/05','2006/07','2008/09', '2010/11','2011/12','2012/13','2013/14'],
		            title:{text: '' }
		        },
		        yAxis: {
		            min: 0,
		            title: {
		                text: 'Average 50 PIPS Score'
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
		        series: data,
		        credits: {
		            enabled: false
		        },
		        exporting: {
		            type: 'image/jpeg'

		        }
		    });
		}		
		
		$(function () {
			$('#button').click(function () {
		        var chart = $('#divChartReadingContainer').highcharts();
		        chart.exportChart({
		            type: 'application/pdf',
		            filename: 'my-pdf'
		        });
		    });
		});

</script>		
</head>
<body>

<h1>${SchoolName}  PIPS Summary (Standardised Scores)</h1>	


<h2> Reading: School Average (Aberdeen Average)</h2>
<br>	
<div id="divChartReadingContainer">
</div>
<h2> Mathematics: School Average (Aberdeen Average)</h2>
<br>	
<div id="divChartMathContainer">
</div>
<button id="button">Export to PDF</button>
</body>
</html>