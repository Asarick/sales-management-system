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
CREATE TABLE warranties (
    warranty_id INT AUTO_INCREMENT PRIMARY KEY,
    order_item_id INT NOT NULL,
    warranty_period_months INT NOT NULL,
    start_date DATE NOT NULL,
    end_date DATE NOT NULL,
    FOREIGN KEY (order_item_id)
        REFERENCES order_items(order_item_id)
        ON DELETE CASCADE
) ENGINE=InnoDB;


CREATE TABLE Products (
    product_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    name TEXT NOT NULL,
    category_id INTEGER,
    price REAL NOT NULL CHECK (price > 0),
    stock INTEGER NOT NULL CHECK (stock >= 0),
    brand TEXT,
    model TEXT,
    specifications TEXT,
    FOREIGN KEY (category_id) REFERENCES Categories(category_id) ON DELETE SET NULL
);

CREATE TABLE Orders (
    order_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    customer_id INTEGER NOT NULL,
    order_date DATE NOT NULL,
    total_amount REAL NOT NULL CHECK (total_amount >= 0),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

CREATE TABLE order_items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL CHECK (quantity > 0),
    price DECIMAL(10,2) NOT NULL CHECK (price > 0),
    CONSTRAINT fk_order_items_order
        FOREIGN KEY (order_id)
        REFERENCES Orders(order_id)
        ON DELETE CASCADE,
    CONSTRAINT fk_order_items_product
        FOREIGN KEY (product_id)
        REFERENCES Products(product_id)
        ON DELETE RESTRICT
) ENGINE=InnoDB;


CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT NOT NULL,
    payment_method VARCHAR(20) NOT NULL
        CHECK (payment_method IN ('Cash', 'Card', 'Mobile Money', 'Bank Transfer')),
    amount DECIMAL(10,2) NOT NULL CHECK (amount > 0),
    payment_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status VARCHAR(20) DEFAULT 'Completed'
        CHECK (status IN ('Pending', 'Completed', 'Failed', 'Refunded')),
    transaction_id VARCHAR(100),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id) ON DELETE CASCADE
) ENGINE=InnoDB;


DELIMITER //

CREATE TRIGGER after_order_item_insert
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    UPDATE Products 
    SET stock = stock - NEW.quantity
    WHERE product_id = NEW.product_id;
END;
//

CREATE TRIGGER auto_generate_warranty
AFTER INSERT ON order_items
FOR EACH ROW
BEGIN
    INSERT INTO warranties (order_item_id, warranty_period_months, start_date, end_date)
    VALUES (
        NEW.order_item_id, 
        12, 
        CURDATE(), 
        DATE_ADD(CURDATE(), INTERVAL 1 YEAR)
    );
END;
//

DELIMITER ;
