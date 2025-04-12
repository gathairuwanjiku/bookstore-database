-- Create the bookstore database
CREATE DATABASE Bookstore;
USE Bookstore;

-- Country table
CREATE TABLE Country (
    country_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

-- Address table
CREATE TABLE Address (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(150) NOT NULL,
    city VARCHAR(100),
    state VARCHAR(100),
    postal_code VARCHAR(20),
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES Country(country_id)
);

-- Address status table
CREATE TABLE Address_Status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50) NOT NULL
);

-- Customer table
CREATE TABLE Customer (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20)
);

-- Customer address 
CREATE TABLE Customer_Address (
    customer_id INT,
    address_id INT,
    status_id INT,
    PRIMARY KEY (customer_id, address_id),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (address_id) REFERENCES Address(address_id),
    FOREIGN KEY (status_id) REFERENCES Address_Status(status_id)
);

-- Publisher table
CREATE TABLE Publisher (
    publisher_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(150) NOT NULL,
    country_id INT,
    FOREIGN KEY (country_id) REFERENCES Country(country_id)
);

-- Book language table
CREATE TABLE Book_Language (
    language_id INT AUTO_INCREMENT PRIMARY KEY,
    language_name VARCHAR(100) NOT NULL
);

-- Book table
CREATE TABLE Book (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(200) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    publication_year INT,
    publisher_id INT,
    language_id INT,
    price DECIMAL(10,2),
    stock INT,
    FOREIGN KEY (publisher_id) REFERENCES Publisher(publisher_id),
    FOREIGN KEY (language_id) REFERENCES Book_Language(language_id)
);

-- Author table
CREATE TABLE Author (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    bio TEXT
);

-- Book_Author table 
CREATE TABLE Book_Author (
    book_id INT,
    author_id INT,
    PRIMARY KEY (book_id, author_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id),
    FOREIGN KEY (author_id) REFERENCES Author(author_id)
);

-- Shipping method table
CREATE TABLE Shipping_Method (
    method_id INT AUTO_INCREMENT PRIMARY KEY,
    method_name VARCHAR(100) NOT NULL,
    cost DECIMAL(10,2)
);

-- Order status table
CREATE TABLE Order_Status (
    status_id INT AUTO_INCREMENT PRIMARY KEY,
    status_name VARCHAR(50)
);

-- Customer order table
CREATE TABLE Customer_Order (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    shipping_method_id INT,
    status_id INT,
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id),
    FOREIGN KEY (shipping_method_id) REFERENCES Shipping_Method(method_id),
    FOREIGN KEY (status_id) REFERENCES Order_Status(status_id)
);

-- Order line table
CREATE TABLE Order_Line (
    order_id INT,
    book_id INT,
    quantity INT,
    price DECIMAL(10,2),
    PRIMARY KEY (order_id, book_id),
    FOREIGN KEY (order_id) REFERENCES Customer_Order(order_id),
    FOREIGN KEY (book_id) REFERENCES Book(book_id)
);

-- Order history table
CREATE TABLE Order_History (
    history_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    status_id INT,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES Customer_Order(order_id),
    FOREIGN KEY (status_id) REFERENCES Order_Status(status_id)
);

-- User and their roles
-- Creating user
CREATE USER 'admin_user'@'localhost'
IDENTIFIED BY 'Pass123';

-- Granting Privilege 
GRANT ALL ON bookstore.* TO 'admin_user'@'localhost'

-- Creating user
CREATE USER 'readonly_user'@'localhost'
IDENTIFIED BY 'Read123';

-- Granting Privilege
GRANT SELECT ON bookstore.* TO 'readonly_user'@'localhost'

-- Creating user
CREATE USER 'order_manager'@'localhost'
IDENTIFIED BY 'Order12'

-- Granting Privilege
GRANT SELECT,INSERT,UPDATE ON bookstore.customer_order TO 'order_manager'@'localhost';
GRANT SELECT,INSERT ON bookstore.order_line TO 'order_manager'@'localhost';

