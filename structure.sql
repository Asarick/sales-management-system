CREATE TABLE Customers (
    customer_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    email TEXT UNIQUE NOT NULL,
    phone TEXT
);

CREATE TABLE Categories (
    category_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL UNIQUE,
    description TEXT
);
