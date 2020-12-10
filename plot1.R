getwd()
setwd("C:/Users/Franco/Documents/Data Science - Johns Hopkins University/Exploratory Data Analysis/Week 4/Exploratory-Data-Analysis-Project-week-4")

NEI <- readRDS("Data/summarySCC_PM25.rds")
SCC <- readRDS("Data/Source_Classification_Code.rds")

library(dplyr)

NEI_grouped <- NEI %>% group_by(year) %>% summarise(total_emissions = sum(Emissions))
    
with(NEI_grouped, plot(year, total_emissions, type="b", main = "Total Emissions by Year from 1999 to 2008",))

dev.copy(png, "plot1.png", width  = 680,
         height = 480)
dev.off()
