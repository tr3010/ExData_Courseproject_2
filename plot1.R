# Read data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total PM2.5 emissions in the US decreased from 1999 to
# 2008?
total.emissions <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')
barplot(height=total.emissions$Emissions, names.arg=total.emissions$year,
        xlab="Year", ylab=expression('PM'[2.5]*' emission'),
        main=expression('Total US PM'[2.5]*' Emission 1999 - 2008'))
dev.off()
