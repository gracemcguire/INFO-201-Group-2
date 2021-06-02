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
    ggtitle("Adverse COVID-19 Vaccine Effects by Sex")

  bp <- ggplotly(bp)

  return(bp)
}

a <- chart_2(vaers, "M")
a
