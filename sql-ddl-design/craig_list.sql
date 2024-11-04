DROP DATABASE IF EXISTS craig_list;
CREATE DATABASE craig_list;
\c craig_list;

CREATE TABLE Region (
    region_id INT PRIMARY KEY,
    region_name VARCHAR(100)
);

-- Inserting data into Region table
INSERT INTO Region
(region_id, region_name)
VALUES
(1, 'North America'),
(2, 'Europe'),
(3, 'Asia'),
(4, 'South America'),
(5, 'Africa'),
(6, 'Australia'),
(7, 'Antarctica');

CREATE TABLE User (
    user_id INT PRIMARY KEY,
    username VARCHAR(100),
    email VARCHAR(100),
    preferred_region_id INT,
    FOREIGN KEY (preferred_region_id) REFERENCES Region(region_id)
);

-- Inserting data into User table
INSERT INTO User 
(user_id, username, email, preferred_region_id) 
VALUES 
(1, 'john_doe', 'john@example.com', 1), 
(2, 'jane_doe', 'jane@example.com', 2);

CREATE TABLE Post (
    post_id INT PRIMARY KEY,
    title VARCHAR(200),
    text TEXT,
    user_id INT,
    location VARCHAR(100),
    region_id INT,
    FOREIGN KEY (user_id) REFERENCES User(user_id),
    FOREIGN KEY (region_id) REFERENCES Region(region_id)
);

-- Inserting data into Post table
INSERT INTO Post
(post_id, title, text, user_id, location, region_id)
VALUES
(1, 'Selling Car', 'Selling my used car, good condition.', 1, 'New York', 1),
(2, 'Apartment for Rent', '2 bedroom apartment for rent.', 2, 'London', 2);

CREATE TABLE Category (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(100)
);

-- Inserting data into Category table
INSERT INTO Category
(category_id, category_name)
VALUES
(1, 'Cars'),
(2, 'Apartments'),
(3, 'Furniture'),
(4, 'Electronics');

CREATE TABLE PostCategory (
    post_id INT,
    category_id INT,
    PRIMARY KEY (post_id, category_id),
    FOREIGN KEY (post_id) REFERENCES Post(post_id),
    FOREIGN KEY (category_id) REFERENCES Category(category_id)
);

-- Inserting data into PostCategory table
INSERT INTO PostCategory
(post_id, category_id)
VALUES
(1, 1),
(2, 2);
