<?php

class Database {

    private static $instance = null;

    private static $host = 'db:3306';
    private static $user = 'root';
    private static $password = 'password';
    private static $db = 'helpdesk_core_php';
    
    public static function getInstance(){
        if(self::$instance == null){
            self::$instance = new mysqli(self::$host, self::$user, self::$password, self::$db);
        }
        return self::$instance;
    } 
}
