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
  <title>Device Manager Home</title>
  <link rel="stylesheet" media="screen" href="webjars/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="webjars/bootstrap/3.3.7/css/bootstrap-theme.min.css">
  <script type="text/javascript" src="webjars/jquery/2.1.1/jquery.min.js"></script>
  <script type="text/javascript" src="webjars/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
  		<form class="form-inline" role="form">
            <%-- <h2>Power Plants List</h2>
            <form:select path="nameOfList" class="form-control"  id="drpdwnPP">
			    <form:option value="0" label="Select an Option" />
			    <form:options items="${nameOfList}" />
			</form:select>
			<button id="btnChoose" type="submit" class="btn btn-default">Choose</button>
		</form> --%>

			<!-- <div id = "deviceForm" style="display: none"> -->
			<h2>Device List</h2>
            <h3><a href="${pageContext.request.contextPath}/newDevice"> New Device</a></h3>
            <table class="table">
                <th>ID</th>
                <th>Name</th>
                <th>IPaddress</th>
                <th>Action</th>
                 
                <c:forEach var="device" items="${listDevice}" >
                <tr>
                    <td>${device.ID}</td>
                   <td>${device.name}</td>
                    <td>${device.IPaddress}</td>
                    <td>
                        <a href="${pageContext.request.contextPath}/editDevice?ID=${device.ID}">Edit</a>
                        &nbsp;&nbsp;&nbsp;&nbsp;
                        <a href="${pageContext.request.contextPath}/deleteDevice?ID=${device.ID}">Delete</a>
                    </td>
                             
                </tr>
                </c:forEach>             
            </table>
          <!--   </div> -->
        </div>
  </div>
  
  <script type="text/javascript">
var button = document.getElementById("btnChoose");

button.onclick = function() {
    var div = document.getElementById("deviceForm");
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
</script>
    <div class="container">
      <hr>
      <footer>
        <p>&copy; 2017 Connect Hydro, Inc.</p>
      </footer>
    </div> <!-- /container -->
</body>
</html>