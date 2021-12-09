<?php

namespace application\models;

use application\core\Model;
use PDO;

/*
 * Model which is responsible to all books data
 */

class ModelBooks extends Model {

    public function getBooks($limit, $offset) {
        $request = "SELECT *, (SELECT GROUP_CONCAT(authors.author SEPARATOR ', ') FROM authors, relations WHERE books.id = relations.bookId AND authors.id = relations.authorId) AS author FROM books WHERE isDeleted = 0 LIMIT $limit OFFSET $offset";
        $query = $this->pdo->prepare($request);
        if ($query->execute()) {
            return $query->fetchAll(PDO::FETCH_ASSOC);
        }
        http_response_code(500);
        die (require('tpl/500.tpl'));
    }

    public function getBook($bookId) {
        $query = $this->pdo->prepare("SELECT *, (SELECT GROUP_CONCAT(authors.author SEPARATOR ', ') FROM authors, relations WHERE books.id = relations.bookId AND authors.id = relations.authorId) AS author FROM books WHERE id =:bookId AND isDeleted = 0");
        if ($query->execute(['bookId' => $bookId])) {
            $bookData = $query->fetch(PDO::FETCH_ASSOC);
            $this->incrementViewsBook($bookData['viewsBook'], $bookId);
            return $bookData;
        }
        http_response_code(500);
        die (require('tpl/500.tpl'));
    }

    public function addBook() {
        if (!$this->isValidRequest()) {
            http_response_code(400);
            die (require('tpl/400.tpl'));
        }
        $query = $this->pdo->prepare("INSERT INTO books (title, year, numPages, about) VALUES (:title, :year, :numPages, :about)");

        if ($query->execute($this->getBookDataFromInput())) {
            $newBookId = $this->pdo->lastInsertId();
            $this->addAuthors($newBookId);
            $this->uploadImage($newBookId);
        } else {
            http_response_code(500);
            die (require('tpl/500.tpl'));
        }
    }

    public function softDeleteBook() {
        $query = $this->pdo->prepare("UPDATE books SET isDeleted = 1 WHERE id =:bookId; UPDATE relations SET isDeleted = 1 WHERE bookId =:bookId;");
        if (!$query->execute(['bookId' => $_POST['id']])) {
            http_response_code(500);
            die (require('tpl/500.tpl'));
        }
    }

    public function getSearchedBooks() {
        $query = $this->pdo->prepare("SELECT COUNT(*) FROM books WHERE isDeleted = 0");
        if (!$query->execute()) {
            http_response_code(500);
            die (require('tpl/500.tpl'));
        }
        $limit = $query->fetch(PDO::FETCH_COLUMN);

        return $this->findBooks($this->getBooks($limit, 0), htmlspecialchars($_POST['textSearch']));
    }

    public function incrementBookRequests($bookId) {
        $query = $this->pdo->prepare("UPDATE books SET requestsBook = :requests WHERE id = :bookId");
        $numRequestsBook = $this->getBookRequests($bookId);
        $query->execute(['requests' => ++$numRequestsBook, 'bookId' => $bookId]);
    }

    private function getBookDataFromInput(): array {
        return [
            'title' => $_POST['title'],
            'year' => $_POST['year'],
            'numPages' => $_POST['numPages'],
            'about' => $_POST['about']
        ];
    }

    private function addAuthors($bookId): void {
        $maxNumAuthors = 3;
        for ($i = 1; $i <= $maxNumAuthors; $i++) {
            $currentAuthor = 'author' . $i;
            if (isset($_POST[$currentAuthor]) && $_POST[$currentAuthor] !== '') {
                //case if author is already exists at the db
                if ($this->exsitsAuthor($currentAuthor)) {
                    $query = $this->pdo->prepare("INSERT INTO authors (author) VALUES (:authorName)");
                    $query->execute(['authorName' => $_POST[$currentAuthor]]);
                }
                $authorId = $this->getAuthorId($_POST[$currentAuthor]);
                $this->addRelations($bookId, $authorId);
            } else {
                break;
            }
        }
    }

    private function findBooks($books, $searchedBook) {
        $output = [];

        foreach ($books as $book) {
            if (mb_stripos($book['title'], $searchedBook) !== false ||
                mb_stripos($book['author'], $searchedBook) !== false ||
                $book['year'] == $searchedBook) {
                $output[] = $book;
            }
        }
        return $output;
    }

    private function getAuthorId($nameAuthor) {
        $query = $this->pdo->prepare("SELECT id FROM authors WHERE author =:authorName");
        if (!$query->execute(['authorName' => $nameAuthor])) {
            http_response_code(500);
            die (require('tpl/500.tpl'));
        }
        return $query->fetch(PDO::FETCH_COLUMN);
    }

    private function addRelations($bookId, $authorId): void {
        $query = $this->pdo->prepare("INSERT INTO relations (bookId, authorId) VALUES (:bookId, :authorId)");
        if (!$query->execute(['bookId' => $bookId, 'authorId' => $authorId])) {
            http_response_code(500);
            die (require('tpl/500.tpl'));
        }
    }

    private function uploadImage($nameImage): void {
        $fileName = $nameImage . '.jpg';
        move_uploaded_file($_FILES['image']['tmp_name'], 'images/' . $fileName);
    }

    private function getBookRequests($bookId) {
        $query = $this->pdo->prepare("SELECT requestsBook FROM books WHERE id = :bookId");
        $query->execute(['bookId' => $bookId]);
        $data = $query->fetch(PDO::FETCH_ASSOC);
        return $data['requestsBook'];
    }

    private function incrementViewsBook($numViewsBook, $bookId) {
        $query = $this->pdo->prepare("UPDATE books SET viewsBook = :numViews WHERE id = :bookId");
        $query->execute(['numViews' => ++$numViewsBook, 'bookId' => $bookId]);
    }

    private function isValidRequest(): bool {
        return $_POST['title'] != '' && $_POST['author1'] != '' && $_POST['year'] &&
            $_POST['about'] != '' && $_POST['numPages'] > 0;
    }

    private function exsitsAuthor($currentAuthor) {
        $query = $this->pdo->prepare("SELECT * FROM authors WHERE author =:nameAuthor");
        $result = '';
        if ($query->execute(['nameAuthor' => $currentAuthor])) {
            $result = $query->fetch(PDO::FETCH_COLUMN);
        }
        return $result === $currentAuthor;
    }
}