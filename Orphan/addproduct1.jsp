<?php include '../Databases/Connect.jsp'; ?>
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
              $name    = $_REQUEST['name'];
              $description   = $_REQUEST['description'];
              $actualprice = $_REQUEST['actualprice'];
              $discountprice = $_REQUEST['discountprice'];
              $category   = $_REQUEST['category'];
              $fileList = implode(',',$files);
              $seller=$_REQUEST['seller'];
              $dateTime = $_REQUEST['dateTime'];

        }
    }
    mysqli_query($conn, "INSERT INTO `productlist`(`pro_seller`, `pro_name`, `pro_description`, `pro_actualprice`, `pro_discountprice`, `pro_category`, `pro_image`, `pro_date`) VALUES ('$seller','$name','$description','$actualprice','$discountprice','$category','$fileList','$dateTime')");
    //echo "Inserted";
    mysqli_close($conn);

}
?>
<script type="text/javascript">
  alert("Your product will be published after the admin approval. ");
  window.location="addproduct.jsp";
</script>
