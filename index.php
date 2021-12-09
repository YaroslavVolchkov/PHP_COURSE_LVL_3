<?php

ini_set('display_errors', 1);
error_reporting(E_ALL);

require_once('application/components/autoloader.php');
require_once('application/components/debug.php');
require_once('config/constants.php');

use application\components\Router;

$router = new Router();
$router->run();

