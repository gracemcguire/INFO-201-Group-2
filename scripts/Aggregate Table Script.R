h <- read.csv("2021VAERSDATA.csv", stringsAsFactors = F)

x <- function(SEX, df) {
  y <- df %>%
    group_by(STATE) %>%
    summarise(SEX_male = sum(SEX == "M", na.rm = T),
           SEX_female = sum(SEX == "F", na.rm = T),
           SEX_unknown = sum(SEX == "U", na.rm = T),
           AGE_max = max(AGE_YRS, na.rm = T),
           AGE_min = min(AGE_YRS, na.rm = T),
           AGE_avg = min(AGE_YRS, na.rm = T))
  return(y)
}

v <- x("AGE", h)

# We included the table so that the columns that we thought were important would
# be displayed. The information reveals the columns obtaining the SEX, column
# containing either Male, Female, or Unidentified. We also found the Age group
# max, min, and mean.
