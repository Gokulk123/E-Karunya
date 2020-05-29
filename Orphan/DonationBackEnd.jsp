<?php 

include '../Databases/Connect.jsp'; 


$RecId			=		$_REQUEST['RecId'];
$PostId			=		$_REQUEST['PostId'];
$Donation		=		(float)$_REQUEST['Donation'];
$Message     	=		$_REQUEST['Message'];

//Calculating Shares
$DonationShare	=		(float)($Donation  *  80)/100;
$AdminShare		=		(float)($Donation  *  20)/100;

//Calculating Coplons win - All wins one coupon, and extra 1 coupon for each 1000.
$coupons_count	=	1;
$Donationtemp	=	$Donation; 
 
//issuing one mandatory coupon
mysqli_query($conn, "INSERT INTO `coupons` (`Coupon_id`, `Coupon_number`, `Coupon_owner`) VALUES (NULL, '".Coupon_generator()."', '".$_COOKIE['id']."')");

//Generating coupons
while((int)$Donationtemp >0 ) { 
	$coupons_count++;
	$Donationtemp-=1000;
	mysqli_query($conn, "INSERT INTO `coupons` (`Coupon_id`, `Coupon_number`, `Coupon_owner`) VALUES (NULL, '".Coupon_generator()."', '".$_COOKIE['id']."')");
}

//Updating Admin Balance
 mysqli_query($conn, "UPDATE `accounts` SET `Acc_Balance`=`Acc_Balance`+$AdminShare WHERE `Acc_owner`=0");


//Updating Recipient Balance
 mysqli_query($conn, "UPDATE `accounts` SET `Acc_Balance`=`Acc_Balance`+$DonationShare WHERE `Acc_owner`=$RecId");


//Updating Donor Balance
 mysqli_query($conn, "UPDATE `accounts` SET `Acc_Balance`=`Acc_Balance`-$Donation WHERE `Acc_owner`=".$_COOKIE['id']); 

//Adding Donation
 mysqli_query($conn, "INSERT INTO `donations` (`Don_id`, `Donour`, `Reciever`, `Amount`, `TransactionDateTime`, `Post`, `Message`) VALUES (NULL, '".$_COOKIE['id']."', '$RecId', '$Donation', '".date("M,d,Y h:i:s A")."', '$PostId', '$Message')");

function Coupon_generator()
{
	return substr(base_convert(sha1(uniqid(mt_rand())), 16, 36), 0, 15);
}



?>
<script type="text/javascript">
	alert("Your donation was successful,\n\n You earned <?php echo $coupons_count ?> coupons through your act of kindness.\n\n This makes you eligible for participating in our lucky draw. \n\n Keep up the good work. \n\n With love and paryers. \n\n Team e-Karunya");	
	window.location='index.jsp';
</script>