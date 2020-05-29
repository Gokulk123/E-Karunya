<?php
	session_start();

		if (!isset($_SESSION['cid'])) {
		
		echo "<script>alert('Please Login');</script>";
		?>	
		<script type="text/javascript">
			window.location='../index.php'; 
		</script>
		<?php
		}
	
?>
<!DOCTYPE HTML>
<head>
<title>G Site</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script> 
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style type="text/css">
  	  .rating {
  display: inline-block;
  position: relative;
  height: 50px;
  line-height: 50px;
  font-size: 50px;
}

.rating label {
  position: absolute;
  top: 0;
  left: 0;
  height: 100%;
  cursor: pointer;
}

.rating label:last-child {
  position: static;
}

.rating label:nth-child(1) {
  z-index: 5;
}

.rating label:nth-child(2) {
  z-index: 4;
}

.rating label:nth-child(3) {
  z-index: 3;
}

.rating label:nth-child(4) {
  z-index: 2;
}

.rating label:nth-child(5) {
  z-index: 1;
}

.rating label input {
  position: absolute;
  top: 0;
  left: 0;
  opacity: 0;
}

.rating label .icon {
  float: left;
  color: transparent;
}

.rating label:last-child .icon {
  color: #000;
}

.rating:not(:hover) label input:checked ~ .icon,
.rating:hover label:hover input ~ .icon {
  color: #09f;
}

.rating label input:focus:not(:checked) ~ .icon:last-child {
  color: #000;
  text-shadow: 0 0 5px #09f;
}
.container {
  border: 2px solid #ccc;
  background-color: #eee;
  border-radius: 5px;
  padding: 16px;
  margin: 16px 0
}

.container::after {
  content: "";
  clear: both;
  display: table;
}

.container img {
  float: left;
  margin-right: 20px;
  border-radius: 50%;
}

.container span {
  font-size: 20px;
  margin-right: 15px;
}

@media (max-width: 500px) {
  .container {
      text-align: center;
  }
  .container img {
      margin: auto;
      float: none;
      display: block;
  }
}
  </style>
