<?php

namespace application\controllers;

use application\core\Controller;
use application\models\ModelBooks;
use application\models\ModelTemplates;
use application\views\TemplateEngine;

class ControllerSearch extends Controller {

    public function __construct() {
        $this->modelData = new ModelBooks();
        $this->modelTemplates = new ModelTemplates();
        $this->view = new TemplateEngine();
    }

    public function actionIndex() {
        $data['books'] = $this->modelData->getSearchedBooks();
        $data['tplLinks'] = $this->modelTemplates->getSearchLinks(count($data['books']));
        $data['pagination'] = null;

        $this->view->generatePage($data);
    }
}