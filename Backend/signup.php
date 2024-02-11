<?php
include('db.php');

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $fname = $_POST["fname"];
    $lname = $_POST["lname"];
    $gender = $_POST["gender"];
    $phone = $_POST["phone"];
    $email = $_POST["email"];
    $password = password_hash($_POST["password"], PASSWORD_DEFAULT);

    $roleQuery = "SELECT rid FROM Role WHERE rid ='$familyRole'";
    $roleResult = $conn->query($roleQuery);

    if ($roleResult === FALSE) {
        echo "Error: " . $roleQuery . "<br>" . $conn->error;
    } elseif ($roleResult->num_rows > 0) {
        $roleRow = $roleResult->fetch_assoc();
        $rid = $roleRow["rid"];

        $sql = "INSERT INTO user (fname, lname, gender, tel, email, passwd, rid) 
                VALUES ('$fname', '$lname', '$gender', '$phone', '$email', '$password', '$rid')";

        if ($conn->query($sql) === TRUE) {
            echo "Registration successful!";
        } else {
            echo "Error: " . $sql . "<br>" . $conn->error;
        }
    } else {
        echo "Error: Role not found.";
        echo "Error: " . $roleQuery . "<br>" . $conn->error;
    }
 

$conn->close();
?>
