-- 1
SELECT authorId, `name` FROM nd.Authors
UNION
SELECT bookId, `year` FROM nd.Books
