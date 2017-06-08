<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Data Visualization</title>
<link rel="stylesheet" media="screen"
	href="webjars/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="webjars/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/css/bootstrap-datetimepicker.min.css" />
<script type="text/javascript" src="webjars/jquery/1.12.0/jquery.min.js"></script>
<script type="text/javascript" src="webjars/jquery/1.12.0/jquery.js"></script>
<script type="text/javascript"
	src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.10.6/moment.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datetimepicker/4.17.37/js/bootstrap-datetimepicker.min.js"></script>
<!-- Load c3.css -->
<link href="webjars/c3/0.4.11/c3.css" rel="stylesheet" type="text/css">

<!-- Bootstrap Date-Picker Plugin -->
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css" />

<!-- Load d3.js and c3.js -->
<script type="text/javascript" src="webjars/d3js/3.5.5/d3.js"
	charset="utf-8"></script>
<script type="text/javascript" src="webjars/c3/0.4.11/c3.js"></script>
<script src="http://d3js.org/d3.v3.min.js" charset="utf-8"></script>
</head>
<body>
	<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container-fluid">
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#myNavbar">
				<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="#">HydroConnect</a>
		</div>
		<div class="collapse navbar-collapse" id="myNavbar">
			<ul class="nav navbar-nav">
				<li class="active"><a
					href="${pageContext.request.contextPath}/home">Home</a></li>
				<li><a
					href="${pageContext.request.contextPath}/dataVisualization">Data
						Visualization</a></li>
				<li><a
					href="${pageContext.request.contextPath}/decisionSupport/">Decision
						Support</a></li>
				<%-- <li><a href="${pageContext.request.contextPath}/eventMatrix">Event Matrix</a></li> --%>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<li><a href="${pageContext.request.contextPath}"><span
						class="glyphicon glyphicon-log-in"></span> Login</a></li>
			</ul>
		</div>
	</div>
	</nav>
	<div class="container theme-showcase" role="main">
		<div class="jumbotron">
			<!--     <h2>Data Visualization</h2> -->
			<form class="form-inline" role="form">
				<div class="container">
					<h2>Power Plants List</h2>

					<div class="form-group">
						<!-- Date input -->
						<label class="control-label" for="date">From</label> <input
							class="form-control" id="date1" name="date1"
							placeholder="YYYY/MM/DD" type="text" />
					</div>

					<div class="form-group">
						<!-- Date input -->
						<label class="control-label" for="date">To</label> <input
							class="form-control" id="date2" name="date2"
							placeholder="YYYY/MM/DD" type="text" />
					</div>

					<div class='col-md-6'>
						<div class="form-group">
							<label>PowerPlant:</label>
							<form:select path="nameOfList" class="form-control" id="drpdwnPP">
								<form:option value="0" label="Select an Option" />
								<form:options items="${nameOfList}" itemValue="ID"
									itemLabel="Name" />
							</form:select>
						</div>
					</div>
					<br>


				</div>
				<div class="col-lg-12">
					<div class="row">
						<div class="col-xs-4">
							<button id="btnChoose" type="submit" class="btn btn-default">Choose</button>
						</div>
					</div>
				</div>
				<div id="VisualizationDiv" style="display: none" class="jumbotron">
					<h3>Water level / Energy Output</h3>
					<div id="chart"></div>
					<br>
					<h3>Energy Output / Time</h3>
					<div id="chart1"></div>
					<br>
					<!-- <h3>Other</h3>
			         <div id="chart2"></div> -->
				</div>

				<script>
					jQuery(document)
							.ready(
									function($) {
										var date_input1 = $('input[name="date1"]'); //our date input has the name "date"
										var container1 = $('.bootstrap-iso form').length > 0 ? $(
												'.bootstrap-iso form').parent()
												: "body";
										var options1 = {
											format : 'yyyy-mm-dd',
											container : container1,
											todayHighlight : true,
											startDate : "2016-11-01",
											endDate : "2016-11-30",
											autoclose : true
										};
										date_input1.datepicker(options1);

										var date_input2 = $('input[name="date2"]'); //our date input has the name "date"
										var container2 = $('.bootstrap-iso form').length > 0 ? $(
												'.bootstrap-iso form').parent()
												: "body";
										var options2 = {
											format : 'yyyy-mm-dd',
											container : container2,
											todayHighlight : true,
											startDate : "2016-11-01",
											endDate : "2016-11-30",
											autoclose : true
										};
										date_input2.datepicker(options2);

										/*      $('#datetimepicker2').datetimepicker({
										         useCurrent: false //Important! See issue #1075
										     });
										     $("#datetimepicker1").on("dp.change", function (e) {
										         $('#datetimepicker2').data("DateTimePicker").minDate(e.date);
										     });
										     $("#datetimepicker1").on("dp.change", function (e) {
										         $('#datetimepicker2').data("DateTimePicker").maxDate(e.date);
										     });
										 */

										/* var button = document.getElementById("btnChoose");
										var c3Data = ""; */
										$("#btnChoose")
												.click(
														function(event) {

															var dropdown = document
																	.getElementById("drpdwnPP");
															var selectedValue = dropdown.options[dropdown.selectedIndex].value;

															var fromDate = $('#date1').val();
															var toDate = $('#date2').val();

															
															/* var div = document
															.getElementById("VisualizationDiv");
													 if (div.style.display !== "none") {
													    div.style.display = "none"; 
													}		*/
															$.post("GetRules",
																			{
																				selectedValue : selectedValue,
																				fromDate : fromDate,
																				toDate : toDate
																			},
																			function(
																					data) {
																				//c3Data = data;
																				
																				var c3Data = JSON.parse(data);
																				//console.log(c3Data);
																				var data1 = c3Data[0];//.slice(0,300);
																				var data2 = c3Data[1];//.slice(0,300);
																				var data3 = c3Data[2];//.slice(0,300);
																				var data4 = c3Data[3];//.slice(0,300);
																				
																				data1.unshift("Water Level");
																				data2.unshift("Energy Output");
																				data3.unshift("Energy Output");
																				data4.unshift("TimeStamp");
																				//console.log(JSON.parse("[['30','200','100','400', '150', '250'],[ '30', '200', '100', '400', '150', '250']]"));
																				var chart = c3.generate({
																							data : {
																								columns : [
																										data1,
																										data2 ]},
																							bindto : '#chart'
																						});

																				var chart1 = c3.generate({
																							data : {
																								x : 'TimeStamp',
																								xFormat: '%Y-%m-%d',
																								columns : [
																									data4,
																									data3 
																								]
																							},
																							axis : {
																								x : {
																									type : 'timeseries',
																									tick : {
																										format : '%Y-%m-%d'
																									}
																								}
																							},
																							bindto : '#chart1'
																						});
																				var div = document
																						.getElementById("VisualizationDiv");
																				/* if (div.style.display !== "none") {
																				    div.style.display = "none";
																				}
																				else */if (selectedValue !== "0") {
																					div.style.display = "inline";
																				}
																				//...
																				

																			})
																	.done(
																			function() {
																				
																			})
																	.fail(
																			function(
																					xhr,
																					textStatus,
																					errorThrown) {
																				alert('error');
																				alert(errorThrown);
																				
																			})
																	.complete(
																			function() {
																				$(
																						"#btn-btnChoose")
																						.prop(
																								"disabled",
																								false);
																				

																			});
															return false;
														});
									});

					/*  var chart2 = c3.generate({
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
						}); */

					/* 	setTimeout(function () {
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
						}, 1000); */
				</script>
			</form>
		</div>
	</div>
	<div class="container">
		<hr>
		<footer>
		<p>&copy; 2017 Connect Hydro, Inc.</p>
		</footer>
	</div>
	<!-- /container -->
</body>
</html>