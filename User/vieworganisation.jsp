<%@page import="java.sql.*"%>
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
            <a href="shop.jsp">
              <i class="fa fa-tasks"></i>
              <span>Shop Now</span>
              </a>
          </li>
          <li class="sub-menu">
            <a class="active" href="vieworganisation.jsp">
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
                    <!--<th>Status</th>-->
                  </tr>
                </thead>
                <tbody>
                     <%

try
{           
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ekarunya","root","");
String query="SELECT * FROM `orphanage`";
PreparedStatement psmt=con.prepareStatement(query);
ResultSet rs=psmt.executeQuery();
while(rs.next())
{%>
                  <tr>
            <td><% out.println(rs.getString("id")); %> </td>
            <td><% out.println(rs.getString("OrganisationName")); %></td>
            <td><% out.println(rs.getString("email")); %></td>
            <td><% out.println(rs.getString("mainphone")); %></td>
            <td><% out.println(rs.getString("altphone")); %></td>
             <td><% out.println(rs.getString("Address")); %></td>
             <td><% out.println(rs.getString("regNo")); %></td>
             <td><% out.println(rs.getString("careTakerName")); %></td>
             <td><% out.println(rs.getString("careTakerPhone")); %></td>
             </tr>
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
                 
                              }
                        
                        
                  
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
                    <!--<th>Status</th>-->
                  </tr>
                </thead>
                <tbody>
                    <%

try
{           
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ekarunya","root","");
String query="SELECT * FROM `Womenwelfare`";
PreparedStatement psmt=con.prepareStatement(query);
ResultSet rs=psmt.executeQuery();
while(rs.next())
{%>
 <tr>
            <td><% out.println(rs.getString("id")); %> </td>
            <td><% out.println(rs.getString("OrganisationName")); %></td>
            <td><% out.println(rs.getString("email")); %></td>
            <td><% out.println(rs.getString("mainphone")); %></td>
            <td><% out.println(rs.getString("altphone")); %></td>
             <td><% out.println(rs.getString("Address")); %></td>
             <td><% out.println(rs.getString("regNo")); %></td>
             <td><% out.println(rs.getString("careTakerName")); %></td>
             <td><% out.println(rs.getString("careTakerPhone")); %></td>
             </tr>
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
                 
                              }
                  
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
                    <!--<th>Status</th>-->
                  </tr>
                </thead>
                <tbody>
                    <%

try
{           
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ekarunya","root","");
String query="SELECT * FROM `oldage`";
PreparedStatement psmt=con.prepareStatement(query);
ResultSet rs=psmt.executeQuery();
while(rs.next())
{%>
                  <tr>
            <td><% out.println(rs.getString("id")); %> </td>
            <td><% out.println(rs.getString("OrganisationName")); %></td>
            <td><% out.println(rs.getString("email")); %></td>
            <td><% out.println(rs.getString("mainphone")); %></td>
            <td><% out.println(rs.getString("altphone")); %></td>
             <td><% out.println(rs.getString("Address")); %></td>
             <td><% out.println(rs.getString("regNo")); %></td>
             <td><% out.println(rs.getString("careTakerName")); %></td>
             <td><% out.println(rs.getString("careTakerPhone")); %></td>
             </tr>
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
                 
                              }
                  
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

