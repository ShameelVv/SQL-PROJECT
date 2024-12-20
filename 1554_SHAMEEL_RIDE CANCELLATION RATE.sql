-- Step 1: Create the Users and Trips tables
CREATE TABLE Users (
    user_id INT,
    banned VARCHAR(3),
    ROLE VARCHAR(10)
);

CREATE TABLE Trips (
    id INT,
    client_id INT,
    driver_id INT,
    city_id INT,
    status VARCHAR(20),
    request_at DATE
);

-- Step 2: Insert data into the Users table
INSERT INTO Users (user_id, banned, ROLE) VALUES
(1, 'No', 'client'),
(2, 'Yes', 'client'),
(3, 'No', 'client'),
(4, 'No', 'client'),
(10, 'No', 'driver'),
(11, 'No', 'driver'),
(12, 'No', 'driver'),
(13, 'No', 'driver');

-- Step 3: Insert data into the Trips table
INSERT INTO Trips (id, client_id, driver_id, city_id, status, request_at) VALUES
(1, 1, 10, 1, 'completed', '2023-07-12'),
(2, 2, 11, 1, 'cancelled_by_driver', '2023-07-12'),
(3, 3, 12, 6, 'completed', '2023-07-12'),
(4, 4, 13, 6, 'cancelled_by_client', '2023-07-12'),
(5, 1, 10, 1, 'completed', '2023-07-13'),
(6, 2, 11, 6, 'completed', '2023-07-13'),
(7, 3, 12, 6, 'completed', '2023-07-13'),
(8, 2, 12, 12, 'completed', '2023-07-14'),
(9, 3, 10, 12, 'completed', '2023-07-14'),
(10, 4, 13, 12, 'cancelled_by_driver', '2023-07-14');

-- Step 4: Query to calculate the cancellation rate
SELECT 
    t.request_at AS DAY,
    ROUND(
        SUM(CASE WHEN t.status IN ('cancelled_by_driver', 'cancelled_by_client') THEN 1 ELSE 0 END) * 1.0 / COUNT(*),
        2
    ) AS "cancellation rate"
FROM Trips t
JOIN Users u
ON t.client_id = u.user_id
WHERE u.banned = 'No'
GROUP BY t.request_at
ORDER BY t.request_at;
