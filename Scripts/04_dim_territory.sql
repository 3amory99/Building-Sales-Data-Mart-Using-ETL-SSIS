USE EO_AdventureWorksDW2022
GO
-- dropping the foreign keys
IF EXISTS (SELECT *
           FROM   sys.foreign_keys
           WHERE  NAME = 'fk_fact_sales_dim_territory' AND parent_object_id = Object_id('fact_sales'))
	ALTER TABLE fact_sales DROP CONSTRAINT fk_fact_sales_dim_territory;

-- Drop and create the table
IF EXISTS (SELECT *
           FROM   sys.objects
           WHERE  NAME = 'dim_territory'
                  AND type = 'U')
	DROP TABLE dim_territory

GO
CREATE TABLE dim_territory(
	territory_sk       INT NOT NULL IDENTITY(1, 1),   -- surrogate key
    territory_id       INT NOT NULL,				  -- Bussines key
    territory_name     NVARCHAR(50),
    territory_country  NVARCHAR(400),
    territory_group    NVARCHAR(50),
    
	source_system_code TINYINT NOT NULL,			  -- Metadata
    
	start_date         DATETIME NOT NULL DEFAULT (Getdate()),  -- SCD
    end_date           DATETIME,							   -- SCD
    is_current         TINYINT NOT NULL DEFAULT (1),		   -- SCD
    
	CONSTRAINT pk_dim_territory PRIMARY KEY CLUSTERED (territory_sk)
);


-- Create Foreign Keys
IF EXISTS (SELECT *
           FROM   sys.tables
           WHERE  NAME = 'fact_sales'
                  AND type = 'u')
	ALTER TABLE fact_sales
    ADD CONSTRAINT fk_fact_sales_dim_territory FOREIGN KEY (territory_sk)
    REFERENCES dim_territory(territory_sk);


-- Insert unknown record
SET IDENTITY_INSERT dim_territory ON
INSERT INTO dim_territory
            (territory_sk,
             territory_id,
             territory_name,
             territory_country,
             territory_group,
             source_system_code,
             start_date,
             end_date,
             is_current)
VALUES     (0,
            0,
            'Unknown',
            'Unknown',
            'Unknown',
            0,
            '1900-01-01',
            NULL,
            1)

SET IDENTITY_INSERT dim_territory OFF

-- create indexes
IF EXISTS (SELECT *
           FROM   sys.indexes
           WHERE  NAME = 'dim_territory_territory_id'
                  AND object_id = Object_id('dim_territory'))
	DROP INDEX dim_territory.dim_territory_territory_id;

CREATE INDEX dim_territory_territory_id
ON dim_territory(territory_id); 


