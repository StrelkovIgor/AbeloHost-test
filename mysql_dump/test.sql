-- --------------------------------------------------------
-- Хост:                         127.0.0.1
-- Версия сервера:               9.5.0 - MySQL Community Server - GPL
-- Операционная система:         Linux
-- HeidiSQL Версия:              12.6.0.6765
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Дамп структуры базы данных test
CREATE DATABASE IF NOT EXISTS `test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `test`;

-- Дамп структуры для таблица test.blogs
CREATE TABLE IF NOT EXISTS `blogs` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `img` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `text` longtext COLLATE utf8mb4_unicode_ci,
  `views` int unsigned NOT NULL DEFAULT '0',
  `create_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы test.blogs: ~60 rows (приблизительно)
INSERT INTO `blogs` (`id`, `title`, `description`, `img`, `text`, `views`, `create_at`) VALUES
	(1, 'Будущее ИИ', 'Развитие искусственного интеллекта', 'https://picsum.photos/seed/ai1/400/300', 'Текст про ИИ', 120, '2025-01-05 10:15:00'),
	(2, 'PHP 8.3 обзор', 'Новые возможности PHP', 'https://picsum.photos/seed/php2/400/300', 'Текст про PHP', 340, '2025-01-06 11:20:00'),
	(3, 'UX основы', 'Принципы удобного интерфейса', 'https://picsum.photos/seed/ux3/400/300', 'Текст про UX', 212, '2025-01-07 09:40:00'),
	(4, 'SMM в 2025', 'Продвижение в соцсетях', 'https://picsum.photos/seed/smm4/400/300', 'Текст про SMM', 180, '2025-01-08 14:00:00'),
	(5, 'Как открыть стартап', 'Запуск бизнеса с нуля', 'https://picsum.photos/seed/startup5/400/300', 'Текст про стартап', 260, '2025-01-09 16:10:00'),
	(6, 'Онлайн обучение', 'Плюсы дистанционного формата', 'https://picsum.photos/seed/edu6/400/300', 'Текст про обучение', 95, '2025-01-10 12:30:00'),
	(7, 'Космос сегодня', 'Современные миссии', 'https://picsum.photos/seed/space7/400/300', 'Текст про космос', 410, '2025-01-11 18:45:00'),
	(8, 'Путешествие по Италии', 'Маршрут и советы', 'https://picsum.photos/seed/italy8/400/300', 'Текст про Италию', 500, '2025-01-12 09:00:00'),
	(9, 'Здоровый сон', 'Как высыпаться', 'https://picsum.photos/seed/sleep9/400/300', 'Текст про сон', 305, '2025-01-13 22:10:00'),
	(10, 'Лучшие сериалы года', 'Подборка сериалов', 'https://picsum.photos/seed/tv10/400/300', 'Текст про сериалы', 670, '2025-01-14 20:00:00'),
	(11, 'JavaScript тренды', 'Актуальные технологии JS', 'https://picsum.photos/seed/js11/400/300', 'Текст про JS', 390, '2025-01-15 11:00:00'),
	(12, 'Создание логотипа', 'Этапы разработки', 'https://picsum.photos/seed/logo12/400/300', 'Текст про дизайн', 150, '2025-01-16 13:25:00'),
	(13, 'Контент маркетинг', 'Как привлекать клиентов', 'https://picsum.photos/seed/content13/400/300', 'Текст про контент', 220, '2025-01-17 10:50:00'),
	(14, 'Финансы для всех', 'Личные финансы', 'https://picsum.photos/seed/money14/400/300', 'Текст про финансы', 275, '2025-01-18 17:40:00'),
	(15, 'Самообразование', 'Как учиться эффективно', 'https://picsum.photos/seed/self15/400/300', 'Текст про самообучение', 190, '2025-01-19 08:30:00'),
	(16, 'Физика вокруг нас', 'Простые объяснения', 'https://picsum.photos/seed/physics16/400/300', 'Текст про физику', 360, '2025-01-20 19:10:00'),
	(17, 'Япония для туристов', 'Советы и маршруты', 'https://picsum.photos/seed/japan17/400/300', 'Текст про Японию', 440, '2025-01-21 07:45:00'),
	(18, 'Иммунитет', 'Как укрепить здоровье', 'https://picsum.photos/seed/health18/400/300', 'Текст про иммунитет', 230, '2025-01-22 21:00:00'),
	(19, 'Настольные игры', 'Лучшие варианты', 'https://picsum.photos/seed/games19/400/300', 'Текст про игры', 310, '2025-01-23 18:30:00'),
	(20, 'Облачные сервисы', 'AWS, Azure, GCP', 'https://picsum.photos/seed/cloud20/400/300', 'Текст про облака', 280, '2025-01-24 15:20:00'),
	(21, 'Python старт', 'Первый шаг в Python', 'https://picsum.photos/seed/python21/400/300', 'Текст про Python', 520, '2025-01-25 10:00:00'),
	(22, 'Цвет в дизайне', 'Психология восприятия', 'https://picsum.photos/seed/color22/400/300', 'Текст про цвет', 160, '2025-01-26 12:15:00'),
	(23, 'Email маркетинг', 'Рабочие рассылки', 'https://picsum.photos/seed/email23/400/300', 'Текст про email', 145, '2025-01-27 09:50:00'),
	(24, 'Менеджмент', 'Управление командой', 'https://picsum.photos/seed/team24/400/300', 'Текст про менеджмент', 200, '2025-01-28 16:00:00'),
	(25, 'Онлайн курсы', 'Как выбрать лучший', 'https://picsum.photos/seed/course25/400/300', 'Текст про курсы', 170, '2025-01-29 14:30:00'),
	(26, 'Биология человека', 'Как мы устроены', 'https://picsum.photos/seed/bio26/400/300', 'Текст про биологию', 330, '2025-01-30 18:00:00'),
	(27, 'Путешествие по США', 'Большой маршрут', 'https://picsum.photos/seed/usa27/400/300', 'Текст про США', 480, '2025-01-31 09:20:00'),
	(28, 'Правильное питание', 'Основы рациона', 'https://picsum.photos/seed/food28/400/300', 'Текст про питание', 290, '2025-02-01 13:40:00'),
	(29, 'Индустрия кино', 'Как снимают фильмы', 'https://picsum.photos/seed/movie29/400/300', 'Текст про кино', 410, '2025-02-02 20:10:00'),
	(30, 'DevOps основы', 'CI/CD и автоматизация', 'https://picsum.photos/seed/devops30/400/300', 'Текст про DevOps', 261, '2025-02-03 11:00:00'),
	(31, 'Микросервисы', 'Архитектура приложений', 'https://picsum.photos/seed/micro31/400/300', 'Текст про микросервисы', 310, '2025-02-04 15:00:00'),
	(32, 'Типографика', 'Работа со шрифтами', 'https://picsum.photos/seed/font32/400/300', 'Текст про шрифты', 157, '2025-02-05 10:30:00'),
	(33, 'SEO продвижение', 'Поисковая оптимизация', 'https://picsum.photos/seed/seo33/400/300', 'Текст про SEO', 350, '2025-02-06 17:10:00'),
	(34, 'Бизнес стратегия', 'План роста компании', 'https://picsum.photos/seed/strategy34/400/300', 'Текст про стратегию', 225, '2025-02-07 09:00:00'),
	(35, 'Навыки будущего', 'Что изучать сейчас', 'https://picsum.photos/seed/future35/400/300', 'Текст про навыки', 265, '2025-02-08 12:00:00'),
	(36, 'Астрономия', 'Звезды и галактики', 'https://picsum.photos/seed/astro36/400/300', 'Текст про астрономию', 390, '2025-02-09 22:00:00'),
	(37, 'Азия', 'Лучшие страны для поездок', 'https://picsum.photos/seed/asia37/400/300', 'Текст про Азию', 455, '2025-02-10 08:30:00'),
	(38, 'Йога', 'Польза для тела', 'https://picsum.photos/seed/yoga38/400/300', 'Текст про йогу', 210, '2025-02-11 06:45:00'),
	(39, 'Геймдев', 'Создание игр', 'https://picsum.photos/seed/game39/400/300', 'Текст про геймдев', 343, '2025-02-12 19:00:00'),
	(40, 'Big Data', 'Анализ больших данных', 'https://picsum.photos/seed/data40/400/300', 'Текст про Big Data', 295, '2025-02-13 14:20:00'),
	(41, 'Frontend фреймворки', 'React и Vue', 'https://picsum.photos/seed/frontend41/400/300', 'Текст про frontend', 360, '2025-02-14 10:10:00'),
	(42, 'Иллюстрации', 'Цифровое искусство', 'https://picsum.photos/seed/art42/400/300', 'Текст про иллюстрации', 155, '2025-02-15 16:40:00'),
	(43, 'Таргетинг', 'Реклама в соцсетях', 'https://picsum.photos/seed/ads43/400/300', 'Текст про рекламу', 185, '2025-02-16 13:00:00'),
	(44, 'Инвестиции', 'Куда вкладывать', 'https://picsum.photos/seed/invest44/400/300', 'Текст про инвестиции', 410, '2025-02-17 18:10:00'),
	(45, 'План обучения', 'Долгосрочное развитие', 'https://picsum.photos/seed/learn45/400/300', 'Текст про обучение', 130, '2025-02-18 09:30:00'),
	(46, 'Химия в быту', 'Наука вокруг нас', 'https://picsum.photos/seed/chem46/400/300', 'Текст про химию', 270, '2025-02-19 21:00:00'),
	(47, 'Европейские города', 'Лучшие маршруты', 'https://picsum.photos/seed/europe47/400/300', 'Текст про Европу', 500, '2025-02-20 07:00:00'),
	(48, 'Кардио тренировки', 'Здоровье сердца', 'https://picsum.photos/seed/cardio48/400/300', 'Текст про кардио', 195, '2025-02-21 11:45:00'),
	(49, 'Киберспорт', 'Развитие индустрии', 'https://picsum.photos/seed/esport49/400/300', 'Текст про киберспорт', 365, '2025-02-22 20:30:00'),
	(50, 'API дизайн', 'REST и best practices', 'https://picsum.photos/seed/api50/400/300', 'Текст про API', 245, '2025-02-23 14:00:00'),
	(51, 'Linux сервер', 'Администрирование', 'https://picsum.photos/seed/linux51/400/300', 'Текст про Linux', 312, '2025-02-24 09:10:00'),
	(52, 'UI тренды', 'Современные интерфейсы', 'https://picsum.photos/seed/ui52/400/300', 'Текст про UI', 180, '2025-02-25 15:00:00'),
	(53, 'Продажи онлайн', 'Увеличение конверсии', 'https://picsum.photos/seed/sales53/400/300', 'Текст про продажи', 260, '2025-02-26 12:20:00'),
	(54, 'Фриланс', 'Как начать карьеру', 'https://picsum.photos/seed/freelance54/400/300', 'Текст про фриланс', 295, '2025-02-27 18:40:00'),
	(55, 'Методы обучения', 'Как учиться быстрее', 'https://picsum.photos/seed/study55/400/300', 'Текст про обучение', 160, '2025-02-28 10:00:00'),
	(56, 'Генетика', 'Основы науки', 'https://picsum.photos/seed/genetics56/400/300', 'Текст про генетику', 340, '2025-03-01 21:15:00'),
	(57, 'Южная Америка', 'Маршруты путешествий', 'https://picsum.photos/seed/south57/400/300', 'Текст про Южную Америку', 430, '2025-03-02 08:00:00'),
	(58, 'Медитация', 'Польза для психики', 'https://picsum.photos/seed/meditation58/400/300', 'Текст про медитацию', 220, '2025-03-03 06:30:00'),
	(59, 'VR технологии', 'Будущее развлечений', 'https://picsum.photos/seed/vr59/400/300', 'Текст про VR', 223, '2025-03-04 19:20:00'),
	(60, 'GraphQL', 'Альтернатива REST', 'https://picsum.photos/seed/graphql60/400/300', 'Текст про GraphQL', 278, '2025-03-05 13:00:00');

