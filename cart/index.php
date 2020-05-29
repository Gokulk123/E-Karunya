<?php

session_start();

?>
<!DOCTYPE HTML>
<head>
<title>G Site</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="css/style.css" rel="stylesheet" type="text/css" media="all"/>
<link href="css/slider.css" rel="stylesheet" type="text/css" media="all"/>
<script type="text/javascript" src="js/jquery-1.9.0.min.js"></script> 
<script type="text/javascript" src="js/move-top.js"></script>
<script type="text/javascript" src="js/easing.js"></script>
<script type="text/javascript" src="js/jquery.nivo.slider.js"></script>
<script type="text/javascript">
    $(window).load(function() {
        $('#slider').nivoSlider();
    });
    </script>
</head>
<body>
	<div class="header">
		 <div class="headertop_desc">
			<div class="wrap">
				<div class="nav_list">
					<ul>
						<li><a href="http://localhost:8084/fakeproduct/index.php">Home</a></li>
						
						<li><a href="contact.html">Contact</a></li>
						
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
					<a href="#">&nbsp;&nbsp;&nbsp;&nbsp;<h1 style="color: red;font-size: 40px;font-weight: bold;"><span style="font-family: sans-serif;font-style: italic;">G</span> Site</h1></a>
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
				<div class="header_bottom">
					<div class="header_bottom_left">				
						<div class="categories">
						   <ul>
						  	   <h3>Categories</h3>
							      <li><a href="#">All</a></li>

							      <?php
							      $con=mysqli_connect("localhost","root","","fakeproduct");
							      $sql="SELECT * FROM `fake_category`";
							      $r=mysqli_query($con,$sql);
							      if(mysqli_num_rows($r) > 0)
							      {
							      	while ($rows=mysqli_fetch_array($r)) {
							      		
							      ?>
							      <li><a href="#"><?php echo $rows[1]; ?></a></li>
							      
							       <?php
							       	}
							      }


							      ?>
						  	 </ul>
						</div>					
		  	         </div>
						    <div class="header_bottom_right">					 
						 	    <!------ Slider ------------>
						 	    <br><br><br><br><br><br><br><br>
								  <div class="slider">
							      	<div class="slider-wrapper theme-default">
							            <div id="slider" class="nivoSlider">
							                <img src="images/a.jpg" data-thumb="images/a.jpg" alt="" />
							                <img src="images/b.jpg" data-thumb="images/b.jpg" alt="" />
							                <img src="images/c.jpg" data-thumb="images/c.jpg" alt="" />
							                <img src="images/d.jpg" data-thumb="images/d.jpg" alt="" />
							                 <img src="images/e.jpg" data-thumb="images/e.jpg" alt="" />
							            </div>
							        </div>
						   		</div>
						<!------End Slider ------------>
			         </div>
			     <div class="clear"></div>
			</div>
   		</div>
   </div>
   <!------------End Header ------------>
   
   <?php
    $con=mysqli_connect("localhost","root","","fakeproduct");
    if($con)// if connection established
    {
      $cname=$_REQUEST['cname'];
      $sql="select * from  fake_product where `pro_cat_name`='$cname'";
      $r=mysqli_query($con,$sql);
       
        while( $row=mysqli_fetch_array($r) )
        {
        	//echo $row[3];
         ?>
  <div class="main">
  	<div class="wrap">
      <div class="content">
    	<div class="content_top">
    		<div class="heading">
    		<h3>New Products</h3>
    		</div>
    	</div>
	      <div class="section group">
				<div class="grid_1_of_5 images_1_of_5">
					 <a href="preview.html"><?php echo "<img src='../seller/".$row[7]."' height='100px'>";?></a>
					 <h2><a href="#"><?php echo $row["pro_name"]; ?></a></h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees"><?php echo $row["pro_discountprice"]; ?>Rs/-</span></p>
					    </div>
					       		<div class="add-cart">								
						    	<h4><?php echo "<a href=preview1.php?pid=".$row['pro_id'].">Add to Cart</a>";?></h4><!--image name is passed by url method-->
							     </div>
							 <div class="clear"></div>
					</div>					 
				</div>
				<div class="grid_1_of_5 images_1_of_5">
					 <a href="preview.html"><?php echo "<img src='../seller/".$row[9]."' alt='loading' height='100px'>";?></a>
					 <h2><a href="#"><?php echo $row[3]; ?></a></h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees"><?php echo $row["pro_discountprice"]; ?>Rs/-</span></p>
					    </div>
					       		<div class="add-cart">								
									<h4><?php echo "<a href=preview1.php?pid=".$row['pro_id'].">Add to Cart</a>";?></h4>
							     </div>
							 <div class="clear"></div>
					</div>
					 
				</div>
				<div class="grid_1_of_5 images_1_of_5">
					<a href="preview.html"><?php echo "<img src='../seller/".$row["image4"]."' alt='loading' height='100px'>";?></a>
					 <h2><a href="#"><?php echo $row[3]; ?></a></h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees"><?php echo $row["pro_discountprice"]; ?>Rs/-</span></p>
					    </div>
					       		<div class="add-cart">								
									<h4><?php echo "<a href=preview1.php?pid=".$row['pro_id'].">Add to Cart</a>";?></h4>
							     </div>
							 <div class="clear"></div>
					</div>
				    
				</div>
				<div class="grid_1_of_5 images_1_of_5">
					<a href="preview.html"><?php echo "<img src='../seller/".$row["image5"]."' alt='loading' height='100px'>";?></a>
					 <h2><a href="preview.html"><?php echo $row[3]; ?></a></h2>
					 <div class="price-details">
				       <div class="price-number">
							<p><span class="rupees"><?php echo $row["pro_discountprice"]; ?>Rs/-</span></p>
					    </div>
					       		<div class="add-cart">								
									<h4><?php echo "<a href=preview1.php?pid=".$row['pro_id'].">Add to Cart</a>";?></h4>
							     </div>
							 <div class="clear"></div>
					</div>
				</div>
				<div class="grid_1_of_5 images_1_of_5">
					<a href="preview.html"><?php echo "<img src='../seller/".$row["image3"]."' alt='loading' height='100px'>";?></a>
					 <h2><a href="#"><?php echo $row[3]; ?></a></h2>
					<div class="price-details">
				       <div class="price-number">
							<p><span class="rupees"><?php echo $row["pro_discountprice"]; ?>Rs/-</span></p>
					    </div>
					       		<div class="add-cart">								
									<h4><?php echo "<a href=preview1.php?pid=".$row['pro_id'].">Add to Cart</a>";?></h4>
							     </div>
							 <div class="clear"></div>
					</div>				     
				</div>
			</div>
			<div class="content_bottom">
    		<div class="heading">
				<?php

				}//while end

   				}
   				else
   				{
   					echo mysqli_error($con);
   				}// if end*/
    			?>
    	
    		</div>
    	  </div>
			
       </div>
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

