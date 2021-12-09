<?php

namespace application\components;

class Router {

    private $controllerName = 'ControllerPage';
    private $actionName = 'actionIndex';
    private $id = 1;

    public function run() {
        $this->getControllerValues(explode('/', $_SERVER['REQUEST_URI']));
        $controllerClass = 'application\controllers\\' . $this->controllerName;

        if (!class_exists($controllerClass)) {
            http_response_code(400);
            die (require('tpl/400.tpl'));
        }
        $controller = new $controllerClass();
        $action = $this->actionName;

        if (!method_exists($controller, $action)) {
            http_response_code(400);
            die (require('tpl/400.tpl'));
        }
        $controller->$action(round($this->id));
    }

    private function getControllerValues(array $params) {
        //validation of controller name
        if ($this->isValidParam($params[1])) {
            $this->controllerName = 'Controller' . ucfirst($params[1]);

            //case if isset second param
            if (isset($params[2])) {
                //case if the second param is action
                if ($this->isValidParam($params[2])) {
                    $this->actionName = 'action' . ucfirst($params[2]);

                    //case if isset and is id the third param
                    if (isset($params[3]) && is_numeric($params[3])) {
                        $this->id = $params[3];
                    }
                //case if the second param is id
                } else if (is_numeric($params[2])) {
                    $this->id = $params[2];
                }
            }
        }
    }

    private function isValidParam($arg) {
        return ($arg !== '' && $this->isLetters($arg));
    }

    private function isLetters($str) {
        return preg_match("#^[a-zA-Z]+$#", $str);
    }
}