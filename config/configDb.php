<?php

/**
 * Config of connection to database
 */
$host = '127.0.0.1';
$dbname = 'library';
$user = 'root';
$pass = 'root';

return [
    'cdn' => "mysql:host=$host;dbname=$dbname",
    'user' => $user,
    'pass' => $pass
];

