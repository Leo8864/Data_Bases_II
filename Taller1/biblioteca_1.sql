-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3307
-- Tiempo de generación: 19-04-2026 a las 05:54:14
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca_1`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `bookcategories`
--

CREATE TABLE `bookcategories` (
  `CategoryID` int(11) NOT NULL,
  `CategoryName` varchar(50) NOT NULL,
  `Description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `bookcategories`
--

INSERT INTO `bookcategories` (`CategoryID`, `CategoryName`, `Description`) VALUES
(1, 'Fiction', 'Fictional works including novels and short stories'),
(2, 'Non-fiction', 'Books based on real facts and events'),
(3, 'Science', 'Books about scientific concepts and discoveries'),
(4, 'Technology', 'Books about technological advancements'),
(5, 'History', 'Books about historical events and figures'),
(6, 'Biography', 'Books about individuals and their lives'),
(7, 'Fantasy', 'Fictional works with magical elements'),
(8, 'Mystery', 'Books about solving crimes or puzzles'),
(9, 'Children', 'Books aimed at young readers'),
(10, 'Education', 'Books used for learning and instruction');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `books`
--

CREATE TABLE `books` (
  `BookID` int(11) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Author` varchar(100) NOT NULL,
  `Genre` varchar(50) DEFAULT NULL,
  `PublicationYear` int(11) DEFAULT NULL,
  `AvailableCopies` int(11) DEFAULT 0,
  `CategoryID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `books`
--

INSERT INTO `books` (`BookID`, `Title`, `Author`, `Genre`, `PublicationYear`, `AvailableCopies`, `CategoryID`) VALUES
(1, 'To Kill a Mockingbird', 'Harper Lee', 'Fiction', 1960, 5, 1),
(2, 'Sapiens: A Brief History of Humankind', 'Yuval Noah Harari', 'Non-fiction', 2011, 3, 2),
(3, 'A Brief History of Time', 'Stephen Hawking', 'Science', 1988, 4, 3),
(4, 'The Innovators', 'Walter Isaacson', 'Technology', 2014, 2, 4),
(5, 'The Diary of a Young Girl', 'Anne Frank', 'History', 1947, 3, 5),
(6, 'Steve Jobs', 'Walter Isaacson', 'Biography', 2011, 4, 6),
(7, 'Harry Potter and the Sorcerer\'s Stone', 'J.K. Rowling', 'Fantasy', 1997, 6, 7),
(8, 'The Girl with the Dragon Tattoo', 'Stieg Larsson', 'Mystery', 2005, 2, 8),
(9, 'Charlotte\'s Web', 'E.B. White', 'Children', 1952, 7, 9),
(10, 'Introduction to Algorithms', 'Cormen et al.', 'Education', 2009, 3, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `loans`
--

CREATE TABLE `loans` (
  `LoanID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `BookID` int(11) DEFAULT NULL,
  `LoanDate` date NOT NULL,
  `ReturnDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `loans`
--

INSERT INTO `loans` (`LoanID`, `UserID`, `BookID`, `LoanDate`, `ReturnDate`) VALUES
(1, 1, 1, '2024-11-01', NULL),
(2, 2, 2, '2024-11-02', '2024-11-10'),
(3, 3, 3, '2024-11-03', NULL),
(4, 4, 4, '2024-11-04', '2024-11-12'),
(5, 5, 5, '2024-11-05', NULL),
(6, 6, 6, '2024-11-06', '2024-11-14'),
(7, 7, 7, '2024-11-07', NULL),
(8, 8, 8, '2024-11-08', '2024-11-16'),
(9, 9, 9, '2024-11-09', NULL),
(10, 10, 10, '2024-11-10', '2024-11-18');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservations`
--

CREATE TABLE `reservations` (
  `ReservationID` int(11) NOT NULL,
  `UserID` int(11) DEFAULT NULL,
  `BookID` int(11) DEFAULT NULL,
  `ReservationDate` date NOT NULL,
  `Status` varchar(20) DEFAULT 'active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservations`
--

INSERT INTO `reservations` (`ReservationID`, `UserID`, `BookID`, `ReservationDate`, `Status`) VALUES
(1, 1, 3, '2024-11-01', 'active'),
(2, 2, 5, '2024-11-02', 'cancelled'),
(3, 3, 7, '2024-11-03', 'active'),
(4, 4, 9, '2024-11-04', 'active'),
(5, 5, 2, '2024-11-05', 'cancelled'),
(6, 6, 4, '2024-11-06', 'active'),
(7, 7, 6, '2024-11-07', 'active'),
(8, 8, 8, '2024-11-08', 'cancelled'),
(9, 9, 10, '2024-11-09', 'active'),
(10, 10, 1, '2024-11-10', 'active');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `staff`
--

CREATE TABLE `staff` (
  `StaffID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Role` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `staff`
--

INSERT INTO `staff` (`StaffID`, `FirstName`, `LastName`, `Role`, `Email`) VALUES
(1, 'Laura', 'Thompson', 'Administrator', 'laura.thompson@example.com'),
(2, 'Michael', 'Rodriguez', 'Librarian', 'michael.rodriguez@example.com'),
(3, 'Nina', 'White', 'Assistant', 'nina.white@example.com'),
(4, 'Oscar', 'Clark', 'Librarian', 'oscar.clark@example.com'),
(5, 'Paul', 'Lewis', 'Administrator', 'paul.lewis@example.com'),
(6, 'Quinn', 'Walker', 'Librarian', 'quinn.walker@example.com'),
(7, 'Rachel', 'Hall', 'Assistant', 'rachel.hall@example.com'),
(8, 'Sam', 'Allen', 'Administrator', 'sam.allen@example.com'),
(9, 'Tina', 'Young', 'Librarian', 'tina.young@example.com'),
(10, 'Victor', 'King', 'Assistant', 'victor.king@example.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `FirstName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `PhoneNumber` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`UserID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`) VALUES
(1, 'Alice', 'Johnson', 'alice.johnson@example.com', '1234567890'),
(2, 'Bob', 'Smith', 'bob.smith@example.com', '0987654321'),
(3, 'Carol', 'Davis', 'carol.davis@example.com', '1122334455'),
(4, 'David', 'Garcia', 'david.garcia@example.com', '2233445566'),
(5, 'Eve', 'Martinez', 'eve.martinez@example.com', '3344556677'),
(6, 'Frank', 'Brown', 'frank.brown@example.com', '4455667788'),
(7, 'Grace', 'Lee', 'grace.lee@example.com', '5566778899'),
(8, 'Hank', 'Wilson', 'hank.wilson@example.com', '6677889900'),
(9, 'Ivy', 'Taylor', 'ivy.taylor@example.com', '7788990011'),
(10, 'Jack', 'Anderson', 'jack.anderson@example.com', '8899001122');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `bookcategories`
--
ALTER TABLE `bookcategories`
  ADD PRIMARY KEY (`CategoryID`);

--
-- Indices de la tabla `books`
--
ALTER TABLE `books`
  ADD PRIMARY KEY (`BookID`),
  ADD KEY `CategoryID` (`CategoryID`);

--
-- Indices de la tabla `loans`
--
ALTER TABLE `loans`
  ADD PRIMARY KEY (`LoanID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `BookID` (`BookID`);

--
-- Indices de la tabla `reservations`
--
ALTER TABLE `reservations`
  ADD PRIMARY KEY (`ReservationID`),
  ADD KEY `UserID` (`UserID`),
  ADD KEY `BookID` (`BookID`);

--
-- Indices de la tabla `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffID`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `bookcategories`
--
ALTER TABLE `bookcategories`
  MODIFY `CategoryID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `books`
--
ALTER TABLE `books`
  MODIFY `BookID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `loans`
--
ALTER TABLE `loans`
  MODIFY `LoanID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `reservations`
--
ALTER TABLE `reservations`
  MODIFY `ReservationID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `staff`
--
ALTER TABLE `staff`
  MODIFY `StaffID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `books`
--
ALTER TABLE `books`
  ADD CONSTRAINT `books_ibfk_1` FOREIGN KEY (`CategoryID`) REFERENCES `bookcategories` (`CategoryID`);

--
-- Filtros para la tabla `loans`
--
ALTER TABLE `loans`
  ADD CONSTRAINT `loans_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `loans_ibfk_2` FOREIGN KEY (`BookID`) REFERENCES `books` (`BookID`);

--
-- Filtros para la tabla `reservations`
--
ALTER TABLE `reservations`
  ADD CONSTRAINT `reservations_ibfk_1` FOREIGN KEY (`UserID`) REFERENCES `users` (`UserID`),
  ADD CONSTRAINT `reservations_ibfk_2` FOREIGN KEY (`BookID`) REFERENCES `books` (`BookID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
