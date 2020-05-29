<?php
session_start();
$name=$_POST['name'];
$email=$_POST['email'];
$address=$_POST['address'];
$city=$_POST['city'];
$state=$_POST['state'];
$name_on_card=$_POST['cardname'];
$card_no=$_POST['cardnumber'];
$exp_month=$_POST['expmonth'];
$exp_year=$_POST['expyear'];
$cvv=$_POST['cvv'];
$pname=$_REQUEST['pname'];
$price=$_REQUEST['price'];
$quantity=$_REQUEST['quantity'];
$sellerid=$_SESSION['seller_id'];
$con1=mysqli_connect("localhost","root","","fakeproduct");
$sql1="SELECT * FROM `fake_product` WHERE `pro_name`='$pname'";
$r=mysqli_query($con1,$sql1);
if(mysqli_num_rows($r) > 0)
{
	$row=mysqli_fetch_array($r);
	$pid=$row['pro_id'];
}
$con=mysqli_connect("localhost","root","","fakeproduct");
$sql="INSERT INTO `fake_checkout`(`Name`,  `Email`, `Address`, `State`,`City`,`Cardname`,`Cardnumber`,`Expmonth`,`Expyear`,`CVV`,`product`,`price`,`pro_id`,`quantity`) VALUES('$name','$email','$address','$state','$city','$name_on_card','$card_no','$exp_month','$exp_year','$cvv','$pname','$price','$pid','$quantity')";
$r=mysqli_query($con,$sql);
if($r)
{
	?>
	<!--<script type="text/javascript">
		alert("success");
		window.location="http://localhost:8084/fakeproduct/index1.php";
	</script>-->
	<?php
}


else
{
	echo mysqli_error($con);
}

?>


