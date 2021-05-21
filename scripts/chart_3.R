library(dplyr)
library(ggplot2)
chart_3 <- function(ds) {
  numdays_clean <- ds %>%
    filter(NUMDAYS <= 400) %>%
    group_by(CAGE_YR) %>%
    summarise(avg = sum(NUMDAYS, na.rm = T) / n())
  chart_3 <- ggplot(numdays_clean) +
    geom_col(mapping = aes(x = CAGE_YR, y = avg), color = "gray50") +
    ggtitle("Average Days for the Vaccine Side Effects to Occur vs. Age") +
    xlab("Age") +
    ylab("Average Days for the Vaccine Side Effects to Occur.")
  return(chart_3)
}
