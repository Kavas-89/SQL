-- Create Customer Table
create database joinsConcept;
use joinsConcept;

CREATE TABLE Customer (
    Customer_Id INT PRIMARY KEY,
    Customer_Name VARCHAR(50),
    Customer_city VARCHAR(50)
);

-- Create Product Table
CREATE TABLE Product (
    Product_id INT PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL,
    price DECIMAL(10,2) NOT NULL
);

-- Create Orders Table (no foreign key constraints)
CREATE TABLE Orders (
    Order_id INT PRIMARY KEY,
    Customer_Id INT,
    product_id INT,
    order_date DATE
);
INSERT INTO Customer (Customer_Id, Customer_Name, Customer_city) VALUES
(1, 'Sunita Kaur', 'Pune'),
(2, 'David John', 'Hyderabad'),
(3, 'Fatima Ali', 'Ahmedabad'),
(4, 'Arjun Mehta', 'Jaipur'),
(5, 'Meera Suresh', 'Lucknow'),
(6, 'Suresh', 'Lucknow');

INSERT INTO Product (Product_id, product_name, price) VALUES
(1, 'Smart AC', 32000.00),
(2, 'Gaming Console', 35000.00),
(3, 'Noise Cancelling Earbuds', 3900.00),
(4, 'VR Headset', 17000.00),
(5, 'Fitband Pro', 4300.00),
(6, 'Wireless Keyboard', 2200.00),
(7, 'Action Camera', 21000.00),
(8, 'Smart Home Hub', 7000.00),
(9, 'E-Book Reader', 12000.00),
(10, 'Dash Cam', 6500.00);


INSERT INTO Orders (Order_id, Customer_Id, product_id, order_date) VALUES
-- Matching data
(1, 1, 1, '2025-07-25'),
(2, 2, 3, '2025-07-26'),
(3, 3, 2, '2025-07-27'),
(4, 4, 5, '2025-07-28'),
(5, 1, 8, '2025-07-29'),
(6, 5, 4, '2025-07-30'),
(7, 2, 6, '2025-08-01'),
(8, 3, 7, '2025-08-03'),

-- Anonymous / Orphan data
(9, 9, 15, '2025-08-05'),     -- Both customer & product missing
(10, 10, 20, '2025-08-09'),   -- Both missing
(11, 100, 100, '2025-08-12'), -- Both missing
(12, 2, 11, '2025-08-13'),    -- Product missing
(13, 20, 2, '2025-08-14');    -- Customer missing


-- inner join 
SELECT c.Customer_Id, c.Customer_Name, c.Customer_city,
       o.Order_id, o.product_id, o.order_date
FROM Customer c
INNER JOIN Orders o ON c.Customer_Id = o.Customer_Id;

-- left join 
SELECT c.Customer_Id, c.Customer_Name, c.Customer_city,
       o.Order_id, o.product_id, o.order_date
FROM Customer c
LEFT JOIN Orders o ON c.Customer_Id = o.Customer_Id;

-- right join 
SELECT c.Customer_Id, c.Customer_Name, c.Customer_city,
       o.Order_id, o.product_id, o.order_date
FROM Customer c
RIGHT JOIN Orders o ON c.Customer_Id = o.Customer_Id;
 
 
-- anti left 
SELECT c.*
FROM Customer c
LEFT JOIN Orders o ON c.Customer_Id = o.Customer_Id
WHERE o.Order_id IS NULL;

-- anti right
SELECT o.*
FROM Orders o
LEFT JOIN Customer c ON o.Customer_Id = c.Customer_Id
WHERE c.Customer_Id IS NULL;
 -- anti inner join 
 SELECT c.Customer_Id, c.Customer_Name, c.Customer_city,
       NULL AS Order_id, NULL AS product_id, NULL AS order_date
FROM Customer c
LEFT JOIN Orders o ON c.Customer_Id = o.Customer_Id
WHERE o.Order_id IS NULL

UNION ALL

SELECT NULL AS Customer_Id, NULL AS Customer_Name, NULL AS Customer_city,
       o.Order_id, o.product_id, o.order_date
FROM Orders o
LEFT JOIN Customer c ON o.Customer_Id = c.Customer_Id
WHERE c.Customer_Id IS NULL;


-- customer name with  product name and order date

select  Customer_Name ,p.product_name,o.order_date 
from Customer as c
join Orders as o 
on c.Customer_Id = o.Customer_Id
left join product as p
on o.Product_id = p.Product_id ; 

-- customer who ordered mouse along with order dates

select  c.Customer_Name ,p.product_name,o.order_date 
from Customer as c
join Orders as o 
on c.Customer_Id = o.Customer_Id
join product as p
on o.Product_id = p.Product_id 
where p.Product_name = "Smart AC";

-- Show all customers their orders, including products

select * from Customer as c
left join Orders as o 
on c.Customer_Id = o.Customer_Id
left join  Product as p
on o.product_id = p.product_id;