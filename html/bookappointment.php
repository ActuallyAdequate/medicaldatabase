<?php
include "connection.php";
function sanitise_number($num){
$num = trim($num);
$num = stripslashes($num);
$num = htmlspecialchars($num);
return $num;
}
// get the post records
$mno = $_POST['mno'];
$mno = sanitise_number($mno);
$name = $_POST['name'];
$name = sanitise_number($name);
$date = $_POST['date'];
$time = $_POST['time'];
$clinic = $_POST['clinic'];
$issue = $_POST['issue'];
$issue = sanitise_number($issue);
$errMsg = "";
if(!preg_match("/^\d{10}\.\d$/", $mno)){
$errMsg .= "Medical Number must be in form ##########.#\n";
}
if(!preg_match("/^[a-zA-Z\s]+$/", $name)){
$errMsg .= "Name must be alpha characters\n";
}
if(!preg_match("/^[a-zA-z]+$/", $issue)){
$errMsg .= "issue can only contain alpha characters and whitespace\n";
}
if($errMsg != ""){
echo $errMsg;
}
else
{
//echo $mno . $name . $date . $time . $clinic;
// database insert SQL code
$sql1 = "insert ignore into patientdetails(medicalno)
values('$mno');";
$sql2 = "insert ignore into patient(name, medicalno) values('$name','$mno');";
$s1 = mysqli_query($conn, $sql1);
$s2 = mysqli_query($conn, $sql2);
$sqlpatient = "select patientID from patient where medicalno = '$mno' limit 1;";
$p = mysqli_query($conn, $sqlpatient);
$patientID = mysqli_fetch_assoc($p)["patientID"];
$sqlemployee = "select employeeID from EmployeeWork natural join employee join Clinic on 
Clinic.clinicID = Employee.clinicID where Clinic.clinicID = '$clinic' limit 1;";
$e = mysqli_query($conn, $sqlemployee);
$employeeID = mysqli_fetch_assoc($e)["employeeID"];
//echo $patientID . $employeeID;
$formattime = $time. ":00";
$sql3 = "insert into Appointment(employeeID, app_date, app_time, clinicID)
values('$employeeID', '$date','$formattime','$clinic');";
$sql4 = "insert into admission(patientID, appointmentID, issue)
values($patientID, last_insert_id(), '$issue');";
$s3 = mysqli_query($conn, $sql3);
$s4 = mysqli_query($conn, $sql4);
if($s1 && $s2 && $s3 && $s4)
{
echo "Appointment Booked!";
}
else{
echo "Booking Failed :(";
}
}
?>