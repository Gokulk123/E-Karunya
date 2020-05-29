
<?php
  include 'Databases/Connect.jsp';
  ?>
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
      <form class="form-login">
        <h2 class="form-login-heading">Charity Login</h2>
        <div class="login-wrap">
          <input type="text" class="form-control" name="username" placeholder="User ID" autofocus>
          <br>
          <input type="password" class="form-control" name="password" placeholder="Password">
          <br>
          <input type="radio" name="type" value="orphan">Orphanage
          <input type="radio" name="type" value="oldage">Old Age Home
          <input type="radio" name="type" value="welfare">Women Welfare
          <br><br>
          <button class="btn btn-theme btn-block" name="submit" type="submit"><i class="fa fa-lock"></i> SIGN IN</button>
          <hr>
          <div class="registration">
            Don't have an account yet?<br/>
            <a class="" href="CharitySignup.jsp">
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
<?php

if (isset($_REQUEST['submit'])) {
//username=Sree&password=asd&submit=

      $username = $_REQUEST['username'];
      $password = sha1($_REQUEST['password']);
      $type=$_REQUEST['type'];

      if($type=="orphan")
      {
                $result = mysqli_query($conn, "SELECT * FROM `orphanage` WHERE `email`='$username' AND `password`='$password'");

      if (mysqli_num_rows($result) > 0) {
         // while($row = mysqli_fetch_assoc($result)) {
                //if($row['status']==0)
                //{
                  /*?>
                    <script type="text/javascript">
                      alert('Your account waits admin approval.');
                    </script>
                  <?php
                }
               // else
                //{*/
                  ?>
                    <script type="text/javascript">
                        alert('Welcome to your account');
                        window.location='Charity/setcookie.jsp?id=<?php echo $row['id'];  ?>';
                    </script>
                  <?php
                }
                else
                {
                  ?>
                  <script type="text/javascript">
                        alert('<?php echo mysqli_error($conn); ?>');
                        window.location='Charity/setcookie.jsp?id=<?php echo $row['id'];  ?>';
                    </script>
                  <?php
                }
          }
      //} else {
         // echo "0 results";
      //}
      //}
      
}

?>
