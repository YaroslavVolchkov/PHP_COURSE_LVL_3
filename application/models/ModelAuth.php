<?php

namespace application\models;

use application\core\Model;
use PDO;

/*
 * Model which is responsible to authorization in admin panel
 */

class ModelAuth extends Model {

    public function checkAuth() {
        if (!isset($_SERVER['PHP_AUTH_USER']) || $_SERVER['PHP_AUTH_USER'] == '') {
            $this->showUnauthorizedHeaders();
            http_response_code(401);
            die (require('tpl/401.tpl'));
        }
        $query = $this->pdo->prepare("SELECT * FROM adminUsers WHERE login =:login");
        if (!$query->execute(['login' => $_SERVER['PHP_AUTH_USER']])) {
            http_response_code(500);
            die (require('tpl/500.tpl'));
        }
        $userData = $query->fetch(PDO::FETCH_ASSOC);

        //case if login or password is wrong
        if (!isset($userData['login']) || !$this->isValidPassword($userData['pass'])) {
            $this->showUnauthorizedHeaders();
        }
    }

    private function isValidPassword($pass) {
        return $pass === $_SERVER['PHP_AUTH_PW'];
    }

    private function showUnauthorizedHeaders() {
        header("WWW-Authenticate: Basic realm=\"My Realm\"");
        header("HTTP/1.0 401 Unauthorized");
    }
}