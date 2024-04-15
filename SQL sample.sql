-- Task1 Database Design

create database try;
use try;
CREATE TABLE User (
    UserID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    Password VARCHAR(255),
    ContactNumber VARCHAR(20),
    Address TEXT
);
INSERT INTO User (UserID, Name, Email, Password, ContactNumber, Address) VALUES
(1, 'Aakash', 'aakash@example.com', 'password123', '123-456-7890', 'Madurai, Tamil Nadu, India'),
(2, 'Priya', 'priya@example.com', 'abc@123', '987-654-3210', 'Tiruchirappalli, Tamil Nadu, India'),
(3, 'Rahul', 'rahul@example.com', 'securepwd', '555-123-4567', 'Salem, Tamil Nadu, India'),
(4, 'Deepika', 'deepika@example.com', 'p@ssw0rd', '111-222-3333', 'Coimbatore, Tamil Nadu, India'),
(5, 'Ravi', 'ravi@example.com', 'qwerty', '444-555-6666', 'Chennai, Tamil Nadu, India'),
(6, 'Sneha', 'sneha@example.com', 'password321', '777-888-9999', 'Salem, Tamil Nadu, India'),
(7, 'Vikas', 'vikas@example.com', 'letmein', '222-333-4444','Tiruchirappalli, Tamil Nadu, India'),
(8, 'Anjali', 'anjali@example.com', 'd@vidb', '999-888-7777', 'Madurai, Tamil Nadu, India'),
(9, 'Arun', 'arun@example.com', 'emma123', '666-777-8888',  'Coimbatore, Tamil Nadu, India'),
(10, 'John', 'john@example.com', 'pass123', '333-444-5555', 'Chennai, Tamil Nadu, India');


CREATE TABLE Courier (
    CourierID INT PRIMARY KEY,
    SenderName VARCHAR(255),
    SenderAddress TEXT,
    ReceiverName VARCHAR(255),
    ReceiverAddress TEXT,
    Weight DECIMAL(5, 2),
    Status VARCHAR(50),
    TrackingNumber VARCHAR(20) UNIQUE,
    DeliveryDate DATE
);
alter table Courier add EmployeeID int;
alter table Courier add foreign key(EmployeeID) references Employee(EmployeeID);
alter table Courier add UserID int;
alter table Courier add foreign key(UserID) references User(UserID);
INSERT INTO Courier VALUES 
(101, 'John', 'Chennai, Tamil Nadu, India', 'Jane Doe', '456 Elm St, Coimbatore, India', 2.5, 'In Transit', 'TRK123456', '2024-04-13', 51,10),
(102, 'Aakash', 'Madurai, Tamil Nadu, India', 'Bob Smith', '321 Pine St,Chennai, India', 1.8, 'Delivered', 'TRK789012', '2024-04-10', 53,1),
(103, 'Priya', 'Tiruchirappalli, Tamil Nadu, India', 'Michael Brown', '456 Elm St, Madurai, India', 3.1, 'Pending', 'TRK345678', '2024-04-12', 51,2),
(104, 'Rahul', 'Salem, Tamil Nadu, India', 'David Johnson', '852 Walnut St,Madurai, India', 4.2, 'In Transit', 'TRK901234', '2024-04-15', 60,3),
(105, 'Deepika', 'Coimbatore, Tamil Nadu, India', 'Sophia Williams', '147 Sycamore St, Salem, India', 2.7, 'Pending', 'TRK567890', '2024-04-09', 56,4),
(106, 'Ravi', 'Chennai, Tamil Nadu, India', 'Smith Johnson', '321 Pine St, Madurai, India', 1.8, 'Delivered', 'TRK789013', '2024-04-10', 57,5),
(107, 'Sneha', 'Salem, Tamil Nadu, India', 'Prakash Kumar', '456 Elm St,  Chennai, India', 2.5, 'In Transit', 'TRK123457', '2024-04-13', 51,6),
(108, 'Vikas', 'Tiruchirappalli, Tamil Nadu, India', 'Raj Singh', '321 Pine St, Madurai, India', 1.8, 'Delivered', 'TRK789072', '2024-04-10', 52,7),
(109, 'Anjali', 'Madurai, Tamil Nadu, India', 'Raju Patel', '654 Birch St, Coimbatore, India', 3.1, 'Pending', 'TRK345679', '2024-04-12', 58,8),
(110, 'Arun', 'Coimbatore, Tamil Nadu, India', 'Davidra Krishnan', '852 Walnut St,Chennai, India', 4.2, 'In Transit', 'TRK901204', '2024-04-15', 57,9),
(111, 'Aakash', 'Madurai, Tamil Nadu, India', 'Davidan Balaji', '852 Walnut St, Coimbatore, India', 4.2, 'In Transit', 'TRK901934', '2024-04-15', 53,1),
(112, 'Anjali', 'Madurai, Tamil Nadu, India', 'Rajesh Kumar', '654 Birch St, Salem, India', 3.1, 'Pending', 'TRK345778', '2024-04-12', 55,8);

