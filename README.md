# Immigration-Data-Lake

### Data Engineering Capstone Project

  

#### Project Summary

This project aims to gather data of immigrants to the US and analyze it through many aspects, It aims to answer questions like:

- What is the most popular state for the student immigrants ?

- Does the temperature of a state in a certain month affect the number of immigrants?

- How much does the number of immigrants to a state affect the foreigners born in that state ?

And many more analytical questions.

  

The project follows the follow steps:

* Step 1: Scope the Project and Gather Data

* Step 2: Explore and Assess the Data

* Step 3: Define the Data Model

* Step 4: Run ETL to Model the Data

* Step 5: Complete Project Write Up

  
### Step 1 
#### Data Gathering

  

The project depends on four datasets.

- The first dataset is the [Immigration Dataset](https://www.trade.gov/national-travel-and-tourism-office) which comes from the US National Tourism and Trade Office. This dataset contains information about the immigrant such as his origin country.
- The second dataset is the [Temperature Dataset](https://www.kaggle.com/datasets/berkeleyearth/climate-change-earth-surface-temperature-data). This data tells us the temperature of cities monthly. It is wider than the cities of the united states so we have to select only the records that we need.
- The third dataset is the [US cities demographics Dataset](https://public.opendatasoft.com/explore/dataset/us-cities-demographics/export/) which contains information of each city like how many races live in a city, how many foreigners are born in a city, the population. This dataset can help us study the effect of the immigrants on a state (foreigners born) and also the effect of a state on immigrants (Does immigrants prefer to live in a state with a variety of races or not not for example).
- The final dataset is the [Airport codes Dataset](https://datahub.io/core/airport-codes#data) which contains information about all the airports in a city or state.

#### Scope of the Project
The project aims to gather data from the described four datasets , clean the data and create a data model to serve the data analysts who would like to explore the data more and get powerful insights from it.
We will perform ETL process on the data to reach our final model and store it on s3 as parquet files.
##### Tools and technologies used
- **[AWS EMR](https://aws.amazon.com/emr/)** which is cloud big data solution for petabyte-scale data processing.
- **[PySpark](https://spark.apache.org/docs/latest/api/python/)** for processing and dealing with the large amount of data.
- **[AWS S3](https://aws.amazon.com/s3/)** which is cloud object storage. I used it to store the four datasets and also the data model after processing (extracting , transforming and loading)


### Step 2 
#### Cleaning the Data
- Immigration Data
	- First we decode the labels using the immigration decoding file (also uploaded to S3) for fields like `i94cit` , `i94port`.
	- We convert the `dtadfile` and `dtadddto` to formatted dates.
	- Convert `arrdate` and `depdate` from SAS date format to datetime format.
	- Convert `airportcountry` to lower case letters.
	- Drop null records from both `airportcountry` and `airportstate` columns.
- Demographics Data
	- Convert `city` to lower case letters.
- Temperature Data
	- Filter the country on the United States only.
	- Drop duplicates on ( `dt` , `City`) 
- Airport Data
	- Filter `iso_country` on US only.
	- Extract state code from `iso_region`
	-  Convert `municipality` column to lower case.

### Step 3 
#### Data Model
The model follows the Star Schema 