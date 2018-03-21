CREATE TABLE IF NOT EXISTS `Books_Authors` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `bookId` int(11) NOT NULL,
  `authorId` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=8 ;

INSERT INTO nd.Books_Authors (nd.Books_Authors.bookId, nd.Books_Authors.authorId)
SELECT bookId, authorId FROM nd.Books
WHERE authorID != 0;

ALTER TABLE nd.Books DROP authorId;
ALTER TABLE nd.Books MODIFY title varchar(255) CHARACTER SET latin7;
