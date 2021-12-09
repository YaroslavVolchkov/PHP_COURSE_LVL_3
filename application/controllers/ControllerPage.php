<?php

namespace application\controllers;

use application\core\Controller;
use application\models\ModelTemplates;
use application\views\TemplateEngine;
use application\models\ModelBooks;

class ControllerPage extends Controller {

    public function __construct() {
        $this->modelData = new ModelBooks();
        $this->modelTemplates = new ModelTemplates();
        $this->view = new TemplateEngine();
    }

    public function actionIndex($pageId) {
        $data['books'] = $this->modelData->getBooks(BOOKS_ON_PAGE, $this->modelTemplates->getOffset($pageId));
        $data['tplLinks'] = $this->modelTemplates->getPageBooksLinks();
        $data['pagination'] = $this->modelTemplates->getPagination($pageId, 'user');

        $this->view->generatePage($data);
    }

}