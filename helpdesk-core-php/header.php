<?php 
session_start();
ini_set('display_errors', 1);
if(!isset($_SESSION['logged-in']) || $_SESSION['logged-in'] == false){
    header('Location: ./index.php');
    exit();
}
$user = $_SESSION['user'];
require_once './src/Database.php';
$db = Database::getInstance();
?>
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Helpdesk - Dashboard</title>

  <!-- Custom fonts for this template-->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Page level plugin CSS-->
  <link href="vendor/datatables/dataTables.bootstrap4.css" rel="stylesheet">

  <!-- Custom styles for this template-->
  <link href="css/sb-admin.css" rel="stylesheet">

</head>

<body id="page-top">

  <nav class="navbar navbar-expand navbar-dark bg-dark static-top">

    <a class="navbar-brand mr-1" href="dashboard.php">Helpdesk</a>

    <button class="btn btn-link btn-sm text-white order-1 order-sm-0" id="sidebarToggle" href="#">
      <i class="fas fa-bars"></i>
    </button>

    <!-- Navbar Search -->
    <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
      <div class="input-group">
        <input type="hidden" class="form-control" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2">
        <div class="input-group-append">
          <!--<button class="btn btn-primary" type="button">
            <i class="fas fa-search"></i>
          </button>-->
        </div>
      </div>
    </form>

    <!-- Navbar -->
    <ul class="navbar-nav ml-auto ml-md-0">
      
      <li class="nav-item dropdown no-arrow">
        <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fas fa-user-circle fa-fw"></i> <?php echo $user->name?>
        </a>
        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
          
          <a class="dropdown-item" href="./logout.php" data-toggle="modal" data-target="#logoutModal">Logout</a>
        </div>
      </li>
    </ul>

  </nav>

  <div id="wrapper">

    <!-- Sidebar -->
    <ul class="sidebar navbar-nav">
      <li class="nav-item active">
        <a class="nav-link" href="./dashboard.php">
          <i class="fas fa-fw fa-tachometer-alt"></i>
          <span> Dashboard</span>
        </a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="./open.php">
          <i class="fas fa-fw fa-lock-open"></i>
          <span> Open</span>
        </a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="./solved.php">
          <i class="fa fa-fw fa-anchor"></i>
          <span> Solved</span>
        </a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="./closed.php">
          <i class="fa fa-fw fa-times-circle"></i>
          <span> Closed</span>
        </a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="./pending.php">
          <i class="fa fa-fw fa-adjust"></i>
          <span> Pending</span>
        </a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="./unassigned.php">
          <i class="fa fa-fw fa-at"></i>
          <span> Unassigned</span>
        </a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="./mytickets.php">
          <i class="fa fa-fw fa-award"></i>
          <span> My tickets</span>
        </a>
      </li>
      <?php if($user->role == 'admin'): ?>
      <li class="nav-item active">
        <a class="nav-link" href="./team.php">
          <i class="fa fa-fw fa-users"></i>
          <span> Teams</span>
        </a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="./users.php">
          <i class="fa fa-fw fa-users"></i>
          <span> Users</span>
        </a>
      </li>
   <?php endif; ?>  
    </ul>
    
