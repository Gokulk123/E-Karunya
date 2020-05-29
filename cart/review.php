<?php
/*

							
/*echo $_SERVER['REMOTE_ADDR'];
echo $_SERVER['HTTP_X_FORWARDED_FOR'];
$IP = $_SERVER['REMOTE_ADDR'];        // Obtains the IP address
$computerName = gethostbyaddr($IP);
echo $computerName;*/
session_start();
if(isset($_POST['save']))
{
	$pname1=$_REQUEST['pname'];
	
	$pid=$_SESSION['pid'];
	//echo $pid;
	$title=$_POST['title'];
	$content=$_POST['content'];
	$customer=$_POST['customer'];
	
	$cid=$_SESSION['cid'];
	//echo $cid;
	$file=$_FILES['file1']['tmp_name'];
	$file2=$_FILES['file1']['name'];
	$target="images/";
	$target=$target.basename($_FILES['file1']['name']);
	$path=move_uploaded_file($file, $target);
	$localIP = getHostByName(getHostName());
	if($customer=="another site")
		{
	$con1=mysqli_connect("localhost","root","","fakeproduct");
	$sql1="select * from `fake_feedback` where `feed_pro_id`='$pid' and `feed_cust_id`='$cid'";
	$r1=mysqli_query($con1,$sql1);
	$count=mysqli_num_rows($r1);
	if($count > 0){
		?>
<script type="text/javascript">
	
	alert("You are already submitted the review");
	window.location="http://localhost:8084/fakeproduct/cart/preview.php?pname=<?php echo $_REQUEST['pname']; ?>";
</script>
		

		
		<?php
	}
	else
	{
		
			$con=mysqli_connect("localhost","root","","fakeproduct");
			$sql="insert into fake_feedback( `feed_pro_id`, `feed_title`, `feed_review`, `feed_cust_id`, `cus_status`, `bill`, `ipaddress`) values('$pid','$title','$content','$cid','$customer','$target','$localIP')";
			$r=mysqli_query($con,$sql);
			if ($r) {
					?>
						<script type="text/javascript">
						alert("success");
						window.location="http://localhost:8084/fakeproduct/cart/preview.php?pname=<?php echo $_REQUEST['pname']; ?>";
						</script>

					<?php
			}
			else
			{
				echo mysqli_error($con);
			}
		
		}
	}
	else{
		$con1=mysqli_connect("localhost","root","","fakeproduct");
	$sql1="select * from `reguserreview` where `reg_pro_id`='$pid' and `reg_cust_id`='$cid'";
	$r1=mysqli_query($con1,$sql1);
	$count=mysqli_num_rows($r1);
	if($count > 0){
		?>
<script type="text/javascript">
	
	alert("You are already submitted the review");
	window.location="http://localhost:8084/fakeproduct/cart/preview.php?pname=<?php echo $_REQUEST['pname']; ?>";
</script>
		

		
		<?php
	}
	else
	{
		
			$con=mysqli_connect("localhost","root","","fakeproduct");
			$sql="insert into reguserreview values('$pid','$title','$content','$cid')";
			$r=mysqli_query($con,$sql);
			if ($r) {
					?>
						<script type="text/javascript">
						alert("success");
						window.location="http://localhost:8084/fakeproduct/cart/preview.php?pname=<?php echo $_REQUEST['pname']; ?>";
						</script>

					<?php
			}

	}
}
}
?>
