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
     String Organisaton=request.getParameter("Organisaton");
   try
   {
     Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ekarunya","root","");
   String sql="INSERT INTO `donationrequest`(`Donate_Id`, `Donate_Name`, `Donate_Report`, `Donate_Date`, `Donate_Organisation`,`Donate_Org_Id`)"
     + " VALUES (NULL,'"+title+"','"+report+"','"+dateTime+"','"+Organisaton+"','"+cookieid+"')";
    PreparedStatement psmt=con.prepareStatement(sql);
     int rs=psmt.executeUpdate(sql);
     if(rs>0){
     %>
<script type="text/javascript">
  alert("Your donation will be published after the varification by the administrator. ");
  window.location="addDonationRequest.jsp";
</script>

<%
     }
       }
     catch(Exception e)
       {
     out.print(e);
     %>
<script type="text/javascript">
  alert("error ");
  window.location="addDonationRequest.jsp";
</script>
<%
       }
   }
%>
   

