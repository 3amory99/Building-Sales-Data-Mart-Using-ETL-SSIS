USE EO_AdventureWorksDW2022
GO
if exists(select * from sys.tables where name = 'lookup_country')
	drop table lookup_country

create table lookup_country
(
	country_id int not null identity(1,1),
	country_name nvarchar(50) not null,
	country_code nvarchar(2) not null, 
	country_region nvarchar(50)
	);

--drop table lookup_country

insert into lookup_country(country_name,country_code,country_region)
values('United States','US','North America'),
		('Canada','CA','North America'),
	  		('France','FR','Europe'),
		  		('Germany','DE','Europe'),
			  		('Australia','AU','Pacific'),
				  		('United Kingdom','GB','Europe')

select country_id,country_name as territory_country,country_code,country_region as territory_group
from lookup_country

