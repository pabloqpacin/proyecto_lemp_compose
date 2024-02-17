<!--
https://www.youtube.com/watch?v=zZ6vybT1HQs
// 1. MySQLi Extension:         dependencies added on the php Dockerfile
// 2. PDO (PHP Data Object):    more databases, object oriented
-->


<?php

    // Me gustaría que obtuviera esta información de 'mysql.properties' directamente
    $db_server = "db:3306";         # El nombre del contenedor, alternativamente... $ docker inspect proyecto-db-1 | grep IPAddress ...
    $db_user = "root";
    $db_pass = "password";          # Ojo Exceptions... xq no 'Could not connect'
    $db_name = "db1";
    $conn = "";

    // if ($conn){
    //     echo "You are connected <br> <hr>";
    // } else {
    //     echo "Could not connect! <br> <hr>";
    // }

    function customErrorHandler($errno, $errstr, $errfile, $errline) {
        throw new ErrorException($errstr, $errno, 0, $errfile, $errline);
    }

    set_error_handler("customErrorHandler");

    try {
        $conn = mysqli_connect($db_server, $db_user, $db_pass, $db_name);
    
        if ($conn === false) {
            throw new Exception("Could not connect! " . mysqli_connect_error());
        }

        echo "You are connected <br> <hr>";
    } catch (Exception $e) {
        echo "Exception caught: " . $e->getMessage() . "<br> <hr>";
    }

?>