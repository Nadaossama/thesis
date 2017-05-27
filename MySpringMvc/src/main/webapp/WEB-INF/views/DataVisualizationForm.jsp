<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
 <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <title>Data Visualization</title>
  <link rel="stylesheet" media="screen" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.7/css/bootstrap-theme.min.css">
  <script type="text/javascript" src="webjars/jquery/2.1.1/jquery.min.js"></script>
  <script type="text/javascript" src="webjars/jquery/2.1.1/jquery.js"></script>
  <script type="text/javascript" src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <!-- Load c3.css -->
 <link href="webjars/c3/0.4.11/c3.css" rel="stylesheet" type="text/css">

<!-- Load d3.js and c3.js -->
<script type="text/javascript" src="webjars/d3js/3.5.5/d3.js" charset="utf-8"></script>
<script type="text/javascript" src="webjars/c3/0.4.11/c3.js"></script>
<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
</head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">HydroConnect</a>
    </div>
    <div class="collapse navbar-collapse" id="myNavbar">
      <ul class="nav navbar-nav">
        <li class="active"><a href="${pageContext.request.contextPath}/home">Home</a></li>
        <li><a href="${pageContext.request.contextPath}/dataVisualization">Data Visualization</a></li>
        <li><a href="${pageContext.request.contextPath}/decisionSupport">Decision Support</a></li>
        <li><a href="${pageContext.request.contextPath}/eventMatrix">Event Matrix</a></li>
      </ul>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="${pageContext.request.contextPath}"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
      </ul>
    </div>
  </div>
</nav>
<div  class="container theme-showcase" role="main">    
  <div class="jumbotron">
    <!--     <h2>Data Visualization</h2> -->
        <form class="form-inline" role="form">
            <h2>Power Plants List</h2>
           <%--  <pre>${JSON}</pre> --%>
            <form:select path="nameOfList" class="form-control"  id="drpdwnPP">
			    <form:option value="0" label="Select an Option" />
			    <form:options items="${nameOfList}"  itemValue="ID" itemLabel="Name" />
			</form:select>
			<div class="container">
    <div class='col-md-6'>
        <div class="form-group">
         <!-- <label>From: </label> -->
            <div class='input-group date' id='datetimepicker6'>
           
                <input type='text' class="form-control" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
    </div>
    <div class='col-md-6'>
        <div class="form-group">
        <!-- <label>To: </label> -->
            <div class='input-group date' id='datetimepicker7'>
            
                <input type='text' class="form-control" />
                <span class="input-group-addon">
                    <span class="glyphicon glyphicon-calendar"></span>
                </span>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(function () {
        $('#datetimepicker6').datetimepicker();
        $('#datetimepicker7').datetimepicker({
            useCurrent: false //Important! See issue #1075
        });
        $("#datetimepicker6").on("dp.change", function (e) {
            $('#datetimepicker7').data("DateTimePicker").minDate(e.date);
        });
        $("#datetimepicker7").on("dp.change", function (e) {
            $('#datetimepicker6').data("DateTimePicker").maxDate(e.date);
        });
    });
</script>
			<button id="btnChoose" type="submit" class="btn btn-default">Choose</button>
			
			  <div id = "VisualizationDiv" style="display: none" class="jumbotron">
			        <h3>Water level / Energy Output</h3>
			         <div id="chart"></div>
			         <br>
			         <h3>Energy Output / Time</h3>
			         <div id="chart1"></div>
			          <br>
			         <h3>Other</h3>
			         <div id="chart2"></div>
			  </div>
         <script>
         var button = document.getElementById("btnChoose");

         button.onclick = function() {
             var div = document.getElementById("VisualizationDiv");
             var dropdown = document.getElementById("drpdwnPP");
             var selectedValue = dropdown.options[dropdown.selectedIndex].value;
             if (div.style.display !== "none") {
                 div.style.display = "none";
             }
             else if (selectedValue !== "0")  {
                 div.style.display = "block";
             }
             return false; 
         };
         
         var chart = c3.generate({
        	    data: {
        	        columns: [
        	            ['Water Level', 30, 200, 100, 400, 150, 250],
        	            ['Energy Output', 50, 20, 10, 40, 15, 25]
        	        ]
        	    },
        	    bindto: '#chart'
        	});
         
         var chart1 = c3.generate({
        	    data: {
        	        x: 'x',
//        	        xFormat: '%Y%m%d', // 'xFormat' can be used as custom format of 'x'
        	        columns: [
        	            ['x', '2013-01-01', '2013-01-02', '2013-01-03', '2013-01-04', '2013-01-05', '2013-01-06'],
//        	            ['x', '20130101', '20130102', '20130103', '20130104', '20130105', '20130106'],
        	            ['PowerPlant 1', 30, 200, 100, 400, 150, 250],
        	            ['PowerPlant 2', 130, 340, 200, 500, 250, 350]
        	        ]
        	    },
        	    axis: {
        	        x: {
        	            type: 'timeseries',
        	            tick: {
        	                format: '%Y-%m-%d'
        	            }
        	        }
        	    },
        	    bindto: '#chart1'
        	});
         
         var chart2 = c3.generate({
        	    data: {
        	        x: 'x',
        	        columns: [
        	            ['x', '2012-12-29', '2012-12-30', '2012-12-31'],
        	            ['data1', 230, 300, 330],
        	            ['data2', 190, 230, 200],
        	            ['data3', 90, 130, 180],
        	        ]
        	    },
        	    axis: {
        	        x: {
        	            type: 'timeseries',
        	            tick: {
        	                format: '%m/%d',
        	            }
        	        }
        	    },
        	    bindto: '#chart2'
        	});

        	setTimeout(function () {
        	    chart2.flow({
        	        columns: [
        	            ['x', '2013-01-11', '2013-01-21'],
        	            ['data1', 500, 200],
        	            ['data2', 100, 300],
        	            ['data3', 200, 120],
        	        ],
        	        duration: 1500,
        	        done: function () {
        	            chart2.flow({
        	                columns: [
        	                    ['x', '2013-02-11', '2013-02-12', '2013-02-13', '2013-02-14'],
        	                    ['data1', 200, 300, 100, 250],
        	                    ['data2', 100, 90, 40, 120],
        	                    ['data3', 100, 100, 300, 500]
        	                ],
        	                length: 0,
        	                duration: 1500,
        	                done: function () {
        	                    chart2.flow({
        	                        columns: [
        	                            ['x', '2013-03-01', '2013-03-02'],
        	                            ['data1', 200, 300],
        	                            ['data2', 150, 250],
        	                            ['data3', 100, 100]
        	                        ],
        	                        length: 2,
        	                        duration: 1500,
        	                        done: function () {
        	                            chart2.flow({
        	                                columns: [
        	                                    ['x', '2013-03-21', '2013-04-01'],
        	                                    ['data1', 500, 200],
        	                                    ['data2', 100, 150],
        	                                    ['data3', 200, 400]
        	                                ],
        	                                to: '2013-03-01',
        	                                duration: 1500,
        	                            });
        	                        }
        	                    });
        	                }
        	            });
        	        },
        	    });
        	}, 1000);
         </script>
         		</form>
 </div>
  </div>  
    <div class="container">
      <hr>
      <footer>
        <p>&copy; 2017 Connect Hydro, Inc.</p>
      </footer>
    </div> <!-- /container -->
</body>
</html>