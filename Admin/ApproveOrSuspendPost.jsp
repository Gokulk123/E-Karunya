<%@page import="java.sql.*"%>
<%
try
{       
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ekarunya","root","");
if(request.getParameter("choice")!=null)
{
      String id=request.getParameter("id");
     String type=request.getParameter("choice");
  String sql=""; 
  if(type.equals("approve"))
{
          sql="UPDATE `posts` SET `Status`='1' WHERE `Post_id`='"+id+"'";
            PreparedStatement pmt=conn.prepareStatement(sql);
        int s=pmt.executeUpdate();
        if(s>0){
              //echo "updated";
              %>
              <script type="text/javascript">
                  alert("Status updated!!!");
                  window.location="Posts.jsp";
                </script>
              <%
}
}

          else
          {
          sql="UPDATE `posts` SET `Status`='0' WHERE `Post_id`='"+id+"'";
            PreparedStatement pst=conn.prepareStatement(sql);
        int r=pst.executeUpdate();
        if(r>0){
              //echo "updated";
              %>
          
                <script type="text/javascript">
                  alert("Status updated!!!");
                  window.location="Posts.jsp";
                </script>
              <%
            }
         else
            {
              out.print("error");
        
        }
          }
}
}
catch(Exception j)
{
out.print(j);
}
%>
