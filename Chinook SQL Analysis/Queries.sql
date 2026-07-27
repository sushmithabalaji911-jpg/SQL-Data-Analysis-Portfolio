-- Query 1: SELECT
SELECT * FROM Customer;

-- Query 2: WHERE
SELECT FirstName, LastName, Country
FROM Customer
WHERE Country = 'USA';

-- Query 3: ORDER BY
SELECT FirstName, LastName, Country
FROM Customer
ORDER BY LastName ASC;

-- Query 4: GROUP BY
SELECT Country, COUNT(*) AS TotalCustomers
FROM Customer
GROUP BY Country
ORDER BY TotalCustomers DESC;

-- Query 5: INNER JOIN
SELECT c.FirstName,
       c.LastName,
       i.InvoiceDate,
       i.Total
FROM Customer c
INNER JOIN Invoice i
ON c.CustomerId = i.CustomerId;

-- Query 6: LEFT JOIN
SELECT c.FirstName,
       c.LastName,
       i.InvoiceDate,
       i.Total
FROM Customer c
LEFT JOIN Invoice i
ON c.CustomerId = i.CustomerId;

-- Query 7: SUM
SELECT SUM(Total) AS TotalRevenue
FROM Invoice;

-- Query 8: AVG
SELECT AVG(Total) AS AverageInvoiceValue
FROM Invoice;

-- Query 9: Subquery
SELECT FirstName, LastName
FROM Customer
WHERE CustomerId IN (
    SELECT CustomerId
    FROM Invoice
    WHERE Total > 10
);

-- Query 10: View
CREATE VIEW CustomerInvoiceSummary AS
SELECT c.FirstName,
       c.LastName,
       i.Total
FROM Customer c
INNER JOIN Invoice i
ON c.CustomerId = i.CustomerId;

SELECT * FROM CustomerInvoiceSummary;

-- Query 11: Index
CREATE INDEX idx_customer_country
ON Customer(Country);