-- lentelių sukūrimas
CREATE TABLE IF NOT EXISTS `News` (
  `newsId` int(11) NOT NULL AUTO_INCREMENT,
  `text` text CHARACTER SET latin7 NOT NULL,
  `date` date NOT NULL, 
  PRIMARY KEY (`newsId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

CREATE TABLE IF NOT EXISTS `Comments` (
  `commentId` int(11) NOT NULL AUTO_INCREMENT,
  `text` text CHARACTER SET latin7 NOT NULL,
  `date` date NOT NULL, 
  `newsId` int(11) NOT NULL,
  PRIMARY KEY (`commentId`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- išrenkami naujausi 10 straipsnių su paskutiniu kiekviename parašytu komentaru
SELECT Ar.News.newsId, Ar.News.`text`, Ar.News.`date`, b.commentId, b.`text` FROM Ar.News 
LEFT JOIN 
(SELECT Ar.Comments.commentId, Ar.Comments.text, Ar.Comments.newsId FROM Ar.Comments INNER JOIN
(SELECT newsId, MAX(Ar.Comments.`date`) AS latest FROM Ar.Comments GROUP BY Ar.Comments.newsId ) a
ON Ar.Comments.newsId = a.newsId AND Ar.Comments.`date` = a.latest) b ON Ar.News.newsId = b.newsId
ORDER BY Ar.News.`date` desc LIMIT 10

