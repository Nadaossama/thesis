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
  <title>Decision Support</title>
  <link rel="stylesheet" media="screen" href="../webjars/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="../webjars/bootstrap/3.3.7/css/bootstrap-theme.min.css">
  <link rel="stylesheet" type="text/css" href="../resources/theme.css">
  <script src="../webjars/jquery/2.1.1/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.3/jquery-ui.min.js"></script>
<!--   
 <script type="text/javascript" src="../webjars/jquery/2.1.1/jquery.js"></script> 
 <script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
  <script type="text/javascript" src="../webjars/jquery/2.1.1/jquery.min.js"></script> -->
  <script type="text/javascript" src="../resources/scripts.js"></script>
  <script type="text/javascript" src="../webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
        <li><a href="${pageContext.request.contextPath}/decisionSupport/">Decision Support</a></li>
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
      <!--   <h2>Decision Support</h2> -->
        
          <form class="form-inline" role="form">
            <h3>Choose Power Plant</h3>
            <form:select path="nameOfList" class="form-control"  id="drpdwnPP">
			    <form:option value="0" label="Select an Option" />
			    <form:options items="${nameOfList}" />
			</form:select>
			<button id="btnChoose" type="submit" class="btn btn-default">Apply Rules</button>
			
		<!-- 	<script>
			var button = document.getElementById("btnChoose");

	         button.onclick = function() {
	             var div = document.getElementById("DecisionSupportDiv");
	             var dropdown = document.getElementById("drpdwnPP");
	             var selectedValue = dropdown.options[dropdown.selectedIndex].value;
	             if (div.style.display !== "none") {
	                 div.style.display = "none";
	             }
	             else if (selectedValue !== "0")  {
	                 div.style.display = "inline";
	             }
	             return false; 
	         };
			</script> -->
<script type="text/javascript" src="//cdnjs.cloudflare.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>

<div id = "DecisionSupportDiv" style="display: none" >
    <div class="row">
        <div class="col-md-6">
            <div class="todolist not-done">
             <h3>Action List</h3>
               <!--  <input type="text" class="form-control add-todo" placeholder="Add todo">
                    <button id="checkAll" class="btn btn-success">Mark all as done</button>
                     -->
                    <hr>
                    <ul id="sortable" class="list-unstyled">
                    <li class="ui-state-default">
                       <!--  <div class="checkbox"> -->
                            <label>
                                <input type="checkbox" value="" />Action: Water Level is high, Turn down Turbine and activate Rack-Cleaner</label>
                     <!--    </div>
 -->                    </li>
                    <li class="ui-state-default">
                       <!--  <div class="checkbox"> -->
                            <label>
                                <input type="checkbox" value="" />Action: Activate Rack Cleaner</label>
                        <!-- </div> -->
                    </li>
                  <!--   <li class="ui-state-default">
                        <div class="checkbox">
                            <label>
                                <input type="checkbox" value="" />Teach penguins to fly</label>
                        </div>
                    </li> -->
                </ul>
                <div class="todo-footer">
                    <strong><span class="count-todos"></span></strong> Items Left
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="todolist not-done">
             <h3>Warning List</h3>
                <ul id="sortable" class="list-unstyled">
                    <li>Warning: Water Level high at previous Power Plant, Turn Down turbine</li>
                    
                </ul>
            </div>
        </div>
    </div>
</div>
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