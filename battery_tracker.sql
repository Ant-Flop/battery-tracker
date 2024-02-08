-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Час створення: Лис 23 2023 р., 10:34
-- Версія сервера: 10.4.17-MariaDB
-- Версія PHP: 8.0.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `battery_tracker`
--

-- --------------------------------------------------------

--
-- Структура таблиці `batteries_directory`
--

CREATE TABLE `batteries_directory` (
  `id` int(11) NOT NULL,
  `typeBattery` varchar(255) NOT NULL,
  `A/h` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `batteries_directory`
--

INSERT INTO `batteries_directory` (`id`, `typeBattery`, `A/h`) VALUES
(1, 'type1', 5),
(2, 'type2', 10);

-- --------------------------------------------------------

--
-- Структура таблиці `battery_replacement`
--

CREATE TABLE `battery_replacement` (
  `id` int(11) NOT NULL,
  `numberOfBatteries` int(11) NOT NULL,
  `upsModelsDirectoryId` int(11) DEFAULT NULL,
  `otherEquipmentDirectoryId` int(11) DEFAULT NULL,
  `receiptId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `battery_replacement`
--

INSERT INTO `battery_replacement` (`id`, `numberOfBatteries`, `upsModelsDirectoryId`, `otherEquipmentDirectoryId`, `receiptId`) VALUES
(1, 2, 1, NULL, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `branches_directory`
--

CREATE TABLE `branches_directory` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `branches_directory`
--

INSERT INTO `branches_directory` (`id`, `name`) VALUES
(1, 'name');

-- --------------------------------------------------------

--
-- Структура таблиці `districts_directory`
--

CREATE TABLE `districts_directory` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `branchesDirectoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `districts_directory`
--

INSERT INTO `districts_directory` (`id`, `name`, `branchesDirectoryId`) VALUES
(9, 'name1', 1);

-- --------------------------------------------------------

--
-- Структура таблиці `equipment_card`
--

CREATE TABLE `equipment_card` (
  `id` int(11) NOT NULL,
  `upsModelsDirectoryId` int(11) NOT NULL,
  `batteryReplacementId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `equipment_card`
--

INSERT INTO `equipment_card` (`id`, `upsModelsDirectoryId`, `batteryReplacementId`) VALUES
(1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `expenses`
--

CREATE TABLE `expenses` (
  `id` int(11) NOT NULL,
  `upsModelsDirectoryId` int(11) NOT NULL,
  `objectsDirectoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `expenses`
--

INSERT INTO `expenses` (`id`, `upsModelsDirectoryId`, `objectsDirectoryId`) VALUES
(1, 1, 2);

-- --------------------------------------------------------

--
-- Структура таблиці `objects_directory`
--

CREATE TABLE `objects_directory` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `voltage` double NOT NULL,
  `districtsDirectoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `objects_directory`
--

INSERT INTO `objects_directory` (`id`, `name`, `voltage`, `districtsDirectoryId`) VALUES
(2, 'name2', 50, 9);

-- --------------------------------------------------------

--
-- Структура таблиці `other_equipment_directory`
--

CREATE TABLE `other_equipment_directory` (
  `id` int(11) NOT NULL,
  `producer` varchar(255) NOT NULL,
  `model` varchar(255) NOT NULL,
  `numberOfBatteries` double NOT NULL,
  `dateOfLastBatteryReplacement` date NOT NULL,
  `batteriesDirectoryId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `other_equipment_directory`
--

INSERT INTO `other_equipment_directory` (`id`, `producer`, `model`, `numberOfBatteries`, `dateOfLastBatteryReplacement`, `batteriesDirectoryId`) VALUES
(1, 'producer', 'model', 2, '2023-09-15', 2);

-- --------------------------------------------------------

--
-- Структура таблиці `receipt`
--

CREATE TABLE `receipt` (
  `id` int(11) NOT NULL,
  `dateOfReceipt` date NOT NULL,
  `numbers` int(11) NOT NULL,
  `currentBalance` double NOT NULL,
  `upsModelsDirectoryId` int(11) NOT NULL,
  `contractsDirectoryId` int(11) NOT NULL,
  `expensesId` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `receipt`
--

INSERT INTO `receipt` (`id`, `dateOfReceipt`, `numbers`, `currentBalance`, `upsModelsDirectoryId`, `contractsDirectoryId`, `expensesId`) VALUES
(1, '2023-09-21', 10, 11, 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `roles`
--

CREATE TABLE `roles` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `permission` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `roles`
--

INSERT INTO `roles` (`id`, `name`, `permission`) VALUES
(1, 'admin', '1. Add new users;'),
(2, 'user', '1. Use the system');

-- --------------------------------------------------------

--
-- Структура таблиці `total`
--

CREATE TABLE `total` (
  `id` int(11) NOT NULL,
  `upsModelsDirectoryId` int(11) NOT NULL,
  `objectsDirectoryId` int(11) NOT NULL,
  `equipmentCardId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `total`
--

INSERT INTO `total` (`id`, `upsModelsDirectoryId`, `objectsDirectoryId`, `equipmentCardId`) VALUES
(1, 1, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблиці `ups_models_directory`
--

CREATE TABLE `ups_models_directory` (
  `id` int(11) NOT NULL,
  `producer` varchar(255) NOT NULL,
  `power` double NOT NULL,
  `numberOfBatteries` double NOT NULL,
  `yearProductionUPS` year(4) NOT NULL,
  `inventoryNumber` int(11) NOT NULL,
  `s/n` double NOT NULL,
  `APCS` varchar(255) NOT NULL,
  `dateOfLastBatteryReplacement` datetime NOT NULL,
  `batteriesDirectoryId` int(11) NOT NULL,
  `model` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `ups_models_directory`
--

INSERT INTO `ups_models_directory` (`id`, `producer`, `power`, `numberOfBatteries`, `yearProductionUPS`, `inventoryNumber`, `s/n`, `APCS`, `dateOfLastBatteryReplacement`, `batteriesDirectoryId`, `model`) VALUES
(1, 'producer', 50, 10, 2023, 100, 20, 'apcs', '2023-09-15 00:00:00', 2, 'model1');

-- --------------------------------------------------------

--
-- Структура таблиці `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `users`
--

INSERT INTO `users` (`id`, `username`, `email`) VALUES
(14, 'itps05', 'itps05@soe.com.ua');

-- --------------------------------------------------------

--
-- Структура таблиці `users_roles`
--

CREATE TABLE `users_roles` (
  `id` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `roleId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп даних таблиці `users_roles`
--

INSERT INTO `users_roles` (`id`, `userId`, `roleId`) VALUES
(1, 14, 1);

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `batteries_directory`
--
ALTER TABLE `batteries_directory`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `battery_replacement`
--
ALTER TABLE `battery_replacement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_3cde133b17bc3e1b993197e0c23` (`receiptId`),
  ADD KEY `FK_18022e792474340b39fae9b3f91` (`upsModelsDirectoryId`),
  ADD KEY `FK_a09d4c9be9b39f83642896348a9` (`otherEquipmentDirectoryId`);

--
-- Індекси таблиці `branches_directory`
--
ALTER TABLE `branches_directory`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `districts_directory`
--
ALTER TABLE `districts_directory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_d6ff81594ed8073a198cfc13eec` (`branchesDirectoryId`);

--
-- Індекси таблиці `equipment_card`
--
ALTER TABLE `equipment_card`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_00d679aa6ff5da27e47c3be5100` (`upsModelsDirectoryId`),
  ADD KEY `FK_4453d98066427d4c9de99edff48` (`batteryReplacementId`);

--
-- Індекси таблиці `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_19a306ceca5fa476b8253bf22d3` (`upsModelsDirectoryId`),
  ADD KEY `FK_4bd859cdfe3ccab6a72b2de003f` (`objectsDirectoryId`);

--
-- Індекси таблиці `objects_directory`
--
ALTER TABLE `objects_directory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_f0934650a2baea7e6e66840ac84` (`districtsDirectoryId`);

--
-- Індекси таблиці `other_equipment_directory`
--
ALTER TABLE `other_equipment_directory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_44054f4b04a9e50441121f68551` (`batteriesDirectoryId`);

--
-- Індекси таблиці `receipt`
--
ALTER TABLE `receipt`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_0e4bfc2ce722ad3315a49541c5b` (`upsModelsDirectoryId`),
  ADD KEY `FK_11eca4852dc0049da44f791c3df` (`expensesId`);

--
-- Індекси таблиці `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `total`
--
ALTER TABLE `total`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_3901b5db54d58e6c1b989da55bd` (`upsModelsDirectoryId`),
  ADD KEY `FK_83ee160d22e8d347c0d3535660b` (`objectsDirectoryId`),
  ADD KEY `FK_580921814c49d0fd94b770a7ee5` (`equipmentCardId`);

--
-- Індекси таблиці `ups_models_directory`
--
ALTER TABLE `ups_models_directory`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_42b012d4299c46ffd4c88bdfe20` (`batteriesDirectoryId`);

--
-- Індекси таблиці `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `IDX_fe0bb3f6520ee0469504521e71` (`username`),
  ADD UNIQUE KEY `IDX_97672ac88f789774dd47f7c8be` (`email`);

--
-- Індекси таблиці `users_roles`
--
ALTER TABLE `users_roles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK_776b7cf9330802e5ef5a8fb18dc` (`userId`),
  ADD KEY `FK_4fb14631257670efa14b15a3d86` (`roleId`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `batteries_directory`
--
ALTER TABLE `batteries_directory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT для таблиці `battery_replacement`
--
ALTER TABLE `battery_replacement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `branches_directory`
--
ALTER TABLE `branches_directory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `districts_directory`
--
ALTER TABLE `districts_directory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблиці `equipment_card`
--
ALTER TABLE `equipment_card`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `objects_directory`
--
ALTER TABLE `objects_directory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `other_equipment_directory`
--
ALTER TABLE `other_equipment_directory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `receipt`
--
ALTER TABLE `receipt`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `roles`
--
ALTER TABLE `roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT для таблиці `total`
--
ALTER TABLE `total`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `ups_models_directory`
--
ALTER TABLE `ups_models_directory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT для таблиці `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT для таблиці `users_roles`
--
ALTER TABLE `users_roles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `battery_replacement`
--
ALTER TABLE `battery_replacement`
  ADD CONSTRAINT `FK_18022e792474340b39fae9b3f91` FOREIGN KEY (`upsModelsDirectoryId`) REFERENCES `ups_models_directory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_3cde133b17bc3e1b993197e0c23` FOREIGN KEY (`receiptId`) REFERENCES `receipt` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_a09d4c9be9b39f83642896348a9` FOREIGN KEY (`otherEquipmentDirectoryId`) REFERENCES `other_equipment_directory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Обмеження зовнішнього ключа таблиці `districts_directory`
--
ALTER TABLE `districts_directory`
  ADD CONSTRAINT `FK_d6ff81594ed8073a198cfc13eec` FOREIGN KEY (`branchesDirectoryId`) REFERENCES `branches_directory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Обмеження зовнішнього ключа таблиці `equipment_card`
--
ALTER TABLE `equipment_card`
  ADD CONSTRAINT `FK_00d679aa6ff5da27e47c3be5100` FOREIGN KEY (`upsModelsDirectoryId`) REFERENCES `ups_models_directory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_4453d98066427d4c9de99edff48` FOREIGN KEY (`batteryReplacementId`) REFERENCES `battery_replacement` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Обмеження зовнішнього ключа таблиці `expenses`
--
ALTER TABLE `expenses`
  ADD CONSTRAINT `FK_19a306ceca5fa476b8253bf22d3` FOREIGN KEY (`upsModelsDirectoryId`) REFERENCES `ups_models_directory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_4bd859cdfe3ccab6a72b2de003f` FOREIGN KEY (`objectsDirectoryId`) REFERENCES `objects_directory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Обмеження зовнішнього ключа таблиці `objects_directory`
--
ALTER TABLE `objects_directory`
  ADD CONSTRAINT `FK_f0934650a2baea7e6e66840ac84` FOREIGN KEY (`districtsDirectoryId`) REFERENCES `districts_directory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Обмеження зовнішнього ключа таблиці `other_equipment_directory`
--
ALTER TABLE `other_equipment_directory`
  ADD CONSTRAINT `FK_44054f4b04a9e50441121f68551` FOREIGN KEY (`batteriesDirectoryId`) REFERENCES `batteries_directory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Обмеження зовнішнього ключа таблиці `receipt`
--
ALTER TABLE `receipt`
  ADD CONSTRAINT `FK_0e4bfc2ce722ad3315a49541c5b` FOREIGN KEY (`upsModelsDirectoryId`) REFERENCES `ups_models_directory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_11eca4852dc0049da44f791c3df` FOREIGN KEY (`expensesId`) REFERENCES `expenses` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Обмеження зовнішнього ключа таблиці `total`
--
ALTER TABLE `total`
  ADD CONSTRAINT `FK_3901b5db54d58e6c1b989da55bd` FOREIGN KEY (`upsModelsDirectoryId`) REFERENCES `ups_models_directory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_580921814c49d0fd94b770a7ee5` FOREIGN KEY (`equipmentCardId`) REFERENCES `equipment_card` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_83ee160d22e8d347c0d3535660b` FOREIGN KEY (`objectsDirectoryId`) REFERENCES `objects_directory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Обмеження зовнішнього ключа таблиці `ups_models_directory`
--
ALTER TABLE `ups_models_directory`
  ADD CONSTRAINT `FK_42b012d4299c46ffd4c88bdfe20` FOREIGN KEY (`batteriesDirectoryId`) REFERENCES `batteries_directory` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Обмеження зовнішнього ключа таблиці `users_roles`
--
ALTER TABLE `users_roles`
  ADD CONSTRAINT `FK_4fb14631257670efa14b15a3d86` FOREIGN KEY (`roleId`) REFERENCES `roles` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `FK_776b7cf9330802e5ef5a8fb18dc` FOREIGN KEY (`userId`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
