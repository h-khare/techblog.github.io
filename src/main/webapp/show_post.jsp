<%@page import="com.blog.dao.LikeDao"%>
<%@page import="java.text.DateFormat"%>
<%@page import="com.blog.dao.UserDao"%>
<%@page import="com.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.entities.Post"%>
<%@page import="com.blog.helper.MyConnection"%>
<%@page import="com.blog.dao.PostDao"%>
<%@page import="com.blog.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page errorPage="error.jsp" %>
    
    <%

	User user=(User)session.getAttribute("us");
if(user==null)
{
	response.sendRedirect("login.jsp");
}
    %>
    
    <%
       int post_id=Integer.parseInt(request.getParameter("post_id"));
    PostDao pd1= new PostDao(MyConnection.getConnetion());
       Post  p= pd1.getPostId(post_id);
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title><%=p.getpTitle() %> || Tech Blog by Harsh Khare</title>

<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<style type="text/css">
		.banner-background{
			clip-path: polygon(60% 0, 85% 0, 100% 0, 100% 81%, 85% 92%, 60% 80%, 30% 90%, 0 78%, 0 0, 20% 0);
		}

		.post-title{
			font-weight: 100;
			font-size: 30px;
		}
		.post-content{
			font-weight: 100;
			font-size: 25px;
		}
		.post-date{
			font-style: italic;
			font-weight: bold;
		}
		.post-user-info{
			font-size: 20px;
		}	
		.row-user{
		border:1px solid grey;
		
		}
		.m1
		{
			width: 70vw;
		}
		
		body{
		 background:url("img/123.jpg");
		 background-size: cover;
		 background-attachment: fixed;
		}
		
	</style>

<div id="fb-root"></div>
<script async defer crossorigin="anonymous" src="https://connect.facebook.net/hi_IN/sdk.js#xfbml=1&version=v11.0" nonce="KosFE2tw"></script>

</head>
<body>


		<!-- Navbar -->
			<nav class="navbar navbar-expand-lg navbar-dark primary-background">
  <a class="navbar-brand" href="index.jsp"><span class="fa fa-certificate fa-spin"></span> Tech Block</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="profile.jsp"><span class="fa fa-cubes"></span> Harsh <span class="sr-only">(current)</span></a>
      </li>

      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <span class="fa fa-check-square-o"></span> Categories
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Programming Language</a>
          <a class="dropdown-item" href="#">Project Implementation</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Data Structure</a>
        </div>
      </li>

             <li class="nav-item">
        <a class="nav-link" href="#"><span class="fa fa-handshake-o"></span> Contact</a>
      </li>
      
                   <li class="nav-item">
        <a class="nav-link" data-toggle="modal" data-target="#do-post-modal" href="#"><span class="fa fa-asterisk fa-spin"></span> Do Post</a>
      </li>
      
    </ul>
    <ul class="navbar-nav mr-right">
          <li class="nav-item">
        <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-Modal"><span class="fa fa-user-circle-o"></span> <%=user.getName() %></a>
      </li>
            <li class="nav-item">
        <a class="nav-link" href="Logout"><span class="fa fa-user-circle fa-spin"></span> Logout</a>
      </li>
    </ul>
  </div>
</nav>

<!-- Main Contenct of body -->

<div class="container m1">
 <div class="row my-4">
 	<div class="col-md-8 offset-md-2">
 		
 		<div class="card-header primary-background text-white">
 			<h4 class="post-title"><%=p.getpTitle()%></h4>
 		</div>

 			<div class="card-body">

 				<img class="card-img-top my-2"  src="blog_pics/<%=p.getpPic() %>" alt="Card image cap">

 					<div class="row my-3 row-user">
 						<div class="col-md-8 ">

 							<%
 								UserDao ud1= new UserDao(MyConnection.getConnetion());
									int a=p.getUserid();
								User uk= new User();
								uk=(User)ud1.getUserByUserId(a);
								System.out.println(uk.getId());
								%>
 							<p class="post-user-info"><a href="User_profile.jsp?us_id=<%= uk.getId()%>"><%=uk.getName()%></a> has posted!...</p>
 						</div>
 						<div class="col-md-4 ">
 							<p class="post-date"><%=DateFormat.getDateInstance().format(p.getpDate())%></p>
 						</div>
 					</div>
 				<p class="post-content"><%=p.getpContent()%></p>
 				<br>
 				<br>
 				<pre class="post-code"><%=p.getpCode()%></pre>
 			</div>
 			<div class="card-footer primary-background">
 			<%
 			 
 			    LikeDao ld= new LikeDao(MyConnection.getConnetion());
 			
 			%>
 				
 				<a href="#" onclick="doLike(<%=p.getpId() %>,<%=user.getId() %>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="likes"><%=ld.countLike(p.getpId()) %></span></a>
    <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
 			</div>
 			
 			<div class="card-footer">
 			<div class="fb-comments" data-href="http://localhost:8080/Blog/show_post.jsp?post_id=<%=p.getpId() %>" data-width="" data-numposts="5"></div>
 			</div>
 	</div>
 </div>
</div>

