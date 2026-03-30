# 📊 Data Catalog for Gold Layer

## 📌 Overview
The **Gold Layer** represents business-level data structured for analytics and reporting.  
It consists of:

- **Dimension tables** → descriptive attributes  
- **Fact tables** → measurable business metrics  

---

##  1. `gold.dim_customers`

**Purpose:**  
Stores customer details enriched with demographic and geographic data.

### Columns

| Column Name      | Data Type     | Description |
|-----------------|--------------|------------|
| customer_key     | INT           | Surrogate key uniquely identifying each customer record |
| customer_id      | INT           | Unique identifier for each customer |
| customer_number  | NVARCHAR(50)  | Alphanumeric customer reference |
| first_name       | NVARCHAR(50)  | Customer’s first name |
| last_name        | NVARCHAR(50)  | Customer’s last name |
| country          | NVARCHAR(50)  | Customer’s country of residence |
| marital_status   | NVARCHAR(50)  | Marital status (e.g., Married, Single) |
| gender           | NVARCHAR(50)  | Gender (Male, Female, n/a) |
| birthdate        | DATE          | Date of birth (YYYY-MM-DD) |
| create_date      | DATE          | Record creation date |

---

##  2. `gold.dim_products`

**Purpose:**  
Contains product details and attributes for analysis.

### Columns

| Column Name         | Data Type     | Description |
|---------------------|--------------|------------|
| product_key         | INT           | Surrogate key for product |
| product_id          | INT           | Unique product identifier |
| product_number      | NVARCHAR(50)  | Alphanumeric product code |
| product_name        | NVARCHAR(50)  | Product name with details |
| category_id         | NVARCHAR(50)  | Category identifier |
| category            | NVARCHAR(50)  | Product category (e.g., Bikes) |
| subcategory         | NVARCHAR(50)  | Product subcategory |
| maintenance_required| NVARCHAR(50)  | Indicates if maintenance is needed |
| cost                | INT           | Product cost |
| product_line        | NVARCHAR(50)  | Product line (e.g., Road, Mountain) |
| start_date          | DATE          | Product availability date |

---

##  3. `gold.fact_sales`

**Purpose:**  
Stores transactional sales data for reporting and analysis.

### Columns

| Column Name     | Data Type     | Description |
|-----------------|--------------|------------|
| order_number    | NVARCHAR(50)  | Unique sales order ID |
| product_key     | INT           | Links to product dimension |
| customer_key    | INT           | Links to customer dimension |
| order_date      | DATE          | Order placement date |
| shipping_date   | DATE          | Shipping date |
| due_date        | DATE          | Payment due date |
| sales_amount    | INT           | Total sales value |
| quantity        | INT           | Units sold |
| price           | INT           | Price per unit |

---