truncate table Courier;
select* from Courier;

update Courier set DeliveryDate='2024-04-14' where CourierID=108;
CREATE TABLE CourierServices (
    ServiceID INT PRIMARY KEY,
    ServiceName VARCHAR(100),
    Cost DECIMAL(8, 2)
);
drop table CourierServices;
ALTER TABLE CourierServices
ADD CourierID INT;

ALTER TABLE CourierServices 
ADD FOREIGN KEY (CourierID) REFERENCES Courier(CourierID);

INSERT INTO CourierServices(CourierID,ServiceID,ServiceName,Cost) VALUES
(101,11, 'Standard Delivery', 75.50),
(102,12, 'Express Delivery', 100.00),
(103,13, 'Same Day Delivery', 70.00),
(104,14, 'Overnight Delivery', 50.25),
(105,15, 'Economy Delivery', 90.00),
(102,16, 'Express Delivery', 150.00),
(103,17, 'Same Day Delivery', 40.00),
(101,18, 'Standard Delivery', 65.50),
(102,19, 'Express Delivery', 230.00),
(103,20, 'Same Day Delivery', 80.00);

CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    Name VARCHAR(255),
    Email VARCHAR(255) UNIQUE,
    ContactNumber VARCHAR(20),
    Role VARCHAR(50),
    Salary DECIMAL(10, 2)
);

INSERT INTO Employee (EmployeeID, Name, Email, ContactNumber, Role, Salary) VALUES
(51, 'Aravind Kumar', 'aravind.kumar@example.com', '+919876543210', 'Manager', 60000.00),
(52, 'Priya John', 'priya.raman@example.com', '+919876543211', 'Developer', 50000.00),
(53, 'Karthik Mani', 'karthik.mani@example.com', '+919876543212', 'HR Specialist', 55000.00),
(54, 'Deepika Ramesh', 'deepika.ramesh@example.com', '+919876543213', 'Sales Representative', 45000.00),
(55, 'Senthil Kumar', 'senthil.kumar@example.com', '+919876543214', 'Customer Support', 48000.00),
(56, 'Nithya Sundaram', 'nithya.sundaram@example.com', '+919876543215', 'Marketing Manager', 58000.00),
(57, 'Rajeshwari Balaji', 'rajeshwari.balaji@example.com', '+919876543216', 'Financial Analyst', 52000.00),
(58, 'Manoj Krishnan', 'manoj.krishnan@example.com', '+919876543217', 'IT Specialist', 53000.00),
(59, 'John Chandrasekhar', 'ananya.chandrasekhar@example.com', '+919876543218', 'Operations Supervisor', 56000.00),
(60, 'Prakash Rajendran', 'prakash.rajendran@example.com', '+919876543219', 'Quality Assurance', 47000.00);


CREATE TABLE Location (
    LocationID INT PRIMARY KEY,
    LocationName VARCHAR(100),
    Address TEXT
);
INSERT INTO Location (LocationID, LocationName, Address) VALUES
(111, 'Chennai', 'Chennai, Tamil Nadu, India'),
(222, 'Coimbatore', 'Coimbatore, Tamil Nadu, India'),
(333, 'Madurai', 'Madurai, Tamil Nadu, India'),
(444, 'Tiruchirappalli', 'Tiruchirappalli, Tamil Nadu, India'),
(555, 'Salem', 'Salem, Tamil Nadu, India');

