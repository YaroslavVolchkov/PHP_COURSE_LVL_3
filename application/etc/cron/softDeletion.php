<?php

$config = require('../../../config/configDb.php');
$path = __DIR__ . '/softDeletion/';
$pdo = new PDO($config['cdn'], $config['user'], $config['pass']);

$command = file_get_contents($path . 'deleteBooks.sql');
makeDeletion($pdo, $command);

function makeDeletion($pdo, $command) {
    $query = $pdo->prepare($command);
    $query->execute();
}