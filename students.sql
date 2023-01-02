-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Час створення: Січ 02 2023 р., 10:10
-- Версія сервера: 10.4.19-MariaDB
-- Версія PHP: 7.4.20

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База даних: `students`
--

-- --------------------------------------------------------

--
-- Структура таблиці `educ_part`
--

CREATE TABLE `educ_part` (
  `student_id` int(11) NOT NULL,
  `student_gpa` float DEFAULT NULL,
  `student_attendance` int(11) DEFAULT NULL,
  `id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп даних таблиці `educ_part`
--

INSERT INTO `educ_part` (`student_id`, `student_gpa`, `student_attendance`, `id`) VALUES
(1, 10.5, 50, 3),
(2, 4.3, 20, 2),
(3, 7.2, 44, 1),
(5, 8.6, 26, 4);

-- --------------------------------------------------------

--
-- Структура таблиці `students`
--

CREATE TABLE `students` (
  `id` int(11) NOT NULL,
  `student_name` varchar(255) DEFAULT NULL,
  `student_surname` varchar(255) DEFAULT NULL,
  `student_birthday` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп даних таблиці `students`
--

INSERT INTO `students` (`id`, `student_name`, `student_surname`, `student_birthday`) VALUES
(1, 'Андрей', 'Пузир', '2005-09-03'),
(2, 'Мария', 'Клименко', '2005-11-13'),
(3, 'Олег', 'Прохоренко', '2005-01-30'),
(4, 'Артём', 'Сидоренко', '2004-06-05');

-- --------------------------------------------------------

--
-- Структура таблиці `students_subjects`
--

CREATE TABLE `students_subjects` (
  `subject_name` varchar(255) DEFAULT NULL,
  `student_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп даних таблиці `students_subjects`
--

INSERT INTO `students_subjects` (`subject_name`, `student_id`) VALUES
('Биология', 2),
('Английский язык', 1),
('Биология', 1),
('Математика', 3),
('Физика', 4),
('Английский язык', 4),
('Физика', 1),
('Биология', 4);

-- --------------------------------------------------------

--
-- Структура таблиці `subjects`
--

CREATE TABLE `subjects` (
  `subject_name` varchar(255) NOT NULL,
  `hour_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп даних таблиці `subjects`
--

INSERT INTO `subjects` (`subject_name`, `hour_number`) VALUES
('Английский язык', 25),
('Биология', 35),
('Математика', 30),
('Физика', 12);

--
-- Індекси збережених таблиць
--

--
-- Індекси таблиці `educ_part`
--
ALTER TABLE `educ_part`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `id` (`id`);

--
-- Індекси таблиці `students`
--
ALTER TABLE `students`
  ADD PRIMARY KEY (`id`);

--
-- Індекси таблиці `students_subjects`
--
ALTER TABLE `students_subjects`
  ADD KEY `id` (`student_id`),
  ADD KEY `subject_name` (`subject_name`);

--
-- Індекси таблиці `subjects`
--
ALTER TABLE `subjects`
  ADD PRIMARY KEY (`subject_name`);

--
-- AUTO_INCREMENT для збережених таблиць
--

--
-- AUTO_INCREMENT для таблиці `educ_part`
--
ALTER TABLE `educ_part`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT для таблиці `students`
--
ALTER TABLE `students`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Обмеження зовнішнього ключа збережених таблиць
--

--
-- Обмеження зовнішнього ключа таблиці `educ_part`
--
ALTER TABLE `educ_part`
  ADD CONSTRAINT `educ_part_ibfk_1` FOREIGN KEY (`id`) REFERENCES `students` (`id`);

--
-- Обмеження зовнішнього ключа таблиці `students_subjects`
--
ALTER TABLE `students_subjects`
  ADD CONSTRAINT `students_subjects_ibfk_2` FOREIGN KEY (`student_id`) REFERENCES `students` (`id`),
  ADD CONSTRAINT `students_subjects_ibfk_3` FOREIGN KEY (`subject_name`) REFERENCES `subjects` (`subject_name`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
