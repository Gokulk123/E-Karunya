<%@page import="java.sql.*"%>
 <%
     String id=request.getParameter("id");
     try
   {
     Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ekarunya","root","");
  String sql="DELETE FROM `posts` WHERE `Post_id`='"+id+"'";
   PreparedStatement psmt=con.prepareStatement(sql);
     int r=psmt.executeUpdate(sql);
   if(r>0)
   {
   %>
   <script>
       alert("deleted your post");
       window.location="posts.jsp";
   </script>
<%
   }
   
   
   }
catch(Exception a)
{
out.print(a);
}
%> 