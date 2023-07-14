<?php
include "connection.php";
function sanitise_number($num){
$num = trim($num);
$num = stripslashes($num);
$num = htmlspecialchars($num);
return $num;
}
// get the post records
$mno = $_GET['mno'];
$mno = sanitise_number($mno);
if(!preg_match("/^\d{10}\.\d$/", $mno)){
echo "<p>Query Failed</p>";
}
else{
// database insert SQL code
$sql = "select * from patientData where medicalno = '$mno';";
$result = mysqli_query($conn, $sql);
?>
<html>
<body>
<table width = "100%" border = "1" cellspacing = "1" cellpadding = "1">
<tr>
<td>Name</td>
<td>MedicalNo</td>
<td>Date of Birth</td>
<td>Bloodtype</td>
<td>Sex</td>
<td>Comments</td>
</tr>
<?php
while($row = mysqli_fetch_assoc($result)){ 
?>
<tr>
<td>
<?php echo $row["name"];?>
</td>
<td>
<?php echo $row["medicalno"];?>
</td>
<td>
<?php echo $row["dob"];?>
</td>
<td>
<?php echo $row["bloodtype"];?>
</td>
<td>
<?php echo $row["sex"];?>
</td>
<td>
<?php
$comment = $row["comments"];
if(is_null($comment)){
echo "";
}else{
echo $comment;
}?>
</td>
<tr>
<?php } ?>
</table>
</body>
</html>
<?php } ?>