<!-- Modal -->
<div class="modal fade" id="profile-Modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header primary-background text-white">
        <h5 class="modal-title" id="exampleModalLabel">Tech Blog</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="container text-center">
        <img src="pics/<%= user.getProfile()%>" class="img-fluid" style="border-top-right-radius:60%;max-width:100px;" >
        <br>
        <h5 class="model-title" mt-3 ><%=user.getName() %></h5>
        <div id="profile-details">
        <table class="table">

  <tbody>
    <tr>
      <th scope="row">ID : </th>
      <td><%=user.getId() %></td>
    </tr>
    <tr>
      <th scope="row">Email : </th>
      <td><%=user.getEmail() %></td>
    </tr>
    <tr>
      <th scope="row">Gender : </th>
      <td><%=user.getGender() %></td>
    </tr>
        <tr>
      <th scope="row">Status : </th>
      <td><%=user.getAbout() %></td>
    </tr>
        <tr>
      <th scope="row">Registered On : </th>
      <td><%=user.getDate().toString() %></td>
    </tr>
  </tbody>
</table>
</div>

	<!-- FIle edit -->
	<div id="profile-edit" style="display: none;">
	<h3 class="mt-2">Please Edit Carefully</h3>
	<form id="form-1" action="Edit" method="post" enctype="multipart/form-data">
		
			<table class="table">
					<tr>
						<td>ID </td>
						<td><%= user.getId() %></td>
					</tr>
										<tr>
						<td>Name </td>
						<td><input type="text" class="form-control" name="username" value="<%=user.getName()%>"></td>
					</tr>
					<tr>
						<td>Email </td>
						<td><input type="email" class="form-control" name="email" value="<%=user.getEmail()%>"></td>
					</tr>
										<tr>
						<td>Gender </td>
						<td><%=user.getGender() %> </tr>
										<tr>
						<td>Password </td>
						<td><input type="password" class="form-control" name="password" value="<%=user.getPassword()%>"></td>
					</tr>
					
															<tr>
						<td>New Profile <%=user.getProfile()%></td>
						<td><input type="file" class="form-control" name="image" value="<%=user.getProfile()%>"></td>
					</tr>
										<tr>
						<td>About </td>
						<td><textarea type="text" class="form-control" name="about" ><%=user.getAbout()%></textarea></td>
					</tr>
			</table>
			
			<div class="container">
				<input type="submit" class="btn-outline-primary" value="Save" id="button-1"/>
			</div>
	</form>
	</div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" id="edit-profile-button" class="btn btn-primary">Edit</button>
      </div>
    </div>
  </div>
</div>


<!-- End post Modal -->

<!-- Modal -->
<div class="modal fade" id="do-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Provide hte Post Details...</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="post-form" action="AddPosts" method="post" enctype='multipart/form-data'>
        
        
        
        <div class="form-group">
  				<select class="form-control" name="cid">
  				
  				<option selected disabled>---select categories---</option>
  				
  				<%
  						PostDao pd = new PostDao(MyConnection.getConnetion());
  						ArrayList<Category> list = pd.getAllCategories();
  						for(Category c:list)
  						{
  							%>
  							<option value="<%=c.getCid()%>"><%=c.getName() %></option>
  							<%
  						}
  				
  				%>

  				</select>
        </div>
        
        <div class="form-group">
        <input class="form-control" name="ptitle" type="text" placeholder="Enter Post Title">
        </div>
        
        <div class="form-group">
           <textarea rows="" cols="" name="pcontent" class="form-control" placeholder="Enter your content" style="height: 100px"></textarea>
        </div>
         <div class="form-group">
           <textarea rows="" cols="" name="pcode" class="form-control" placeholder="Enter your program(if any)" style="height: 100px"></textarea>
        </div>
        
        <div class="form-group">
			<label id="label-1">Select your Pics</label>
			<br>
        	<input type="file"class="form-control" name="image">
        </div>
        
        <div class="container text-center">
        <button type="submit" class="btn btn-outline-primary">Post</button>
        </div>
        
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script>

		$(document).ready(function(){

			let editStatus=false;

				$('#edit-profile-button').click(function(){

						if(editStatus==false){

							$("#profile-details").hide()

							$("#profile-edit").show(); 
									editStatus=true;
									$(this).text("Back")
							}
						else
							{
							$("#profile-details").show()

							$("#profile-edit").hide(); 
							editStatus=false;
							$(this).text("Edit")
							}


					
					})
			});
</script>

<!-- Now post js -->

<script type="text/javascript">

$(document).ready(function(e){

	$("#post-form").on("submit",function(event){

		event.preventDefault();
		 console.log("you have clicked on submit...!")
		let form=new FormData(this);

		$.ajax({

			url:"AddPosts",
			type:'POST',
			data:form,
			success:function (data,textStatus,jqXHR)
			{
				console.log(data);
				if(data.trim()=='done')
					{
					swal("Good job!", "You clicked the button!", "success");
					}
				else
					{
					swal("Error!", "Something went wrong!", "error");
					}
				},
				error:function (jqXHR,textStatus,errorThrown){
					swal("Error!", "Something went wrong!", "error");
					},
					processData:false;
					contentType:false;
			})
			

		})
})

</script>
<script type="text/javascript" src="js/myjs.js"></script>
</body>
</html>