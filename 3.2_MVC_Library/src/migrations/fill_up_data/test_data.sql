INSERT INTO books(title, count_pages, year, link_image,descr)
VALUES
    ('СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА', 356, 1999, '/books-images/22.jpg','СИ++ И КОМПЬЮТЕРНАЯ ГРАФИКА'),
    ('Программирование на языке Go!', 355, 1998, '/books-images/23.jpg','Программирование на языке Go!'),
    ('Толковый словарь сетевых терминов и аббревиатур', 354, 1997, '/books-images/25.jpg', 'Толковый словарь сетевых терминов и аббревиатур'),
    ('Python for Data Analysis', 353, 1996, '/books-images/26.jpg', 'Python for Data Analysis'),
    ('Thinking in Java (4th Edition)', 352, 1995, '/books-images/27.jpg','Thinking in Java 4th Edition'),
    ('Introduction to Algorithms', 351, 1921, '/books-images/29.jpg', 'Introduction to Algorithms'),
    ('JavaScript Pocket Reference', 350, 1994, '/books-images/31.jpg', 'JavaScript Pocket Reference'),
    ('Adaptive Code via C#: Class and Interface Design, Design Patterns, and SOLID Principles', 349, 1993, '/books-images/32.jpg', "Адаптивный код на С#, Class and Interface Design, Design Patterns, and SOLID Principles"),
    ('SQL: The Complete Referenc', 348, 1992, '/books-images/33.jpg', 'SQL: The Complete Referenc'),
    ('PHP and MySQL Web Development', 347, 1991, '/books-images/34.jpg','PHP and MySQL Web Development'),
    ('Статистический анализ и визуализация данных с помощью R', 346, 1990, '/books-images/35.jpg','Статистический анализ и визуализация данных с помощью R'),
    ('Computer Coding for Kid', 345, 1885, '/books-images/36.jpg','Computer Coding for Kid'),
    ('Exploring Arduino: Tools and Techniques for Engineering Wizardry', 344, 2000, '/books-images/37.jpg', 'Tools and Techniques for Engineering Wizardry'),
    ('Программирование микроконтроллеров для начинающих и не только', 342, 2001, '/books-images/38.jpg', 'Программирование микроконтроллеров для начинающих и не только'),
    ('The Internet of Things', 341, 2002, '/books-images/39.jpg', 'The Internet of Things'),
    ('Sketching User Experiences: The Workbook', 340, 2003, '/books-images/40.jpg', 'Sketching User Experiences: The Workbook'),
    ('InDesign CS6', 339, 2004, '/books-images/41.jpg','InDesign CS6'),
    ('Адаптивный дизайн. Делаем сайты для любых устройств', 338, 2005, '/books-images/42.jpg','Адаптивный дизайн. Делаем сайты для любых устройств'),
    ('Android для разработчиков', 337, 2006, '/books-images/43.jpg','Android для разработчиков'),
    ('Clean Code: A Handbook of Agile Software Craftsmanship', 336, 2007, '/books-images/44.jpg','Clean Code: A Handbook of Agile Software Craftsmanship'),
    ('Swift Pocket Reference: Programming for iOS and OS X', 335, 2008, '/books-images/45.jpg', 'Swift Pocket Reference: Programming for iOS and OS X'),
    ('NoSQL Distilled: A Brief Guide to the Emerging World of Polyglot Persistence', 334, 2009, '/books-images/46.jpg', 'NoSQL Distilled: A Brief Guide to the Emerging World of Polyglot Persistence'),
    ('Head First Ruby', 333, 2010, '/books-images/47.jpg', 'Head First Ruby'),
    ('Practical Vim', 332, 2011, '/books-images/48.jpg', 'Practical Vim');

INSERT INTO authors (author)
VALUES
    ('Андрей Богуславский'),
    ('Марк Саммерфильд'),
    ('М. Вильямс'),
    ('Уэс Маккинни'),
    ('Брюс Эккель'),
    ('Томас Кормен'),
    ('Дэвид Флэнаган'),
    ('Гэри Маклин Холл'),
    ('Джеймс Р. Грофф'),
    ('Люк Веллинг'),
    ('Сергей Мастицкий'),
    ('Джон Вудкок'),
    ('Джереми Блум'),
    ('А. Белов'),
    ('Сэмюэл Грингард'),
    ('Сет Гринберг'),
    ('Александр Сераков'),
    ('Тим Кедлек'),
    ('Пол Дейтел'),
    ('Роберт Мартин'),
    ('Энтони Грей'),
    ('Мартин Фаулер'),
    ('Джей Макгаврен'),
    ('Дрю Нейл'),
    ('Прамодкумар Дж. Садаладж'),
    ('Чарльз Лейзерсон'),
    ('Рональд Ривест'),
    ('Клиффорд Штайн');

INSERT INTO books_authors (book_id, author_id)
VALUES(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(18, 18),
(19, 19),
(20, 20),
(21, 21),
(22, 22),
(23, 23),
(24, 24),
(22, 25),
(6, 26),
(6, 27),
(6, 28);