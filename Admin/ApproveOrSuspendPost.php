<?php
include '../Databases/Connect.php'; 
$choice     = $_REQUEST['choice'];
$id         = $_REQUEST['id'];

if($choice==='approve')
{
    mysqli_query($conn, "UPDATE `posts` SET `Status` = '1' WHERE `posts`.`Post_id` = $id");
    echo "<script>alert('Approved successfully');window.location='Posts.php';</script>";
}
if($choice==='suspend')
{
    mysqli_query($conn, "UPDATE `posts` SET `Status` = '0' WHERE `posts`.`Post_id` = $id");
    echo "<script>alert('Suspended successfully');window.location='Posts.php';</script>";
}

?>