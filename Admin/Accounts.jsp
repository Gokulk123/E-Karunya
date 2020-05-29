<?php include '../Databases/Connect.jsp'; ?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>E Karunya</title>

  <!-- Favicons -->
  <link href="img/favicon.png" rel="icon">
  <link href="img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Bootstrap core CSS -->
  <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <!--external css-->
  <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  <link rel="stylesheet" type="text/css" href="css/zabuto_calendar.css">
  <link rel="stylesheet" type="text/css" href="lib/gritter/css/jquery.gritter.css" />
  <!-- Custom styles for this template -->
  <link href="css/style.css" rel="stylesheet">
  <link href="css/style-responsive.css" rel="stylesheet">
  <script src="lib/chart-master/Chart.js"></script>

  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
</head>

<body>
  <section id="container">
    <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
      <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
      </div>
      <!--logo start-->
      <a href="index.html" class="logo"><b><span>E </span>KARUNYA</b></a>
      <!--logo end-->
      <div class="nav notify-row" id="top_menu">
        <!--  notification start -->
        <ul class="nav top-menu">
          <!-- settings start -->
          
        </ul>
        <!--  notification end -->
      </div>
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
          <li><a class="logout" href="login.html">Logout</a></li>
        </ul>
      </div>
    </header>
    <!--header end-->
    <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
          <p class="centered"><a href="profile.html"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNkDOqcBBhp0U8UkBLs2JMlWWNVOT5otXHSQCJ0pJlrAuFF82v" class="img-circle" width="80"></a></p>
          <h5 class="centered">Admin Access</h5>
           <li class="mt">
            <a class="active" href="index.jsp">
              <i class="fa fa-dashboard"></i>
              <span>Home</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="Users.jsp">
              <i class="fa fa-user"></i>
              <span>Users</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="Organisation.jsp">
              <i class="fa fa-tasks"></i>
              <span>Organisations</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="Posts.jsp">
              <i class="fa fa-bullhorn"></i>
              <span>Posts</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="Accounts.jsp">
              <i class="fa fa-credit-card"></i>
              <span>Accounts</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="Feedback.jsp">
              <i class="fa fa-tasks"></i>
              <span>Feedback</span>
              </a>
          </li>
        <!-- sidebar menu end-->
      </div>
    </aside>
    <!--sidebar end-->
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <br><br>        
        <div class="col-md-12 mb">
                <div class="message-p pn">
                  <div class="message-header">
                    <h5>Main Account Balance</h5>
                  </div>
                  <div class="row">
                    <div class="col-md-3 centered hidden-sm hidden-xs">
                      <img src="https://www.logolynx.com/images/logolynx/s_23/23938578fb8d88c02bc59906d12230f3.png" class="img-circle" width="65">
                    </div>
                    <div class="col-md-7">
                      <?php

                       $sql = "SELECT * FROM `accounts`WHERE `Acc_Owner_type`=0";
            $result = mysqli_query($conn, $sql);
            $balance=0;
              while($row = mysqli_fetch_assoc($result)) { $balance  =  (float)$row['Acc_Balance']; }

                ?>
                      <p>
                        <name>Collective Update till now</name>
                        <h2>Rs <?php echo($balance); ?></h2>
                      </p>
                      <p>
                        <name>Prize Money to be distributed</name>
                        <h3>Rs <?php echo(($balance*80)/100); ?></h3>
                      </p>
                    </div>
                  </div>
                </div>
                <!-- /Message Panel-->

                <div class="form-panel">
              <form role="form" class="form-horizontal style-form">
                <center><h1>Pick a Winner</h1></center>
                <hr>

                <?php  if (isset($_REQUEST['id'])) {  ?>

                <div class="form-group has-success">
                  <label class="col-lg-2 control-label">First Name</label>
                  <div class="col-lg-10">
                    <input type="text" placeholder="" id="f-name" class="form-control">
                    <p class="help-block">Successfully done</p>
                  </div>
                </div>
                <div class="form-group has-error">
                  <label class="col-lg-2 control-label">Last Name</label>
                  <div class="col-lg-10">
                    <input type="text" placeholder="" id="l-name" class="form-control">
                    <p class="help-block">Aha you gave a wrong info</p>
                  </div>
                </div>
                <div class="form-group has-warning">
                  <label class="col-lg-2 control-label">Email</label>
                  <div class="col-lg-10">
                    <input type="email" placeholder="" id="email2" class="form-control">
                    <p class="help-block">Something went wrong</p>
                  </div>
                </div> 
                </form>

                <?php } ?>
                <center>
                  <div class="form-group">
                    <div class="col-lg-offset-1 col-lg-10">
                        <a href="SelectWinner.jsp?fund=<?php echo(($balance*80)/100); ?>" 
                          style="border: solid black 1px;padding: 10px; "
                          >
                          Select A Winner
                        </a>
                    </div>
                  </div>
                </center>

              
            </div>
              </div>

     
<!-- Draw the frame-->



<!--Ends draw frame-->

      </section>
    </section>
    <!--main content end-->
    <!--footer start-->
    
    <!--footer end-->
  </section>
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="lib/jquery/jquery.min.js"></script>

  <script src="lib/bootstrap/js/bootstrap.min.js"></script>
  <script class="include" type="text/javascript" src="lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="lib/jquery.scrollTo.min.js"></script>
  <script src="lib/jquery.nicescroll.js" type="text/javascript"></script>
  <script src="lib/jquery.sparkline.js"></script>
  <!--common script for all pages-->
  <script src="lib/common-scripts.js"></script>
  <script type="text/javascript" src="lib/gritter/js/jquery.gritter.js"></script>
  <script type="text/javascript" src="lib/gritter-conf.js"></script>
  <!--script for this page-->
  <script src="lib/sparkline-chart.js"></script>
  <script src="lib/zabuto_calendar.js"></script>
  <script type="text/javascript">
    
  <script type="application/javascript">
    $(document).ready(function() {
      $("#date-popover").popover({
        html: true,
        trigger: "manual"
      });
      $("#date-popover").hide();
      $("#date-popover").click(function(e) {
        $(this).hide();
      });

      $("#my-calendar").zabuto_calendar({
        action: function() {
          return myDateFunction(this.id, false);
        },
        action_nav: function() {
          return myNavFunction(this.id);
        },
        ajax: {
          url: "show_data.jsp?action=1",
          modal: true
        },
        legend: [{
            type: "text",
            label: "Special event",
            badge: "00"
          },
          {
            type: "block",
            label: "Regular event",
          }
        ]
      });
    });

    function myNavFunction(id) {
      $("#date-popover").hide();
      var nav = $("#" + id).data("navigation");
      var to = $("#" + id).data("to");
      console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
    }
  </script>
</body>

</html>
