-- 1 Sukuriama daug su daug ryšį apdorojanti lentelė
CREATE TABLE IF NOT EXISTS `Books_Authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookId` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

-- 2 bookID ir authorId stulpelių duomenys perkopijami į naujai sukurtą lentelę
INSERT INTO nd.Books_Authors (nd.Books_Authors.bookId, nd.Books_Authors.authorId)
SELECT bookId, authorId FROM nd.Books
WHERE authorID != 0

-- pridedami duomenys testuoti
INSERT INTO test.Books_Authors SET bookId = 5, authorId = 5

-- išmetamas nereikalingas stulpelis knygų lentelėje
ALTER TABLE nd.Books DROP authorId

-- 3
SELECT nd.Books_Authors.bookId, GROUP_CONCAT(nd.Authors.`name`)
FROM nd.Books_Authors 
INNER JOIN nd.Authors ON nd.Books_Authors.authorId = nd.Authors.authorId
GROUP BY nd.Books_Authors.bookId

-- 4
ALTER TABLE nd.Books MODIFY title varchar(255) CHARACTER SET latin7;
