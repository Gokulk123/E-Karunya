<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>Dashio - Bootstrap Admin Template</title>

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
  <!-- **********************************************************************************************************************************************************
      MAIN CONTENT
      *********************************************************************************************************************************************************** -->
  <div id="login-page">
    <div class="container">
      <form class="form-login" action="AdminLogin.jsp">
        <h2 class="form-login-heading">Admin Login</h2>
        <div class="login-wrap">
          <input type="text" class="form-control" placeholder="User Name" name="user" autofocus>
          <br>
          <input type="password" class="form-control" placeholder="Password" name="pass" >
          <br>
          <button class="btn btn-theme btn-block" href="index.html" type="submit"><i class="fa fa-lock"></i> SIGN IN</button>
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

 <%@page import="java.sql.*"%>
                                                         <% 
                                                          String username = request.getParameter("user");
                                                            String password = request.getParameter("pass");
                                                        try
                                                       {
                                                       Class.forName("com.mysql.jdbc.Driver");
                                                        Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ekarunya","root","");
                                                       String sql="SELECT * FROM `admin`";
                                                              
                                                               PreparedStatement psmt=con.prepareStatement(sql);
                                                               ResultSet rs=psmt.executeQuery();
                                                              int f=0;
                                                              while(rs.next())
                                                               { 
                                                                 if(username.equals(rs.getString("Username"))&&password.equals(rs.getString("Password"))) 
                                                                 {
                                                               f=1;
                                                               
                                                                 }
                                                               
                                                               }
                                                               %>
                                                            <script>
                                                                var res=<%=f %>
                                                                if(res==0)
                                                                {
                                                                     window.alert("not found")
                                                                }
                                                                else
                                                                {
                                                                    window.location="Admin/index.jsp";
                                                                
                                                                }
                                                                
                                                            </script>
                                                     <%
                                                       
                                                       
                                                           
                                                     
                                                           
                                                       }
                                                       catch(Exception e)
                                                       {
                                                           out.print(e);
                                                       }
                                                           
                                                            %>
             
    
</html>
  