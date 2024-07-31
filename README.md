# Music-Store-EDA
# Music Dataset Exploratory Data Analysis (EDA) Project

## Project Overview

This project involves conducting an exploratory data analysis (EDA) on a music dataset consisting of multiple CSV files. The primary objective is to gain insights from the data, uncover patterns, and answer business-related questions. The analysis is performed using Python's Pandas library in Jupyter Notebook for data manipulation and preliminary analysis, followed by further exploration and querying in MySQL Workbench using the SQLAlchemy library. This README file provides a detailed overview of the project, including data sources, methods, and key findings.

## Data Sources

The dataset comprises multiple CSV files, each containing different aspects of the music data:

1. **Artist Information**: Details about the artists.
2. **Invoice Information**: Data related to invoices, including customer purchases.
3. **Customer Information**: Information about customers who made purchases.
4. **Track Information**: Data on individual tracks, including song length and genre.
5. **Album Information**: Details about albums, including the artist and release date.
6. **Playlist Information**: Details about playlist and playlist_track.

## Project Workflow

1. **Data Loading and Initial Exploration**:
   - Loaded multiple CSV files into Pandas DataFrames.
   - Conducted initial data exploration to understand the structure, types, and completeness of the data.
   - Identified and handled missing values, duplicates, and inconsistencies.

2. **Data Cleaning and Preparation**:
   - the data is clean and required no further modifications

3. **Exploratory Data Analysis (EDA)**:
   - Conducted descriptive statistics to summarize the data.
   - Analyzed multidimensional data relationships, such as customer purchases across different genres and artists.

4. **Dynamic Data Import to MySQL**:
   - Used the SQLAlchemy library to dynamically import the cleaned and transformed data into MySQL Workbench.
   - Created necessary tables and relationships in the MySQL database.

5. **SQL-Based Analysis**:
   - Formulated and executed SQL queries to answer key business questions and derive insights from the data.
   - Analyzed data on various dimensions, including artist popularity, customer spending patterns, and genre preferences.
   - Performed advanced SQL queries to identify trends and outliers.

## Key Analysis and Insights
Set 1
1. Who is the senior most employee based on job title? 
2. Which countries have the most Invoices? 
3. What are top 3 values of total invoice? 
4. Which city has the best customers? We would like to throw a promotional Music 
Festival in the city we made the most money. Write a query that returns one city that 
has the highest sum of invoice totals. Return both the city name & sum of all invoice 
totals 
5. Who is the best customer? The customer who has spent the most money will be 
declared the best customer. Write a query that returns the person who has spent the 
most money

Set 2
1. Write query to return the email, first name, last name, & Genre of all Rock Music 
listeners. Return your list ordered alphabetically by email starting with A 
2. Let's invite the artists who have written the most rock music in our dataset. Write a 
query that returns the Artist name and total track count of the top 10 rock bands 
3. Return all the track names that have a song length longer than the average song length. 
Return the Name and Milliseconds for each track. Order by the song length with the 
longest songs listed first

Set 3
1. Find how much amount spent by each customer on artists? Write a query to return 
customer name, artist name and total spent 
2. We want to find out the most popular music Genre for each country. We determine the 
most popular genre as the genre with the highest amount of purchases. Write a query 
that returns each country along with the top Genre. For countries where the maximum 
number of purchases is shared return all Genres 
3. Write a query that determines the customer that has spent the most on music for each 
country. Write a query that returns the country along with the top customer and how 
much they spent. For countries where the top amount spent is shared, provide all 
customers who spent this amount 

## Tools and Technologies Used

- **Python**: For data loading, cleaning, and preliminary analysis.
- **Pandas**: For data manipulation and EDA.
- **Jupyter Notebook**: For interactive data exploration and visualization.
- **SQLAlchemy**: For dynamic data import into MySQL.
- **MySQL Workbench**: For advanced SQL querying and data analysis.

## Conclusion

This project demonstrates a comprehensive approach to exploratory data analysis, leveraging the power of Python for data manipulation and SQL for advanced querying. The insights gained from this analysis can inform business decisions, identify trends, and uncover hidden patterns in the music dataset. The combination of Pandas and SQL provides a robust framework for handling and analyzing complex multidimensional data.

## Future Work

- **Machine Learning**: Implement predictive models to forecast future trends in music purchases and customer behavior.
- **Dashboard Creation**: Develop interactive dashboards for real-time data visualization and insights.
- **Data Integration**: Integrate additional data sources to enrich the analysis and provide more comprehensive insights.

#credits: rishabhnmishra
