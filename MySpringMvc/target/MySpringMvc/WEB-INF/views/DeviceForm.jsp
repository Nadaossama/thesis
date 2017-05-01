<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
	"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta charset="utf-8">
   <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Device Manager Home</title>
        <link rel="stylesheet" href="/resources/bootstrap/css/bootstrap.min.css">         
<script src="../js/bootstrap.min.js"></script>   
     <base href="${pageContext.request.contextPath}"/>
     <base href="#{request.requestURL.substring(0, request.requestURL.length() - request.requestURI.length())}#{request.contextPath}/" />
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
</head>
<body>
<div align="center">
        <h1>New/Edit Device</h1>
        <form:form action="saveDevice" method="post" modelAttribute="Device">
        <table>
            <form:hidden path="ID"/>
            <tr>
                <td>Name:</td>
                <td><form:input path="Name" /></td>
            </tr>
            <tr>
                <td>IPAddress:</td>
                <td><form:input path="IPaddress" /></td>
            </tr>
            
            <tr>
                <td colspan="2" align="center"><input type="submit" value="Save"></td>
            </tr>
        </table>
        </form:form>
    </div>
</body>
</html>