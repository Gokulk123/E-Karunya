
<?php include '../Databases/Connect.php'; ?>
<?php
if(isset($_POST['submit'])){
              $title    = $_REQUEST['title'];
              $report   = $_REQUEST['report'];
              $dateTime = $_REQUEST['dateTime'];
              $phone = $_REQUEST['phone'];


    $r=mysqli_query($conn, "INSERT INTO `sponsorrequest`(`sp_req_id`, `sp_req_name`, `sp_req_address`, `sp_req_phone`, `sp_req_date`, `sp_req_user`,`sp_request_status`) VALUES (NULL, '$title', '$report','$phone', '$dateTime','".$_COOKIE['id']."','0')");
    //echo "Inserted";
    if($r)

    {
?>
<script type="text/javascript">
  alert("Your Adoption Process Will Start After Admin Approval. ");
  window.location="add_sponsor.php";
</script>
<?php
}
else
{
  echo mysqli_error($conn);
}
}
?>