<%@page import="java.sql.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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
          <li><a class="logout" href="../">Logout</a></li>
        </ul>
      </div>
    </header>
    <!--header end-->
    <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
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
  %>
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
         <p class="centered"><a href="profile.html"><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNkDOqcBBhp0U8UkBLs2JMlWWNVOT5otXHSQCJ0pJlrAuFF82v" class="img-circle" width="80"></a></p>
          <h5 class="centered"><%out.print(cookieValue);%></h5>
          <p style="color: white;text-align: center;text-transform: uppercase;font-weight: bold;">User</p>
           <li class="mt">
            <a  href="index.jsp">
              <i class="fa fa-dashboard"></i>
              <span>Home</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="posts.jsp" onclick="widow.location='posts.jsp'">
              <i class="fa fa-user"></i>
              <span>Posts</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="Notifications.jsp">
              <i class="fa fa-bullhorn"></i>
              <span>Announcements</span>
              </a>
          </li>
          </li>
          <li class="sub-menu">
            <a href="Feedback.jsp">
              <i class="fa fa-tasks"></i>
              <span>Feedback</span>
              </a>
          </li>
           <li class="sub-menu">
            <a href="add_adoption.jsp">
              <i class="fa fa-tasks"></i>
              <span>Adopt A Member</span>
              </a>
          </li>
           <li class="sub-menu">
            <a href="add_sponsor.jsp">
              <i class="fa fa-tasks"></i>
              <span>Sponsor A Member</span>
              </a>
          </li>
          <li class="sub-menu">
            <a class="active" href="shop.jsp">
              <i class="fa fa-tasks"></i>
              <span>Shop Now</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="vieworganisation.jsp">
              <i class="fa fa-tasks"></i>
              <span>Organisations</span>
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
        <div class="row">
          <div class="col-lg-12 main-chart">
            <!--CUSTOM CHART START -->
            <!--custom chart end-->
 <!--<div class="form-panel">
              <h4 class="mb"><i class="fa fa-angle-right"></i>Add A Post</h4>
              <form class="form-horizontal style-form" method="post" action="addPost.jsp" enctype="multipart/form-data">
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">Title</label>
                  <div class="col-sm-10">
                    <input type="text" class="form-control" name="title">
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">Detailed Report</label>
                  <div class="col-sm-10">
                    <textarea class="form-control" name="report"></textarea>
                  </div>
                </div>
                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">Uploaded date and Time</label>
                  <div class="col-sm-10">
                    <input type="text" name="dateTime" value="<?php echo date("d,M,Y h:i:s A"); ?>" class="form-control">
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label">Documents</label>
                  <div class="col-sm-10">
                    <input type="file" name="upload[]" class="logout" multiple>
                  </div>
                </div>

                <div class="form-group">
                  <label class="col-sm-2 col-sm-2 control-label"> </label>
                  <div class="col-sm-10">
                  <button type="submit" name="submit" value="Submit" class="btn btn-theme"><i class="fa fa-cog"></i>Submit</button>
                  </div>
                </div>

              </form>
            </div>


<!-- Table -->

<div class="row mt">
  <div class="col-md-12">
    <div class="content-panel">
      <table class="table table-striped table-advance table-hover">
        <h4><i class="fa fa-angle-right"></i> PRODUCT DETAILS</h4>
        <hr>
        <thead>
          <tr>
            <th><i class="fa fa-bullhorn"></i> Id</th>
            <th>NAME</th>
            <th> PRICE</th>
            <th>CATEGORY</th>
            <th>NUMBER OF ITEMS LEFT</th>
             <th>PRODUCT IMAGE</th>
            <th>PURCHASE</th>
            
          </tr>
        </thead>
        <tbody>
            <%

try
{
    Class.forName("com.mysql.jdbc.Driver");
    
                                                       
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ekarunya","root","");
String query="SELECT * FROM `productlist`";
PreparedStatement psmt=con.prepareStatement(query);
ResultSet rs=psmt.executeQuery();
while(rs.next())
{%>
          
          <tr>
            <td><% out.println(rs.getString("pro_id")); %> </td>
             <td><% out.println(rs.getString("pro_name")); %></td>
              <td><% out.println(rs.getString("pro_discountprice")); %></td>
            <td><% out.println(rs.getString("pro_category")); %></td>
            <td><% out.println(rs.getString("pro_totl")); %></td>
            <td><img src="../files/<% out.println(rs.getString("image")); %>" alt="no image available" style="width: 100px; height: 100px;"></td>
          </td><td><a href="../payment/paymentform.jsp">Buy Now</a></td></tr>
            <%  
}
%> 						
    <%
    rs.close();
    psmt.close();
    con.close();
    }
catch(Exception e)
{
    e.printStackTrace();
    }




%>
           
          </tr>
        </tbody>
      </table>
    </div>
    <!-- /content-panel -->
  </div>
  <!-- /col-md-12 -->
</div>

<!--Table Ends-->


            <!-- /row -->
            <div class="row">
                <!-- DIRECT MESSAGE PANEL -->
              <div class="col-md-8 mb">
              </div>
              <!-- /col-md-8  -->
            </div>
            <br>
                        <br>
                                    <br>
                                                <br>
          </div>
          <!-- /col-lg-9 END SECTION MIDDLE -->
          <!-- **********************************************************************************************************************************************************
              RIGHT SIDEBAR CONTENT
              *********************************************************************************************************************************************************** -->

          <!-- /col-lg-3 -->
        </div>
        <!-- /row -->
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
