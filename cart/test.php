<?php
    $con=mysqli_connect("localhost","root","","test6");
    if($con)// if connection established
    {
      ?>
      <script type="text/javascript">alert('Connected');</script>
      <?php
      $sql="select * from  fake_product";
      $r=mysqli_query($con,$sql);
       
        while( $row=mysqli_fetch_array($r) )
        {
        
        echo $row[8];  
        
       
       } 
    }
?>