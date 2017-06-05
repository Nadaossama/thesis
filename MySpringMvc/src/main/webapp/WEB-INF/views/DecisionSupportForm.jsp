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
<title>Decision Support</title>
<link rel="stylesheet" media="screen"
	href="../webjars/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css"
	href="../webjars/bootstrap/3.3.7/css/bootstrap-theme.min.css">
<link rel="stylesheet" type="text/css" href="../resources/theme.css">
<script src="../webjars/jquery/1.12.0/jquery.js"></script>
<script src="../webjars/jquery/1.12.0/jquery.min.js"></script>
<script src="../webjars/jquery-ui/1.12.1/jquery-ui.js"></script>
<script src="../webjars/jquery-ui/1.12.1/jquery-ui.min.js"></script>
<script type="text/javascript" src="../resources/scripts.js"></script>
<script type="text/javascript"
	src="../webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style>
.text-wrap {
	white-space: normal;
}
</style>
</head>
<body>
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
			<%--  <form:form method = "post" action="/decisionSupport/GetRules" modelAttriute="PowerPlant"> --%>
			<form class="form-inline" role="form">
				<%-- <form action="${pageContext.request.contextPath}/decisionSupport/GetRules" method="post" class="form-inline" role="form" commandName="command"> --%>
				<h3>Choose Power Plant</h3>
				<form:select name="ID" path="PowerPlantList" class="form-control"
					id="drpdwnPP">
					<form:option value="0" label="Select an Option" />
					<form:options items="${PowerPlantList}" itemValue="ID"
						itemLabel="Name" />
				</form:select>

				<button id="btnChoose" type="submit" class="btn btn-default">Apply
					Rules</button>


				<script>
					jQuery(document)
							.ready(
									function($) {
										/* var button = document.getElementById("btnChoose"); */

										$("#btnChoose")
												.click(
														function(event) {

															var dropdown = document
																	.getElementById("drpdwnPP");
															var selectedValue = dropdown.options[dropdown.selectedIndex].value;

															/*  if (div.style.display !== "none") {
															     div.style.display = "none";
															 }
															 else */
															$
																	.post(
																			"GetRules",
																			{
																				selectedValue : selectedValue
																			},
																			function(
																					data) {
																				var json = JSON
																						.parse(data);
																				console
																						.log(json);
																				//now json variable contains data in json format
																				//let's display a few items
																				$(
																						'#table')
																						.empty();
																				// we'll put all our html in here for now
																				var tr;
																				for (var i = 0; i < json.length; i++) {
																					tr = $('<tr/>');
																					tr
																							.append("<td>"
																									+ json[i]
																									+ "</td>");
																					$(
																							'table')
																							.append(
																									tr);
																				}

																				var div = document
																						.getElementById("DecisionSupportDiv");
																				if (selectedValue !== "0") {
																					div.style.display = "inline";
																				}

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
				</script>



				<div id="DecisionSupportDiv" style="display: none">
					<br>
					<h3>Action List :</h3>
					<table class="table" id="table">
					</table>
				</div>
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