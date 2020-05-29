<?php include '../Databases/Connect.php'; ?>


<?php

  $id = $_REQUEST['id'];
  $type= $_REQUEST['type'];
  $cat=$_REQUEST['cat'];
 // echo $id.$type.$cat;
  
  if($cat=='Orphan')
  {
          if($type=="Approve")
          {
            $sql="UPDATE `orphanage` SET `status`='Approve' WHERE `id`='$id'";
            $r=mysqli_query($conn,$sql);
            if($r)
            {
              //echo "updated";
              ?>
                <script type="text/javascript">
                  alert("Status updated!!!");
                  window.location="Organisation.php";
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
                $sql="UPDATE `orphanage` SET `status`='Suspend' WHERE `id`='$id'";
                $r=mysqli_query($conn,$sql);
                if($r)
                {
                 // echo "updated";
                  ?>
                    <script type="text/javascript">
                      alert("Status updated!!!");
                      window.location="Organisation.php";
                    </script>
                  <?php
                }
                else
                {
                  echo mysqli_error($conn);
                }
              }
             
    }
    else if($cat=='Womenwelfare')
    {
                if($type=="Approve")
              {
                $sql="UPDATE `womenwelfare` SET `status`='Approve' WHERE `id`='$id'";
                $r=mysqli_query($conn,$sql);
                if($r)
                {
                  //echo "updated";
                  ?>
                    <script type="text/javascript">
                      alert("Status updated!!!");
                      window.location="Organisation.php";
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
                $sql="UPDATE `womenwelfare` SET `status`='Suspend' WHERE `id`='$id'";
                $r=mysqli_query($conn,$sql);
                if($r)
                {
                 // echo "updated";
                  ?>
                    <script type="text/javascript">
                      alert("Status updated!!!");
                      window.location="Organisation.php";
                    </script>
                  <?php
                }
              }
    }
    else 
    {
       if($type=="Approve")
              {
                $sql="UPDATE `oldage` SET `status`='Approve' WHERE `id`='$id'";
                $r=mysqli_query($conn,$sql);
                if($r)
                {
                  ?>
                    <script type="text/javascript">
                      alert("Status updated!!!");
                      window.location="Organisation.php";
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
                $sql="UPDATE `oldage` SET `status`='Suspend' WHERE `id`='$id'";
                $r=mysqli_query($conn,$sql);
                if($r)
                {
                  ?>
                    <script type="text/javascript">
                      alert("Status updated!!!");
                      window.location="Organisation.php";
                    </script>
                  <?php
                }
              }

        }

?>
