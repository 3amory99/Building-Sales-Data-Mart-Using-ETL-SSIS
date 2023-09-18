# Building-Sales-Data-Mart-Using-ETL-SSIS

## Overview:
By using [AdventureWorks2022](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms) Dataset I have built a Sales Data Mart using (SQL Server Integration Services SSIS) SQL Server involves leveraging the capabilities of Integration Services (SSIS) and the Modeling of SQL Server, This Data mart offers several benefits, making them valuable components in the main purpose of data management and analytics within organizations

## Technologies:
* Visual Studio
* SQL Server Integration Services (SSIS)
* SQL Server Management Studio (SSMS)
* SCD (Type 1 and Type 2)
  
### Note:
This data mart is designed for online sales only.

## Project Stages

**1- Data Source Selection:**


* We began by selecting the AdventureWorks2022 database as our primary data source. This OLTP system serves as the foundation for our data mart.

**2- Data Extraction:** 


* Using SQL Server Integration Services (SSIS), we extracted relevant data from the AdventureWorks2022 database. This extraction process involved identifying essential tables and fields for analysis.

**3- Data Cleansing and Preprocessing:**

  
* To ensure data quality and accuracy, we performed data cleansing and preprocessing tasks. This step involved handling missing values, removing duplicates, and transforming data as needed.

**4- Star Schema Design:**


* The foundation of our data mart is the star schema. We meticulously designed this schema to align with the specific analytical requirements of our project. This schema includes dimension tables describing various attributes and a central fact table containing numerical measures.

**5- ETL Development:**


* The core of our data integration process is the development of Extract, Transform, Load (ETL) processes. Leveraging SSIS and other ETL tools, we created workflows to extract data, apply transformations, and load it into the star schema.

**6- Data Mart Population:**


* We populated the data mart with cleansed and transformed data, ensuring that it is readily available for analysis.

- These stages represent the key milestones in our journey to create a Sales Data Mart using SSIS and SQL Server. The resulting star schema empowers my  mindset with an efficient view of data access and valuable insights for informed decision-making.


## Project Workflow:

### Star Schema Design:
Meticulously crafted a star schema that forms the backbone of our data mart. This star schema comprises four dimension tables—Product, Customer, Territory, and Date—and a central fact table housing our key measures and surrogate keys from the dimension tables. This design provides a solid foundation for efficient data analysis and reporting, ensuring that our data mart is well-structured and optimized for our specific analytical needs.
* I generated some SQL Scripts that may help you to create the structure schema of the sales data mart [Scripts](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/tree/master/Scripts) 

![Sales Data Mart Star Schema](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Sales%20Data%20Mart%20Schema.PNG)

### SSIS Packages:
I have created six packages to build this data mart 
* ETL_Dim_Product
* ETL_Dim_Customer
* ETL_Dim_Territory
* ETL_Dim_Date
* Fact_Sales_Full_Load 1
* Fact_Sales_Increamental_Load
  
![SSIS Packages](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/SSIS%20Packages.PNG)

### Product Dim First Load:
This is the first load for Product dimension so you see that I used Slowly Changing Dimensions (SCD) Type 1 and Type 2 as shown to you this is the first load so all of the records have been inserted to the 
destination database without passing to any of the other Historization passes 

![Product Dim First Load](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Product%20Dim%20First%20Load.PNG)

### Product Dim After Making Changes:

* Following the initial load of our Product dimension, we embarked on refining and enhancing this crucial dimension. In this phase, we employed Slowly Changing Dimensions (SCD) techniques, specifically Type 1 and Type 2, to manage changes to dimension data.
* Result: As illustrated in the accompanying image, this stage reflects the state of the Product dimension after implementing the necessary updates. It showcases our commitment to data accuracy and the ability to capture changes effectively. The modified dimension now aligns seamlessly with our evolving business needs, ensuring that our data mart continues to provide valuable insights for informed decision-making.

![Product Dim After Making Changes](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Product%20Dim%20After%20Making%20Changes.PNG)

### Customer Dim First Load:

* The Customer dimension is a vital component of our data mart, and its initial load marks a significant milestone in our project. During this phase, we conducted the first-ever load of data into the Customer dimension, populating it with essential customer information.
* As depicted in the image provided, the data seamlessly passed through the ETL (Extract, Transform, Load) processes, culminating in the successful insertion of customer records into the destination database. It's important to note that this is the inaugural load, where all records are inserted without undergoing any of the historicization or change-tracking processes SCD Type 1 and Type 2.
  
![Customer Dim First Load](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Customer%20Dim.PNG)

### Customer Dim After Making Changes:

* Building on the foundation of our Customer dimension, we initiated a phase dedicated to refining and enhancing this critical dimension. Following the initial load, we implemented adjustments and updates using data management techniques.
* As showcased in the accompanying image, this stage portrays the Customer dimension after incorporating modifications. These enhancements may include updates to customer information, the application of Slowly Changing Dimensions (SCD) techniques, and the adoption of change-tracking mechanisms. These efforts are aimed at ensuring that our Customer dimension accurately represents the evolving landscape of our customer data.

![Customer Dim After Making Changes](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Customer%20Dim%20After%20Making%20Changes.PNG)

### Territory Dim Load:

We find that the [CountryRegionCode] in [AdventureWorks2022] database is considered to only two letters like "US", "CA", "FR" So I have created a table called dbo.lookup_country with the total name of the country like "United States" to be able to ingest data into the data mart.

![Territory Dim](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Territory%20Dim.PNG)

### Date Dim Load:

Extract the date data from the Excel Sheet, you can find it here [Scripts](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/tree/master/Scripts) 

![Date Dim](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Date%20Dim.PNG)

### Fact Table Full Load:

![Fact Table Full Load Control Flow](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Fact%20Table%20Full%20Load%20Control%20Flow.PNG)

![Fact Table Full Load Data Flow](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Fact%20Table%20Full%20Load%20Data%20Flow.PNG)

### Fact Table Incremental Load:

![Fact Table Incremental Load Control Flow](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Fact%20Table%20Increamental%20Load%20Control%20flow.PNG)

![Fact Table Full Load Data Flow](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Fact%20Table%20Full%20Load%20Data%20Flow.PNG)

### Insert New 5 Records in Sources:

![Insert New 5 Records in Sources](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Insert%20New%205%20Records%20in%20Sources.PNG)

### Fact Table Incremental Load:

![Increamental Load Data flow](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Increamental%20Load%20Data%20flow.PNG)

### Check the new insertion data in the Fact Table :

![Increamental data Result](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Increamental%20Result.PNG)

