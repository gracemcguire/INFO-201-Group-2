library(dplyr)

summary_info <- function(ds) {
  ds_summary <- na.omit(list())
  ds_summary$features <- ncol(ds)
  ds_summary$observations <- nrow(ds)
  ds_summary$male_num <- nrow(filter(ds, SEX == "M"))
  ds_summary$female_num <- nrow(filter(ds, SEX == "F"))
  ds_summary$avg_age <- round(mean(pull(ds, CAGE_YR), na.rm = TRUE))
  return(ds_summary)
}

ds <- read.csv(file = '2021VAERSDATA.csv')

vaers_summary <- summary_info(ds)
