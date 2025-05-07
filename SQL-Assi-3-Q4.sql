use sqldata;
CREATE TABLE Author (
    author_id INT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL
);
desc author;
CREATE TABLE Book (
    book_id INT PRIMARY KEY,
    book_name VARCHAR(255) NOT NULL,
    book_category VARCHAR(50) NOT NULL,
    author_id INT NOT NULL,
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
);
desc book;
INSERT INTO Author (author_id, author_name) VALUES
(201, 'Mohammad Ali'),
(202, 'Amruta Buit'),
(203, 'Deepak Pawar'),
(204, 'Shekhar Nagle');

select  * from author;

INSERT INTO Book (book_id, book_name, book_category, author_id) VALUES
(1001, 'Basic of SQL', 'IT', 201),
(1002, 'Learn Python the hard way', 'IT', 202),
(1003, 'Introduction to ML', 'IT', 203),
(1004, 'Dashboard with PowerBI', 'IT', 201),
(1005, 'Django and DRF', 'IT', 204);
select  * from book;