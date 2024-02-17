<?php
    include("index.php");
    include("database.php");

    # If mysqli can't connect to DB (wrong password etc) and we browse localhost/select_user.php... we get them ugly exceptions

    $sql = "SELECT * FROM users";
            // WHERE user = 'Spongebob'";

    $result = mysqli_query($conn, $sql);

    if (mysqli_num_rows($result) > 0){
        while ($row = mysqli_fetch_assoc($result)){
            echo $row["id"] . "<br>";
            echo $row["user"] . "<br>";
            echo $row["reg_date"] . "<br>";
        };
    } else {
        echo "No user found <br>";
    }

    mysqli_close($conn)

?>