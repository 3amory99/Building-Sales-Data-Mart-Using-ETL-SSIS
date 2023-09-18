# Building-Sales-Data-Mart-Using-ETL-SSIS

## Overview:
By using [AdventureWorks2022](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms) Dataset I have built a Sales Data Mart using (SQL Server Integration Services SSIS) SQL Server involves leveraging the capabilities of Integration Services (SSIS) and the Modeling of SQL Server, This Data mart offers several benefits, making them valuable components in the main purpose of data management and analytics within organizations
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

* These stages represent the key milestones in our journey to create a Sales Data Mart using SSIS and SQL Server. The resulting star schema empowers my  mindset with an efficient view about data access and valuable insights for informed decision-making.

![Sales Data Mart Star Schema](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Sales%20Data%20Mart%20Schema.PNG)


![SSIS Packages](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/SSIS%20Packages.PNG)


![Product Dim First Load](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Product%20Dim%20First%20Load.PNG)


![Product Dim After Making Changes](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Product%20Dim%20After%20Making%20Changes.PNG)

![Customer Dim First Load](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Customer%20Dim.PNG)

![Customer Dim After Making Changes](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Customer%20Dim%20After%20Making%20Changes.PNG)

![Territory Dim](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Territory%20Dim.PNG)

![Date Dim](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Date%20Dim.PNG)

![Fact Table Full Load Control Flow](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Fact%20Table%20Full%20Load%20Control%20Flow.PNG)

![Fact Table Full Load Data Flow](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Fact%20Table%20Full%20Load%20Data%20Flow.PNG)

![Fact Table Increamental Load Control Flow](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Fact%20Table%20Increamental%20Load%20Control%20flow.PNG)

![Fact Table Full Load Data Flow](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Fact%20Table%20Full%20Load%20Data%20Flow.PNG)

![Insert New 5 Records in Sources](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Insert%20New%205%20Records%20in%20Sources.PNG)

![Increamental Load Data flow](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Increamental%20Load%20Data%20flow.PNG)

![Product Dim After Making Changes](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Product%20Dim%20After%20Making%20Changes.PNG)

![Increamental data Result](https://github.com/3amory99/Building-Sales-Data-Mart-Using-ETL-SSIS/blob/master/Output%20Images/Increamental%20Result.PNG)