</head>
<body>
	<div class="header">
		 <div class="headertop_desc">
			<div class="wrap">
				<div class="nav_list">
					<ul>
						<li><a href="http://localhost:8084/fakeproduct/index1.php">Home</a></li>
						
						<li><a href="http://localhost:8084/fakeproduct/contact.html">Contact</a></li>
					</ul>
				</div>
					<div class="account_desc">
						<ul>
							
							<li><a href="http://localhost:8084/fakeproduct/seller/logout.php">Logout</a></li>
						
							
						</ul>
					</div>
				<div class="clear"></div>
			</div>
	  	</div>
  	  		<div class="wrap">
				<div class="header_top">
					<div class="logo">
						<h1 style="color: red;font-weight: bold;">G Site</h1>
					</div>
						<div class="header_top_right">
						  <div class="cart">
						  	   <p><span>Cart</span><div id="dd" class="wrapper-dropdown-2" >
						  	   	<ul class="dropdown" style="width: 700px;">
						  	   		<center><h4 style=" font-weight:bold;color: red">Cart List</h4>
										<h4 style="color: skyblue;">
										** Product will be delivered within 5 working Days **
										</h4></center>
										<?php
										$cid= trim($_SESSION['cid']);
										
										$con=mysqli_connect("localhost","root","","fakeproduct");
										$sql="select * from `fake_cart` where `cid`='$cid'";
										
										$r=mysqli_query($con,$sql);
										$count=mysqli_num_rows($r) ;
										if( $count > 0 )
										{

											while($row=mysqli_fetch_array($r))
											{
												$pid= $row[0];
							
												//$_SESSION['pro_id']=$pid;
								
										//$pro_id=$_REQUEST['pro_id'];
										
										$con1=mysqli_connect("localhost","root","","fakeproduct");
										$sql1="select * from `fake_product` where `pro_id`='$pid'";
										/*where `pro_id`='$pro_id'*/
										$r1=mysqli_query($con1,$sql1);
										echo "<center><table border='2px' cellspacing='50px'>";
										if (mysqli_num_rows($r1) > 0) {
											while ($row=mysqli_fetch_array($r1)) {
								
												$cname=$_SESSION['user'];
												$a=$row['pro_id'];
												echo "<tr><td><b>".$row['pro_id']."</b></td><td><b>".$row['pro_name']."</b></td><td><img src='../seller/".$row['image3']."' width='100px' height='100px' style='border:1px solid white;border-radius:10px;'></td><td><b>".$row['pro_discountprice']."Rs/-</b></td><td><a href='checkoutform.php?pname=".$row['pro_name']."&price=".$row['pro_discountprice']."' type='button' class='btn btn-primary'>Place Order</a></td><td><form method='post' action='removecart.php?pname=".$row['pro_name']."&cname=$cname'>
													<button type='submit' name='remove' class='btn btn-danger'>Remove</button>
													</form>
													</td></tr></center>";
												
											}
										}
										echo "</table>";
										}

									}
										else
										{
											echo "<center><h3 style='border:1px solid green;color:#053177;width:50%;'>Your Cart is empty</h3></center>";
										}
										
										?>

								</ul></div></p>
						  </div>
							  <div class="search_box">
					     		<form>
					     			<input type="text" value="Search" onfocus="this.value = '';" onblur="if (this.value == '') {this.value = 'Search';}"><input type="submit" value="">
					     		</form>
					     	</div>
						 <div class="clear"></div>
					</div>
						  <script type="text/javascript">
								function DropDown(el) {
									this.dd = el;
									this.initEvents();
								}
								DropDown.prototype = {
									initEvents : function() {
										var obj = this;
					
										obj.dd.on('click', function(event){
											$(this).toggleClass('active');
											event.stopPropagation();
										});	
									}
								}
					
								$(function() {
					
									var dd = new DropDown( $('#dd') );
					
									$(document).click(function() {
										// all dropdowns
										$('.wrapper-dropdown-2').removeClass('active');
									});
					
								});
					    </script>
			   <div class="clear"></div>
  		    </div>     				
   		</div>
   </div>
   <div class="main">
   	 <div class="wrap">
   	 	<?php
   	 	
   	 	$pname=$_REQUEST['pname'];
   	 	//echo mysqli_escape_string($pname);
    	$con=mysqli_connect("localhost","root","","fakeproduct");
    	$sql="SELECT * FROM `fake_product` WHERE `pro_name`='$pname'";
    	$r=mysqli_query($con,$sql);
    	$count=mysqli_num_rows($r);
    	if($count > 0)
    	{
    		while ($row=mysqli_fetch_array($r)) {
    			$_SESSION['pid']=$row[0];
    	?>

   	 	<div class="content_top">
    		<div class="back-links">
    		<p><a href="index.html">Home</a> &gt;&gt;&gt;&gt; <a href="#" class="active"><?php echo $row[2]; ?></a></p>
    	    </div>
    		<div class="clear"></div>
    	</div>
    	
   	 	<div class="section group">
				<div class="cont-desc span_1_of_2">
				  <div class="product-details">				
					<div class="grid images_3_of_2">
		<?php echo "<img src='../seller/".$row[7]."' alt='loading'>";?>
				  </div>
				<div class="desc span_3_of_2">
					<h2><?php echo $row[3]; ?> </h2>
					<form class="rating">
  <label>
    <input type="radio" name="stars" id="stars" value="1" onclick="rate(1)" />
    <span class="icon">★</span>
  </label>
  <label>
    <input type="radio" name="stars" id="stars" value="2" onclick="rate(2)"/>
    <span class="icon">★</span>
    <span class="icon">★</span>
  </label>
  <label>
    <input type="radio" name="stars" id="stars" value="3" onclick="rate(3)"/>
    <span class="icon">★</span>
    <span class="icon">★</span>
    <span class="icon">★</span>   
  </label>
  <label>
    <input type="radio" name="stars" id="stars" value="4" onclick="rate(4)"/>
    <span class="icon">★</span>
    <span class="icon">★</span>
    <span class="icon">★</span>
    <span class="icon">★</span>
  </label>
  <label>
    <input type="radio" name="stars" id="stars" value="5" onclick="rate(5)"  />
    <span class="icon">★</span>
    <span class="icon">★</span>
    <span class="icon">★</span>
    <span class="icon">★</span>
    <span class="icon">★</span>
  </label>
</form>
<?php $p_id=$row[0]; ?><br><br>
<button type="button" class="btn btn-info btn-sm" data-toggle="modal" data-target="#myModal">Make Review</button>

  <!-- Modal -->
  <div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog">
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <center><h4 class="modal-title" style="color: skyblue;font-weight: bold;font-size: 30px;">Add Review</h4></center>
        </div>
        <div class="modal-body">
        	
        	<form method="post" action="review.php?pname=<?php echo $_REQUEST['pname']; ?>" enctype="multipart/form-data">
        		<table>
          <center><tr><td><p style="font-weight: bold;">Review Title:</p></td>&nbsp;&nbsp;&nbsp;&nbsp;<td><input type="text" name="title"></td></tr></center>
       
          <center><tr><td><p style="font-weight: bold;">Review Content:</p></td>&nbsp;&nbsp;&nbsp;&nbsp;<td><textarea name="content"></textarea></td></tr></center>
          <center><tr><td><input type="radio" name="customer" value="same site"><p style="font-weight: bold;">same site</p></td><td><input type="radio" name="customer" value="another site"><p style="font-weight: bold;">another site</p></td></td></tr></center>
           <center><tr><td><p style="font-weight: bold;">If you are from another site attach your bill :</p></td>&nbsp;&nbsp;&nbsp;&nbsp;<td><input type="file" name="file1"></td></tr></center>
     </table>
        </div>
        <div class="modal-footer">
         <button class="btn btn-success" type="submit" name="save">Save</button> <button type="button" class="btn btn-success" data-dismiss="modal">Close</button>
        </div>
         </form>
      </div>
      
    </div>
  </div><br><br>
					   <p><?php echo $row[4]; ?></p>	
					Total User Rating:&nbsp;&nbsp;&nbsp;<button type="button" class="btn btn-success"> 
						<?php
						$pid=$_SESSION['pid']; 
					$con=mysqli_connect("localhost","root","","fakeproduct");
					$sql="select * from fake_rating where `rat_pro_id`='$pid'";
					$r1=mysqli_query($con,$sql);
					$total=mysqli_num_rows($r1);
					//echo $total;
					if($total > 0)
					{
					
					$r2=mysqli_query($con,"SELECT SUM(rat_rating) FROM fake_rating where `rat_pro_id`='$pid'");
					while ($row1=mysqli_fetch_array($r2)) {
					 $rate=$row1["SUM(rat_rating)"];
					
					}
					
					$cu_rating=$rate/$total;
					echo $cu_rating;
				}
				else
				{
					echo "Be the first person to rate this produsct";
				}

					?>
					<span class="icon">★</span></button>			
					<div class="price">
						<p>Price: <span style="text-decoration: line-through;color: grey;">₹<?php echo $row["pro_actualprice"]; ?></span>&nbsp;&nbsp;&nbsp;&nbsp;<span>₹<?php echo $row["pro_discountprice"]; ?></span></p>
					</div>
					<!-- display review here -->
					<h2>Reviews</h2>

					<div class="container5">
  					
  					<p>
  						<?php echo review(); ?>
  					</p>
					</div>

					<div class="available">
						
					</div>
				<div class="share-desc">
					
					<div class="button">
						<span><a href="add_to_cart.php?pid=<?php echo $row[0];?>&pname= <?php echo $row[3]; ?>">Add to Cart</a></span></div>
					<div class="clear"></div>
				</div>
				 <div class="wish-list">
				 	<ul>
				 		<li class="wish"><a href="#">Add to Wishlist</a></li>
				 	    <li class="compare"><a href="#">Add to Compare</a></li>
				 	</ul>
				 </div>
			</div>
			<div class="clear"></div>
		  </div>
		
   </div>
				<div class="rightsidebar span_3_of_1 sidebar">
					<h2>Related Products</h2>
					 	<div class="special_movies">
					 	   <div class="movie_poster">
					 		  <?php echo "<img src='../seller/".$row["image3"]."' alt='loading'>";?>
					 		 </div>
					 		   <div class="movie_desc">
							    <h4><a href="#"><?php echo $row["pro_name"]; ?></a></h4>
								  <span style="text-decoration: line-through;color: grey;">₹<?php echo $row["pro_actualprice"]; ?></span>&nbsp;&nbsp;<span>₹<?php echo $row["pro_discountprice"]; ?></span>
								     <span><a href="#">Add to Cart</a></span>
								     <!--add_to_cart.php?pid=<?php //echo $row["pro_id"]?>,pname= <?php //echo $row["pro_name"]; ?>-->
								 </div>
								<div class="clear"></div>
					 		</div>	
					 		<div class="special_movies">
					 	   <div class="movie_poster">
					 		   <?php echo "<img src='../seller/".$row["image1"]."' alt='loading'>";?>
					 		 </div>
					 		   <div class="movie_desc">
							    <h4><a href="#"><?php echo $row["pro_name"]; ?></a></h4>
								   <span style="text-decoration: line-through;color: grey;">₹<?php echo $row["pro_actualprice"]; ?></span>&nbsp;&nbsp;<span>₹<?php echo $row["pro_discountprice"]; ?></span>
								     <span><a href="#">Add to Cart</a></span><!--add_to_cart.php?pid=<?php //echo $row["pro_id"]?>,pname= <?php //echo $row["pro_name"]; ?>-->
								 </div>
								<div class="clear"></div>
					 		</div>	
					 		
					 		
					 			 
 					   </div>
 		 		 </div>
 		 		 <?php

    		}
    	}

    	?>
   	 		</div>
        </div>
   <div class="footer">
   	  <div class="wrap">	
	     <div class="section group">
				<div class="col_1_of_4 span_1_of_4">
						<h4>Information</h4>
						<ul>
						<li><a href="#">About Us</a></li>
						<li><a href="#">Customer Service</a></li>
						<li><a href="#">Advanced Search</a></li>
						<li><a href="#">Orders and Returns</a></li>
						<li><a href="contact.html">Contact Us</a></li>
						</ul>
					</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>Why buy from us</h4>
						<ul>
						<li><a href="#">About Us</a></li>
						<li><a href="#">Customer Service</a></li>
						<li><a href="#">Privacy Policy</a></li>
						<li><a href="contact.html">Site Map</a></li>
						<li><a href="#">Search Terms</a></li>
						</ul>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>My account</h4>
						<ul>
							<li><a href="contact.html">Sign In</a></li>
							<li><a href="index.html">View Cart</a></li>
							<li><a href="#">My Wishlist</a></li>
							<li><a href="#">Track My Order</a></li>
							<li><a href="contact.html">Help</a></li>
						</ul>
				</div>
				<div class="col_1_of_4 span_1_of_4">
					<h4>Contact</h4>
						<ul>
							<li><span>+91-123-456789</span></li>
							<li><span>+00-123-000000</span></li>
						</ul>
						<div class="social-icons">
							<h4>Follow Us</h4>
					   		  <ul>
							      <li><a href="#" target="_blank"><img src="images/facebook.png" alt="" /></a></li>
							      <li><a href="#" target="_blank"><img src="images/twitter.png" alt="" /></a></li>
							      <li><a href="#" target="_blank"><img src="images/skype.png" alt="" /> </a></li>
							      <li><a href="#" target="_blank"> <img src="images/linkedin.png" alt="" /></a></li>
							      <div class="clear"></div>
						     </ul>
   	 					</div>
				</div>
			</div>
			 <div class="copy_right">
				<p>G Site © All rights Reseverd | Design by  <a href="http://w3layouts.com">NSK</a> </p>
		   </div>			
        </div>
    </div>
   <script type="text/javascript">
		$(document).ready(function() {			
			$().UItoTop({ easingType: 'easeOutQuart' });
			
		});
	</script>
    <a href="#" id="toTop"><span id="toTopHover"> </span></a>
