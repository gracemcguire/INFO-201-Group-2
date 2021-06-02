vaers <- read.csv("data/2021VAERSDATA.csv")
library("plotly")
library("dplyr")
library("ggplot2")
source("scripts/chart_2.R")

# app_server.R
server <- function(input, output) {
  # FIRST PAGE/PLOT
  output$bar_chart <- renderPlotly({
    # manipulate data
    plot_data <- vaers %>%
      group_by(STATE) %>%
      dplyr::summarize(count = n()) %>%
      filter(STATE %in% input$States) %>%
      filter(count <= input$State_count[2],
             count >= input$State_count[1])
    # bar chart
    plot1 <- ggplot(plot_data) +
      geom_col(mapping = aes(x = count,
                             y = STATE,
                             fill = STATE))
    labs(title = "Number of Deaths in each State",
         xlab = "State",
         ylab = "Deaths") +
      theme(title = element_text(size = 16)) +
      scale_fill_brewer("State", palette = "Set3")
    
    plot1 <- ggplotly(plot1)
    return(plot1)
  })
  
  #SECOND PAGE/PLOT
  output$scatter_plot <- renderPlotly({
    # manipulate data
    plot_data <- vaers %>%
      filter(STATE %in% input$Age,
             AGE_YRS <= input$age_affected)
    
    # Use plotly to plot scatter plot
    plot2 <- plot_ly(plot_data,
                     x = ~AGE_YRS,
                     y = ~STATE,
                     type = "scatter",
                     mode = "markers",
                     color = ~SEX,
                     marker = list(size = 3),
                     text = ~paste("<b>Age:</b>",
                                   plot_data$AGE_YRS,
                                   "<br>",
                                   "<b>State:</b>",
                                   plot_data$STATE),
                     hoverinfo = "text") %>%
      
      # title and axes label
      layout(title = "Ages Affected in each State Due to COVID",
             xaxis = list(title = "Ages of those Affected by COVID:"),
             yaxis = list(title = "Location of Ages Affected:"))
    
    plot2 <- ggplotly(plot2)
    return(plot2)
  })
  output$pie <- renderPlotly({
    return(chart_2(vaers, input$x))
  })
}

# server <- function(input, output) {
#   output$message <- renderText({
#     msg <- paste0("You've chosen option #", input$radioInput,
#            ". You've entered the following text: ", input$textInput)
#     return(msg)
#   })
# }
# 
# chart_2 <- function(ds) {
#   df <- ds %>%
#     group_by(SEX) %>%
#     summarise(total = n())
#   
#   bp <- ggplot(df, aes(x = "", y = total, fill = SEX)) +
#     geom_bar(width = 1, stat = "identity") +
#     ggtitle("Adverse COVID-19 Vaccine Effects by Sex")
#   
#   pie <- bp + coord_polar("y", start = 0) +
#     theme_void()
#   
#   return(pie)
# }

