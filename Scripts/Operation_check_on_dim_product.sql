USE EO_AdventureWorksDW2022
GO
SELECT * 
FROM dim_product;

SELECT COUNT(*) 
FROM dim_product;   -- In first ssis package run we recived 504 row and we have an old row in product dimension

select product_sk, product_sk % 10 as calculated_col
from dim_product;

-- delete all records % 10 = 5 like 15 , 25 , 35 and so on
delete from dim_product where product_sk % 10 = 5;

-- update product color column (Changing SCD Type)
update dim_product set color = 'Red-Yellow'
where product_sk % 10 = 2;

-- update recorder_point column (Historical SCD Type)
update dim_product set reorder_point = ROUND(reorder_point * 1.2,0)
where product_sk % 10 = 7;

-----------------------
select count(*) --all historical records
from dim_product
where end_date is not null;

select * --all historical records
from dim_product
where end_date is not null;