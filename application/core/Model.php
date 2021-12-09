<?php

namespace application\core;

use PDO;

require_once('config/constants.php');

class Model {

    private $config;

    protected PDO $pdo;

    public function __construct() {
        $this->config = require('config/configDb.php');
        $this->pdo = new PDO($this->config['cdn'], $this->config['user'], $this->config['pass']);
    }
}