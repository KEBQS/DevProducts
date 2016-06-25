# Loading libraries
library(data.table)
require(data.table)
library(dplyr)
#library(magrittr)
library(rCharts)
#library(BH)

#setwd("~/Courses/Rpractice/DataDev")
# Reading Retail dataset
retail <- fread("./DORRetail.csv")
retail <- retail[retail$industry != "All.Industries",]

# Exploratory Sata Analysis
years <- sort(unique(retail$calendar_year))
industries <- sort(unique(retail$industry))
counties <- sort(unique(retail$county))
months <- sort(unique(retail$month))
which.min(retail$amount)
which.max(retail$amount)
retail$timeline <- paste(as.character(retail$calendar_year),".",as.character(retail$period_num),sep="")

## Helper functions

#' Grouping all data
#' 
#' @param dt data.table
#' @param minYear
#' @param maxYear
#' @param month
#' @param industries
#' @param counties
#' @return result data.table
#'
GroupAll <- function(dt, minYear, maxYear, month, industries,
                           counties) {
    result <- dt %>% filter(calendar_year >= minYear, calendar_year <= maxYear,
                            period_num %in% month,
                            industry %in% industries, county %in% counties) 
    return(result)
}

#' Retail Sales data grouped by Year
#' 
#' @param dt data.table
#' @param minYear
#' @param maxYear
#' @return data.table
#'
GroupYear <- function(dt, minYear, maxYear) {
    result <- dt %>% filter(calendar_year >= minYear, calendar_year <= maxYear) 
    return(result)
}


#' Group data for Graphic A
#' 
#' @param dt data.table
#' @param minYear
#' @param maxYear
#' @param month
#' @param industries
#' @param counties
#' @return result data.table
#' 

GroupGraphA <- function(dt, minYear, maxYear, month, counties) {
    dt %>% filter(calendar_year >= minYear, calendar_year <= maxYear,
                  period_num %in% month, county %in% counties) 
    dt <- GroupAll(dt, minYear, maxYear, month, industries, counties)

    result <- dt %>% 
        group_by(industry, calendar_year) %>% 
        summarise(total = amount) %>%
        arrange(calendar_year)
    return(result)
}

#' Group data for Graphic B
#' 
#' @param dt data.table
#' @param minYear
#' @param maxYear
#' @param month
#' @param industries
#' @return result data.table
#' 

GroupGraphB <- function(dt, minYear, maxYear, month, industries) {
    dt %>% filter(calendar_year >= minYear, calendar_year <= maxYear,
                  period_num %in% month, industry %in% industries) 
    dt <- GroupAll(dt, minYear, maxYear, month, industries, counties)
    
    result <- dt %>% 
        group_by(county) %>% 
        summarise(total = amount) %>%
        arrange(county)
    return(result)
}

#' Group data for Graphic C
#' 
#' @param dt data.table
#' @param minYear
#' @param maxYear
#' @param month
#' @param industries
#' @param counties
#' @return result data.table
#' 

GroupGraphC <- function(dt, minYear, maxYear, month, industries, counties) {
    minYear <- 2010
    maxYear <- 2015
    month <- 1:12
    dt %>% filter(calendar_year >= 2010, calendar_year <= 2015,
            period_num %in% month, industry %in% industries, county %in% counties) 
    dt <- GroupAll(dt, minYear, maxYear, month, industries, counties)
    
    result <- dt %>% 
        group_by(timeline) %>% 
        summarise(total = amount) %>%
        arrange(timeline)
    return(result)
}

#' Graphic 1 : Retail Sales by Industry
#' 
#' @param dt data.table
#' @param dom
#' @param xAxisLabel Industry
#' @param yAxisLabel Retail Sales
#' @return GraphA plot
plotGraphA <- function(dt, dom = "GraphA", 
                                  xAxisLabel = "Industry",
                                  yAxisLabel = "Retail Sales Amount") {
    
    GraphA <- nPlot(
        total ~ industry,
        data = dt,
        type = "multiBarChart",
        dom = dom, width = 650
    )
    GraphA$chart(margin = list(left = 100))
    GraphA$chart(color = c('green', 'orange', 'blue'))
    GraphA$chart(tooltipContent = "#! function(key, x, y, e){ 
  return '<h5><b>Industry</b>: ' + e.point.industry + '<br>' + '<b>Total</b>: ' 
    + e.point.total + '<br>'
    + '</h5>'
} !#")
    GraphA$yAxis(axisLabel = yAxisLabel, width = 80)
    GraphA$xAxis(axisLabel = xAxisLabel, width = 70)
    GraphA
    }

#' Graphic 2 : Retail Sales on Selected Industry by Month
#' 
#' @param dt data.table
#' @param dom
#' @param xAxisLabel County
#' @param yAxisLabel Retail Sales
#' @return GraphB plot
plotGraphB <- function(dt, dom = "GraphB", 
                       xAxisLabel = "County",
                       yAxisLabel = "Retail Sales Amount") {
    
    GraphB <- nPlot(
        total ~ county,
        data = dt,
        type = "multiBarChart",
        dom = dom, width = 650
    )
    GraphB$chart(margin = list(left = 100))
    GraphB$chart(color = c('purple', 'orange', 'blue'))
    GraphB$chart(tooltipContent = "#! function(key, x, y, e){ 
  return '<h5><b>County</b>: ' + e.point.county + '<br>' + '<b>Total</b>: ' 
    + e.point.total + '<br>'
    + '</h5>'
} !#")
    GraphB$yAxis(axisLabel = yAxisLabel, width = 80)
    GraphB$xAxis(axisLabel = xAxisLabel, width = 70)
    GraphB
}

#' Graphic 3 : Retail Sales on Selected Industry by Month
#' 
#' @param dt data.table
#' @param dom
#' @param xAxisLabel County
#' @param yAxisLabel Retail Sales
#' @return GraphC plot
plotGraphC <- function(dt, dom = "GraphC", 
                       xAxisLabel = "Year",
                       yAxisLabel = "Retail Sales Amount") {
    
    GraphC <- nPlot(
        total ~ timeline,
        data = dt,
        type = "scatterChart",
        dom = dom, width = 650
    )
    GraphC$chart(margin = list(left = 100), 
                 showDistX = TRUE,
                 showDistY = TRUE)
    GraphC$chart(color = c('yellow', 'orange', 'blue'))
    GraphC$chart(tooltipContent = "#! function(key, x, y, e){ 
                 return '<h5><b>Year</b>: ' + e.point.timeline + '<br>' + '<b>Total</b>: ' 
                 + e.point.total + '<br>'
                 + '</h5>'
            } !#")
    GraphC$yAxis(axisLabel = yAxisLabel, width = 80)
    GraphC$xAxis(axisLabel = xAxisLabel, width = 70)
    GraphC
    
    }
