
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

## Setup Instructions
1. **Prerequisites**:
   - MySQL or MariaDB server installed.
   - A database client (e.g., MySQL Workbench, phpMyAdmin, or command-line client).

2. **Create the Database**:
   - Create a new database: `CREATE DATABASE sales_management_system;`
   - Use the database: `USE sales_management_system;`

3. **Run the Schema**:
   - Execute the provided SQL scripts to create the tables (in the order: Customers, Categories, Products, Orders, Order_Items, Payments, Warranties).

4. **Populate with Dummy Data**:
   - Run the INSERT statements provided in the project files to add sample data. Ensure you insert in dependency order to avoid foreign key errors:
     - Customers
     - Categories
     - Products
     - Orders
     - Order_Items
     - Warranties
     - Payments

## Usage
- **Querying Data**: Use standard SQL queries to retrieve information, e.g.:
  - List all customers: `SELECT * FROM Customers;`
  - View orders with customer details: `SELECT o.order_id, c.name, o.total_amount FROM Orders o JOIN Customers c ON o.customer_id = c.customer_id;`
- **Testing**: The dummy data includes sample orders, payments, and warranties for validation.
- **Maintenance**: Update stock levels, add new products, or process refunds as needed.

## Files in the Project
- `schema.sql`: Contains the CREATE TABLE statements for all tables.
- `dummy_data.sql`: Contains INSERT statements for populating tables with sample data.
- `README.md`: This file, explaining the project and setup.

## Contributing
- Fork the repository and submit pull requests for improvements.
- Report issues or suggest new features via GitHub issues.

## License
This project is licensed under the MIT License. See LICENSE file for details.

