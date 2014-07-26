# Read data files
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Have total PM2.5 emissions in Baltimore City, Maryland decreased from
# 1999 to 2008?
bmore.emissions <- NEI[NEI$fips=="24510",]
# group emissions by year
bmore.emissions.by.year <- aggregate(Emissions ~ year, bmore.emissions, sum)

png('plot2.png')
barplot(height=bmore.emissions.by.year$Emissions,
        names.arg=bmore.emissions.by.year$year,
        xlab="Year", ylab=expression('PM'[2.5]*' emission'),
        main=expression('Total PM'[2.5]*' emissions in Baltimore City, '*
            'Maryland 1999 - 2008'))
dev.off()
