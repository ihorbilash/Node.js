/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: authors
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `authors` (
  `a_id` int NOT NULL AUTO_INCREMENT,
  `author` varchar(255) NOT NULL,
  PRIMARY KEY (`a_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 29 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: books
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `books` (
  `b_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `link_image` varchar(255) NOT NULL,
  `descr` varchar(255) NOT NULL,
  `year` int NOT NULL,
  `count_pages` int NOT NULL,
  `count_search` int DEFAULT '0',
  `count_click` int DEFAULT '0',
  `deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`b_id`)
) ENGINE = InnoDB AUTO_INCREMENT = 25 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# SCHEMA DUMP FOR TABLE: books_authors
# ------------------------------------------------------------

CREATE TABLE IF NOT EXISTS `books_authors` (
  `book_id` int NOT NULL,
  `author_id` int NOT NULL,
  `deleted` tinyint(1) DEFAULT '0',
  KEY `book_id` (`book_id`),
  KEY `author_id` (`author_id`),
  CONSTRAINT `books_authors_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `books` (`b_id`),
  CONSTRAINT `books_authors_ibfk_2` FOREIGN KEY (`author_id`) REFERENCES `authors` (`a_id`)
) ENGINE = InnoDB DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: authors
# ------------------------------------------------------------

INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (1, 'Андрей Богуславский');
INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (2, 'Марк Саммерфильд');
INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (3, 'М. Вильямс');
INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (4, 'Уэс Маккинни');
INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (5, 'Брюс Эккель');
INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (6, 'Томас Кормен');
INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (7, 'Дэвид Флэнаган');
INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (8, 'Гэри Маклин Холл');
INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (9, 'Джеймс Р. Грофф');
INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (10, 'Люк Веллинг');
INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (11, 'Сергей Мастицкий');
INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (12, 'Джон Вудкок');
INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (13, 'Джереми Блум');
INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (14, 'А. Белов');
INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (15, 'Сэмюэл Грингард');
INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (16, 'Сет Гринберг');
INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (17, 'Александр Сераков');
INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (18, 'Тим Кедлек');
INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (19, 'Пол Дейтел');
INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (20, 'Роберт Мартин');
INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (21, 'Энтони Грей');
INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (22, 'Мартин Фаулер');
INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (23, 'Джей Макгаврен');
INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (24, 'Дрю Нейл');
INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (25, 'Прамодкумар Дж. Садаладж');
INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (26, 'Чарльз Лейзерсон');
INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (27, 'Рональд Ривест');
INSERT INTO
  `authors` (`a_id`, `author`)
VALUES
  (28, 'Клиффорд Штайн');

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: books
# ------------------------------------------------------------

INSERT INTO
  `books` (
    `b_id`,
    `title`,
    `link_image`,
    `descr`,
    `year`,
    `count_pages`,
    `count_search`,
    `count_click`,
    `deleted`
  )
VALUES
  (
    1,
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    '/books-images/22.jpg',
    'СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА',
    1999,
    356,
    0,
    0,
    0
  );
INSERT INTO
  `books` (
    `b_id`,
    `title`,
    `link_image`,
    `descr`,
    `year`,
    `count_pages`,
    `count_search`,
    `count_click`,
    `deleted`
  )
VALUES
  (
    2,
    'Программирование на языке Go!',
    '/books-images/23.jpg',
    'Программирование на языке Go!',
    1998,
    355,
    0,
    0,
    0
  );
INSERT INTO
  `books` (
    `b_id`,
    `title`,
    `link_image`,
    `descr`,
    `year`,
    `count_pages`,
    `count_search`,
    `count_click`,
    `deleted`
  )
VALUES
  (
    3,
    'Толковый словарь сетевых терминов и аббревиатур',
    '/books-images/25.jpg',
    'Толковый словарь сетевых терминов и аббревиатур',
    1997,
    354,
    0,
    0,
    0
  );
INSERT INTO
  `books` (
    `b_id`,
    `title`,
    `link_image`,
    `descr`,
    `year`,
    `count_pages`,
    `count_search`,
    `count_click`,
    `deleted`
  )
VALUES
  (
    4,
    'Python for Data Analysis',
    '/books-images/26.jpg',
    'Python for Data Analysis',
    1996,
    353,
    0,
    0,
    0
  );
INSERT INTO
  `books` (
    `b_id`,
    `title`,
    `link_image`,
    `descr`,
    `year`,
    `count_pages`,
    `count_search`,
    `count_click`,
    `deleted`
  )
VALUES
  (
    5,
    'Thinking in Java (4th Edition)',
    '/books-images/27.jpg',
    'Thinking in Java 4th Edition',
    1995,
    352,
    0,
    0,
    0
  );
INSERT INTO
  `books` (
    `b_id`,
    `title`,
    `link_image`,
    `descr`,
    `year`,
    `count_pages`,
    `count_search`,
    `count_click`,
    `deleted`
  )
VALUES
  (
    6,
    'Introduction to Algorithms',
    '/books-images/29.jpg',
    'Introduction to Algorithms',
    1921,
    351,
    0,
    0,
    0
  );
INSERT INTO
  `books` (
    `b_id`,
    `title`,
    `link_image`,
    `descr`,
    `year`,
    `count_pages`,
    `count_search`,
    `count_click`,
    `deleted`
  )
VALUES
  (
    7,
    'JavaScript Pocket Reference',
    '/books-images/31.jpg',
    'JavaScript Pocket Reference',
    1994,
    350,
    0,
    0,
    0
  );
INSERT INTO
  `books` (
    `b_id`,
    `title`,
    `link_image`,
    `descr`,
    `year`,
    `count_pages`,
    `count_search`,
    `count_click`,
    `deleted`
  )
VALUES
  (
    8,
    'Adaptive Code via C#: Class and Interface Design, Design Patterns, and SOLID Principles',
    '/books-images/32.jpg',
    'Адаптивный код на С#, Class and Interface Design, Design Patterns, and SOLID Principles',
    1993,
    349,
    0,
    0,
    0
  );
INSERT INTO
  `books` (
    `b_id`,
    `title`,
    `link_image`,
    `descr`,
    `year`,
    `count_pages`,
    `count_search`,
    `count_click`,
    `deleted`
  )
VALUES
  (
    9,
    'SQL: The Complete Referenc',
    '/books-images/33.jpg',
    'SQL: The Complete Referenc',
    1992,
    348,
    0,
    0,
    0
  );
INSERT INTO
  `books` (
    `b_id`,
    `title`,
    `link_image`,
    `descr`,
    `year`,
    `count_pages`,
    `count_search`,
    `count_click`,
    `deleted`
  )
VALUES
  (
    10,
    'PHP and MySQL Web Development',
    '/books-images/34.jpg',
    'PHP and MySQL Web Development',
    1991,
    347,
    0,
    0,
    0
  );
INSERT INTO
  `books` (
    `b_id`,
    `title`,
    `link_image`,
    `descr`,
    `year`,
    `count_pages`,
    `count_search`,
    `count_click`,
    `deleted`
  )
VALUES
  (
    11,
    'Статистический анализ и визуализация данных с помощью R',
    '/books-images/35.jpg',
    'Статистический анализ и визуализация данных с помощью R',
    1990,
    346,
    0,
    0,
    0
  );
INSERT INTO
  `books` (
    `b_id`,
    `title`,
    `link_image`,
    `descr`,
    `year`,
    `count_pages`,
    `count_search`,
    `count_click`,
    `deleted`
  )
VALUES
  (
    12,
    'Computer Coding for Kid',
    '/books-images/36.jpg',
    'Computer Coding for Kid',
    1885,
    345,
    0,
    0,
    0
  );
INSERT INTO
  `books` (
    `b_id`,
    `title`,
    `link_image`,
    `descr`,
    `year`,
    `count_pages`,
    `count_search`,
    `count_click`,
    `deleted`
  )
VALUES
  (
    13,
    'Exploring Arduino: Tools and Techniques for Engineering Wizardry',
    '/books-images/37.jpg',
    'Tools and Techniques for Engineering Wizardry',
    2000,
    344,
    0,
    0,
    0
  );
INSERT INTO
  `books` (
    `b_id`,
    `title`,
    `link_image`,
    `descr`,
    `year`,
    `count_pages`,
    `count_search`,
    `count_click`,
    `deleted`
  )
VALUES
  (
    14,
    'Программирование микроконтроллеров для начинающих и не только',
    '/books-images/38.jpg',
    'Программирование микроконтроллеров для начинающих и не только',
    2001,
    342,
    0,
    0,
    0
  );
INSERT INTO
  `books` (
    `b_id`,
    `title`,
    `link_image`,
    `descr`,
    `year`,
    `count_pages`,
    `count_search`,
    `count_click`,
    `deleted`
  )
VALUES
  (
    15,
    'The Internet of Things',
    '/books-images/39.jpg',
    'The Internet of Things',
    2002,
    341,
    0,
    0,
    0
  );
INSERT INTO
  `books` (
    `b_id`,
    `title`,
    `link_image`,
    `descr`,
    `year`,
    `count_pages`,
    `count_search`,
    `count_click`,
    `deleted`
  )
VALUES
  (
    16,
    'Sketching User Experiences: The Workbook',
    '/books-images/40.jpg',
    'Sketching User Experiences: The Workbook',
    2003,
    340,
    0,
    0,
    0
  );
INSERT INTO
  `books` (
    `b_id`,
    `title`,
    `link_image`,
    `descr`,
    `year`,
    `count_pages`,
    `count_search`,
    `count_click`,
    `deleted`
  )
VALUES
  (
    17,
    'InDesign CS6',
    '/books-images/41.jpg',
    'InDesign CS6',
    2004,
    339,
    0,
    0,
    0
  );
INSERT INTO
  `books` (
    `b_id`,
    `title`,
    `link_image`,
    `descr`,
    `year`,
    `count_pages`,
    `count_search`,
    `count_click`,
    `deleted`
  )
VALUES
  (
    18,
    'Адаптивный дизайн. Делаем сайты для любых устройств',
    '/books-images/42.jpg',
    'Адаптивный дизайн. Делаем сайты для любых устройств',
    2005,
    338,
    0,
    0,
    0
  );
INSERT INTO
  `books` (
    `b_id`,
    `title`,
    `link_image`,
    `descr`,
    `year`,
    `count_pages`,
    `count_search`,
    `count_click`,
    `deleted`
  )
VALUES
  (
    19,
    'Android для разработчиков',
    '/books-images/43.jpg',
    'Android для разработчиков',
    2006,
    337,
    0,
    0,
    0
  );
INSERT INTO
  `books` (
    `b_id`,
    `title`,
    `link_image`,
    `descr`,
    `year`,
    `count_pages`,
    `count_search`,
    `count_click`,
    `deleted`
  )
VALUES
  (
    20,
    'Clean Code: A Handbook of Agile Software Craftsmanship',
    '/books-images/44.jpg',
    'Clean Code: A Handbook of Agile Software Craftsmanship',
    2007,
    336,
    0,
    0,
    0
  );
INSERT INTO
  `books` (
    `b_id`,
    `title`,
    `link_image`,
    `descr`,
    `year`,
    `count_pages`,
    `count_search`,
    `count_click`,
    `deleted`
  )
VALUES
  (
    21,
    'Swift Pocket Reference: Programming for iOS and OS X',
    '/books-images/45.jpg',
    'Swift Pocket Reference: Programming for iOS and OS X',
    2008,
    335,
    0,
    0,
    0
  );
INSERT INTO
  `books` (
    `b_id`,
    `title`,
    `link_image`,
    `descr`,
    `year`,
    `count_pages`,
    `count_search`,
    `count_click`,
    `deleted`
  )
VALUES
  (
    22,
    'NoSQL Distilled: A Brief Guide to the Emerging World of Polyglot Persistence',
    '/books-images/46.jpg',
    'NoSQL Distilled: A Brief Guide to the Emerging World of Polyglot Persistence',
    2009,
    334,
    0,
    0,
    0
  );
INSERT INTO
  `books` (
    `b_id`,
    `title`,
    `link_image`,
    `descr`,
    `year`,
    `count_pages`,
    `count_search`,
    `count_click`,
    `deleted`
  )
VALUES
  (
    23,
    'Head First Ruby',
    '/books-images/47.jpg',
    'Head First Ruby',
    2010,
    333,
    0,
    0,
    0
  );
INSERT INTO
  `books` (
    `b_id`,
    `title`,
    `link_image`,
    `descr`,
    `year`,
    `count_pages`,
    `count_search`,
    `count_click`,
    `deleted`
  )
VALUES
  (
    24,
    'Practical Vim',
    '/books-images/48.jpg',
    'Practical Vim',
    2011,
    332,
    0,
    0,
    0
  );

# ------------------------------------------------------------
# DATA DUMP FOR TABLE: books_authors
# ------------------------------------------------------------

INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (1, 1, 0);
INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (2, 2, 0);
INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (3, 3, 0);
INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (4, 4, 0);
INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (5, 5, 0);
INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (6, 6, 0);
INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (7, 7, 0);
INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (8, 8, 0);
INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (9, 9, 0);
INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (10, 10, 0);
INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (11, 11, 0);
INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (12, 12, 0);
INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (13, 13, 0);
INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (14, 14, 0);
INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (15, 15, 0);
INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (16, 16, 0);
INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (17, 17, 0);
INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (18, 18, 0);
INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (19, 19, 0);
INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (20, 20, 0);
INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (21, 21, 0);
INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (22, 22, 0);
INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (23, 23, 0);
INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (24, 24, 0);
INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (22, 25, 0);
INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (6, 26, 0);
INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (6, 27, 0);
INSERT INTO
  `books_authors` (`book_id`, `author_id`, `deleted`)
VALUES
  (6, 28, 0);

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
