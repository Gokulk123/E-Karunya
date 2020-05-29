<%@page import="java.sql.*"%>
 <%
     
  String cookieValue="";
  String cookieid="";
  Cookie[] cookies = request.getCookies();
 for(int i = 0; i < cookies.length; i++)
  {
   Cookie cookie = cookies[i];
   String cookieName = cookie.getName();
   if(cookieName.equals("user"))
    {
   cookieValue = cookie.getValue();
    }
   if(cookieName.equals("id"))
    {
   cookieid = cookie.getValue();
    }
  }
  
    if(request.getParameter("Submit")!=null)
    {
     String title=request.getParameter("title");
     String report=request.getParameter("report");
     String dateTime=request.getParameter("dateTime");
   try
   {
     Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ekarunya","root","");
   String sql="INSERT INTO `posts` (`Post_id`, `DateTime`, `OwnerId`, `Title`, `Description`, `Status`)"
     + " VALUES (NULL, '"+dateTime+"', '"+cookieid +"', '"+title+"', '"+report+"', '0')";
     PreparedStatement psmt=con.prepareStatement(sql);
     int r=psmt.executeUpdate(sql);
     if(r>0)
     {
     %>
     <script>
         alert("your post added successfully");
     </script>
<%
     }
       }
     catch(Exception e)
       {
     out.print(e);
       }
   }
%>
 <script type="text/javascript">
    window.location="posts.jsp";
</script>       
    