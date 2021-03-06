<!DOCTYPE html>
<html lang="en">

<head>
        <title>E - Karunya</title>

  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet">
  <link href="css/style-responsive.css" rel="stylesheet">


</head>

<body>
  <div id="login-page">
    <div class="container">
      <form class="form-login" action="UserLogin.jsp">
        <h2 class="form-login-heading">User Login</h2>
        <div class="login-wrap">
          <input type="text" class="form-control" name="username" placeholder="User ID" autofocus>
          <br>
          <input type="password" class="form-control" name="password" placeholder="Password">
          <br>
          <button class="btn btn-theme btn-block" name="submit" type="submit"><i class="fa fa-lock"></i> SIGN IN</button>
          <hr>
          <div class="registration">
            Don't have an account yet?<br/>
            <a class="" href="UserSignup.jsp">
              Create an account
              </a>
          </div>
        </div>
        <!-- Modal -->
        </form>
    </div>
  </div>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="lib/jquery/jquery.min.js"></script>
  <script src="lib/bootstrap/js/bootstrap.min.js"></script>
  <!--BACKSTRETCH-->
  <!-- You can use an image of whatever size. This script will stretch to fit in any screen size.-->
  <script type="text/javascript" src="lib/jquery.backstretch.min.js"></script>
  <script>
    $.backstretch("img/login-bg.jpg", {
      speed: 500
    });
  </script>
</body>

</html>




                                                        <%@page import="java.sql.*"%>
                                                         <% 
                                                          String username = request.getParameter("username");
                                                            String password = request.getParameter("password");
                                                            String status="1";
                                                        try
                                                       {
                                                       Class.forName("com.mysql.jdbc.Driver");
                                                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ekarunya","root","");
                                                       String sql="SELECT * FROM `users`";
                                                              
                                                               PreparedStatement psmt=con.prepareStatement(sql);
                                                               ResultSet rs=psmt.executeQuery();
                                                              int f=0;
                                                              while(rs.next())
                                                               { 
                                                                   String sts=rs.getString("Status");
                                                                 if(username.equals(rs.getString("email"))&&password.equals(rs.getString("password"))&&status.equals(rs.getString("status"))) 
                                                                 {
                                                                     
                                                               f=1;
                                                               String value = rs.getString("Name");
                                                                Cookie nameu = new Cookie("user", value);
                                                                nameu.setMaxAge(2*24*60*60);
                                                                 response.addCookie(nameu);
                                                                 String value2 = rs.getString("id");
                                                                Cookie idu = new Cookie("id", value2);
                                                                idu.setMaxAge(2*24*60*60);
                                                                 response.addCookie(idu);
                                                                 
                                                               
                                                               }}
                                                               %>
                                                            <script>
                                                                var res=<%=f %>
                                                                if(res==0)
                                                                {
                                                                     window.alert("not found")
                                                                }
                                                                else
                                                                {
                                                                    window.location="User/index.jsp";
                                                                
                                                                }
                                                                
                                                            </script>
                                                     <%
                                                       
                                                       
                                                           
                                                     
                                                           
                                                       }
                                                       catch(Exception e)
                                                       {
                                                           out.print(e);
                                                       }
                                                           
                                                            %>
             
    