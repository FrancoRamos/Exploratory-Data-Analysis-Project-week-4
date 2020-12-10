getwd()
setwd("C:/Users/Franco/Documents/Data Science - Johns Hopkins University/Exploratory Data Analysis/Week 4/Exploratory-Data-Analysis-Project-week-4")

NEI <- readRDS("Data/summarySCC_PM25.rds")
SCC <- readRDS("Data/Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

NEI_grouped_Baltimore <- NEI %>% filter(fips == "24510" & type == "ON-ROAD") %>% group_by(type,year) %>% summarise(total_emissions = sum(Emissions))

NEI_grouped_LA <- NEI %>% filter(fips == "06037" & type == "ON-ROAD") %>% group_by(type,year) %>% summarise(total_emissions = sum(Emissions))

g <- ggplot()
g + 
geom_point(data=NEI_grouped_Baltimore, aes(year, total_emissions, colour = "blue")) + 
geom_line(data=NEI_grouped_Baltimore, aes(year, total_emissions, colour = "blue")) +
geom_point(data=NEI_grouped_LA, aes(year, total_emissions, colour ="red")) + 
geom_line(data=NEI_grouped_LA, aes(year, total_emissions, colour ="red")) +
scale_color_discrete(name = "City", labels = c("Baltimore", "Los Angeles")) + 
theme(plot.title = element_text(hjust = 0.5)) + 
ggtitle("Baltimore and Los Angeles Motor Vehicle Emissions by Year from 1999 to 2008") +
theme(legend.title = element_text(face = "bold"))


dev.copy(png, "plot6.png", width  = 780,
         height = 480)
dev.off()