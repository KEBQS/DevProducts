---
title: "About"
output: html_document
---

This is a Shiny application built for Coursera Data Science Developing Data Products Course to visualize data from Colorado Department of Revenue website.  
 <https://www.colorado.gov/revenue>.  

##Download Data
To download the data you will need to go to <https://www.colorado.gov/pacific/revenue/retail-sales-report> and 
choose one of the options in the selection criteria to download the excel file(s). One file per month.  

I downloaded each excel file from 2010 to 2015, (72 excel files), and compiled them using R into one csv file, that is the one I am attaching in this project. (The R program to compile the data has not been included in this project)  

##Data Summary
The dataset consists of 154,440 rows with Retail Sales information for all Colorado Counties by Industry. 
Data consists of 6 columns :
county, industry, calendar_year, amount, period, period_num

##Instruction how to operate this Shiny application
You will see 4 sections or tabs :
Data
Graphics
About
Instructions

###Data tab
You will be able to select a range of years, select an industry, and one or multiple counties.
Depends of your selections, the data table at the right side will be updated automatically.

###Graphics tab
You will be able to see 3 graphics:

####Retail Sales by Industry 
Show in a bars diagram, all industries and their respective retail sales amount according with your selection of
years, month, and counties.

####Retail Sales on selected Industry by County
Show in a bars diagram, all counties and their respective retail sales amount according with your selection of years, month, and industries.

####Retail Sales on selected Industry and County by Year
Show in a diagram, retail sales amount according with your selection of industries and counties.

###About
DOcumentation about this shiny application.

###Instructions
Instructions of how to display information using this shiny application.
  
Author : Katia Becker  
