<%@page import="java.sql.*"%>
<?php include 'Databases/Connect.jsp'; ?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
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
  <script type="text/javascript">
    function comparepasswords()
    {
      var main    =document.getElementById('main');
      var compare =document.getElementById('confirm');
      var message =document.getElementById('message');

      if (main.value==compare.value) {return true;}
      else{
        message.style.visibility='visible';
        compare.value="";
        return false;

      }
      
      return false;
    }
  </script>
</head>

<body>
  <div id="login-page">
    <div class="container">
      <form class="form-login" onsubmit="return comparepasswords()">
        <h2 class="form-login-heading">User Signup</h2>
        <div class="login-wrap">
          <input type="text" class="form-control" required name="Username" placeholder="Name" autofocus>
          <br>
          <input type="email" class="form-control" required name="email" placeholder="Email Id" autofocus>
          <br>
          <input type="number" min="6000000000" required max="9999999999" name="phone" class="form-control" placeholder="Primary phone" autofocus>
          <br>
          <input type="number" min="6000000000" class="form-control" name="aphone" placeholder="Alternate phone" autofocus>
          <br>
          <textarea class="form-control" required placeholder="Full Address" name="address" autofocus></textarea>
          <br>
          <span>Date of birth</span>
          <input type="date" class="form-control" required name="dob" placeholder="Date of Birth" autofocus>
          <br>
          <hr>
          <input type="password" id="main" class="form-control" name="pass" required placeholder="Password" autofocus>
          <br>
          <input type="password" id="confirm" class="form-control" required placeholder="Confirm Password">
          <br>
          <span style="visibility:collapse" id="message"><i style="color:red">* Passwords dosn't match</i></span>
         <div class="form-group">
         <button type="submit" class="btn btn-primary " name="Register">Register</button>
	</div>
          <hr>
          <%
    if(request.getParameter("Register")!=null)
    {
     String Username=request.getParameter("Username");
     String Email=request.getParameter("email");
     String Phone=request.getParameter("phone");
     String aphone=request.getParameter("aphone");
     String Address=request.getParameter("address");
     String Dob=request.getParameter("dob");
     String Pass=request.getParameter("pass");
 try
   {
     Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ekarunya","root","");
   String sql="INSERT INTO `users`(`id`, `Name`, `Email`, `Phone`, `Alternate`, `Address`, `Dob`, `Password`, `status`)"
     + " VALUES (NULL,'"+Username+"','"+Email+"','"+Phone+"','"+aphone+"','"+Address+"','"+Dob+"','"+Pass+"','1')";
     PreparedStatement psmt=con.prepareStatement(sql);
     psmt.executeUpdate(sql);
       }
     catch(Exception e)
       {
     out.print(e);
       }
   }
%>
          <div class="registration">
            Already have an account yet?<br/>
            <a class="" href="UserLogin.jsp">
              Already having an account
              </a>
          </div>
        </div>
        <!-- Modal -->
        <!-- modal -->
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
