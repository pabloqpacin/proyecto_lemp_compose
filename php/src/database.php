<!--
https://www.youtube.com/watch?v=zZ6vybT1HQs
// 1. MySQLi Extension:         dependencies added on the php Dockerfile
// 2. PDO (PHP Data Object):    more databases, object oriented
-->


<?php

    // Me gustaría que obtuviera esta información de 'mysql.properties' directamente
    $db_server = "db:3306";         # El nombre del contenedor, alternativamente... $ docker inspect proyecto-db-1 | grep IPAddress ...
    $db_user = "root";
    $db_pass = "password";
    $db_name = "db1";
    $conn = "";

    $conn = mysqli_connect($db_server, $db_user, $db_pass, $db_name);
    
    if ($conn){
        echo "You are connected <br>";
    } else {
        echo "Could not connect! <br>";
    }

    // try{}catch(){}

?>