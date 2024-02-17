<?php
    include("database.php");
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fakebook Form</title>
    <style>
        body {
            background-color: #333;
            color: #fff;
            padding: 20px;
            font-family: system-ui, -apple-system, 'Segoe UI', Roboto, Ubuntu, sans-serif;
        }
    </style>
</head>
<body>
    <form action="<?php echo htmlspecialchars($_SERVER["PHP_SELF"]); ?>" method="post">
        <h2>Welcome to Fakebook</h2>
        username:<br>
        <input type="text" name="username"><br>
        password:<br>
        <input type="password" name="password"><br>
        <input type="submit" name="submit" value="register">
    </form>
</body>
</html>

<?php

    if ($_SERVER["REQUEST_METHOD"] == "POST") {

        $username = filter_input(INPUT_POST, "username", FILTER_SANITIZE_SPECIAL_CHARS);
        $password = filter_input(INPUT_POST, "password", FILTER_SANITIZE_SPECIAL_CHARS);

        if (empty($username)){
            echo "Please enter a username";
        } elseif (empty($password)) {
            echo "Please enter a password";
        } else {
            $hash = password_hash($password, PASSWORD_DEFAULT);
            $sql = "INSERT INTO users (user, password)
                    VALUES ('$username', '$hash')";
            try {
                $result = mysqli_query($conn, $sql);
                if ($result === false) {
                    throw new Exception(mysqli_error($conn));
                }
                echo "You are now registered!";
            } catch (Exception $e) {
                echo "Could not register user! <br> <hr>" . $e->getMessage();
            }
        }
    }

    mysqli_close($conn);
?>