CREATE TABLE Payment (
    PaymentID INT PRIMARY KEY,
    CourierID INT,
    LocationID INT,
    Amount DECIMAL(10, 2),
    PaymentDate DATE,
    FOREIGN KEY (CourierID) REFERENCES Courier(CourierID),
    FOREIGN KEY (LocationID) REFERENCES Location(LocationID)
);
drop table Payment;
alter table Payment add EmployeeID int;
alter table Payment add foreign key(EmployeeID) references Employee(EmployeeID);
truncate table Payment;
INSERT INTO Payment VALUES
(210, 101, 111, 75.50, '2024-04-12',51),
(211, 102, 222, 100.00, '2024-04-09',52),
(213, 103, 333, 50.25, '2024-04-11',53),
(214, 104, 444, 120.75, '2024-04-14',54),
(215, 105, 555, 90.00, '2024-04-07',55),
(216, 106, 222, 75.50, '2024-04-12',56),
(217, 107, 111, 100.00, '2024-04-08',57),
(218, 108, 333, 50.25, '2024-04-12',58),
(219, 109, 555, 120.75, '2024-04-09',59),
(220, 110, 444, 90.00, '2024-04-10',60),
(221, 111, 222, 90.00, '2024-04-13',51),
(222, 112, 111, 90.00, '2024-04-10',52);

-- Task 2: Select,Where
-- Solve the following queries in the Schema that you have created above 

-- 1. List all customers:
select*from User;

-- 2. List all orders for a specific customer:
select* from Courier where SenderName='Aakash';

-- 3. List all couriers: 
select* from courier;

-- 4. List all packages for a specific order: 
select* from courier where DeliveryDate='2024-04-12';

-- 5. List all deliveries for a specific courier: 
select* from CourierServices where ServiceName='Express Delivery';

-- 6. List all undelivered packages: 
select* from courier where Status!='Delivered';

-- 7. List all packages that are scheduled for delivery today: 
select* from courier where DeliveryDate=curdate();

-- 8. List all packages with a specific status: 
select* from courier where Status='In Transit';

-- 9. Calculate the total number of packages for each courier.
 SELECT CourierID, COUNT(*) AS TotalPackages 
FROM CourierServices 
GROUP BY CourierID;

-- 10. Find the average delivery time for each courier 
SELECT SenderName, AVG(DATEDIFF(CURRENT_DATE, DeliveryDate)) AS AvgDeliveryTime FROM Courier GROUP BY SenderName;

-- 11. List all packages with a specific weight range: 
SELECT * FROM Courier WHERE Weight BETWEEN 3 AND 5;

-- 12. Retrieve employees whose names contain 'John' 
select* from employee where Name LIKE '%John%';

-- 13. Retrieve all courier records with payments greater than $50.
SELECT * FROM Courier 
INNER JOIN Payment ON Courier.CourierID = Payment.CourierID 
WHERE Payment.Amount > 50;


-- Task 3: GroupBy, Aggregate Functions, Having, Order By, where 

-- 14. Find the total number of couriers handled by each employee. 
SELECT e.EmployeeID, e.Name, COUNT(*) AS TotalCouriersHandled 
FROM Employee e 
INNER JOIN Courier c ON e.EmployeeID = c.EmployeeID 
GROUP BY e.EmployeeID, e.Name;

-- 15. Calculate the total revenue generated by each location 
SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalRevenue 
FROM Location l 
LEFT JOIN Payment p ON l.LocationID = p.LocationID 
GROUP BY l.LocationID, l.LocationName;

-- 16. Find the total number of couriers delivered to each location. 
select l.LocationName, count(*) AS Numberofcouriers
from location l
left join Payment p ON l.LocationID=p.locationID
group by l.LocationID,l.LocationName;

-- 17. Find the courier with the highest average delivery time: 
SELECT c.CourierID, AVG(DATEDIFF(CURRENT_DATE,c.DeliveryDate)) AS AvgDeliveryTime
FROM Courier c
GROUP BY c.CourierID
ORDER BY AvgDeliveryTime DESC
LIMIT 1;

-- 18. Find Locations with Total Payments Less Than a Certain Amount 
select l.LocationName, sum(p.Amount) AS Revenue 
from Location l left join Payment p on l.LocationID=p.LocationID 
group by l.LocationName having Revenue<=250;

-- 19. Calculate Total Payments per Location 
select l.LocationName ,sum(Amount) as TotalPayments 
from Location l left join Payment p ON l.LocationID=p.LocationID 
group by l.LocationName;

