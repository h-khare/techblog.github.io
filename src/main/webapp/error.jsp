<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Sorry Something went worng</title>

<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<style type="text/css">
		.banner-background{
			clip-path: polygon(60% 0, 85% 0, 100% 0, 100% 81%, 85% 92%, 60% 80%, 30% 90%, 0 78%, 0 0, 20% 0);
		}
	</style>
	

</head>
<body>

	<div class="container text-center">
		<img id="image-1" class="img-fluid" alt="" src="img/error-404.png"/>
		<h3 class="display-3">Sorry! Something went worng ....</h3>
		<h1><%=exception %></h1>
		<br>
		<a href="index.jsp" class="btn primary-background btn-lg text white">Home</a>
	</div>

</body>
</html>