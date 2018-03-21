-- 1
SELECT * FROM nd.Books;
-- 2
SELECT title FROM nd.Books ORDER BY title asc; 
-- 3
SELECT authorId, COUNT(*) FROM nd.Books GROUP BY authorId; 
