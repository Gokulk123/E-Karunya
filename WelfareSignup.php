<?php include 'Databases/Connect.php'; ?>
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
      alert(main.value);
      alert(compare.value);
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
        <h2 class="form-login-heading">Welfare Signup</h2>
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
         
           <button class="btn btn-theme btn-block" href="index.html" type="submit"><i class="fa fa-lock"></i> SIGN UP</button>
          <hr>
          <div class="registration">
            Don't have an account yet?<br/>
            <a class="" href="OrphanLogin.php">
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
<?php
//regNo=juyiy44564&careName=lksdfsdjfl&carePhone=9495244088&pass=asdfgh123

if (isset($_REQUEST['name'])) 
{

  $name     = $_REQUEST['name'];
  $email    = $_REQUEST['email'];
  $phone    = $_REQUEST['phone'];
  $aPhone   = $_REQUEST['aPhone'];
  $address  = $_REQUEST['address'];
  $Dob      = $_REQUEST['dob'];
  $regNo    = $_REQUEST['regNo'];
  $careName = $_REQUEST['careName'];
  $carePhone= $_REQUEST['carePhone'];
  //$pass     = sha1($_REQUEST['pass']);
  $pass=$_REQUEST['pass'];
  //$type=$_REQUEST['type'];

 

    mysqli_query($conn, "INSERT INTO `womenwelfare` (`id`, `OrganisationName`, `email`, `mainphone`, `altphone`, `Address`, `regNo`, `careTakerName`, `careTakerPhone`, `password`, `status`) VALUES (NULL, '$name', '$email', '$phone', '$aPhone', '$address', '$regNo', '$careName', '$carePhone', '$pass', '1')");
  $result = mysqli_query($conn, "SELECT * FROM `womenwelfare`");
  $owner=0;
  while($row = mysqli_fetch_assoc($result))
  {
    $owner=$row['id'];
  }
  echo("User added with id ".$owner);
  mysqli_query($conn,"INSERT INTO `accounts` (`Acc_id`, `Acc_owner`, `Acc_Owner_type`, `Acc_Balance`) VALUES (null, '$owner', '4', '10000')");
  ?>
      <script type="text/javascript">
        alert("Please login to access the portal.");
        window.location="WomenwelfareLogin.php";
      </script>



      <?php
  
  // orphan registration ends here
  /*else if($type=='welfare')
  {
      mysqli_query($conn, "INSERT INTO `womenwelfare` (`id`, `OrganisationName`, `email`, `mainphone`, `altphone`, `Address`, `regNo`, `careTakerName`, `careTakerPhone`, `password`, `status`) VALUES (NULL, '$name', '$email', '$phone', '$aPhone', '$address', '$regNo', '$careName', '$carePhone', '$pass', '2')");
        $result = mysqli_query($conn, "SELECT * FROM `womenwelfare`");
        $owner=0;
        while($row = mysqli_fetch_assoc($result))
        {
          $owner=$row['id'];
        }
        echo("User added with id ".$owner);
        mysqli_query($conn,"INSERT INTO `accounts` (`Acc_id`, `Acc_owner`, `Acc_Owner_type`, `Acc_Balance`) VALUES (null, '$owner', '2', '10000')");
        ?>
            <script type="text/javascript">
              alert("Please login to access the portal.");
              window.location="CharityLogin.php";
            </script>
        <?php
  }
  else
  {

  
  mysqli_query($conn, "INSERT INTO `oldage` (`id`, `OrganisationName`, `email`, `mainphone`, `altphone`, `Address`, `regNo`, `careTakerName`, `careTakerPhone`, `password`, `status`) VALUES (NULL, '$name', '$email', '$phone', '$aPhone', '$address', '$regNo', '$careName', '$carePhone', '$pass', '2')");
  $result = mysqli_query($conn, "SELECT * FROM `agencies`");
  $owner=0;
  while($row = mysqli_fetch_assoc($result))
  {
    $owner=$row['id'];
  }
  echo("User added with id ".$owner);
  mysqli_query($conn,"INSERT INTO `accounts` (`Acc_id`, `Acc_owner`, `Acc_Owner_type`, `Acc_Balance`) VALUES (null, '$owner', '2', '10000')");
  ?>
      <script type="text/javascript">
        alert("Please login to access the portal.");
        window.location="CharityLogin.php";
      </script>
  <?php
    mysqli_close($conn);
}*/
}
?>