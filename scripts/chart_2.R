library(dplyr)
library(ggplot2)

chart_2 <- function(ds) {
  df <- data.frame(
    group = c("Female", "Male", "Unknown"),
    value = c(24468, 8755, 898)
  )

  bp <- ggplot(df, aes(x = "", y = value, fill = sexes)) +
    geom_bar(width = 1, stat = "identity") +
    ggtitle("Adverse COVID-19 Vaccine Effects by Sex")

  pie <- bp + coord_polar("y", start = 0) +
    theme_void()

  return(pie)
}
