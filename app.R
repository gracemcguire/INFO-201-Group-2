library("shiny")
library("plotly")
library("leaflet")
library("magick")
library("dplyr")


# load the ui and server
source("myui.R")
source("myserver.R")

shinyApp(ui = ui, server = server)
