<?php
session_start();
$pid=$_REQUEST['pid'];
$pname=$_REQUEST['pname'];
//print_r($_SESSION);
$cid=$_SESSION['cid'];

		$con=mysqli_connect("localhost","root","","fakeproduct");
		date_default_timezone_set("Asia/kolkata");
		$d=date("d/m/y");
		$t=date("h:i:sa");
		$sql="insert into `fake_cart` values('$pid','$d','$t','$cid')";
		$r=mysqli_query($con,$sql);
		if($r)
		{
			//echo "success";
			//header("Location:index1.php");
			?>
<script type="text/javascript">
	alert("Product Added to your cart");
	window.location="preview.php?pname=<?php echo(trim($pname));?>";
</script>

			<?php
			
		}
		else
		{
			echo mysqli_error($con);
		}



?>