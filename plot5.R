getwd()
setwd("C:/Users/Franco/Documents/Data Science - Johns Hopkins University/Exploratory Data Analysis/Week 4/Exploratory-Data-Analysis-Project-week-4")

NEI <- readRDS("Data/summarySCC_PM25.rds")
SCC <- readRDS("Data/Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

NEI_grouped <- NEI %>% filter(fips == "24510" & type == "ON-ROAD") %>% group_by(type,year) %>% summarise(total_emissions = sum(Emissions))


g <- ggplot(NEI_grouped, aes(year, total_emissions))
g + geom_point() + geom_line() + theme(plot.title = element_text(hjust = 0.5)) + 
    ggtitle("Total Motor Vehicle Emissions by Year from 1999 to 2008") +
    theme(legend.title = element_text(face = "bold"))


dev.copy(png, "plot5.png", width  = 780,
         height = 480)
dev.off()