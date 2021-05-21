# scatterplot showing age, state, and sex with adverse effects

library(ggplot2)
library(plotly)
library(leaflet)
library(stringr)sw


library("ggplot2")

ds

chart_1 <- function(ds){
scatterplot <- ggplot(data = ds) +
  geom_point(mapping = aes(x = AGE_YRS, y = STATE, color = SEX)) +
  scale_x_reverse() +
  labs(x = "Age", y = "State", fill = "Sex")
scatterplot
return(chart_1)
}














recovery_plot <- plot_ly(
  data = ds,
  x = ~AGE_YRS,
  y = ~NUMDAYS,
  type = "bar",
  mode = "markers"
) %>%
  layout(
    title = "Adverse Symptoms by Age",
    xaxis = list(title = "Age"),
    yaxis = list(title = "Number of Days to Recover")
  )

recovery_plot


# pie chart
ggplot(data = mpg, aes(x = factor(1), fill = factor(cyl))) +
  geom_bar(width = 1) +
  coord_polar(theta = "y")

library("ggplot2")

midwest

# scatter plot
ggplot(data = midwest) + 
  geom_point(mapping = aes(x = percollege, y = percadultpoverty))

# hexagonal binning
ggplot(data = midwest) + 
  geom_hex(mapping = aes(x = percollege, y = percadultpoverty))

# bar chart
ggplot(data = mpg) + 
  geom_bar(mapping = aes(x = hwy, fill = class)) +
  
  # bar chart
  ggplot(data = mpg) + 
  geom_bar(mapping = aes(x = hwy, fill = class)) +
  coord_flip()

# pie chart
ggplot(data = mpg, aes(x = factor(1), fill = factor(cyl))) +
  geom_bar(width = 1) +
  coord_polar(theta = "y")


# example of scales
ggplot(data = midwest) +
  geom_point(mapping = aes(x = percollege, y = percadultpoverty, color = state)) +
  scale_x_reverse()


# example of small multiples with facets
ggplot(data = mpg) +
  geom_point(mapping = aes(x =  displ, y = hwy)) +
  facet_wrap(~class)


# interactive graph with plotly
mpg_graph <- ggplot(data = mpg) +
  geom_point(mapping = aes(x =  displ, y = hwy)) +
  facet_wrap(~class)

library("plotly")
ggplotly(mpg_graph)


# interactive plot of the iris flower dataset
plot_ly(
  data = iris,
  x = ~Sepal.Width,
  y = ~Petal.Width,
  color = ~Species,
  Type = "scatter",
  Mode = "Markers"
) %>%
  layout (
    title = "Iris Data Set Visualization",
    xaxis = list(title = "Sepal Width", ticksuffix = "cm"),
    yaxis = list(title = "Petal Width", ticksuffix = "cm")
  )


# leaflet interactive map
library("leaflet")
library("dplyr")

#too lazy to follow and download, but refer to lecture 14.4 for learning leaflet
# Interactive Maps



