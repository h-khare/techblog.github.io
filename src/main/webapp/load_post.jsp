<%@page import="com.blog.entities.User"%>
<%@page import="com.blog.dao.LikeDao"%>
<%@page import="jdk.internal.misc.FileSystemOption"%>
<%@page import="com.blog.entities.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.blog.helper.MyConnection"%>
<%@page import="com.blog.dao.PostDao"%>
<div class="row">
<%
PostDao d= new PostDao(MyConnection.getConnetion());
List<Post> list=null;
int cid=Integer.parseInt(request.getParameter("cid"));
System.out.println(cid);
if(cid==0){
list=d.getAllPosts();
}
else
{
	list=d.getPostByCatId(cid);
}

if(list.size()==0)
{
	out.println("<h3 class='display-3 text-center'>No Posts in this Category....</h3>");
	return;
}

for(Post p:list)
{
%>
<div class="col-md-6">
<div class="card"> 
<img class="card-img-top" src="blog_pics/<%=p.getpPic() %>" alt="Card image cap">
<div class="card-body">
<b><%=p.getpTitle() %></b>
<p><%=p.getpContent() %></p>
<%
 User user=(User)session.getAttribute("us");
%>
</div>
<div class="card-footer text-center primary-background">
 <%
 			 
 			    LikeDao ld= new LikeDao(MyConnection.getConnetion());
 			
 			%>
 				
 				<a href="#" onclick="doLike(<%=p.getpId() %>,<%=user.getId() %>)" class="btn btn-outline-light btn-sm"><i class="fa fa-thumbs-o-up"></i><span class="likes"><%=ld.countLike(p.getpId()) %></span></a>
 				
    
 <a href="show_post.jsp?post_id=<%=p.getpId() %>" class="btn btn-outline-light btn-sm">Read more..!</a>

    <a href="#" class="btn btn-outline-light btn-sm"><i class="fa fa-commenting-o"></i><span>20</span></a>
</div>
</div>
</div>
<%
}
%>
</div>