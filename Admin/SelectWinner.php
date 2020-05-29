<?php 

include '../Databases/Connect.php'; 


$winner				=	0;
$winningCoupon		=	0;

$amount				=	(float)$_REQUEST['fund'];

//select winner

$sql 	= "SELECT * FROM `coupons` ORDER BY rand()";
$result = mysqli_query($conn, $sql);
$i=0;
while($row = mysqli_fetch_assoc($result)) 
	{	
		
		$winner 			=	$row['Coupon_owner'];	
		$winningCoupon		=	$row['Coupon_number'];
	}

//updates the winner account
 mysqli_query($conn, "UPDATE `accounts` SET `Acc_Balance`=`Acc_Balance`+$amount WHERE `Acc_owner`=$winner");

 //updates the winner account
 mysqli_query($conn, "UPDATE `accounts` SET `Acc_Balance`=`Acc_Balance`-$amount WHERE `Acc_owner`=0");

 //Unlists all the coupons
 mysqli_query($conn, "DELETE FROM `coupons`");

 //Sets notifications


date_default_timezone_set('Asia/Kolkata');
 	//select winner name
 		$winnerName		=	"";
 		$Date 			=	date("d,M,Y");
 		$Time 			=	date("h:i:s A");
 		$result 		=	mysqli_query($conn, "SELECT * FROM `users` WHERE `id`='$winner'");
 		while($row = mysqli_fetch_assoc($result))
 		{
 			$winnerName	=	$row['Name'];
 		}
//send notification to the users
$message 	=	"The lucky draw was conducted on $Date at $Time, The winner was $winnerName	, and he won rs $amount";

mysqli_query($conn, "INSERT INTO `notifications`(`Id`, `Message`) VALUES (null,$message)");

?>
<script type="text/javascript">
	alert("<?php echo($message); ?>\n The amount will be deducted from your account. \n All existings coupons will be inavlid from now on!!!");
</script>