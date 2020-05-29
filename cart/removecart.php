<?php
session_start();
$pname=$_REQUEST['pname'];
$cname=$_REQUEST['cname'];
$con1=mysqli_connect("localhost","root","","fakeproduct");
$sql1="SELECT * FROM `fake_product` WHERE `pro_name`='$pname'";
$r1=mysqli_query($con1,$sql1);
if(mysqli_num_rows($r1) > 0)
{
	while ($rows=mysqli_fetch_array($r1)) {
		$pid=$rows["pro_id"];
	}
}
$con2=mysqli_connect("localhost","root","","fakeproduct");
$sql2="SELECT * FROM `fake_buyer` WHERE `Buyer_name`='$cname'";
$r2=mysqli_query($con2,$sql2);
if(mysqli_num_rows($r2) > 0)
{
	while ($row1=mysqli_fetch_array($r2)) {
		$cid=$row1["Buyer_id"];
	}
}
$con=mysqli_connect("localhost","root","","fakeproduct");
$sql="DELETE FROM `fake_cart` WHERE `pro_id`='$pid' and `cid`='$cid' ";
$r=mysqli_query($con,$sql);
if ($r) {

//print_r($_SESSION['pid']);
       unset($_SESSION[$_REQUEST['pname']]);
  
	?>
	<script type="text/javascript">
      alert("Product Removed");
        window.location="http://localhost:8084/fakeproduct/cart/preview.php?pname=<?php echo $pname; ?>";

    </script>
    <?php
}
else
{
	echo mysqli_error($con);
}

?>