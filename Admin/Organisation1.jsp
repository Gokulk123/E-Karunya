<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%
try
{           
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ekarunya","root","");
  String id=request.getParameter("id"); 
  String type = request.getParameter("type"); 
  String cat=request.getParameter("cat"); 
  String sql="";
  
 // echo $id.$type.$cat;
  if(cat.equals("Orphan"))
  {
          if(type.equals("Approve"))
          {
          sql="UPDATE `orphanage` SET `status`='1' WHERE `id`='"+id+"'";
            PreparedStatement psmt=con.prepareStatement(sql);
        int rs=psmt.executeUpdate();
        if(rs>0){
              //echo "updated";
              %>
                <script type="text/javascript">
                  alert("Status updated organisation!!!");
                  window.location="Organisation.jsp";
                </script>
              <%
            }
            else
            {
              out.print("error");
            }
          
          }
              else
              {
                sql="UPDATE `orphanage` SET `status`='0' WHERE `id`='"+id+"'";
                PreparedStatement psmt=con.prepareStatement(sql);
        int rs=psmt.executeUpdate();
        if(rs>0){
                 // echo "updated";
                  %>
                    <script type="text/javascript">
                      alert("Status updated organisation!!!");
                      window.location="Organisation.jsp";
                    </script>
                  <%
                }
                else
                {
                  out.print("error");
                }
              }
             
  }
    else if(cat.equals("Womenwelfare"))
    {
                if(type.equals("Approve"))
              {
                 sql="UPDATE `womenwelfare` SET `status`='1' WHERE `id`='"+id+"'";
                PreparedStatement psmt=con.prepareStatement(sql);
        int rs=psmt.executeUpdate();
        if(rs>0){
                  //echo "updated";
                  %>
                    <script type="text/javascript">
                      alert("Status updated women!!!");
                      window.location="Organisation.jsp";
                    </script>
                  <%
                }
                else
                {
                  out.print("error");
                }
              }
    
              else
              {
                sql="UPDATE `womenwelfare` SET `status`='0' WHERE `id`='"+id+"'";
                 PreparedStatement psmt=con.prepareStatement(sql);
        int rs=psmt.executeUpdate();
        if(rs>0){
                 // echo "updated";
                  %>
                    <script type="text/javascript">
                      alert("Status updated women!!!");
                      window.location="Organisation.jsp";
                    </script>
                  <%
                }
              }
    }
    else
    {
       if(type.equals("Approve"))
              {
                sql="UPDATE `oldage` SET `status`='1' WHERE `id`='"+id+"'";
                PreparedStatement psmt=con.prepareStatement(sql);
        int rs=psmt.executeUpdate();
        if(rs>0){
                  %>
                    <script type="text/javascript">
                      alert("Status updated oldage!!!");
                      window.location="Organisation.jsp";
                    </script>
                  <%
                }
                else
                {
                  out.print("error");
                }
              }
              else
              {
                sql="UPDATE `oldage` SET `status`='0' WHERE `id`='"+id+"'";
                PreparedStatement psmt=con.prepareStatement(sql);
        int rs=psmt.executeUpdate();
        if(rs>0){
                  %>
                    <script type="text/javascript">
                      alert("Status updated oldage!!!");
                      window.location="Organisation.jsp";
                    </script>
                  <%
                }
              }

        }
}
catch(Exception j)
{
out.print(j);
}
%>
