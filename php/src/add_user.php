<?php
    include("index.php");
    include("database.php");

    $username = 'Spongebob';
    $password = 'pineapple1';
    $hash = password_hash($password, PASSWORD_DEFAULT);

    $sql = "INSERT INTO users (user, password)
            VALUES ('$username', '$hash')";

    try {
        $result = mysqli_query($conn, $sql);
        if ($result === false) {
            throw new Exception(mysqli_error($conn));
        }
        echo "User '$username' is now registered!";
    } catch (Exception $e) {
        echo "Could not register user $username! <br> <hr>" . $e->getMessage();
    }
    
    mysqli_close($conn);

    echo '<br>';

?>

<!-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    Hello<br>
</body>
</html> -->