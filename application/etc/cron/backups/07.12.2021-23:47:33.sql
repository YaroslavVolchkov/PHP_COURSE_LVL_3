-- MySQL dump 10.13  Distrib 5.7.34, for osx10.12 (x86_64)
--
-- Host: localhost    Database: library
-- ------------------------------------------------------
-- Server version	5.7.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `adminUsers`
--

DROP TABLE IF EXISTS `adminUsers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `adminUsers` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `login` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `adminUsers`
--

LOCK TABLES `adminUsers` WRITE;
/*!40000 ALTER TABLE `adminUsers` DISABLE KEYS */;
INSERT INTO `adminUsers` VALUES (1,'admin','admin');
/*!40000 ALTER TABLE `adminUsers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `authors` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `author` (`author`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
INSERT INTO `authors` VALUES (3,'Cisco Systems'),(7,'А. Аллан'),(1,'Андрей Богуславский'),(5,'Брюс Эккель'),(10,'Джеймс Р. Грофф'),(9,'Дэвид Херрон'),(2,'Марк Саммерфильд'),(8,'Мета Заниздра'),(6,'Роберт Мартин'),(4,'Уэст Маккинни');
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `books`
--

DROP TABLE IF EXISTS `books`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `books` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `year` int(4) unsigned NOT NULL,
  `numPages` int(10) unsigned NOT NULL,
  `about` text NOT NULL,
  `viewsBook` int(10) unsigned NOT NULL DEFAULT '0',
  `requestsBook` int(10) unsigned NOT NULL DEFAULT '0',
  `isDeleted` tinyint(4) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `books`
--

LOCK TABLES `books` WRITE;
/*!40000 ALTER TABLE `books` DISABLE KEYS */;
INSERT INTO `books` VALUES (1,'Язык програмирования СИ',2003,352,'Ця книга являє собою навчальний посібник, де описуються основні поняття і методи сучасного практичного програмування, оволодівши якими читач зможе самостійно створювати додатки до відомої російської САПР КОМПАС, до її базовим конструкторським модулів - креслярсько-графічній системі КОМПАС-Графік і системі тривимірного, твердотільного моделювання КОМПАС -ЗО.  \r\n\r\nПредметом вивчення книги є об\'єктно-орієнтоване програмування на мові С++ в середовищі сучасних операційних систем сімейства Windows. Для успішного освоєння представленого в книзі матеріалу потрібні попередні навички користувальницької роботи на персональному комп\'ютері.  \r\n\r\nНавчальний посібник має 5 розділів:\r\n\r\n1. Введення в програмування на мові С++ (знаходиться на доданому CD-ROM);\r\n\r\n2. Основи програмування тривимірної графіки з використанням OpenGL;\r\n\r\n3. Об\'єктно-орієнтоване програмування на мові С++; \r\n\r\n4. Інструментальні засоби розробки прикладних САПР КОМПАС-МАЙСТЕР 5 і \r\n\r\n5. Програмування для Microsoft Windows з використанням Visual C ++ і бібліотеки класів MFC (знаходиться на CD-ROM).',195,96,0),(2,'Программирование на языке Go',2013,580,'Перед вами практичний посібник з Go, революційно нової мови програмування з вбудованою підтримкою паралельного програмування, який спрощує розробку програм для багатопроцесорних систем. На даний момент, Go — найграндіозніша з нових мов програмування. Вона спочатку створювалася, щоб допомогти задіяти повну потужність сучасних багатоядерних процесорів. У цьому посібнику першопроходця мови Go Марк Саммерфільд розповідається, яким чином писати програми, в повній мірі застосовуючи його революційні можливості та ідіоми. \r\n\r\nБудучи в той же час і підручником, і довідником, книга «Програмування на мові Go» об\'єднує в собі всі відомості, які знадобляться, для того щоб продовжити вивчення Go, думати на Go і створювати високопродуктивні програми на Go. Саммерфільд призводить масу порівнянь ідіом програмування, показуючи переваги Go перед більш давніми мовами, приділяючи особливу увагу ключовим інноваціям. Також, починаючи з самих початків, він пояснює всі аспекти паралельного програмування на мові Go з використанням каналів і без застосування блокувань, а також гнучкість і незвичність підходу до об\'єктно-орієнтованого програмування з використанням механізму динамічної типізації. Головний акцент автор робить на практичне застосування. Кожний розділ містить вивірені, працюючі приклади програмного коду, щоб викликати в читача дух експериментатора і допомогти йому швидше опанувати майстернісь розробки. ',252,169,0),(3,'Толковый словарь сетевых терминов и аббревиатур',2002,366,'Цей словник є найбільш повне зібрання термінів і абревіатур, що застосовуються в галузі мережевих технологій. У першій частині зібрані стандартні терміни, широко використовувані в області міжмережевих взаємодій, а в другій — специфічні терміни, характерні тільки для Cisco Systems і Cisco IOS. Словник стане практичним і зручним довідником для всіх фахівців в області мережевих технологій; він буде незамінний як при читанні матеріалів загального характеру, так і при вивченні спеціалізованих технічних керівництв.',14,6,0),(4,'Phyton и анализ данных',2000,336,'Авторитетне керівництво і детальний путівник по мові програмування Python призначений для практикуючих програмістів. Книга компактна, націлена на суть справи і написана дуже доступною мовою. Детально обговорюються не тільки ядро ​​мови, а й найбільш важливі частини стандартної бібліотеки Python.  \r\n\r\nДодатково висвітлюється ряд тем, які не розглядаються ні в офіційній документації, ні в будь-яких інших джерелах. Читачеві пропонується практичне знайомство з особливостями Python, включаючи генератори, співпрограми, замикання, метакласи і декоратори. Докладно описані нові модулі, що мають відношення до розробки багатозадачних програм, що використовують потоки управління і дочірні процеси, а також призначені для організації мережевих взаємодій і роботи з системними службами.  \r\n\r\nУ повністю переробленому і оновленому четвертому виданні поліпшена організація матеріалу, що дозволяє ще швидше знаходити відповіді на питання і забезпечує ще більшу зручність роботи з довідником. Книга відображає найбільш суттєві нововведення в мові і в стандартній бібліотеці, що з\'явилися в Python 2.6 і Python 3. ',40,10,0),(5,'Философия JAVA',2017,1168,'Повна нова версія книги про основні проблеми програмування: чому вони виникають і який підхід використовує Java в їх вирішенні.  \r\n\r\nВперше читач може познайомитися з повною версією цієї класичної праці, який раніше російською мовою друкувалась в скороченні.\r\n\r\nКнига, що витримала в оригіналі не одне перевидання, за глибокий і воістину філософський виклад тонкощів мови Java вважається однією з кращих посібників для програмістів. Щоб по-справжньому зрозуміти мову Java, необхідно розглядати його не просто як набір якихось команд і операторів, а зрозуміти її «філософію», підхід до вирішення завдань, в порівнянні з такими в інших мовах програмування.\r\n\r\nНа цих сторінках автор розповідає про основні проблеми написання коду: у чому їх природа і який підхід використовує Java в їх вирішенні. Тому обговорювані в кожному розділі риси мови нерозривно пов\'язані з тим, як вони використовуються для вирішення певних завдань.',3,1,0),(6,'Чистый Код',2019,464,'Навіть поганий програмний код може працювати. Однак якщо код не є «чистим», це завжди буде заважати розвитку проєкту і компанії-розробника, віднімаючи значні ресурси на його підтримку і «приборкання». \r\n\r\nЦя книга присвячена доброму програмуванню. Вона сповнена реальних прикладів коду. Ми будемо розглядати код з різних напрямків: зверху вниз, знизу вгору і навіть зсередини. Прочитавши книгу, ви дізнаєтеся багато нового про коди. Більш того, ви навчитеся відрізняти хороший код від поганого. Ви дізнаєтеся, як писати хороший код і як перетворити поганий код в хороший.',0,0,0),(7,'Программирование для мобильных устройств на iOS',2013,410,'Ця книга допоможе вам швидко освоїти програмування під iOS і навчить створювати додатки для пристроїв iPhone, iPad і iPod Touch. Докладно описується процес розробки програми для iOS: від першого запуску Xcode до завантажити програму в магазин App Store. Також ви познайомитеся з мовою Objective-C і основними бібліотеками, необхідними при розробці для iOS. Кожна глава книги являє собою урок, який допоможе швидко освоїти розглянуту тему, з великою кількістю прикладів коду та ілюстрацій. У виданні розглядаються версії iOS 5 і Xcode 4.',8,4,0),(8,'PHP объекты, шаблоны и методики программирования',2015,600,'Четверте видання книги \"PHP: об\'єкти, шаблони та методики програмування\" було переглянуто і доповнено новим матеріалом. Книга починається з огляду об\'єктноорієнтованих можливостей PHP, в який включені важливі теми, такі як визначення класів, успадкування, інкапсуляція, рефлексія і багато іншого. Цей матеріал закладає основи об\'єктноорієнтованого проєктування та програмування на PHP. Ви вивчите також деякі основні принципи проєктування. У цьому виданні книги також описані можливості, що з\'явилися в PHP версії 5.4, такі як трейти, додаткові розширення на основі рефлексії, уточнення типів параметрів методів, поліпшена обробка виключень і багато інших дрібних розширень мови.',2,0,0),(9,'Node.js Разработка серверных веб-приложений на JavaScript',2012,144,'Книга \"Node.js Розробка серверних веб-додатків на JavaScript\" присвячена розробці веб-додатків в Node.js — платформі, яка виводить мову JavaScript за межі браузера. Це дозволяє використовувати його в серверних додатках. Швидкий движок JavaScript, запозичений з браузера Chrome, лежить в основі платформи. Крім того, додано швидку і надійну бібліотеку асинхронного мережного введення/виведення. Девід Херрон описує установку та експлуатацію Node.js, каркаси розробки додатків Connect і Express. Розповідає про роботу з базами даних.',3,0,0),(12,'SQL Полное руководство',2016,560,'На сторінках цієї книги розкриті способи застосування популярних цифрових контролерів сигналів Microchip dsPIC, в яких обчислювальний потенціал потужних цифрових процесорів сигналів успішно поєднано з можливостями мікроконтролерів PIC. Розглядаються питання не лише програмування, а і проектування електронного обладнання. Таким чином читач отримує повне уявлення про  процес створення інтерфейсу для трьох конкретних типів датчиків: температури, тиску/навантаження і витрат. Ця практична, легка для сприйняття книга розкриває реальні проблеми, що виникають в повсякденній роботі розробників, і вказує на рішення, що дозволяють реалізувати всі сильні сторони такого потужного засобу як інтелектуальні датчики.',10,2,0);
/*!40000 ALTER TABLE `books` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `comment` text NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'0001_baseline.sql','The base structure of DB.'),(18,'0002_makeAuthorsTable.sql',''),(19,'0003_makeRelationTable_book-author.sql',''),(20,'0004_dropAuthorsColumn.sql','');
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relations`
--

DROP TABLE IF EXISTS `relations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `relations` (
  `bookId` int(10) unsigned DEFAULT NULL,
  `authorId` int(10) unsigned DEFAULT NULL,
  `isDeleted` tinyint(1) DEFAULT '0',
  KEY `bookId` (`bookId`),
  KEY `authorId` (`authorId`),
  CONSTRAINT `relations_ibfk_1` FOREIGN KEY (`bookId`) REFERENCES `books` (`id`),
  CONSTRAINT `relations_ibfk_2` FOREIGN KEY (`authorId`) REFERENCES `authors` (`id`),
  CONSTRAINT `relations_ibfk_3` FOREIGN KEY (`bookId`) REFERENCES `books` (`id`),
  CONSTRAINT `relations_ibfk_4` FOREIGN KEY (`authorId`) REFERENCES `authors` (`id`),
  CONSTRAINT `relations_ibfk_5` FOREIGN KEY (`bookId`) REFERENCES `books` (`id`),
  CONSTRAINT `relations_ibfk_6` FOREIGN KEY (`authorId`) REFERENCES `authors` (`id`),
  CONSTRAINT `relations_ibfk_7` FOREIGN KEY (`bookId`) REFERENCES `books` (`id`),
  CONSTRAINT `relations_ibfk_8` FOREIGN KEY (`authorId`) REFERENCES `authors` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relations`
--

LOCK TABLES `relations` WRITE;
/*!40000 ALTER TABLE `relations` DISABLE KEYS */;
INSERT INTO `relations` VALUES (3,3,0),(7,7,0),(1,1,0),(5,5,0),(9,9,0),(2,2,0),(8,8,0),(6,6,0),(4,4,0);
/*!40000 ALTER TABLE `relations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-12-08  1:47:34
