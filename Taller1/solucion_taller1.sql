-- Taller 1
-- Fabian Leonardo Bello Arias

-- 1 Subconsultas

-- 1.1 Obtener los nombres y apellidos de los usuarios que han reservado un libro de la categoría "Fiction".

SELECT FirstName, LastName 
FROM users 
WHERE UserID IN (
    SELECT UserID FROM reservations WHERE BookID IN (
        SELECT BookID FROM books WHERE CategoryID = (
            SELECT CategoryID FROM bookcategories WHERE CategoryName = 'Fiction'
        )
    )
);

-- 1.2  Mostrar el título y autor de los libros que están prestados.
SELECT Title, Author 
FROM books 
WHERE BookID IN (
SELECT BookID FROM loans WHERE ReturnDate IS NULL
);

-- 2 OPERADORES DE CONJUNTO

-- 2.1 Encontrar los títulos de los libros que han sido reservados, pero no prestados.
SELECT DISTINCT b.Title
FROM books b
JOIN reservations r ON b.BookID = r.BookID
LEFT JOIN loans l ON b.BookID = l.BookID
WHERE l.LoanID IS NULL;

--2.2 Encontrar los títulos de los libros que han sido prestados, pero no reservados.
SELECT DISTINCT b.Title
FROM books b
JOIN loans l ON b.BookID = l.BookID
LEFT JOIN reservations r ON b.BookID = r.BookID
WHERE r.ReservationID IS NULL;

-- 3. EXPRESIONES CONDICIONALES

--3.1 Mostrar un listado de todos los libros con un estado: "Disponible" si AvailableCopies > 0, o "Agotado" si no hay copias disponibles.
SELECT Title, AvailableCopies,
CASE 
WHEN AvailableCopies > 0 THEN 'Disponible'
ELSE 'Agotado'
END AS Estado
FROM books;

--3.2 Mostrar los usuarios y clasifícalos como "Activo" si tienen libros prestados y "Sin actividad" si no.

SELECT DISTINCT u.FirstName, u.LastName,
CASE 
WHEN l.LoanID IS NOT NULL THEN 'Activo'
ELSE 'Sin actividad'
END AS Estatus_Usuario
FROM users u
LEFT JOIN loans l ON u.UserID = l.UserID;

--4. ANÁLISIS AGREGADO CON GROUP BY Y HAVING

--4.1 Encontrar las categorías con más de 3 libros.
SELECT c.CategoryName, COUNT(b.BookID) AS TotalLibros
FROM bookcategories c
JOIN books b ON c.CategoryID = b.CategoryID
GROUP BY c.CategoryName
HAVING COUNT(b.BookID) > 3;

--4.2 Mostrar los usuarios que tienen más de 2 libros reservados.
SELECT u.FirstName, u.LastName, COUNT(r.ReservationID) AS TotalReservas
FROM users u
JOIN reservations r ON u.UserID = r.UserID
GROUP BY u.UserID, u.FirstName, u.LastName
HAVING COUNT(r.ReservationID) > 2;

 --5. INNER JOIN

--5.1 Mostrar un listado de los nombres de usuarios y los títulos de los libros que han sido prestados.

SELECT u.FirstName, u.LastName, b.Title
FROM users u
INNER JOIN loans l ON u.UserID = l.UserID
INNER JOIN books b ON l.BookID = b.BookID;

--5.2 Mostrar los nombres de usuarios y los títulos de los libros que han reservado.

SELECT u.FirstName, u.LastName, b.Title
FROM users u
INNER JOIN reservations r ON u.UserID = r.UserID
INNER JOIN books b ON r.BookID = b.BookID;

-- 6 LEFT JOIN

 -- 6.1 Listar todos los libros junto con el nombre del usuario que los reservó, si es que existe una reserva.

SELECT u.FirstName, u.LastName, b.Title
FROM users u
INNER JOIN loans l ON u.UserID = l.UserID
INNER JOIN books b ON l.BookID = b.BookID;

 -- 6.2 Listar todos los usuarios junto con el título del libro prestado, si existe un préstamo.

SELECT u.FirstName, u.LastName, b.Title
FROM users u
INNER JOIN reservations r ON u.UserID = r.UserID
INNER JOIN books b ON r.BookID = b.BookID;

-- 7RIGHT JOIN

-- 7.1 Listar todos los libros junto con los nombres de los usuarios que los han reservado, incluyendo los libros que no tienen reservas.

SELECT b.Title, u.FirstName, u.LastName
FROM reservations r
INNER JOIN users u ON r.UserID = u.UserID
RIGHT JOIN books b ON r.BookID = b.BookID;

-- 7.2 Lista todos los usuarios junto con los títulos de los libros prestados, incluyendo los usuarios que no han realizado préstamos.

SELECT u.FirstName, u.LastName, b.Title
FROM loans l
INNER JOIN books b ON l.BookID = b.BookID
RIGHT JOIN users u ON l.UserID = u.UserID;

-- 8 FUNCIONES ESPECIALIZADAS

-- 8.1 Mostrar un listado de los títulos de los libros en mayúsculas.

SELECT UPPER(Title) AS Titulo_Mayusculas 
FROM books;

-- 8.2 Mostrar los nombres de los usuarios concatenados en un solo campo (Nombre Completo).

SELECT CONCAT(FirstName, ' ', LastName) AS Nombre_Completo 
FROM users;

--9 FUNCIONES DE FECHA

--9.1 Calcular el número de días que han pasado desde que se reservó cada libro.

SELECT b.Title, r.ReservationDate, 
       DATEDIFF(CURDATE(), r.ReservationDate) AS Dias_Transcurridos
FROM reservations r
JOIN books b ON r.BookID = b.BookID;

-- 9.2 Mostrar los préstamos que están pendientes de devolución (ReturnDate es NULL).

SELECT u.FirstName, u.LastName, b.Title, l.LoanDate
FROM loans l
JOIN users u ON l.UserID = u.UserID
JOIN books b ON l.BookID = b.BookID
WHERE l.ReturnDate IS NULL;

--10 FUNCIONES DE AGREGACIÓN

--10.1 Calcular el total de copias disponibles para cada categoría
 
SELECT c.CategoryName, SUM(b.AvailableCopies) AS Total_Copias_Disponibles
FROM bookcategories c
JOIN books b ON c.CategoryID = b.CategoryID
GROUP BY c.CategoryName;
 
--10.2 Encontrar el número total de libros prestados por cada usuario.

SELECT u.FirstName, u.LastName, COUNT(l.LoanID) AS Total_Prestamos
FROM users u
LEFT JOIN loans l ON u.UserID = l.UserID
GROUP BY u.UserID, u.FirstName, u.LastName;