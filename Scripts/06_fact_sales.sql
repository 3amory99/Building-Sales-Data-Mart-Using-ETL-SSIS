USE EO_AdventureWorksDW2022
GO
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'fact_sales')
	DROP TABLE fact_sales;


CREATE TABLE fact_sales
  (
     product_sk    INT NOT NULL,             -- surrogate key as a forigen key
     customer_sk   INT NOT NULL,             -- surrogate key as a forigen key
     territory_sk  INT NOT NULL,             -- surrogate key as a forigen key
     order_date_sk INT NOT NULL,             -- surrogate key as a forigen key
     sales_order_id VARCHAR(50) NOT NULL,    -- as a primary key
     line_number    INT NOT NULL,			 -- as a primary key
     quantity       INT,					 -- Measure
     unit_price     MONEY,					 -- Measure
     unit_cost      MONEY,					 -- Measure
     tax_amount     MONEY,					 -- Measure
     freight        MONEY,					 -- Measure
     extended_sales MONEY,					 -- Measure
     extened_cost   MONEY,					 -- Measure

     created_at     DATETIME NOT NULL DEFAULT(Getdate()),   	 -- Metadata
     CONSTRAINT pk_fact_sales PRIMARY KEY CLUSTERED (sales_order_id, line_number),
     CONSTRAINT fk_fact_sales_dim_product FOREIGN KEY (product_sk) REFERENCES dim_product(product_sk),
     CONSTRAINT fk_fact_sales_dim_customer FOREIGN KEY (customer_sk) REFERENCES dim_customer(customer_sk),
     CONSTRAINT fk_fact_sales_dim_territory FOREIGN KEY (territory_sk) REFERENCES dim_territory(territory_sk),
     CONSTRAINT fk_fact_sales_dim_date FOREIGN KEY (order_date_sk) REFERENCES dim_date(date_sk)
  );


-- Create Indexes on forigen keys
-- Create Indexes for Product key
IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'fact_sales_dim_product'
                  AND object_id = Object_id('fact_sales'))
	DROP INDEX fact_sales.fact_sales_dim_product;

CREATE INDEX fact_sales_dim_product
ON fact_sales(product_sk);

-- Create Indexes for Customer key
IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'fact_sales_dim_customer'
                  AND object_id = Object_id('fact_sales'))
	DROP INDEX fact_sales.fact_sales_dim_customer;

CREATE INDEX fact_sales_dim_customer
ON fact_sales(customer_sk);

-- Create Indexes for Territor key
IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'fact_sales_dim_territory'
                  AND object_id = Object_id('fact_sales'))
  DROP INDEX fact_sales.fact_sales_dim_territory;

CREATE INDEX fact_sales_dim_territory
ON fact_sales(territory_sk);

-- Create Indexes for Order Date key
IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'fact_sales_dim_date'
                  AND object_id = Object_id('fact_sales'))
  DROP INDEX fact_sales.fact_sales_dim_date;

CREATE INDEX fact_sales_dim_date
ON fact_sales(order_date_sk); 