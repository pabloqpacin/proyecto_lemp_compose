<?php
ini_set('display_errors', 1) ;
session_start();
$_SESSION['logged-in'] = false;

require_once './src/Database.php';
$db = Database::getInstance();

$err = '';

if(isset($_POST['submit'])){
 
  $email = $_POST['email'];
  $password = $_POST['password'];

  if(strlen($email) < 1 ){
    $err = 'Please enter email address';
  } else if(!filter_var($email, FILTER_VALIDATE_EMAIL)){
    $err = 'Please enter a valid email adddress';
  } else if(strlen($password) < 1){
    $err = "Please enter your password";
  } else {
    $sql = "SELECT id, name, email, password, role FROM users WHERE email = '$email'";
    $res = $db->query($sql);

    if($res->num_rows < 1){
      $err = "No user found";
    } else {
      $user = $res->fetch_object();

      if(password_verify($password , $user->password)){
          $_SESSION['logged-in'] = true;
          $_SESSION['user'] = $user;
          header('Location: ./dashboard.php');
          exit();
      } else {
        $err = "Wrong username or password";
      }
    }
  }
}
?>

<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Helpdesk - Login</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">

</head>

<body class="bg-dark">
  <div class="container">
    <div class="card card-login mx-auto mt-5">
      <div class="card-header text-center font-weight-bold">Login</div>
      <div class="card-body">
        <form method="POST" action="<?php echo $_SERVER['PHP_SELF']?>">
          <div class="form-group">
            <label for="inputEmail">Email address</label>
            <input type="text" name="email" class="form-control" placeholder="Email address" autofocus="autofocus">


          </div>
          <div class="form-group">
            <label for="inputPassword">Password</label>
            <input type="password" name="password" class="form-control" placeholder="Password">


          </div>
          <div class="form-group">
            <div class="checkbox">
              <label>
                <input type="checkbox" value="remember-me">
                Remember Password
              </label>
            </div>
          </div>
          <button type="submit" name="submit" class="btn btn-primary btn-block">Login</button>
        </form>

        <?php if(strlen($err) > 1) :?>
        <div class="alert alert-danger text-center mt-3" role="alert"> <strong>Failed! </strong> <?php echo $err;?></div>
        <?php endif?>
      </div>
    </div>
  </div>

  <!-- Bootstrap core JavaScript-->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

  <!-- Core plugin JavaScript-->
  <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

</body>

</html>