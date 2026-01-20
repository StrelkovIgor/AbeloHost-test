<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Register the Composer autoloader...
require __DIR__.'/../vendor/autoload.php';

//Register bootstrap
require  path('/bootstrap/app.php');