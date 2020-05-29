<?php

include '../Databases/Connect.jsp';
session_start();

$result = mysqli_query($conn, "SELECT * FROM `orphanage` WHERE `id`='".$_REQUEST['id']."'");
if (mysqli_num_rows($result) > 0) {
    while($row = mysqli_fetch_assoc($result)) {

    		setcookie('OrganisationName'	,$row['OrganisationName']	    , time() + (24 * 60 * 60));
            setcookie('email'	            ,$row['email']	                , time() + (86400 * 30));
            setcookie('mainphone'			,$row['mainphone']		        , time() + (86400 * 30));
            setcookie('altphone'		    ,$row['altphone']	            , time() + (86400 * 30));
            setcookie('Address'	            ,$row['Address']	            , time() + (86400 * 30));
            setcookie('regNo'		        ,$row['regNo']		            , time() + (86400 * 30));
            setcookie('careTakerName'		,$row['careTakerName']		    , time() + (86400 * 30));
            setcookie('careTakerPhone'		,$row['careTakerPhone']		    , time() + (86400 * 30));
            setcookie('id'			        ,$row['id']		                , time() + (86400 * 30));
    }
}
?>
<script type="text/javascript">
      window.location=('index.jsp');
</script>
