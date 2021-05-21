library(ggplot2)

chart_1 <- function(ds) {
  scatterplot <- ggplot(data = ds) +
    geom_point(mapping = aes(x = AGE_YRS, y = STATE, color = SEX)) +
    scale_x_reverse() +
    labs(x = "Age", y = "State", fill = "Sex") +
    ggtitle("Scatterplot View of Adverse Effects in Different States vs. Age")
  return(scatterplot)
}
