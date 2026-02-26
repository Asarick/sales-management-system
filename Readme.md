
## Overview
This project implements a relational database schema for an sales management system. It includes tables for managing customers, products, orders, payments, warranties, and more. The schema is designed using MySQL/MariaDB syntax, with foreign key constraints to ensure data integrity.

The database supports core sales management functionalities such as:
- Customer management
- Product categorization and inventory
- Order processing and item tracking
- Payment handling
- Warranty management

Dummy data has been provided to populate the tables for testing and demonstration purposes.

## Database Schema
The database consists of the following tables:

### 1. Customers
- **Purpose**: Stores customer information.
- **Columns**:
  - `customer_id` (INTEGER, PRIMARY KEY, AUTO_INCREMENT)
  - `name` (TEXT, NOT NULL)
  - `email` (TEXT, UNIQUE, NOT NULL)
  - `phone` (TEXT)

### 2. Categories
- **Purpose**: Defines product categories.
- **Columns**:
  - `category_id` (INTEGER, PRIMARY KEY, AUTO_INCREMENT)
  - `name` (TEXT, NOT NULL, UNIQUE)
  - `description` (TEXT)

### 3. Products
- **Purpose**: Manages product details and inventory.
- **Columns**:
  - `product_id` (INTEGER, PRIMARY KEY, AUTO_INCREMENT)
  - `name` (TEXT, NOT NULL)
  - `category_id` (INTEGER, FOREIGN KEY to Categories)
  - `price` (REAL, NOT NULL, CHECK > 0)
  - `stock` (INTEGER, NOT NULL, CHECK >= 0)
  - `brand` (TEXT)
  - `model` (TEXT)
  - `specifications` (TEXT)

### 4. Orders
- **Purpose**: Tracks customer orders.
- **Columns**:
  - `order_id` (INTEGER, PRIMARY KEY, AUTO_INCREMENT)
  - `customer_id` (INTEGER, NOT NULL, FOREIGN KEY to Customers)
  - `order_date` (DATE, NOT NULL)
  - `total_amount` (REAL, NOT NULL, CHECK >= 0)

### 5. Order_Items
- **Purpose**: Details items within each order.
- **Columns**:
  - `order_item_id` (INTEGER, PRIMARY KEY, AUTO_INCREMENT)
  - `order_id` (INTEGER, NOT NULL, FOREIGN KEY to Orders)
  - `product_id` (INTEGER, NOT NULL, FOREIGN KEY to Products)
  - `quantity` (INTEGER, NOT NULL, CHECK > 0)
  - `price` (REAL, NOT NULL, CHECK > 0)

### 6. Payments
- **Purpose**: Records payment details for orders.
- **Columns**:
  - `payment_id` (INT, PRIMARY KEY, AUTO_INCREMENT)
  - `order_id` (INT, NOT NULL, FOREIGN KEY to Orders)
  - `payment_method` (VARCHAR(20), NOT NULL, CHECK IN ('Cash', 'Card', 'Mobile Money', 'Bank Transfer'))
  - `amount` (DECIMAL(10,2), NOT NULL, CHECK > 0)
  - `payment_date` (DATETIME, DEFAULT CURRENT_TIMESTAMP)
  - `status` (VARCHAR(20), DEFAULT 'Completed', CHECK IN ('Pending', 'Completed', 'Failed', 'Refunded'))
  - `transaction_id` (VARCHAR(100))

### 7. Warranties
- **Purpose**: Manages warranties for order items.
- **Columns**:
  - `warranty_id` (INT, PRIMARY KEY, AUTO_INCREMENT)
  - `order_item_id` (INT, NOT NULL, FOREIGN KEY to Order_Items)
  - `warranty_period_months` (INT, NOT NULL)
  - `start_date` (DATE, NOT NULL)
  - `end_date` (DATE, NOT NULL)
  - `terms` (TEXT)

# Entity Relationships

**Purpose**: The tables are connected using foreign key constraints to model real-world sales workflows and enforce referential integrity.
### 1. Customers → Orders (One-to-Many)
 - A single customer can place multiple orders.
 - Each order belongs to exactly one customer.

# Foreign Key Relationship:
` Orders.customer_id` → `Customers.customer_id`

### 2. Categories → Products (One-to-Many)
- A category can contain multiple products.
- Each product belongs to exactly one category.

# Foreign Key Relationship:
` Products.category_id` → `Categories.category_id`

### 3. Orders → Order_Items (One-to-Many)
- An order can contain multiple order items.
- Each order item belongs to exactly one order.

# Foreign Key Relationship:
 `Order_Items.order_id` → `Orders.order_id`

### 4. Products → Order_Items (One-to-Many)

- A product can appear in multiple order items.
- Each order item references one product.

# Foreign Key Relationship:
`Order_Items.product_id` → `Products.product_id`

### 5. Orders → Payments (One-to-Many)
 - An order can have one or more payment records.
 - Each payment belongs to exactly one order.

# Foreign Key Relationship:
`Payments.order_id` → `Orders.order_id`
This allows support for partial payments, installments, and refunds.

### 6. Order_Items → Warranties (One-to-One or One-to-Many)
 - Each order item can have an associated warranty.
 - A warranty must reference a valid order item.

# Foreign Key Relationship:
`Warranties.order_item_id` → `Order_Items.order_item_id`

 - This ensures warranties are tied to specific purchased items.

### Entity Relationship Flow

The logical flow of the system is:
 - Customer → places → Order → contains → Order_Items → reference → Products → belong to → Categories

 - Order → processed by → Payments

 - Order_Items → may include → Warranties

## Referential Integrity
 - All foreign key constraints ensure:
 - No orphan records
 - Consistent transactional data
 - Accurate modeling of real-world sales processes

Usage
Querying Data

# List all customers:
`SELECT * FROM Customers;`

# View orders with customer details:

`SELECT o.order_id, c.name, o.total_amount`
`FROM Orders o`
`JOIN Customers c ON o.customer_id = c.customer_id;`

# Testing
 - Dummy data includes sample orders, payments, and warranties for validation.

# Maintenance
- Update stock levels, add new products, process refunds, and manage warranties as needed.

## Usage
- **Querying Data**: Use standard SQL queries to retrieve information, e.g.:
  - List all customers: `SELECT * FROM Customers;`
  - View orders with customer details: `SELECT o.order_id, c.name, o.total_amount FROM Orders o JOIN Customers c ON o.customer_id = c.customer_id;`
- **Testing**: The dummy data includes sample orders, payments, and warranties for validation.
- **Maintenance**: Update stock levels, add new products, or process refunds as needed.


## Contributing
- Fork the repository and submit pull requests for improvements.
- Report issues or suggest new features via GitHub issues.

## License
This project is licensed under the MIT License. See LICENSE file for details.