-- 20. Retrieve couriers who have received payments totaling more than $1000 in a specific location 
-- (LocationID = X): 
SELECT c.CourierID, c.SenderName, c.ReceiverName, SUM(p.Amount) AS TotalPayment
FROM Courier c
INNER JOIN Payment p ON c.CourierID = p.CourierID
WHERE p.LocationID = 111
GROUP BY c.CourierID
HAVING TotalPayment > 75;

-- 21. Retrieve couriers who have received payments totaling more than $1000 after a certain date 
-- (PaymentDate > 'YYYY-MM-DD'): 
SELECT c.CourierID, c.SenderName, c.ReceiverName, p.PaymentDate, SUM(p.Amount) AS TotalPayment
FROM Courier c
INNER JOIN Payment p ON c.CourierID = p.CourierID
WHERE p.PaymentDate >= '2024-04-12'
GROUP BY c.CourierID, c.SenderName, c.ReceiverName, p.PaymentDate
HAVING TotalPayment > 75;

-- 22. Retrieve locations where the total amount received is more than $5000 before a certain date 
-- (PaymentDate > 'YYYY-MM-DD')
SELECT c.CourierID, c.SenderName, c.ReceiverName, p.PaymentDate, SUM(p.Amount) AS TotalPayment
FROM Courier c
INNER JOIN Payment p ON c.CourierID = p.CourierID
WHERE p.PaymentDate < '2024-04-10'
GROUP BY c.CourierID, c.SenderName, c.ReceiverName, p.PaymentDate
HAVING TotalPayment > 75;


-- Task 4: Inner Join,Full Outer Join, Cross Join, Left Outer Join,Right Outer Join 
-- 23. Retrieve Payments with Courier Information 
SELECT p.*, c.*
FROM Payment p
LEFT JOIN Courier c ON p.CourierID = c.CourierID;

-- 24. Retrieve Payments with Location Information 
select p.*,l.*
from Payment p
left join Location l ON p.LocationID = l.LocationID;

-- 25. Retrieve Payments with Courier and Location Information 
SELECT p.*, c.*, l.*
FROM Payment p
LEFT JOIN Courier c ON p.CourierID = c.CourierID
LEFT JOIN Location l ON p.LocationID = l.LocationID;

-- 26. List all payments with courier details 
SELECT p.PaymentID,p.Amount, p.CourierID, c.SenderName, c.ReceiverName, p.Amount, p.PaymentDate
FROM Payment p
LEFT JOIN Courier c ON p.CourierID = c.CourierID;

-- 27. Total payments received for each courier 
SELECT c.CourierID, c.SenderName, c.ReceiverName, SUM(p.Amount) AS TotalPayment
FROM Courier c
LEFT JOIN Payment p ON c.CourierID = p.CourierID
GROUP BY c.CourierID, c.SenderName, c.ReceiverName;

-- 28. List payments made on a specific date
SELECT *
FROM Payment
WHERE PaymentDate = '2024-04-12';

-- 29. Get Courier Information for Each Payment 
SELECT p.*, c.*
FROM Payment p
LEFT JOIN Courier c ON p.CourierID = c.CourierID;

-- 30. Get Payment Details with Location 
select p.*,l.LocationName
from Payment p
LEFT JOIN Location l ON p.LocationID=l.LocationID;

-- 31. Calculating Total Payments for Each Courier 
select c.ServiceName,sum(p.Amount) AS TotalPayments
from CourierServices c
LEFT JOIN Payment p ON c.CourierID=p.CourierID
group by c.ServiceName;

-- 32. List Payments Within a Date Range 
SELECT *
FROM Payment
WHERE PaymentDate between '2024-04-10' and '2024-04-15';

-- 33. Retrieve a list of all users and their corresponding courier records, including cases where there are 
-- no matches on either side 
SELECT u.*, c.*
FROM User u
LEFT JOIN Courier c ON u.UserID = c.UserID;

-- 34. Retrieve a list of all couriers and their corresponding services, including cases where there are no 
-- matches on either side 
SELECT c.*, cs.*
FROM Courier c
LEFT JOIN CourierServices cs ON c.CourierID = cs.CourierID;

-- 35. Retrieve a list of all employees and their corresponding payments, including cases where there are 
-- no matches on either side 
SELECT e.*,p.*
FROM Employee e
LEFT JOIN Payment p ON e.EmployeeID=p.EmployeeID;

