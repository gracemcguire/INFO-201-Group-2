summary_info <- function(ds) {
  ds_summary <- list()
  ds_summary$features <- ncol(ds, na.rm = T)
  ds_summary$observations <- nrow(ds, na.rm = T)
  ds_summary$male_num <- nrow(filter(ds, SEX == "M"), na.rm = T)
  ds_summary$female_num <- nrow(filter(ds, SEX == "F"), na.rm = T)
  ds_summary$avg_age <- round(mean(pull(CAGE_YR)))
  return(ds_summary)
}