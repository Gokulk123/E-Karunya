<?php include '../Databases/Connect.php'; ?>
<?php
if(isset($_POST['submit'])){


   
              $title    = $_REQUEST['title'];
              $report   = $_REQUEST['report'];
              $dateTime = $_REQUEST['dateTime'];
              $Organisaton=$_REQUEST['Organisaton'];
        
    
   $r= mysqli_query($conn, "INSERT INTO `donationrequest`(`Donate_Id`, `Donate_Name`, `Donate_Report`, `Donate_Date`, `Donate_Organisation`,`Donate_Org_Id`) VALUES (NULL,'$title','$report','$dateTime','$Organisaton','".$_COOKIE['id']."')");
   if($r)
   {
?>
<script type="text/javascript">
  alert("Your donation will be published after the varification by the administrator. ");
  window.location="addDonationRequest.php";
</script>
<?php
}
}

?>
