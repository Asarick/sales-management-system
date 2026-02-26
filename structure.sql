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
    status VARCHAR(20) DEFAULT 'Active'
        CHECK (status IN ('Active', 'Completed', 'Failed', 'Refunded')),
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


-- Create CustomerPoints table to store loyalty points for each customer
CREATE TABLE CustomerPoints (
    customer_id INT NOT NULL,
    points INT NOT NULL DEFAULT 0,
    PRIMARY KEY (customer_id),
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id) ON DELETE CASCADE
);

DELIMITER //

-- Create a trigger to calculate and update loyalty points
CREATE TRIGGER after_order_status_update
AFTER UPDATE ON Orders
FOR EACH ROW
BEGIN
    -- Check if the status changed to 'Completed'
    IF NEW.status = 'Completed' AND OLD.status != 'Completed' THEN
        DECLARE remaining_days INT;
        DECLARE earned_points INT;

        -- Calculate the remaining days in the current month
        SET remaining_days = DAY(LAST_DAY(CURDATE())) - DAY(CURDATE());

        -- Calculate points earned
        SET earned_points = FLOOR(remaining_days / 8);

        -- Update the CustomerPoints table
        INSERT INTO CustomerPoints (customer_id, points)
        VALUES (NEW.customer_id, earned_points)
        ON DUPLICATE KEY UPDATE points = points + earned_points;
    END IF;

    -- Handle 'Active' orders (no points awarded)
    IF NEW.status = 'Active' THEN
        -- No action needed for 'Active' orders
        LEAVE;
    END IF;
END //

DELIMITER ;

-- Generate 100,000 dummy data entries
-- Insert 700 customers
INSERT INTO Customers (name, email, phone)
SELECT CONCAT('Customer', n), CONCAT('customer', n, '@example.com'), CONCAT('+2547', LPAD(n, 7, '0'))
FROM (SELECT @row := @row + 1 AS n FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) t1, (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) t2, (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) t3, (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) t4, (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) t5, (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) t6, (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) t7, (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) t8, (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) t9, (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) t10) AS numbers, (SELECT @row := 0) AS init LIMIT 700;

-- Insert 100,000 orders for customers
INSERT INTO Orders (customer_id, order_date, total_amount, status)
SELECT c.customer_id, DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 365) DAY), FLOOR(RAND() * 100000), IF(RAND() > 0.5, 'Completed', 'Active')
FROM Customers c, (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t1, (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4 UNION SELECT 5 UNION SELECT 6 UNION SELECT 7 UNION SELECT 8 UNION SELECT 9 UNION SELECT 10) t2
LIMIT 100000;

-- Insert payments for 700 customers with multiple payments
INSERT INTO Payments (order_id, payment_method, amount, payment_date, status, transaction_id)
SELECT o.order_id, 
       (CASE WHEN RAND() < 0.25 THEN 'Cash' 
             WHEN RAND() < 0.5 THEN 'Card' 
             WHEN RAND() < 0.75 THEN 'Mobile Money' 
             ELSE 'Bank Transfer' END),
       FLOOR(RAND() * 10000 + 1000),
       DATE_ADD('2023-01-01', INTERVAL FLOOR(RAND() * 365) DAY),
       'Completed',
       CONCAT('TXN', FLOOR(RAND() * 1000000))
FROM Orders o
WHERE o.customer_id IN (SELECT customer_id FROM Customers LIMIT 700)
LIMIT 20000;

-- Insert products
INSERT INTO Products (name, category_id, price, stock, brand, model, specifications)
SELECT CONCAT('Product', n), FLOOR(RAND() * 10 + 1), FLOOR(RAND() * 10000 + 100), FLOOR(RAND() * 500 + 10), CONCAT('Brand', n), CONCAT('Model', n), 'Specifications'
FROM (SELECT @row := @row + 1 AS n FROM (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) t1, (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) t2, (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) t3, (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) t4, (SELECT 1 UNION SELECT 2 UNION SELECT 3 UNION SELECT 4) t5) AS numbers, (SELECT @row := 0) AS init LIMIT 1000;

-- Insert order items
INSERT INTO order_items (order_id, product_id, quantity, price)
SELECT o.order_id, p.product_id, FLOOR(RAND() * 5 + 1), p.price
FROM Orders o, Products p
LIMIT 50000;
