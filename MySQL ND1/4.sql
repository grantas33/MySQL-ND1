-- 1

SELECT `name`, Count(*) FROM nd.Books 
INNER JOIN nd.Authors ON nd.Books.authorId = nd.Authors.authorId
GROUP BY nd.Authors.authorId;

SELECT `name`, Count(nd.Books.authorId) FROM nd.Authors 
LEFT JOIN nd.Books ON nd.Books.authorId = nd.Authors.authorId
GROUP BY nd.Authors.authorId;

-- 2

DELETE a FROM nd.Authors a JOIN
( SELECT nd.Authors.authorId FROM nd.Authors 
LEFT JOIN nd.Books ON nd.Books.authorId = nd.Authors.authorId
GROUP BY nd.Authors.authorId HAVING COUNT(nd.Books.authorId) = 0 ) b
ON a.authorId = b.authorId

