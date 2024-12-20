-- Create the Customers table
CREATE TABLE Customers (
    id INT PRIMARY KEY,
    NAME VARCHAR(50)
);

-- Insert data into the Customers table
INSERT INTO Customers (id, NAME)
VALUES 
(1, 'Joe'),
(2, 'Henry'),
(3, 'Sam'),
(4, 'Max');

-- Create the Orders table
CREATE TABLE Orders (
    id INT PRIMARY KEY,
    customerId INT
);

-- Insert data into the Orders table
INSERT INTO Orders (id, customerId)
VALUES 
(2, 1),
(1, 3);

-- Find customers who never place an order
SELECT NAME
FROM Customers
WHERE id NOT IN (
    SELECT customerId
    FROM Orders
);
