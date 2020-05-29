<?php
include '../Databases/Connect.php'; 
$id         = $_REQUEST['id'];

mysqli_query($conn, "DELETE FROM `posts` WHERE `posts`.`Post_id` = $id");

?>
<script type="text/javascript">
    alert('Your post was removed successfully');
    window.location='posts.php';
</script>
