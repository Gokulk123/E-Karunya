<?php include '../Databases/Connect.php'; ?>
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

  </head>

<body>
  <section id="container">
    <header class="header black-bg">
      <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
      </div>
      <!--logo start-->
      <a href="index.html" class="logo"><b><span>UMM AL MU'MINEEN </span>CHARITABLE SOCIETY</b></a>
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
          <li><a class="logout" href="logout.php">Logout</a></li>
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
            <a class="active" href="index.php">
              <i class="fa fa-dashboard"></i>
              <span>Home</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="Users.php">
              <i class="fa fa-user"></i>
              <span>Users</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="Organisation.php">
              <i class="fa fa-tasks"></i>
              <span>Organisations</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="Posts.php">
              <i class="fa fa-bullhorn"></i>
              <span>Posts</span>
              </a>
          </li>
         
          <li class="sub-menu">
            <a href="Feedback.php">
              <i class="fa fa-tasks"></i>
              <span>Feedback</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="viewsponsorrequest.php">
              <i class="fa fa-tasks"></i>
              <span>Sponsor Requests</span>
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
      

        <div class="row mt">
          <div class="col-md-12">
            <div class="content-panel">
              <table class="table table-striped table-advance table-hover">
                <h4><i class="fa fa-angle-right"></i> Orphanages </h4>
                <hr>
                <thead>
                  <tr>
                    <th><i class="fa fa-bullhorn"></i> Id</th>
                    <th class="hidden-phone">Name</th>
                    <th>email</th>
                    <th>Phone No.</th>
                    <th>Alternate Phone No.</th>
                    <th>Address</th>
                    <th>Reg. Number</th>
                    <th>Care Taker Name</th>
                    <th>Care Taker Phone</th>
                    <th>Status</th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                      
                      $sql = "SELECT * FROM  `orphanage` ";
                      $result = mysqli_query($conn, $sql);
                      while($row = mysqli_fetch_assoc($result)) { 
                  ?>
                  <tr>
                    <td><?php echo $row['id']; ?> </td>
                    <td><?php echo $row['OrganisationName']; ?> </td>
                    <td><?php echo $row['email']; ?> </td>
                    <td><?php echo $row['mainphone']; ?> </td>
                    <td><?php echo $row['altphone']; ?> </td>
                    <td><?php echo $row['Address']; ?> </td>
                    <td><?php echo $row['regNo']; ?> </td>
                    <td><?php echo $row['careTakerName']; ?> </td>
                    <td><?php echo $row['careTakerPhone']; ?> </td>
                   
                        <td>
                         <?php
                                if ($row['status']=="Suspend") { ?> 
                                 <abbr title="This is an Waiting user">
                                  <a href="Organisation1.php?change=true&type=Approve&id=<?php echo $row['id'];  ?>&cat=Orphan">
                                 <button type="button" class="btn btn-success">Approve
                                 </button>
                               </a>
                                </abbr>
                                 <?php } else{ ?>
                                 <abbr title="This is an approved user">
                                <a href="Organisation1.php?change=true&type=Suspend&id=<?php echo $row['id'];  ?>&cat=Orphan">
                                  <button type="button" class="btn btn-danger">Suspend</button>
                                </a>
                                </abbr>
                                </td><?php 
                              }
                        
                      }  ?>
                  </tr>
                </tbody>
              </table>
            </div>
            <!-- /content-panel -->
          </div>
          <!-- /col-md-12 -->
        </div>
                <div class="row mt">
          <div class="col-md-12">
            <div class="content-panel">
              <table class="table table-striped table-advance table-hover">
                <h4><i class="fa fa-angle-right"></i> Womenwelfare </h4>
                <hr>
                <thead>
                  <tr>
                    <th><i class="fa fa-bullhorn"></i> Id</th>
                    <th class="hidden-phone">Name</th>
                    <th>email</th>
                    <th>Phone No.</th>
                    <th>Alternate Phone No.</th>
                    <th>Address</th>
                    <th>Reg. Number</th>
                    <th>Care Taker Name</th>
                    <th>Care Taker Phone</th>
                    <th>Status</th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                      
                      $sql = "SELECT * FROM  `womenwelfare` ";
                      $result = mysqli_query($conn, $sql);
                      while($row = mysqli_fetch_assoc($result)) { 
                  ?>
                  <tr>
                    <td><?php echo $row['id']; ?> </td>
                    <td><?php echo $row['OrganisationName']; ?> </td>
                    <td><?php echo $row['email']; ?> </td>
                    <td><?php echo $row['mainphone']; ?> </td>
                    <td><?php echo $row['altphone']; ?> </td>
                    <td><?php echo $row['Address']; ?> </td>
                    <td><?php echo $row['regNo']; ?> </td>
                    <td><?php echo $row['careTakerName']; ?> </td>
                    <td><?php echo $row['careTakerPhone']; ?> </td>
                    
                      
                        <td>
                         <?php
                                if ($row['status']=="Suspend") { ?> 
                                 <abbr title="This is an Waiting user">
                                  <a href="Organisation1.php?change=true&type=Approve&id=<?php echo $row['id'];  ?>&cat=Womenwelfare">
                                 <button type="button" class="btn btn-success">Approve
                                 </button>
                               </a>
                                </abbr>
                                 <?php } else{ ?>
                                 <abbr title="This is an approved user">
                                <a href="Organisation1.php?change=true&type=Suspend&id=<?php echo $row['id'];  ?>&cat=Womenwelfare">
                                  <button type="button" class="btn btn-danger">Suspend</button>
                                </a>
                                </abbr>
                                </td>
                        <?php
                      } } ?>
                  </tr>
                </tbody>
              </table>
            </div>
            <!-- /content-panel -->
          </div>
          <!-- /col-md-12 -->
        </div>
                     <div class="row mt">
          <div class="col-md-12">
            <div class="content-panel">
              <table class="table table-striped table-advance table-hover">
                <h4><i class="fa fa-angle-right"></i> Oldages </h4>
                <hr>
                <thead>
                  <tr>
                    <th><i class="fa fa-bullhorn"></i> Id</th>
                    <th class="hidden-phone">Name</th>
                    <th>email</th>
                    <th>Phone No.</th>
                    <th>Alternate Phone No.</th>
                    <th>Address</th>
                    <th>Reg. Number</th>
                    <th>Care Taker Name</th>
                    <th>Care Taker Phone</th>
                    <th>Status</th>
                  </tr>
                </thead>
                <tbody>
                  <?php
                      
                      $sql = "SELECT * FROM  `oldage` ";
                      $result = mysqli_query($conn, $sql);
                      while($row = mysqli_fetch_assoc($result)) { 
                  ?>
                  <tr>
                    <td><?php echo $row['id']; ?> </td>
                    <td><?php echo $row['OrganisationName']; ?> </td>
                    <td><?php echo $row['email']; ?> </td>
                    <td><?php echo $row['mainphone']; ?> </td>
                    <td><?php echo $row['altphone']; ?> </td>
                    <td><?php echo $row['Address']; ?> </td>
                    <td><?php echo $row['regNo']; ?> </td>
                    <td><?php echo $row['careTakerName']; ?> </td>
                    <td><?php echo $row['careTakerPhone']; ?> </td>
                   
                        <td>
                         <?php
                                if ($row['status']=="Suspend") { ?> 
                                 <abbr title="This is an Waiting user">
                                  <a href="Organisation1.php?change=true&type=Approve&id=<?php echo $row['id'];  ?>&cat=Oldage">
                                 <button type="button" class="btn btn-success">Approve
                                 </button>
                               </a>
                                </abbr>
                                 <?php } else{ ?>
                                 <abbr title="This is an approved user">
                                <a href="Organisation1.php?change=true&type=Suspend&id=<?php echo $row['id'];  ?>&cat=Oldage">
                                  <button type="button" class="btn btn-danger">Suspend</button>
                                </a>
                                </abbr>
                                </td>
                        <?php
                      } } ?>
                  </tr>
                </tbody>
              </table>
            </div>
            <!-- /content-panel -->
          </div>
          <!-- /col-md-12 -->
        </div>
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
          url: "show_data.php?action=1",
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

