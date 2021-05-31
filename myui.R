library("leaflet")
library("magick")
library("plotly")
library("shiny")
VAERS <- read.csv("./data/2021VAERSDATA.csv", stringsAsFactors = FALSE)

ui <- fluidPage(
  h1("Demo Page"),
  p(
    "this is a paragraph with",
    strong("bold"),
    "text."
    ),
  h2("here are some example inputs"),
  radioButtons(
    inputId = "radioInput",
    label = h3("Demo radio buttons"),
    choices = list("Choice 1" = 1, "Choice 2" = 2, "Choice 3" = 3),
    selected = 1
  ),
  textInput(
    inputId = "textInput",
    label = h3("example text input"),
    placeholder = "enter your text here"
  ),
  textOutput(
    outputId = "message")
)


# Define the first page content; uses `tabPanel()` and `sidebarLayout()`
# layout functions together (as an example)
# Define content for the third page

introduction_page <- tabPanel(
  ("Introduction"),
  img(src = "imgCoronavirus", height = 40, width = 40),
  h3(p("The questions we hope to answer are:"),
  h4(p(
  "1. How does gender impact the adverse effects of the vaccine?"),
  p(
  "2. How do the adverse effects of the vaccine differ by age?"),
  p(
  "3. How do the adverse effects of the vaccine differ by location?"),
  p(
    "To answer these questions, we will be using the VAERSDATASET from Kaggle",
))))

page_one_mainpanel <- mainPanel (
  h1("Hello"),
  plotlyOutput(
    outputId = "scatterplot")
)
page_one <- tabPanel(
  "Bar chart", # label for the tab in the navbar
  titlePanel("Page 1"), # show with a displayed title
  
  # This content uses a sidebar layout
  sidebarLayout(
    sidebarPanel(
      textInput(inputId = "username", label = "What is your name?")
    ),
    mainPanel(
      h3("Primary Content"),
      p("Plots, data tables, etc. would go here")
    )
  )
)

# Define content for the second page
page_two <- tabPanel(
  "Pie chart", # label for the tab in the navbar
  ui <- fluidPage(
    h1("Demo Page"),
    p(
      "this is a paragraph with",
      strong("bold"),
      "text."
    )
  )
)

# Define content for the third page
page_three <- tabPanel(
  "Scatterplot" # label for the tab in the navbar
  # ...more content would go here...
)

summary_page <- tabPanel(
  "Summary Page" # label for the tab in the navbar
  # ...more content would go here...
)

# Pass each page to a multi-page layout (`navbarPage`)
ui <- navbarPage(
  "Section AH Group 2", # applicaiton page
  introduction_page,# Introduction page
  page_one,         # include the first page content
  page_two,         # include the second page content
  page_three,       # include the third page content
  summary_page      # include the summary page content
)

