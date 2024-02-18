<?php

// Conectar a la base de datos
$db = new PDO('mysql:host=localhost;dbname=sistema_tickets', 'root', '');

// Obtener los datos del formulario
$email = $_POST['email'];
$password = $_POST['password'];

// Validar el usuario
$usuario = $db->query("SELECT * FROM usuarios WHERE email = '$email' AND password = '$password'")->fetch();

if (!$usuario) {
  // Mostrar un mensaje de error
  echo "<p>Usuario o contraseña incorrectos.</p>";
} else {
  // Iniciar sesión y redirigir al usuario al inicio
  session_start();
  $_SESSION['usuario'] = $usuario;
  header('Location: index.php');
}

?>
