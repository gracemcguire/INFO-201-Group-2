
library(dplyr)

aggregate_info <- function(df) {
  summ <- df %>%
    group_by(STATE) %>%
    summarise(Male = sum(SEX == "M", na.rm = T),
              Female = sum(SEX == "F", na.rm = T),
              Unknown = sum(SEX == "U", na.rm = T),
              AverageAge = mean(AGE_YRS, na.rm = T)) %>%
    arrange(-AverageAge)
  colnames(summ) <- c("State", "Males", "Females", "Unknown", "Average Age")
  return(summ)
}