-- 36. List all users and all courier services, showing all possible combinations. 
SELECT u.*, cs.*
FROM User u
CROSS JOIN CourierServices cs;

-- 37. List all employees and all locations, showing all possible combinations: 
SELECT u.*, cs.*
FROM User u
CROSS JOIN CourierServices cs;

-- 38. Retrieve a list of couriers and their corresponding sender information (if available) 
SELECT c.* , u.Name,u.Address 
FROM Courier c Left JOIN User u ON c.SenderName=u.Name;

-- 39. Retrieve a list of couriers and their corresponding receiver information (if available)
SELECT c.*, u.Name AS ReceiverName, u.Address AS ReceiverAddress
FROM Courier c
LEFT JOIN User u ON c.UserID = u.UserID;

-- 40. Retrieve a list of couriers along with the courier service details (if available)
SELECT c.*, cs.* FROM Courier c LEFT JOIN CourierServices cs ON c.CourierID = cs.CourierID;

-- 41. Retrieve a list of employees and the number of couriers assigned to each employee
SELECT e.EmployeeID, e.Name, COUNT(c.CourierID) AS TotalCouriersAssigned
FROM Employee e
LEFT JOIN Courier c ON e.EmployeeID = c.EmployeeID 
GROUP BY e.EmployeeID, e.Name;

-- 42. Retrieve a list of locations and the total payment amount received at each location
SELECT l.LocationID, l.LocationName, SUM(p.Amount) AS TotalPayment
 FROM Location l
 LEFT JOIN Payment p ON l.LocationID = p.LocationID
 GROUP BY l.LocationID, l.LocationName;

-- 43. Retrieve all couriers sent by the same sender (based on SenderName)
SELECT c.*
FROM Courier c
JOIN (SELECT SenderName FROM Courier GROUP BY SenderName HAVING COUNT(*) > 1) s
ON c.SenderName = s.SenderName;

-- 44. List all employees who share the same role. 
SELECT Role, GROUP_CONCAT(Name) AS Employees
FROM Employee
GROUP BY Role;

-- 45. Retrieve all payments made for couriers sent from the same location. 
SELECT p1.*, p2.* FROM Payment p1 JOIN Payment p2 ON p1.LocationID = p2.LocationID AND p1.CourierID <> p2.CourierID;

-- 46. Retrieve all couriers sent from the same location (based on SenderAddress). 
SELECT c1.*, c2.* FROM Courier c1 JOIN Courier c2 ON c1.SenderAddress = c2.SenderAddress AND c1.CourierID <> c2.CourierID;

-- 47. List employees and the number of couriers they have delivered: 
SELECT e.EmployeeID, e.Name, COUNT(c.CourierID) AS TotalCouriersDelivered FROM Employee e LEFT JOIN Courier c ON e.EmployeeID = c.EmployeeID  GROUP BY e.EmployeeID, e.Name;

-- 48. Find couriers that were paid an amount greater than the cost of their respective courier services
SELECT p.*
FROM Payment p
JOIN CourierServices cs ON p.CourierID = cs.CourierID
WHERE p.Amount > cs.Cost;

-- 49. Find couriers that have a weight greater than the average weight of all couriers
SELECT * FROM Courier WHERE Weight > (SELECT AVG(Weight) FROM Courier);

-- 50. Find the names of all employees who have a salary greater than the average salary
SELECT Name FROM Employee WHERE Salary > (SELECT AVG(Salary) FROM Employee);

-- 51. Find the total cost of all courier services where the cost is less than the maximum cost
SELECT SUM(Cost) AS TotalCost FROM CourierServices WHERE Cost < (SELECT MAX(Cost) FROM CourierServices);

-- 52. Find all couriers that have been paid for
SELECT DISTINCT c.* FROM Courier c JOIN Payment p ON c.CourierID = p.CourierID;

-- 53. Find the locations where the maximum payment amount was made
SELECT l.* FROM Location l JOIN Payment p ON l.LocationID = p.LocationID WHERE Amount = (SELECT MAX(Amount) FROM Payment);

-- 54. Find all couriers whose weight is greater than the weight of all couriers sent by a specific sender (e.g., 'SenderName'):
SELECT c.*
FROM Courier c
WHERE Weight > ALL (SELECT Weight FROM Courier WHERE SenderName = 'Anjali');


