USE master
go

IF Db_id('EO_AdventureWorksDW2022') IS NOT NULL
  DROP DATABASE EO_AdventureWorksDW2022;

CREATE DATABASE EO_AdventureWorksDW2022
go
