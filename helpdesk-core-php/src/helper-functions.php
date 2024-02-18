<?php

function cleanInput($input)
{
    return filter_var($input, FILTER_SANITIZE_SPECIAL_CHARS);
}

function isValidEmail($email)
{
    return filter_var($email, FILTER_VALIDATE_EMAIL);
}

function isValidPhone($phone)
{
    return (ctype_digit($phone) && strlen($phone) == 10);
}

function dnd($variable)
{
    echo '<pre>';
    var_dump($variable);
    echo '</pre>';
    die;
}