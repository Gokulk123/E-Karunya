
<?php include '../Databases/Connect.php'; ?>
<?php
if(isset($_POST['submit'])){
$title      =   "";
$report     =   "";
$dateTime   =   "";
$fileList   =   "";
$files[]=null;
    if(count($_FILES['upload']['name']) > 0){
        for($i=0; $i<count($_FILES['upload']['name']); $i++) {
            $tmpFilePath = $_FILES['upload']['tmp_name'][$i];
              if($tmpFilePath != ""){

                $shortname = $_FILES['upload']['name'][$i];
                $filePath = "../UploadedDocs/" . date('d-m-Y-H-i-s').'-'.$_FILES['upload']['name'][$i];

                if(move_uploaded_file($tmpFilePath, $filePath)) {

                    $files[] = date('d-m-Y-H-i-s').'-'. $shortname;

                }
              }
              $title    = $_REQUEST['title'];
              $report   = $_REQUEST['report'];
              $dateTime = $_REQUEST['dateTime'];
              $phone = $_REQUEST['phone'];
              $fileList = implode(',',$files);
        }
    }

    mysqli_query($conn, "INSERT INTO `adoption` (`Ad_Id`, `Ad_Name`, `Ad_Address`,`Ad_Phone`, `Ad_DateTime`, `Ad_Document`, `Ad_UserId`,`Ad_Status`) VALUES (NULL, '$title', '$report','$phone', '$dateTime', '$fileList','".$_COOKIE['id']."','0')");
    //echo "Inserted";
    mysqli_close($conn);


?>
<script type="text/javascript">
  alert("Your Adoption Process Will Start After Admin Approval. ");
  window.location="posts.php";
</script>
<?php
}
?>