library(dplyr)
library(ggplot2)
chart_3 <- function(ds) {
  numdays_clean <- ds %>%
    filter(NUMDAYS <= 400)
  chart_3 <- ggplot(numdays_clean) +
    geom_col(mapping = aes(x = CAGE_YR, y = NUMDAYS), color = "gray50") +
    ggtitle("Number of Days for Adverse Effects to Occur vs. Age") +
    xlab("Age") +
    ylab("Number of Days for Adverse Effects to Occur")
  return(chart_3)
}
