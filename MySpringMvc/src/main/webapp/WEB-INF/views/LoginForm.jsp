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
     <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="../../favicon.ico">

    <title>Signin Template for Bootstrap</title>
    
    <!-- Custom styles for this template -->
    <link href="resources/signin.css" rel="stylesheet">
</head>
<body>
 <div class="container">

      <form:form class="form-signin" action="home" modelAttribute="User" method="post">
        <h2 class="form-signin-heading">Please sign in</h2>
        <label for="inputEmail" class="sr-only">Email address</label>
        <form:input type="email" id="inputEmail" class="form-control" placeholder="Email address" path="username"/>
        <label for="inputPassword" class="sr-only">Password</label>
        <form:input type="password" id="inputPassword" class="form-control" path="Password" placeholder="password"/>
        <div class="checkbox">
          <label>
            <input type="checkbox" value="remember-me"> Remember me
          </label>
        </div>
        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign in</button>
	</form:form>
    </div>
     <!-- /container -->
    <div class="container">
      <hr>
      <footer>
        <p>&copy; 2017 Connect Hydro, Inc.</p>
      </footer>
    </div> <!-- /container -->
</body>
</html>