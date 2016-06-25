CODORRetailSales-KB.Rmd
========================================================
author: Katia Becker
date: Sat Jun 25 11:35:52 2016
Coursera Data Science Developing Data Products Assignment with Shiny and RPres.  

The shiny application can be found at:   
<https://katiabecker.shinyapps.io/CODORRetailSales/>

About Application
====================================
This is a Shiny application built for Coursera Data Science Developing Data Products Course to visualize data from Colorado Department of Revenue website.  
 <https://www.colorado.gov/revenue>.    
 
The goal of this project is to build a shiny application, learn its functionality and create a slide presentation about it.   
This Presentation will explain the shiny application and how to display Retail Sales data for Colorado.

Data
====================================
To download the data you will need to go to <https://www.colorado.gov/pacific/revenue/retail-sales-report> and 
choose the dataset you want to download.   

I downloaded each excel file from 2010 to 2015, (72 excel files), and compiled them using R into one csv file.  

The dataset consists of 6 columns and 154,440 rows with Retail Sales information for all Colorado Counties by Industry. 

Data Summary
========================================================




```
    county            industry         calendar_year      amount       
 Length:154440      Length:154440      Min.   :2010   Min.   :      0  
 Class :character   Class :character   1st Qu.:2011   1st Qu.:    125  
 Mode  :character   Mode  :character   Median :2012   Median :    865  
                                       Mean   :2012   Mean   :  19369  
                                       3rd Qu.:2014   3rd Qu.:   5331  
                                       Max.   :2015   Max.   :3833484  
                                                      NA's   :30996    
    period            period_num   
 Length:154440      Min.   : 1.00  
 Class :character   1st Qu.: 3.75  
 Mode  :character   Median : 6.50  
                    Mean   : 6.50  
                    3rd Qu.: 9.25  
                    Max.   :12.00  
                                   
```

Instructions
====================================
Sections you will see in my shiny application.   
**Data**   
You will be able to select a range of years, industry, and one or multiple counties.Depends of your selections, the data table at the right side will be updated automatically.   

**Graphics**   
*Retail Sales by Industry* Bars diagram, shows retail sales amounts by industry amount  
*Retail Sales on selected Industry by County* Bars diagram, shows retail sales amount by county  
*Retail Sales on selected Industry and County by Year* Diagram, shows retail sales amount according with your selection of industries and counties.
