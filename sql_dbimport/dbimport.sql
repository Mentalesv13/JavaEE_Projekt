-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Czas generowania: 12 Gru 2019, 09:33
-- Wersja serwera: 10.4.8-MariaDB
-- Wersja PHP: 7.3.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `exam_system`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `answers`
--

CREATE TABLE `answers` (
  `answer_id` int(11) NOT NULL,
  `exam_id` int(11) NOT NULL,
  `question` varchar(45) NOT NULL,
  `answer` varchar(45) NOT NULL,
  `correct_answer` varchar(45) NOT NULL,
  `status` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `answers`
--

INSERT INTO `answers` (`answer_id`, `exam_id`, `question`, `answer`, `correct_answer`, `status`) VALUES
(154, 36, 'A', 'BRAK', 'a', 'incorrect'),
(155, 37, 'H', 'h', 'h', 'correct'),
(156, 37, 'A', 'A', 'A', 'correct'),
(157, 37, 'E', 'C', 'C', 'correct'),
(158, 37, 'D', 'D', 'D', 'correct'),
(159, 37, 'B', 'B', 'D', 'incorrect'),
(160, 37, 'A', 'A', 'A', 'correct'),
(161, 37, 'B', 'B', 'B', 'correct'),
(162, 39, 'B', 'B', 'B', 'correct'),
(163, 39, 'D', 'D', 'D', 'correct'),
(164, 39, 'ABC', 'A', 'D', 'incorrect'),
(165, 39, 'A', 'A', 'A', 'correct'),
(166, 40, 'D', 'D', 'D', 'correct'),
(167, 40, 'A', 'B', 'A', 'incorrect'),
(168, 40, 'A', 'A', 'A', 'correct'),
(169, 40, 'ABC', 'D', 'D', 'correct'),
(170, 40, 'B', 'B', 'B', 'correct'),
(171, 40, 'B', 'B', 'B', 'correct'),
(172, 41, 'A', 'BRAK', 'A', 'incorrect'),
(173, 41, 'A', 'BRAK', 'A', 'incorrect'),
(174, 41, 'B', 'BRAK', 'B', 'incorrect'),
(175, 41, 'D', 'BRAK', 'D', 'incorrect'),
(176, 41, 'ABC', 'BRAK', 'D', 'incorrect'),
(177, 41, 'B', 'BRAK', 'B', 'incorrect'),
(178, 42, 'B', 'B', 'B', 'correct'),
(179, 42, 'ABC', 'B', 'D', 'incorrect'),
(180, 42, 'A', 'A', 'A', 'correct'),
(181, 42, 'A', 'A', 'A', 'correct'),
(182, 42, 'D', 'BRAK', 'D', 'incorrect'),
(183, 42, 'B', 'B', 'B', 'correct'),
(184, 43, 'B', 'BRAK', 'B', 'incorrect'),
(185, 43, 'A', 'BRAK', 'A', 'incorrect'),
(186, 43, 'D', 'BRAK', 'D', 'incorrect'),
(187, 43, 'A', 'BRAK', 'A', 'incorrect'),
(188, 43, 'ABC', 'BRAK', 'D', 'incorrect'),
(189, 43, 'B', 'BRAK', 'B', 'incorrect'),
(190, 44, 'A', 'A', 'A', 'correct'),
(191, 44, 'B', 'B', 'B', 'correct'),
(192, 44, 'A', 'A', 'A', 'correct'),
(193, 44, 'B', 'B', 'B', 'correct'),
(194, 44, 'D', 'D', 'D', 'correct'),
(195, 44, 'ABC', 'A', 'D', 'incorrect'),
(196, 45, 'B', 'B', 'B', 'correct'),
(197, 45, 'A', 'A', 'A', 'correct'),
(198, 45, 'A', 'BRAK', 'A', 'incorrect'),
(199, 45, 'D', 'BRAK', 'D', 'incorrect'),
(200, 45, 'B', 'BRAK', 'B', 'incorrect'),
(201, 45, 'Dd', 'BRAK', 'D', 'incorrect'),
(202, 46, 'B', 'B', 'B', 'correct'),
(203, 46, 'Dd', 'D', 'D', 'correct'),
(204, 46, 'B', 'B', 'B', 'correct'),
(205, 46, 'A', 'BRAK', 'A', 'incorrect'),
(206, 46, 'D', 'BRAK', 'D', 'incorrect'),
(207, 46, 'A', 'BRAK', 'A', 'incorrect'),
(208, 47, 'B', 'BRAK', 'B', 'incorrect'),
(209, 47, 'Dd', 'BRAK', 'D', 'incorrect'),
(210, 47, 'A', 'BRAK', 'A', 'incorrect'),
(211, 47, 'A', 'BRAK', 'A', 'incorrect'),
(212, 47, 'B', 'BRAK', 'B', 'incorrect'),
(213, 47, 'D', 'BRAK', 'D', 'incorrect');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `courses`
--

CREATE TABLE `courses` (
  `course_name` varchar(50) NOT NULL,
  `time` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `courses`
--

INSERT INTO `courses` (`course_name`, `time`) VALUES
('AAA', '1'),
('B', '2'),
('M', '5');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `exams`
--

CREATE TABLE `exams` (
  `exam_id` int(11) NOT NULL,
  `std_id` int(11) NOT NULL,
  `course_name` varchar(45) NOT NULL,
  `total_marks` varchar(45) NOT NULL,
  `obt_marks` varchar(45) DEFAULT NULL,
  `date` varchar(45) NOT NULL,
  `start_time` varchar(45) NOT NULL,
  `end_time` varchar(45) DEFAULT NULL,
  `exam_time` varchar(45) DEFAULT NULL,
  `status` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `exams`
--

INSERT INTO `exams` (`exam_id`, `std_id`, `course_name`, `total_marks`, `obt_marks`, `date`, `start_time`, `end_time`, `exam_time`, `status`) VALUES
(36, 10, 'AAA', '1', '0', '01-12-2019', '20:33:24.258', '20:33:27.059', '1', 'Fail (2) 0.0'),
(37, 10, 'M', '7', '6', '01-12-2019', '20:33:32.910', '20:33:40.923', '5', 'Pass (4) 85.71429'),
(38, 10, 'AAA', '0', NULL, '02-12-2019', '17:10:37.502', NULL, '1', NULL),
(39, 10, 'M', '4', '3', '02-12-2019', '17:11:15.715', '17:11:22.776', '5', 'Pass (3) 75,00'),
(40, 10, 'M', '6', '5', '02-12-2019', '17:11:58.691', '17:12:07.826', '5', 'Pass (4) 83,33'),
(41, 10, 'M', '6', '0', '02-12-2019', '18:52:48.322', '18:52:51.161', '5', 'Fail (2) 0,00'),
(42, 10, 'M', '6', '4', '03-12-2019', '12:30:23.909', '12:30:30.936', '5', 'Pass (3) 66,67'),
(43, 10, 'M', '6', '0', '03-12-2019', '14:43:15.487', '14:43:20.468', '5', 'Fail (2) 0,00'),
(44, 21, 'M', '6', '5', '05-12-2019', '09:28:41.962', '09:28:58.699', '5', 'Pass (4) 83,33'),
(45, 10, 'M', '6', '2', '05-12-2019', '09:45:19.843', '09:45:23.108', '5', 'Fail (2) 33,33'),
(46, 10, 'M', '6', '3', '05-12-2019', '09:57:12.545', '09:57:17.217', '5', 'Pass (3) 50,00'),
(47, 10, 'M', '6', '0', '07-12-2019', '23:56:42.737', '23:56:48.492', '5', 'Fail (2) 0,00');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `files`
--

CREATE TABLE `files` (
  `file_id` int(11) NOT NULL,
  `course_name` varchar(50) NOT NULL,
  `file_path` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `files`
--

INSERT INTO `files` (`file_id`, `course_name`, `file_path`) VALUES
(6, 'B', 'kolokwium.pdf'),
(7, 'AAA', '123.pdf'),
(8, 'B', '123.pdf');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `questions`
--

CREATE TABLE `questions` (
  `question_id` int(11) NOT NULL,
  `course_name` varchar(45) NOT NULL,
  `question` varchar(255) NOT NULL,
  `opt1` varchar(85) NOT NULL,
  `opt2` varchar(85) NOT NULL,
  `opt3` varchar(85) NOT NULL,
  `opt4` varchar(85) NOT NULL,
  `correct` varchar(85) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `questions`
--

INSERT INTO `questions` (`question_id`, `course_name`, `question`, `opt1`, `opt2`, `opt3`, `opt4`, `correct`) VALUES
(3, 'M', 'Dd', 'A', 'B', 'C', 'D', 'D'),
(5, 'M', 'D', 'A', 'B', 'C', 'D', 'D'),
(7, 'M', 'A', 'B', 'A', 'A', 'A', 'A'),
(8, 'M', 'B', 'B', 'B', 'N', 'B', 'B'),
(16, 'M', 'A', 'A', 'A', 'A', 'A', 'A'),
(17, 'M', 'B', 'B', 'B', 'B', 'B', 'B'),
(18, 'AAA', 'A', 'A', 'b', 'c', 'd', 'A');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `user_id` int(11) NOT NULL,
  `first_name` varchar(45) NOT NULL,
  `last_name` varchar(45) DEFAULT NULL,
  `user_name` varchar(45) NOT NULL,
  `email` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  `user_type` varchar(45) NOT NULL,
  `contact_no` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `address` varchar(45) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `user_name`, `email`, `password`, `user_type`, `contact_no`, `city`, `address`) VALUES
(1, 'T', 'T', 'T', 'T@T.T', 'T', 'admin', '123456789', 'T', 'T'),
(10, 'M', 'M', 'm', 'M@M.M', 'm', 'student', '123456789', 'M', 'M'),
(21, 's', 's', 's', 's@s.s', 's', 'student', '123123123', 's', 's');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `answers`
--
ALTER TABLE `answers`
  ADD PRIMARY KEY (`answer_id`),
  ADD KEY `user_properties_foreign` (`exam_id`);

--
-- Indeksy dla tabeli `courses`
--
ALTER TABLE `courses`
  ADD PRIMARY KEY (`course_name`);

--
-- Indeksy dla tabeli `exams`
--
ALTER TABLE `exams`
  ADD PRIMARY KEY (`exam_id`),
  ADD KEY `std_id` (`std_id`),
  ADD KEY `fk_ecoursename` (`course_name`);

--
-- Indeksy dla tabeli `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`file_id`),
  ADD KEY `fk_filescourses` (`course_name`);

--
-- Indeksy dla tabeli `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`question_id`),
  ADD KEY `fk_qcoursename` (`course_name`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`),
  ADD UNIQUE KEY `user_name` (`user_name`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `answers`
--
ALTER TABLE `answers`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=214;

--
-- AUTO_INCREMENT dla tabeli `exams`
--
ALTER TABLE `exams`
  MODIFY `exam_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT dla tabeli `files`
--
ALTER TABLE `files`
  MODIFY `file_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT dla tabeli `questions`
--
ALTER TABLE `questions`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `answers`
--
ALTER TABLE `answers`
  ADD CONSTRAINT `user_properties_foreign` FOREIGN KEY (`exam_id`) REFERENCES `exams` (`exam_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_properties_foreign` FOREIGN KEY (`std_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_ecoursename` FOREIGN KEY (`course_name`) REFERENCES `courses` (`course_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `fk_filescourses` FOREIGN KEY (`course_name`) REFERENCES `courses` (`course_name`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Ograniczenia dla tabeli `questions`
--
ALTER TABLE `questions`
  ADD CONSTRAINT `fk_qcoursename` FOREIGN KEY (`course_name`) REFERENCES `courses` (`course_name`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
