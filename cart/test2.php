<?php
    $con=mysqli_connect("localhost","root","","fakeproduct");
    if($con)// if connection established
    {
     // echo "<script>alert('Connected')</script>";
      $sql="select * from  fake_product";
      $r=mysqli_query($con,$sql);
       
        while( $row=mysqli_fetch_array($r) )
        {
          echo $row[8];
          echo "<img src='../seller/".$row[8]."' alt='loading'>";  
         } 
    }
    else
    {
      // echo "<script>alert('!!!!!NOTConnected')</script>";
    }

?>