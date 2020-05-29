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
     String title=request.getParameter("title");
     String report=request.getParameter("report");
     String dateTime=request.getParameter("dateTime");
     String phone=request.getParameter("phone");
try
   {
     Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ekarunya","root","");
   String sql="INSERT INTO `sponsorrequest`(`sp_req_id`, `sp_req_name`, `sp_req_address`, `sp_req_phone`, `sp_req_date`, `sp_req_user`,`sp_request_status`)VALUES (NULL,'"+title+"','"+report+"','"+phone+"','"+dateTime+"','"+cookieid+"','1')";
    PreparedStatement psmt=con.prepareStatement(sql);
     int r=psmt.executeUpdate(sql);
     if(r>0){
        %>
          <script>
              alert("Thank You !!! We Will Contact You Soon ");
              window.location="add_sponsor.jsp";
          </script>
                    <%}
       }
     catch(Exception e)
       {
     out.print(e);
       }
   
%>