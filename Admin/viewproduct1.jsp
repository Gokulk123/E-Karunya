<?php include '../Databases/Connect.jsp'; ?>


<?php

  $id         = $_REQUEST['id'];
  $type = $_REQUEST['choice'];
  //$cat=$_REQUEST['cat'];
 // echo $id.$type.$cat;
  
  
          if($type=="approve")
          {
            $sql="UPDATE `productlist` SET `pro_status`='1' WHERE `pro_id`='$id'";
            $r=mysqli_query($conn,$sql);
            if($r)
            {
              //echo "updated";
              ?>
                <script type="text/javascript">
                  alert("Status updated!!!");
                  window.location="viewproduct.jsp";
                </script>
              <?php
            }
            else
            {
              echo mysqli_error($conn);
            }
          
          }
          else
          {
            $sql="UPDATE `productlist` SET `pro_status`='0' WHERE `pro_id`='$id'";
            $r=mysqli_query($conn,$sql);
            if($r)
            {
              //echo "updated";
              ?>
                <script type="text/javascript">
                  alert("Status updated!!!");
                  window.location="viewproduct.jsp";
                </script>
              <?php
            }
            else
            {
              echo mysqli_error($conn);
            }
          
          }
             
        

?>
