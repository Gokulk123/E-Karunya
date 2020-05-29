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
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
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
          <li><a class="logout" href="../">Logout</a></li>
        </ul>
      </div>
    </header>
    <!--header end-->
    <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
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
        <!-- sidebar menu end-->
      </div>
    </aside>
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
                <h4><i class="fa fa-angle-right"></i> Adoption Requests</h4>
                <hr>
                <thead>
                  <tr>
                    
                    <th class="hidden-phone"><i class="fa fa-question-circle"></i> Name</th>
                    <th><i class="fa fa-bookmark"></i> Address</th>
                    <th><i class=" fa fa-calender"></i> Phone</th>
                    <th><i class=" fa fa-edit"></i>User</th> 
                    <th><i class=" fa fa-edit"></i>Action</th>
                    <th></th>
                  </tr>
                </thead>
                <tbody>
                
                <?php
            $sql = "SELECT * FROM `sponsorrequest` ";
            $result = mysqli_query($conn, $sql);
            $i=0;
              while($row = mysqli_fetch_assoc($result)) {

?>
                  <tr>
                   
                    <td><center><?php echo  $row['sp_req_name']; ?></center></td>
                    <td><center><?php echo  $row['sp_req_address']; ?></center></td>
                    <td><?php echo $row['sp_req_phone']; ?></td>
                    <td>
                       <?php echo $row['sp_req_user']; ?>
                    </td>
                   
                    <?php
                      if($row['sp_request_status']=='suspend')
                      {
                    ?>
                    <td><a href="viewadoptionrequest.php?choice=approve&id=<?php echo  $row['sp_req_id']; ?>" style="color:green">Approve</a></td>
                    <?php
                      }
                      else
                      {
                    ?>
                      <td><a href="viewadoptionrequest.php?choice=suspend&id=<?php echo  $row['sp_req_id']; ?>" style="color:orange">Suspend</a></td>
                      <?php } ?>


                  </tr>

<?php
              }?>
                 
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
<?php
if(isset($_REQUEST['choice']))
{
  $id         = $_REQUEST['id'];
  $type = $_REQUEST['choice'];
  //$cat=$_REQUEST['cat'];
 // echo $id.$type.$cat;
  
  
          if($type=="approve")
          {
            $sql="UPDATE `adoption` SET `Ad_Status`='1' WHERE `Ad_Id`='$id'";
            $r=mysqli_query($conn,$sql);
            if($r)
            {
              //echo "updated";
              ?>
                <script type="text/javascript">
                  alert("Status updated!!!");
                  window.location="viewadoptionrequest.php";
                </script>
              <?php
            }
            else
            {
              echo mysqli_error($conn);
            }
          
          }
          else
          {
            $sql="UPDATE `adoption` SET `Ad_Status`='0' WHERE `Ad_Id`='$id'";
            $r=mysqli_query($conn,$sql);
            if($r)
            {
              //echo "updated";
              ?>
                <script type="text/javascript">
                  alert("Status updated!!!");
                  window.location="viewadoptionrequest.php";
                </script>
              <?php
            }
            else
            {
              echo mysqli_error($conn);
            }
          
          }
             
    }    

?>
