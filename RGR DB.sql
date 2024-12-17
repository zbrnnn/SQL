-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Хост: MySQL-8.2
-- Время создания: Дек 17 2024 г., 11:44
-- Версия сервера: 8.2.0
-- Версия PHP: 8.3.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `Магазин електроніки`
--

-- --------------------------------------------------------

--
-- Структура таблицы `clients`
--

CREATE TABLE `clients` (
  `client_id` int NOT NULL,
  `name` varchar(225) DEFAULT NULL,
  `email` varchar(225) DEFAULT NULL,
  `number` varchar(225) DEFAULT NULL,
  `password` varchar(225) DEFAULT NULL,
  `is_blacklisted` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Клієнти таблиці';

--
-- Дамп данных таблицы `clients`
--

INSERT INTO `clients` (`client_id`, `name`, `email`, `number`, `password`, `is_blacklisted`) VALUES
(3, 'Арсен Зиновець Валериевич', 'baner23@gmail.com', '+380970117992', 'bambam123', 0),
(28, 'Приходько Елизавета Евгеньевна', 'defojilledu-3078@gmail.com', '+380674721187', 'bambam123', 0);

-- --------------------------------------------------------

--
-- Структура таблицы `logistics`
--

CREATE TABLE `logistics` (
  `logist_id` int NOT NULL,
  `name` varchar(225) NOT NULL,
  `phone_num` varchar(225) NOT NULL,
  `region` text NOT NULL,
  `stock_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Список логістів';

-- --------------------------------------------------------

--
-- Структура таблицы `operators`
--

CREATE TABLE `operators` (
  `operator_id` int NOT NULL,
  `phone_num` varchar(225) NOT NULL,
  `name` varchar(225) NOT NULL,
  `role` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Список операторів';

-- --------------------------------------------------------

--
-- Структура таблицы `orderlist`
--

CREATE TABLE `orderlist` (
  `order_id` int NOT NULL,
  `client_id` int NOT NULL,
  `product_id` int NOT NULL,
  `count` int NOT NULL,
  `stock_id` int NOT NULL,
  `operator_id` int NOT NULL,
  `seller_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- --------------------------------------------------------

--
-- Структура таблицы `products`
--

CREATE TABLE `products` (
  `product_id` int NOT NULL,
  `name` varchar(225) NOT NULL,
  `description` text NOT NULL,
  `supplier_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Список продуктів';

-- --------------------------------------------------------

--
-- Структура таблицы `rerairer`
--

CREATE TABLE `rerairer` (
  `repair_id` int NOT NULL,
  `product_id` int NOT NULL,
  `name` varchar(225) NOT NULL,
  `location` varchar(225) NOT NULL,
  `phone_num` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Майстри по ремонту';

-- --------------------------------------------------------

--
-- Структура таблицы `sellers`
--

CREATE TABLE `sellers` (
  `seller_id` int NOT NULL,
  `name` varchar(225) NOT NULL,
  `phone_num` varchar(225) NOT NULL,
  `location` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Дамп данных таблицы `sellers`
--

INSERT INTO `sellers` (`seller_id`, `name`, `phone_num`, `location`) VALUES
(3, 'Тищенко М.', '+380678559246', 'м. Львів, відділ №1'),
(4, 'Тітарчук Р.', '+380932134668', 'м. Черкаси, відділ №1'),
(9, 'Грищенко М.', '+380678559246', 'м. Київ, відділ №1'),
(10, 'Роианов Р.', '+3809681909', 'м. Київ, відділ №3'),
(11, 'Богунов', '+380998134748', 'м. Київ, відділ №7'),
(14, 'Толенко Р.', '+380968134750', 'м. Київ, відділ №1'),
(15, 'Сергієнко П.', '+380958134748', 'м. Київ, відділ №1'),
(20, 'Загорний Цвітан Іванович', '+380998134748', 'м. Київ, відділ №1');

-- --------------------------------------------------------

--
-- Структура таблицы `stock`
--

CREATE TABLE `stock` (
  `stock_id` int NOT NULL,
  `phone_num` int NOT NULL,
  `product_id` int NOT NULL,
  `count` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Склад з товарами';

-- --------------------------------------------------------

--
-- Структура таблицы `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int NOT NULL,
  `name` varchar(225) NOT NULL,
  `company` varchar(225) NOT NULL,
  `phone_num` varchar(225) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Список постачальників';

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `clients`
--
ALTER TABLE `clients`
  ADD PRIMARY KEY (`client_id`);

--
-- Индексы таблицы `logistics`
--
ALTER TABLE `logistics`
  ADD PRIMARY KEY (`logist_id`),
  ADD KEY `stock_id` (`stock_id`);

--
-- Индексы таблицы `operators`
--
ALTER TABLE `operators`
  ADD PRIMARY KEY (`operator_id`);

--
-- Индексы таблицы `orderlist`
--
ALTER TABLE `orderlist`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `client_id` (`client_id`,`product_id`,`stock_id`,`operator_id`,`seller_id`),
  ADD KEY `stock_id` (`stock_id`),
  ADD KEY `seller_id` (`seller_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `operator_id` (`operator_id`);

--
-- Индексы таблицы `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Индексы таблицы `rerairer`
--
ALTER TABLE `rerairer`
  ADD PRIMARY KEY (`repair_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`seller_id`);

--
-- Индексы таблицы `stock`
--
ALTER TABLE `stock`
  ADD PRIMARY KEY (`stock_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Индексы таблицы `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `clients`
--
ALTER TABLE `clients`
  MODIFY `client_id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `operators`
--
ALTER TABLE `operators`
  ADD CONSTRAINT `operators_ibfk_1` FOREIGN KEY (`operator_id`) REFERENCES `orderlist` (`operator_id`);

--
-- Ограничения внешнего ключа таблицы `orderlist`
--
ALTER TABLE `orderlist`
  ADD CONSTRAINT `orderlist_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `clients` (`client_id`),
  ADD CONSTRAINT `orderlist_ibfk_2` FOREIGN KEY (`stock_id`) REFERENCES `stock` (`stock_id`),
  ADD CONSTRAINT `orderlist_ibfk_3` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`seller_id`),
  ADD CONSTRAINT `orderlist_ibfk_4` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Ограничения внешнего ключа таблицы `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `rerairer` (`product_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`supplier_id`) REFERENCES `supplier` (`supplier_id`);

--
-- Ограничения внешнего ключа таблицы `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `stock_ibfk_2` FOREIGN KEY (`stock_id`) REFERENCES `logistics` (`stock_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
