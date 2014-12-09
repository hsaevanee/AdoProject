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
<title>SchoolRoll</title>
	<script type="text/javascript" src="<c:url value="/script/jquery-2.1.1.min.js"/>"></script>
	<script type="text/javascript" src="<c:url value="/script/highcharts.js"/>"></script>
	<script type="text/javascript" src="http://code.highcharts.com/modules/exporting.js"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		 
		var param = { 'sSchoolNameText': '<c:out value='${SchoolName}'/>' }
		
		getSchoolRollData(param);
		
	});
	
	function getSchoolRollData(param) {		
		var sContextPath = '<c:url value="/"/>';
		$.ajax({
            type: 'GET',
            url: sContextPath + 'getSchoolRollData',
            data: param,
            contentType: 'application/json; charset=utf-8',
            dataType: 'json',
            success: function (data) {            	
            	for (var i in data) {
            		   for (var j in data[i]) {
            		     console.log(data[i][j]);
            		     for (member in data[i][j]) {
            		    	    if (data[member] == 0)
            		    	    	data[member] = null;
            		    	}
            		   }
            		}

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
		            type: 'line'
		        },
		        title: {
		            text: 'School Roll'
		        },
		        subtitle: {
		            text: ''
		        },
		        xAxis: {
		            //categories: [ '0%', '5%', '10%', '15%','20%','25%','30%'],
		            categories: [ '1998/99', '1999/00', '2000/01','2001/02','2002/03','2003/04','2004/05','2005/06','2006/07','2007/08','2008/09', '2010/11','2011/12','2012/13'],
		            title:{text: '' }
		        },
		        yAxis: {
		            min: 0,
		            title: {
		                text: 'Number of pupils'
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

<h1>${SchoolName}</h1>	


<h2> School Roll (Pupil Census) </h2>
<br>	
<div id="divChartContainer">
</div>

</body>
</html>