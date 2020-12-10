getwd()
setwd("C:/Users/Franco/Documents/Data Science - Johns Hopkins University/Exploratory Data Analysis/Week 4/Exploratory-Data-Analysis-Project-week-4")

NEI <- readRDS("Data/summarySCC_PM25.rds")
SCC <- readRDS("Data/Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

NEI_grouped <- NEI %>% filter(fips == "24510") %>% group_by(type,year) %>% summarise(total_emissions = sum(Emissions))

g <- ggplot(NEI_grouped, aes(year, total_emissions))
g + geom_point() + geom_line() + facet_grid(. ~ type) + theme(plot.title = element_text(hjust = 0.5)) + ggtitle("Total Emissions in Baltimore City by Type of Source and Year from 1999 to 2008")

dev.copy(png, "plot3.png", width  = 780,
         height = 480)
dev.off()