DROP TABLE IF EXISTS users;


CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL
);


INSERT INTO users (username, password) VALUES
('user1', '$2b$10$z0.WR3ltM9oL3XkDW1iSwu3pFgofl.GPHK3.QXC0yCme.DpdgTTI6'), -- Password: password1
('user2', '$2b$10$t1dcg.t/AS/PZYu5zQ5dyeyK/kXXC5/hc2f.GTbRWLJ9XenfV4/1C'), -- Password: password2
('user3', '$2b$10$dwotzUvh77LpNUoMvlS3pul9P7RofG6lfz9/qUGd.WNw29NcxYBEW'); -- Password: password3


--

DROP TABLE IF EXISTS assets;


CREATE TABLE assets (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255),
    value DECIMAL(10, 2),
    location VARCHAR(255),
    continent VARCHAR(50),
    duration VARCHAR(50)
);


INSERT INTO assets (name, value, location, continent, duration) VALUES
('Asset 1', 100000.00, 'New York', 'North America', '1 year'),
('Asset 2', 75000.00, 'London', 'Europe', '6 months'),
('Asset 3', 50000.00, 'Tokyo', 'Asia', '2 years'),
('Asset 4', 60000.00, 'Los Angeles', 'North America', '1 year'),
('Asset 5', 45000.00, 'Chicago', 'North America', '6 months'),
('Asset 6', 80000.00, 'Houston', 'North America', '2 years'),
('Asset 7', 55000.00, 'Miami', 'North America', '1 year'),
('Asset 8', 70000.00, 'Sydney', 'Australia', '1 year'),
('Asset 9', 65000.00, 'Rio de Janeiro', 'South America', '2 years'),
('Asset 10', 90000.00, 'Cairo', 'Africa', '1 year'),
('Asset 11', 85000.00, 'Toronto', 'North America', '1 year'),
('Asset 12', 95000.00, 'Mexico City', 'North America', '1 year'),
('Asset 13', 60000.00, 'Berlin', 'Europe', '2 years'),
('Asset 14', 55000.00, 'Moscow', 'Europe', '1 year'),
('Asset 15', 80000.00, 'São Paulo', 'South America', '1 year'),
('Asset 16', 70000.00, 'Jakarta', 'Asia', '2 years'),
('Asset 17', 60000.00, 'Bangkok', 'Asia', '1 year'),
('Asset 18', 85000.00, 'Dubai', 'Asia', '1 year'),
('Asset 19', 95000.00, 'Mumbai', 'Asia', '1 year'),
('Asset 20', 70000.00, 'Cape Town', 'Africa', '2 years'),
('Asset 21', 60000.00, 'Nairobi', 'Africa', '1 year'),
('Asset 22', 55000.00, 'Buenos Aires', 'South America', '1 year'),
('Asset 23', 80000.00, 'Lima', 'South America', '1 year'),
('Asset 24', 70000.00, 'Madrid', 'Europe', '2 years'),
('Asset 25', 55000.00, 'Paris', 'Europe', '1 year'),
('Asset 26', 60000.00, 'Rome', 'Europe', '1 year'),
('Asset 27', 70000.00, 'Athens', 'Europe', '2 years'),
('Asset 28', 80000.00, 'Dublin', 'Europe', '1 year'),
('Asset 29', 65000.00, 'Amsterdam', 'Europe', '1 year'),
('Asset 30', 75000.00, 'Stockholm', 'Europe', '2 years'),
('Asset 31', 55000.00, 'Oslo', 'Europe', '1 year'),
('Asset 32', 60000.00, 'Helsinki', 'Europe', '1 year'),
('Asset 33', 70000.00, 'Copenhagen', 'Europe', '2 years');
