
# Pacakges ----------------------------------------------------------------

library(jsonlite) #read & write JSON files
library(xml2)     ##read & write XML files
library(readr)
library(readxl)

  
# Data import -------------------------------------------------------------

census_file <- "../mainInputData/nacional_2019.txt"

#File contents preview

dat <-readLines(census_file, n=10)

metadata_file <- "../mainInputData/Padron_2019.xlsx"

excel_sheets(metadata_file)

#Defining variables' names

census_fields <-c("CPRO",
                  "CMUN",
                  "SEXO",
                  "CPRON",
                  "CMUNN",
                  "NACI",
                  "EDAD",
                  "TAMU",
                  "TAMUN")

#Defining fields' width

census_widths <- c(2,3,1,2,3,3,3,2,2)
sum(census_widths)


# Data upload Test --------------------------------------------------------

#preparing variables
census_var <- fwf_widths(census_widths, col_names = census_fields)

dat <- read_fwf(census_file,
                col_positions = census_var,
                n_max=50)
head(dat)
