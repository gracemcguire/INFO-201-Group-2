library(dplyr)
library(ggplot2)


chart_2 <- function(ds) {
  df <- ds %>%
    group_by(SEX) %>%
    summarise(total = n())

  bp <- ggplot(df, aes(x = "", y = total, fill = SEX)) +
    geom_bar(width = 1, stat = "identity") +
    ggtitle("Adverse COVID-19 Vaccine Effects by Sex")

  pie <- bp + coord_polar("y", start = 0) +
    theme_void()

  return(pie)
}