</body>
</html>

<script type="text/javascript">
	function rate(x)
	{
		var a=x;
		//document.write(a);
		window.location="rating.php?pname=<?php echo $pname; ?>&pid=<?php echo $p_id; ?>&rate="+a;
	}
</script>
<?php
if(isset($_POST['remove']))

{
	$pid=$_SESSION['pid'];
	$cid=$_SESSION['cid'];
	$con=mysqli_connect("localhost","root","","fakeproduct");
	$sql="DELETE FROM `fake_cart` WHERE `pro_id`='$pid' and `cid`='$cid'";
	$r=mysqli_query($con,$sql);
	if($r)
	{
		?>
		<script type="text/javascript">
			alert("removed");
		</script>

		<?php
	}
}

?>
<?php
//session_start();
/*if(isset($_POST['save']))
{
	$pid=$_SESSION['pid'];
	$title=$_POST['title'];
	$content=$_POST['content'];
	$customer=$_POST['customer'];
	$cid=$_SESSION['cid'];
	$file=$_FILES['file1']['tmp_name'];
	$file2=$_FILES['file1']['name'];
	echo $file2;
	$target="C:\ xampp\htdocs\fakeproduct\cart\images";
	$target=$target.basename($_FILES['file1']['name']);
	move_uploaded_file($file, $target);
	$con=mysqli_connect("localhost","root","","fakeproduct");
	$sql="insert into `fake_feedback` values('$pid','$title','$content','$cid','$customer','1','$file2')";



       // check the user submitted the feedback or not by calling function checkflag()

	    
	    $status=checkflag($cid,$pid);
            if($status)
                {


           
							$r=mysqli_query($con,$sql);
							if($r)
							{
								?>

								<script type="text/javascript">
									alert("success");
								</script>

								<?php
							}
							}
				}
				else
				{
				 echo "<script>alert('You have submitted the review last time')</script>";
				}			
/*echo $_SERVER['REMOTE_ADDR'];
echo $_SERVER['HTTP_X_FORWARDED_FOR'];
$IP = $_SERVER['REMOTE_ADDR'];        // Obtains the IP address
$computerName = gethostbyaddr($IP);
echo $computerName;*/

