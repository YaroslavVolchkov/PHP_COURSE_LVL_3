<?php

namespace application\models;

use application\components\Paginator;
use application\core\Model;
use PDO;

/*
 * Model which is responsible to all templates
 */

class ModelTemplates extends Model {

    public function getSearchLinks($numBooks) {
        $output = [
            'main' => 'tpl/main.tpl',
            'header' => 'tpl/header_user.tpl',
            'footer' => 'tpl/footer.tpl',
            'content' => 'tpl/content_books_user.tpl'
        ];
        if ($numBooks < 1) {
            $output['content'] = 'tpl/itemNotFound.tpl';
        }
        return $output;
    }

    public function getOffset($page) {
        //case if requested page is out of bounds
        if (!$this->isValidCurrentPage($page, $this->getNumPages())) {
            http_response_code(404);
            die (require('tpl/404.tpl'));
        }

        if ($page > 1) {
            return BOOKS_ON_PAGE * ($page - 1);
        }
        return 0;
    }

    public function getPageBooksLinks() {
        return [
            'main' => 'tpl/main.tpl',
            'header' => 'tpl/header_user.tpl',
            'footer' => 'tpl/footer.tpl',
            'content' => 'tpl/content_books_user.tpl'
        ];
    }

    public function getPagination($pageId, $controllerName) {
        $actionName = 'generate' . ucfirst($controllerName) . 'Pagination';
        $paginator = new Paginator($pageId, $this->getNumPages());
        return $paginator->$actionName();
    }

    public function getPageBookLinks() {
        return [
            'main' => 'tpl/main.tpl',
            'header' => 'tpl/header_user.tpl',
            'footer' => 'tpl/footer.tpl',
            'content' => 'tpl/content_book_user.tpl'
        ];
    }

    public function getAdminBooksLinks() {
        return [
            'main' => 'tpl/main.tpl',
            'header' => 'tpl/header_admin.tpl',
            'footer' => 'tpl/footer.tpl',
            'content' => 'tpl/content_books_admin.tpl'
        ];
    }


    private function isValidCurrentPage($currentPage, $totalPages): bool {
        return $currentPage > 0 && $currentPage <= $totalPages;
    }

    private function getNumPages() {
        $query = $this->pdo->prepare("SELECT COUNT(*) FROM books WHERE isDeleted = 0");
        if ($query->execute()) {
            $numBooks = $query->fetch(PDO::FETCH_COLUMN);
            $numPages = ceil($numBooks / BOOKS_ON_PAGE);
            //case if library is empty
            if ($numPages < 1) {
                $numPages = 1;
            }
            return $numPages;
        }
        http_response_code(500);
        die (require('tpl/500.tpl'));
    }
}