<?php

$config = require('../../../config/configDb.php');

$pdo = new PDO($config['cdn'], $config['user'], $config['pass']);

makeMigration(getMigrationsToDo(getDoneMigrations($pdo), getMigrationsList()), $pdo);

/* ===================== Functions ================= */

function getDoneMigrations(PDO $pdo) {
    $query = $pdo->prepare("SELECT name FROM migrations");
    $query->execute();
    return $query->fetchAll(PDO::FETCH_COLUMN);
}

function getMigrationsList() {
    $input = scandir((__DIR__ . '/versions/'));
    $migrationsToDo = [];

    foreach ($input as $item) {
        if (preg_match('/^([0-9]{4}\S+.sql)$/', $item)) {
            $migrationsToDo[] = $item;
        }
    }
    return $migrationsToDo;
}

function getMigrationsToDo($doneList, $inputList) {
    if (count($doneList) === count($inputList)) {
        die("You have last version of DATABASE");
    }
    if (count($doneList) > count($inputList)) {
        die('Is incorrect list of migrations');
    }

    //run for all activated versions
    $i = 0;
    foreach ($doneList as $item) {
        if ($item !== $inputList[$i++]) {
            die('Is incorrect list of migrations');
        }
    }
    //get new versions of db
    $migrationsToDo = [];
    for ($iMax = count($inputList); $i < $iMax; $i++) {
        $migrationsToDo[] = $inputList[$i];
    }

    return $migrationsToDo;
}

function makeMigration($migrateList, PDO $pdo) {
    $count = count($migrateList);
    for ($i = 0; $i < $count; $i++) {
        //get and make query migration
        $query = $pdo->prepare(file_get_contents(__DIR__ . '/versions/' . $migrateList[$i]));
        $query->execute();
        //write actual version to db
        $query = $pdo->prepare("INSERT INTO migrations (name, comment) VALUES (:name, :comment)");
        $query->execute(['name' => $migrateList[$i], 'comment' => '']);
    }
    echo 'Migrate was successfully done!';
}