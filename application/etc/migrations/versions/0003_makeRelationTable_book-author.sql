CREATE TABLE IF NOT EXISTS relations (
    bookId INT(10) UNSIGNED,
    authorId INT(10) UNSIGNED,
    isDeleted TINYINT(1) DEFAULT 0
);

INSERT INTO relations (bookId, authorId)
SELECT books.id, authors.id
FROM books JOIN authors ON books.id=authors.id;

ALTER TABLE relations ADD FOREIGN KEY (bookId) REFERENCES books(id) ON DELETE RESTRICT ON UPDATE RESTRICT;
ALTER TABLE relations ADD FOREIGN KEY (authorId) REFERENCES authors(id) ON DELETE RESTRICT ON UPDATE RESTRICT;

