USE EO_AdventureWorksDW2022
GO
-- delete 10% records in dim_customer
delete from dbo.dim_customer where customer_sk % 10 = 3;

-- update city records in dim_customer to check (Changing SCD Type 1)
update dim_customer set city = 'Alex'
where city = 'London'

-- update phone records in dim_customer to check (Historical SCD Type 2)
UPDATE dim_customer 
SET    phone = Substring(phone, 10, 3) 
               + Substring(phone, 4, 5) + Substring(phone, 9, 1) 
               + Substring(phone, 1, 3) 
WHERE  Len(phone) = 12 AND LEFT(phone, 3) BETWEEN '101' AND '125'; 


-- check
SELECT customer_id, 
       Count(*) 
FROM   dim_customer 
GROUP  BY customer_id 
HAVING Count(*) > 1 

SELECT * 
FROM   dim_customer 
WHERE  customer_id = 11036 



	