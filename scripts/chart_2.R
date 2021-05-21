# pie chart by sex

library(ggplot2)
ds

sex_number <- ds %>%
  select(SEX) %>%
  group_by(SEX) %>%
  summarise(count = n())
sex_number

sexes = c("Male", "Female", "Unknown")
number_adverse = c(24468, 8755, 898)
pie_chart_sex <- data.frame(sexes, number_adverse)
pie_chart_sex
  
pie_chart <- pie(pie_chart_sex$number_adverse, labels = sexes)

chart_2 <- function(ds){
df <- data.frame(
  group = c("Female", "Male", "Unknown"),
  value = c(24468, 8755, 898)
)
head(df)

bp <- ggplot(df, aes(x="",y=value, fill=sexes))+
  geom_bar(width = 1, stat = "identity") +
  ggtitle("Adverse COVID-19 Vaccine Effects by Sex") 
bp

pie <- bp + coord_polar("y", start=0) +
  theme_void()

pie

return(chart_2)
}

