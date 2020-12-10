getwd()
setwd("C:/Users/Franco/Documents/Data Science - Johns Hopkins University/Exploratory Data Analysis/Week 4/Exploratory-Data-Analysis-Project-week-4")

NEI <- readRDS("Data/summarySCC_PM25.rds")
SCC <- readRDS("Data/Source_Classification_Code.rds")

library(dplyr)
library(ggplot2)

grep("[Cc]oal", SCC$Short.Name, value=TRUE)
coal_filter <- grepl("coal", SCC$Short.Name, ignore.case = T)
SCC_filtered <- SCC[coal_filter,]
NEI_filtered <- NEI %>% filter(SCC %in% SCC_filtered$SCC)
NEI_grouped <- NEI_filtered %>% group_by(type,year) %>% summarise(total_emissions = sum(Emissions))


g <- ggplot(NEI_grouped, aes(year, total_emissions, col=type))
g + geom_point() + geom_line() + theme(plot.title = element_text(hjust = 0.5)) + 
    ggtitle("Total Coal Emissions by Type of Source and Year from 1999 to 2008") +
    scale_colour_discrete(name = "Type of sources") + theme(legend.title = element_text(face = "bold"))


dev.copy(png, "plot4.png", width  = 780,
         height = 480)
dev.off()