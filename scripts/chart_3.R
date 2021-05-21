# map visualization of symptoms

plot_usmap(data = ds, values = "state_count", color = "red") + 
  scale_fill_continuous(name = "Adverse", label = scales::comma) + 
  theme(legend.position = "right")

sex_count <- ds %>%
  select(SEX) %>%
  group_by(SEX) %>%
  mutate(count = n())

sex_count

symptom_map_plot <- leaflet(data = ds) %>%
  addProviderTiles("CartoDB.Positron") %>%
  setView(lat = 40, lng = -100, zoom = 3.5) %>%
  addCircles(
    lat = ~lat,
    lng = ~long,
    stroke = FALSE,
    radius = 10500,
  )

ds %>%
  group_by(AGE_YRS) %>%
  str_count()
count(AGE_YRS)



library("plotly")
library("ggplot2")

chart_3 <- function(ds){
  numdays_clean <- ds %>%
    filter(NUMDAYS <= 400)
  chart_3 <- ggplot(numdays_clean) +
    geom_col(mapping = aes(x=CAGE_YR, y=NUMDAYS), color = "gray50") +
    ggtitle("Number of Days for Adverse Effects to Occur vs. Age") +
    xlab("Age") +
    ylab("Number of Days for Adverse Effects to Occur")
  return(chart_3)
}    
chart_3(ds)
