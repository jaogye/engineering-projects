# data-engineering-projects

# AirFlow

Implement an Airflow pipeline to the following.

## Objective
Develop a pipeline to process air quality data from OpenAQ and store the results in a database.

## Description
To evaluate the quality of living in some cities, we need to analyze the air quality. To do this, we can rely on a subset of the open dataset provided by OpenAQ. You are given a few datasets in ndjson format, which we expect you to process. You can find them [here](https://drive.google.com/file/d/1bH6BM7hrVI9ufuJ5GVGE7QPEwIJAM1xX/view?usp=sharing).

 We need to monitor the 24hr rolling average of the following measures for each city:

1. PM2.5
2. PM10
3. O3
4. NO2
5. CO

We are also interested in the Air Quality Index (AQI) values of the PM2.5 AQI and PM10 AQI, defined on the 24-hour average of PM2.5 and PM10, respectively (see formula in annex). We are only interested in the cities from the countries provided in `countries.csv`.

The data pipeline must take  data from Google drive, process it, and eventually store the resulting data in a SQLite database. The database should contain one or more tables with the hourly value of the metrics mentioned above (24-hour rolling average of PM2.5, PM10, O3 Ozone, NO2, and CO; And AQI PM2.5, and AQI PM10) for each city. 

# Solution
The solution is implemented in pipeline.py and this pipeline has three sequential tasks: extract_files() , get_data(), process_data()

This implementation follows the following principles:

1) The operations are idempotent, given that the previous task was successfully executed
2) Thus, the initial task (extract_files() ) is entirely idempotent

The staging area is the folder c:/tmp and tables obs_tmp in the sqlite database airquality.
The output area is airquality database.  
The file createdb.py creates airquality database.  

## Tasks

### 1) extract_files()

This function extracts from the URL the file input-dataserts.zip. Unzip this file and store its contents in the folder c:/tmp

### 2) get_data()

This function extracts the contents of the ndjson files, filters by countries, save these contents into the table obs_tmp, which stores the raw data from ndson files.

In detail, this function does the following:
This function reads c:/tmp/countries.csv  and load list of countries (country_list).
For each ndjson file, this function reads each json file inside and the contents. 
If the country of the observation is in  country_list and the parameter value is positive, then the data are inserted into obs_tmp 

At the end  obs_tmp  is sorted by country, city, and date and inserted into obs_air. 
Obs_air must be sorted since we need to compute the rolling averages. 

### 3) process_data()

This function reads the table obs_air and accumulates the values and observations for each parameter into the table indicators (from airquality database) for each combination of (country,city, date, and hour). With these accumulated values, we compute the hourly averages of the parameters, and in every insertion, the 24-hour rolling averages are computed based on hourly averages of the parameters.    After the computation of the rolling averages, Air Quality Index of pm25 and pm10 are computed and saved into the Indicators table.
