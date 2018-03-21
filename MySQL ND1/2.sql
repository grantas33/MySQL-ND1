-- 1
INSERT INTO nd.Authors SET
name = 'Nill Bye';
INSERT INTO nd.Authors SET
name = 'John Bae';
-- 2
INSERT INTO nd.Books SET authorId = 8, title = 'Cosmos', year = 1999;
INSERT INTO nd.Books SET authorId = 8, title = 'Cities', year = 2000;
INSERT INTO nd.Books SET authorId = 9, title = 'Multiplexers: History and philosophy', year = 2016;
-- 3
UPDATE nd.Books SET authorId = 9 WHERE bookId = 10;
