
library(dplyr)

aggregate_info <- function(df) {
  summ <- df %>%
    group_by(STATE) %>%
    summarise(Male = sum(SEX == "M", na.rm = T),
              Female= sum(SEX == "F", na.rm = T),
              Unknown = sum(SEX == "U", na.rm = T),
              AverageAge = mean(AGE_YRS, na.rm = T)) %>%
    arrange(-AverageAge)
  colnames(summ) <- c("State", "Males", "Females", "Unknown", "Average Age")
  return(summ)
}


# We included the table so that the columns that we thought were important would
# be displayed. The information reveals the columns obtaining the SEX, column
# containing either Male, Female, or Unidentified. We also found the Age group
# max, min, and mean.