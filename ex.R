library(tidyverse)
strawberry_data <- read.csv("strawberry_oct4.csv", stringsAsFactors = FALSE)
# Splitting the data into two data frames based on the 'Program' column
strwb_census <- subset(strawberry_data, Program == "CENSUS")
strwb_survey <- subset(strawberry_data, Program == "SURVEY")
strwb_census
strwb_survey
unique(strwb_census$Value)
# Handle Missing Values: (Assuming you want to remove rows with NAs in Value)
strwb_census <- na.omit(strwb_census)

# Handle Non-Numeric Values: (Replace "(D)" with NA or another value)
strwb_census$Value[strwb_census$Value == "(D)"] <- NA  # or another value you'd like to impute

# Remove Commas and Convert to Numeric:
strwb_census$Value <- as.numeric(gsub(",", "", strwb_census$Value))

# Now handle new NAs generated due to non-numeric values (if you wish to):
# For example, you might want to remove these rows, or impute missing values.
# This decision should be based on your analysis goals and understanding of the data.
summary(strwb_census$Value)

