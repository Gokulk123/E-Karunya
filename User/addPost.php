
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
              $fileList = implode(',',$files);
        }
    }
    mysqli_query($conn, "INSERT INTO `posts` (`Post_id`, `DateTime`, `OwnerId`, `Title`, `Description`, `Status`,`files`) VALUES (NULL, '$dateTime', '".$_COOKIE['id']."', '$title', '$report', '0','$fileList')");
    echo "Inserted";
    mysqli_close($conn);


?>
<script type="text/javascript">
  alert("Your post will be published after the varification by the administrator. ");
  window.location="posts.php";
</script>
<?php
}
?>