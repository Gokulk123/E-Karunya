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
     String phone=request.getParameter("phone");
     String orpid=request.getParameter("orphid");
try
   {
     Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ekarunya","root","");
     String sql1="UPDATE `orphanmembers` SET `currentsts`='Already Request Received' WHERE `mem_id`='"+orpid+"'";
   PreparedStatement pst=con.prepareStatement(sql1);
   pst.executeUpdate(sql1);
    String sql="INSERT INTO `adoption` (`Ad_Id`, `Ad_Name`, `Ad_Address`,`Ad_Phone`, `Ad_DateTime`,`Ad_UserId`,`Ad_Status`)"
     + " VALUES (NULL, '"+title+"', '"+report+"','"+phone+"', '"+dateTime+"','"+cookieid+"','0')";
     PreparedStatement psmt=con.prepareStatement(sql);
     int r=psmt.executeUpdate(sql);
     if(r>0){  
String query="SELECT `Ad_Id` FROM `adoption` WHERE `Ad_UserId`='"+cookieid+"' AND `Ad_DateTime`='"+dateTime+"'";
PreparedStatement pmt=con.prepareStatement(query);
ResultSet rs=pmt.executeQuery();
while(rs.next())
{
                                                                String value = rs.getString("Ad_Id");
                                                                Cookie name = new Cookie("Adid", value);
                                                                name.setMaxAge(2*24*60*60);
                                                                 response.addCookie(name);
                                                                

}
      %>
        <script type="text/javascript">
  alert("Your Adoption Process Will Start After submitting Documents. ");
  window.location="adoptionform2.jsp";
</script>
                  <%}
       }
     catch(Exception e)
       {
     out.print(e);
       }
   }
%>
 
 