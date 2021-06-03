library(dplyr)
library(ggplot2)


chart_2 <- function(ds, sex) {
  df <- ds %>%
    group_by(SEX) %>%
    summarise(total = n())
  if (sex != "All") {
    df <- df %>%
      filter(SEX == sex)
  }
  bp <- ggplot(df, aes(x = "", y = total, fill = SEX)) +
    geom_bar(width = 1, stat = "identity") +
    ggtitle("Adverse COVID-19 Vaccine Effects by Sex") +
    labs(y = "Total Individuals", x = "")

  bp <- ggplotly(bp)

  return(bp)
}
