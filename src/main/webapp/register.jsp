<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration Page</title>

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
<%@include file="nav_bar.jsp" %>
<main class="primary-background  banner-background" style="padding-bottom: 400px ;">   
 <div class="container" style="height: 400px;">
 <div class="col-md-6 offset-md-3">
  <div class="card">
  	<div class="card-header primary-background text-white text-center"><span class="fa fa-user-circle fa-2x"></span><br>Register Here!</div>
  	<div class="card-body">
  	<form id="reg-form" action="Register" method="post">
  	
  	
  	  <div class="form-group">
    <label for="exampleInputEmail1">User Name</label>
    <input type="text" name="user_name" class="form-control" id="user_name" aria-describedby="emailHelp" placeholder="Enter Name" required="required">
  </div>
  	
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" required="required">
  </div>
  
  
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password" required="required">
  </div>
  
  
    <div class="form-group">
    <label for="gender">Select Gender</label>
    <br>
    <input type="radio" id="gender1" value="Male" name="gender">Male
    <input type="radio" id="gender2" value="Female" name="gender">Female
  </div>
  
   <div class="form-group">
    <textarea rows="2" class="form-control"  name="about" placeholder="Enter Something about youself"></textarea>
  </div>
  
  
  <div class="form-check">
    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Agree Terms and Conditions</label>
  </div>
  
  <br>
<div class="container text-center" id="loader" style="display:none;">
  <span class="fa fa-refresh fa-spin fa-4x"></span>
  <h4>Please wait...</h4>
</div>
  <br>
  <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
</form>
  	</div>
  </div>
 </div>
 </div>
</main>


<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
$(document).ready(function () {
    console.log("loaded........")
    $('#reg-form').on('submit', function (event) {
        
        event.preventDefault();
        let form = new FormData(this);
        $("#submit-btn").hide();
        $("#loader").show();
        //send register servlet:
        $.ajax({
            url: "Register",
            type: 'POST',
            data: form,
            success: function (data, textStatus, jqXHR) {
                console.log(data)
                $("#submit-btn").show();
                $("#loader").hide();
                if (data.trim() === 'Done!')
                {

                	swal({
                  	  title: "Successfully Registered!",
                  	  text: "Registration Successfully ,we redirect to Login Page!..",
                  	  icon: "success",
                  	  buttons: "Ok!",               
                  	})
                  	.then((willDelete) => {
                  		window.location = "login.jsp"
                  	});
                  	    

                } else
                {
                	swal({
                		  title: "",
                		  text: "Please Agree terms and conditions",
                		  icon: "warning",
                		  buttons: true,

                		})
                		.then((willDelete) => {
                		 
                		});
                                                
                }
            },
            error: function (jqXHR, textStatus, errorThrown) {
                $("#submit-btn").show();
                $("#loader").hide();
                swal("something went wrong..try again");
             
            },
            processData: false,
            contentType: false
        });
    });
});
</script>

</body>
</html>