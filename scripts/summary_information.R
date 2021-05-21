library(dplyr)

summary_info <- function(ds) {
  ds_summary <- na.omit(list())
  ds_summary$features <- ncol(ds)
  ds_summary$observations <- nrow(ds)
  ds_summary$male_num <- nrow(filter(ds, SEX == "M"))
  #Number of males who have reported symptoms
  ds_summary$female_num <- nrow(filter(ds, SEX == "F"))
  #Number of females who have reported symptoms
  ds_summary$avg_age <- round(mean(pull(ds, CAGE_YR), na.rm = TRUE))
  #Average age
  return(ds_summary)
}