?>

<!--edited bu vishnu-->
<?php
// function to cheack the flag is set or not

		/*function checkflag($customerId,$productId)
		{

			$con1=mysqli_connect("localhost","root","","fakeproduct");
			$sql1="select * from fake_feedback where 	feed_pro_id=$productId  and 	feed_cust_id=$customerId";
			$r1=mysqli_query($con1,$sql1);
			while($row1[]=mysqli_fetch_array($r1))
			{
				if($row1["falg"]!=1)
				{

					
                  return true;
				}
				else
				{
					//echo "<script>alert('You have submitted the review last time')</script>";
					 return false;
				}
			}

		}*/
  						function review()
  						{
  						try
  						{
  							$pid=$_SESSION['pid'];
  						$con=mysqli_connect("localhost","root","","fakeproduct");
  						$sql="SELECT * FROM `fake_feedback` WHERE `feed_pro_id`='$pid'";
  						$r=mysqli_query($con,$sql);
  						if(mysqli_num_rows($r) > 0)
  						{
  							while ($row=mysqli_fetch_array($r)) {
  								?>
  								<br>
  								
  								<img src="../images/download.png" alt="Avatar" style="width:50px">
  								<p><?php echo $row["feed_review"] ?>

  								</p>
  								<?php
  							}
  						}
  					}
  					catch(Exception $e)
  					{
  						echo $e;
  					}
  				}
		

?>
