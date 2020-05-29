<?php

include '../Databases/Connect.jsp';
session_start();

$result = mysqli_query($conn, "SELECT * FROM `users` WHERE `id`='".$_REQUEST['id']."'");
if (mysqli_num_rows($result) > 0) {
    while($row = mysqli_fetch_assoc($result)) {

           setcookie('status'		,$row['status']	, time() + (24 * 60 * 60));
            setcookie('Password'	,$row['Password']	, time() + (86400 * 30));
            setcookie('Dob'			,$row['Dob']		, time() + (86400 * 30));
            setcookie('Address'		,$row['Address']	, time() + (86400 * 30));
            setcookie('Alternate'	,$row['Alternate']	, time() + (86400 * 30));
            setcookie('Phone'		,$row['Phone']		, time() + (86400 * 30));
            setcookie('Email'		,$row['Email']		, time() + (86400 * 30));
            setcookie('Name'		,$row['Name']		, time() + (86400 * 30));
            setcookie('id'			,$row['id']		, time() + (86400 * 30));
    }
}
?>
<script type="text/javascript">
      window.location=('index.jsp');
</script>