-- Дамп структуры для таблица test.categories
CREATE TABLE IF NOT EXISTS `categories` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы test.categories: ~10 rows (приблизительно)
INSERT INTO `categories` (`id`, `title`, `description`) VALUES
	(1, 'Технологии', 'Новости и обзоры технологий'),
	(2, 'Программирование', 'Языки программирования и разработка'),
	(3, 'Дизайн', 'UI/UX и графический дизайн'),
	(4, 'Маркетинг', 'Цифровой и классический маркетинг'),
	(5, 'Бизнес', 'Предпринимательство и управление'),
	(6, 'Образование', 'Обучение и саморазвитие'),
	(7, 'Наука', 'Популярная наука'),
	(8, 'Путешествия', 'Поездки и впечатления'),
	(9, 'Здоровье', 'ЗОЖ и медицина'),
	(10, 'Развлечения', 'Фильмы, игры и хобби');

-- Дамп структуры для таблица test.category_blog
CREATE TABLE IF NOT EXISTS `category_blog` (
  `blog_id` int unsigned NOT NULL,
  `category_id` int unsigned NOT NULL,
  KEY `FK_category_blog_blocg_id` (`blog_id`),
  KEY `FK_category_blog_category_id` (`category_id`),
  CONSTRAINT `FK_category_blog_blocg_id` FOREIGN KEY (`blog_id`) REFERENCES `blogs` (`id`) ON DELETE CASCADE,
  CONSTRAINT `FK_category_blog_category_id` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- Дамп данных таблицы test.category_blog: ~80 rows (приблизительно)
INSERT INTO `category_blog` (`blog_id`, `category_id`) VALUES
	(1, 1),
	(1, 7),
	(2, 2),
	(2, 1),
	(3, 3),
	(3, 6),
	(4, 4),
	(4, 5),
	(5, 5),
	(5, 6),
	(6, 6),
	(7, 7),
	(7, 1),
	(8, 8),
	(9, 9),
	(10, 10),
	(11, 2),
	(11, 1),
	(12, 3),
	(13, 4),
	(13, 5),
	(14, 5),
	(15, 6),
	(16, 7),
	(17, 8),
	(18, 9),
	(19, 10),
	(20, 1),
	(20, 2),
	(21, 2),
	(21, 6),
	(22, 3),
	(23, 4),
	(24, 5),
	(25, 6),
	(26, 7),
	(27, 8),
	(28, 9),
	(29, 10),
	(30, 2),
	(30, 1),
	(31, 2),
	(31, 5),
	(32, 3),
	(33, 4),
	(34, 5),
	(35, 6),
	(36, 7),
	(37, 8),
	(38, 9),
	(39, 10),
	(40, 1),
	(40, 2),
	(41, 2),
	(41, 3),
	(42, 3),
	(43, 4),
	(44, 5),
	(45, 6),
	(46, 7),
	(47, 8),
	(48, 9),
	(49, 10),
	(50, 2),
	(50, 1),
	(51, 1),
	(51, 2),
	(52, 3),
	(53, 4),
	(53, 5),
	(54, 5),
	(54, 6),
	(55, 6),
	(56, 7),
	(57, 8),
	(58, 9),
	(59, 1),
	(59, 10),
	(60, 2),
	(60, 1);

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
