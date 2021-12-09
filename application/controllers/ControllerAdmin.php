<?php

namespace application\controllers;

use application\core\Controller;
use application\models\ModelAuth;
use application\models\ModelBooks;
use application\models\ModelTemplates;
use application\views\TemplateEngine;

class ControllerAdmin extends Controller {

    public ModelAuth $modelAuth;

    public function __construct() {
        $this->modelData = new ModelBooks();
        $this->modelTemplates = new ModelTemplates();
        $this->view = new TemplateEngine();

        $this->modelAuth = new ModelAuth();
        $this->modelAuth->checkAuth();
    }

    public function actionIndex($pageId) {
        $data['books'] = $this->modelData->getBooks(BOOKS_ON_PAGE, $this->modelTemplates->getOffset($pageId));
        $data['tplLinks'] = $this->modelTemplates->getAdminBooksLinks();
        $data['pagination'] = $this->modelTemplates->getPagination($pageId, 'admin');

        $this->view->generatePage($data);
    }

    public function actionAddBook() {
        $this->modelData->addBook();
        $this->actionIndex(1);
    }

    public function actionDeleteBook() {
        $this->modelData->softDeleteBook();
    }
}