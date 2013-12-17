# Lake Huron - Water level analysis
huron <- read.csv("../datasets/Huron_water_levels/huronLevel.csv")
str(huron)

# Convert Factors to Dates
huron$Date <- as.Date(huron$Date,"%m/%d/%Y")
str(huron)

# Display a few rows
head(huron)

# Create a Line Plot
plot(huron$Date,huron$Level,type="l",xlab="Year",ylab="Height (m)", main="Lake Huron - Daily Water Levels")

# Find the maximum and minimum water levels for the entire data set
minLevel <- min(huron$Level)
maxLevel <- max(huron$Level)
diff <- maxLevel-minLevel

low.levels <- with(huron,abs(huron$Level-minLevel) < (.05 * diff))
high.levels <- with(huron,abs(huron$Level-maxLevel) < (.05* diff))

# Find the days within 5% of the range of lake levels
years.low <- subset(huron,low.levels)

# Find the days within 5% of the range of lake levels
years.high <- subset(huron,high.levels)

# Display analysis
sprintf("There are %d days of low lake levels.", nrow(years.low))
print("The days are:")
print (years.low$Date)

# Display analysis
sprintf("There are %d days of high lake levels.", nrow(years.high))
print("The days are:")
print (years.high$Date)
