<?php
$conn=mysqli_connect("localhost","root","","eKarunya");
//username=Sree&password=asd&submit=

      $username = $_REQUEST['username'];
      $password = $_REQUEST['password'];
      //$type=$_REQUEST['type'];
      //echo $username.$password;

     
                $result = mysqli_query($conn, "SELECT * FROM `oldage` WHERE `email`='$username' AND `password`='$password'");
      if (mysqli_num_rows($result) > 0) {
          while($row = mysqli_fetch_assoc($result)) {
                if($row['status']=='Suspend')
                {
                  ?>
                    <script type="text/javascript">
                      alert('Your account waits admin approval.');
                    </script>
                  <?php
                }
                else
                {
                  ?>
                    <script type="text/javascript">
                        alert('Welcome to your account');
                        window.location='Oldage/setcookie.php?id=<?php echo $row['id'];  ?>';
                    </script>
                  <?php
                }
              }
            }
                else {
                     echo mysqli_error($conn);
                    }
          
      //} else {
         // echo "0 results";
      //}
      //}
      


?>