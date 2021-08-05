<%@page import="com.blog.dao.LikeDao"%>
<%@page import="com.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.blog.helper.MyConnection"%>
<%@page import="com.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blog.dao.PostDao"%>
<%@page import="com.blog.entities.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
           <%

	User user=(User)session.getAttribute("us");
if(user==null)
{
	response.sendRedirect("login.jsp");
}
    %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
	
	<style type="text/css">
		.banner-background{
			clip-path: polygon(60% 0, 85% 0, 100% 0, 100% 81%, 85% 92%, 60% 80%, 30% 90%, 0 78%, 0 0, 20% 0);
		}
				body{
		 background:url("img/123.jpg");
		 background-size: cover;
		 background-attachment: fixed;
		}
		
		.chaman{
		 width:400px; 
		}
		.card{
		background-color: #c6c7cad4;
		}
	</style>

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
      
                               <li class="nav-item">
        <a class="nav-link" href="mypost.jsp"><span class="fa fa-asterisk fa-spin"></span>My Post</a>
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
        <h5 class="modal-title" id="exampleModalLabel">Provide the Post Details...</h5>
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

<main>
<div class="row">
<%

PostDao po= new PostDao(MyConnection.getConnetion());
List<Post> list1= null;

list1=po.myPost(user.getId());
if(list.size()==0)
{
	out.println("<h3 class='display-3 text-center'>No Posts in this Category....</h3>");
	return;
}
for(Post p:list1)
{
%>
<div class="col-md-6">
<div class="card"> 
<img class="card-img-top" src="blog_pics/<%=p.getpPic() %>" alt="Card image cap">
<div class="card-body">
<b><%=p.getpTitle() %></b>
<p><%=p.getpContent() %></p>

</div>
<div class="card-footer text-center primary-background">
 <%
 			 
 			    LikeDao ld= new LikeDao(MyConnection.getConnetion());
 			
 			%>
 				
 				<a href="#" onclick="doLike(<%=p.getpId() %>,<%=user.getId() %>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="likes"><%=ld.countLike(p.getpId()) %></span></a>
 				
    
 <a href="show_post.jsp?post_id=<%=p.getpId() %>" class="btn btn-outline-light btn-sm">Read more..!</a>

    <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
    
			
		<a href="Delete?id=<%=p.getpId() %>" class="btn btn-primary">Delete Post</a>

</div>
</div>
</div>
<%
}
%>
</div>

</main>


<script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript" src="js/myjs.js"></script>

</body>
</html>