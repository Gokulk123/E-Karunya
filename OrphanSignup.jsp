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
    }

    function copyNumber()
    {
      var main    =document.getElementById('PriPhone');
      var cNo     =document.getElementById('carePhone');
      cNo.value   =main.value;
    }
  </script>
 
</head>

<body>
  <div id="login-page">
    <div class="container">
      <form class="form-login" onsubmit="return comparepasswords();">
        <h2 class="form-login-heading">Orphanage Signup</h2>
        <div class="login-wrap">
          <input type="text" class="form-control" required name="name" placeholder="Organization name" autofocus>
          <br>
          <input type="email" class="form-control"  required name="email" placeholder="Email Id" autofocus>
          <br>
          <input type="number" id="PriPhone" class="form-control" required name="phone" placeholder="Primary phone" onkeyup="copyNumber()" autofocus>
          <br>
          <input type="number" class="form-control" name="aPhone" placeholder="Alternate phone" autofocus>
          <br>
          <textarea type="text" class="form-control" required name="address" placeholder="Full Address" autofocus></textarea>
          <br>
          <input type="text" class="form-control" required name="regNo" placeholder="Registration Number" autofocus>
          <br>
          <hr>
          <input type="text" class="form-control" required name="careName" placeholder="Care Taker Name" autofocus>
          <br>
          <input type="number" id="carePhone" class="form-control" name="carePhone" placeholder="Care Taker Phone" autofocus>
          <br>
           <hr>
          <input type="password" id="main" class="form-control" name="pass" required placeholder="Password" autofocus>
          <br>
          <input type="password" id="confirm" class="form-control" required placeholder="Confirm Password">
          <br>
          <span style="visibility:collapse" id="message"><i style="color:red">* Passwords dosn't match</i></span>
          <br>
         
           <div class="form-group">
          <button type="submit" class="btn btn-primary " name="Register">Register</button>
	 </div>
          <%
    if(request.getParameter("Register")!=null)
    {
     String name=request.getParameter("name");
     String email=request.getParameter("email");
     String phone=request.getParameter("phone");
     String aPhone=request.getParameter("aphone");
     String address=request.getParameter("address");
     String regNo=request.getParameter("regNo");
     String careName=request.getParameter("careName");
     String carePhone=request.getParameter("carePhone");
     String pass=request.getParameter("pass");
try
   {
     Class.forName("com.mysql.jdbc.Driver");
    Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ekarunya","root","");
   String sql="INSERT INTO `orphanage`(`id`, `OrganisationName`, `email`, `mainphone`, `altphone`, `Address`, `regNo`, `careTakerName`, `careTakerPhone`, `password`, `status`)"
     + " VALUES (NULL,'"+name+"','"+email+"','"+phone+"','"+aPhone+"','"+address+"','"+regNo+"','"+careName+"','"+carePhone+"','"+pass+"','0')";
    PreparedStatement psmt=con.prepareStatement(sql);
      int rs=psmt.executeUpdate(sql);
      if(rs>0)
      {
          %>
          <script>
              alert("your request has been send wait for the admin approval");
              window.location="OrphanLogin.jsp";
              
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
          <hr>
          <div class="registration">
            Don't have an account yet?<br/>
            <a class="" href="OrphanLogin.jsp">
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
  