-- Taller 1
-- Fabian Leonardo Bello Arias

-- Subconsultas
-- 1.1 reserva fiction 

SELECT FirstName, LastName 
FROM users 
WHERE UserID IN (
    SELECT UserID FROM reservations WHERE BookID IN (
        SELECT BookID FROM books WHERE CategoryID = (
            SELECT CategoryID FROM bookcategories WHERE CategoryName = 'Fiction'
        )
    )
);

-- 1.2 Título y Autor de libros actualmente prestados
SELECT Title, Author 
FROM books 
WHERE BookID IN (
    SELECT BookID FROM loans WHERE ReturnDate IS NULL
);

-- BLOQUE 2: CONJUNTOS (Usando LEFT JOIN por compatibilidad)
-- 2.1 Reservados pero NO prestados
SELECT DISTINCT b.Title
FROM books b
JOIN reservations r ON b.BookID = r.BookID
LEFT JOIN loans l ON b.BookID = l.BookID
WHERE l.LoanID IS NULL;