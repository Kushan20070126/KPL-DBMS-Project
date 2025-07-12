# Kurunegala Plantations Limited Coconut Trade Database System

![ER Diagram](https://github.com/Kushan20070126/KPL-DBMS-Project/blob/main/DBMS_CW.png)

A comprehensive database project for managing coconut trade operations at Kurunegala Plantations Limited (KPL), including estates, suppliers, buyers, orders, shipments, payments, warehouses, and quality inspections.

---

## Table of Contents

- [About the Project](#about-the-project)
- [Features](#features)
- [Database Design](#database-design)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Sample SQL Queries](#sample-sql-queries)
- [Project Structure](#project-structure)
- [Contributing](#contributing)
- [License](#license)

---

## About the Project

Kurunegala Plantations Limited (KPL) is a government-owned company in Sri Lanka specializing in coconut cultivation and trade. This project implements a relational database to centralize and streamline all key operations, ensuring data accuracy, efficient management, and robust reporting.

---

## Features

- Centralized management of estates, suppliers, buyers, and batches.
- Order processing and shipment tracking.
- Payment and inventory management across multiple warehouses.
- Quality inspection records and audit trails.
- Reporting and data analysis capabilities.
- SQL scripts for database creation, data insertion, and advanced queries.

---

## Database Design

### Entity-Relationship Diagram (ERD)

- **Entities:** Estate, Supplier, Batch, Buyer, Order, OrderDetail, Shipment, Payment, Warehouse, Inventory, Transporter, QualityInspection
- **Key Relationships:**  
  - One estate produces many batches  
  - One supplier supplies many batches  
  - One buyer places many orders  
  - One order can have multiple shipments and payments  
  - One batch can have multiple quality inspections and inventory records

### Relational Schema

| Table             | Primary Key     | Foreign Keys                     |
|-------------------|----------------|----------------------------------|
| Estate            | EstateID       |                                  |
| Supplier          | SupplierID     |                                  |
| Batch             | BatchID        | EstateID, SupplierID             |
| Buyer             | BuyerID        |                                  |
| Order             | OrderID        | BuyerID                          |
| OrderDetail       | OrderDetailID  | OrderID, BatchID                 |
| Shipment          | ShipmentID     | OrderID, TransporterID           |
| Payment           | PaymentID      | OrderID                          |
| Warehouse         | WarehouseID    |                                  |
| Inventory         | InventoryID    | WarehouseID, BatchID             |
| Transporter       | TransporterID  |                                  |
| QualityInspection | InspectionID   | BatchID                          |

---

## Getting Started

### Prerequisites

- SQL Server or compatible RDBMS
- SQL client (e.g., SQL Server Management Studio)

### Installation

1. Clone the repository:
    ```
    git clone https://github.com/Kushan20070126/KPL-DBMS-Project.git
    cd kpl-coconut-db
    ```
2. Open the SQL script files in your SQL client.
3. Execute the scripts in order:
    - `01_create_tables.sql`
    - `02_insert_sample_data.sql`
    - `03_procedures_functions_triggers.sql`

---

## Usage

- Run provided SQL queries to generate reports and analyze data.
- Modify or extend the database structure as needed for your organization.

---

## Sample SQL Queries

