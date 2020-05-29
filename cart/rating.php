<!--<!DOCTYPE html>
<html>
<head>
	<title></title>
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
  </style>
</head>
<body>
<form class="rating" >
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
    <input type="radio" name="stars" id="stars" value="5" onclick="rate(5)"/>
    <span class="icon">★</span>
    <span class="icon">★</span>
    <span class="icon">★</span>
    <span class="icon">★</span>
    <span class="icon">★</span>
  </label>

</form>
</body>
</html>

<script type="text/javascript">
	function rate(x)
	{
		var a=x;
		//document.write(a);
    window.location="rating.php?rating="+a+"";


	}
    $(':radio').change(function() {
  console.log('New star rating: ' + this.value);
});
</script>-->
<?php 
session_start();
?>
<?php

$pid=$_REQUEST['pid'];
$cname=$_SESSION['user'];
$pname=$_REQUEST['pname'];
echo $pid;
echo $cname;
echo $pname;
$con=mysqli_connect("localhost","root","","fakeproduct");
$sql="select `Buyer_id` from `fake_buyer` where `Buyer_name`='$cname'";
$r=mysqli_query($con,$sql);
if(mysqli_num_rows($r) > 0)
{
  while($row=mysqli_fetch_array($r))
  {
    $cid=$row[0];
    echo $cid;
  }
}
/*$con=mysqli_connect("localhost","root","","fakeproduct");
$sql="select `rat_rating` from `fake_rating` where `rat_pro_id`='$pid' and `cus_id`='$cid'";
$r=mysqli_query($con,$sql);
if(mysqli_num_rows($r) > 0)
{
  while($row=mysqli_fetch_array($r))
  {
    $rating=$row[2];
    $flag=$row[4];
  }

if($flag==1)
{
  ?>
<script type="text/javascript">
  alert("rating already submitted");

</script>

  <?php
}
else
{*/
  //echo $cid;
$pid=$_REQUEST['pid'];
//echo $pid;
$rate=$_GET['rate'];

//echo $rate;
$con1=mysqli_connect("localhost","root","","fakeproduct");
$sql1="select * from fake_rating where `rat_pro_id`='$pid' and `cus_id`='$cid'";
$r1=mysqli_query($con1,$sql1);
$count=mysqli_num_rows($r1);
  if($count > 0)
  {
    ?>
    <script type="text/javascript">
      alert("You are already rated this product");
        window.location="http://localhost:8084/fakeproduct/cart/preview.php?pname=<?php echo $pname; ?>";
    </script>

    <?php
  }
  else
  {

    $con=mysqli_connect("localhost","root","","fakeproduct");
    $sql="INSERT INTO `fake_rating`(`rat_pro_id`,`rat_rating`,`cus_id`) values('$pid','$rate','$cid')";
    $r=mysqli_query($con,$sql);
    if($r)
    {
    ?>
    <script type="text/javascript">
    alert("rating submitted");
    window.location="http://localhost:8084/fakeproduct/cart/preview.php?pname=<?php echo $pname; ?>";
  </script>

  <?php
  }
  else
    {echo mysqli_error($con);}

  }


?>