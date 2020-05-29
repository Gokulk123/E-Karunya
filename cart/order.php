<?php
session_start();
$pname=$_REQUEST['pname'];
echo $pname;
$price=$_REQUEST['price'];
echo $price;
date_default_timezone_set("Asia/kolkata");
$d=date("d/m/y");
$t=date("h:i:sa");
echo $d;
echo $t;
echo $_SESSION['cid'];
//$con=mysqli_connect("localhost","root",)

?>