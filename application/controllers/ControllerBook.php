<?php

namespace application\controllers;

use application\core\Controller;
use application\models\ModelBooks;
use application\models\ModelTemplates;
use application\views\TemplateEngine;

class ControllerBook extends Controller {

    public function __construct() {
        $this->modelData = new ModelBooks();
        $this->modelTemplates = new ModelTemplates();
        $this->view = new TemplateEngine();
    }

    public function actionIndex($bookId) {
        $data['bookData'] = $this->modelData->getBook($bookId);
        $data['tplLinks'] = $this->modelTemplates->getPageBookLinks();

        $this->view->generatePage($data);
    }

    public function actionIncrementRequestsBook() {
        $this->modelData->incrementBookRequests($_POST['id']);
    }
}