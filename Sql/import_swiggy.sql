CREATE DATABASE SWIGGY;
USE SWIGGY;
SELECT COUNT(*) FROM restaurants;



LOAD DATA LOCAL INFILE '"C:\Users\Abhiram\OneDrive - Abhiram\Desktop\Sql\restaurants.csv"'
INTO TABLE restaurants
FIELDS TERMINATED BY ',' IGNORE 1 LINES;









