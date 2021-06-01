vaers <- read.csv("data/2021VAERSDATA.csv")

# Answers the Location and Death count
# Data for first widget
filter_blank_data <- vaers %>%
  filter(!STATE %in% c("XB", ""))
state_unique <- unique(a$STATE)

# First widget
state_check <- checkboxGroupInput(inputId = "States",
                                  label = "Location by State",
                                  choices = state_unique,
                                  selected = state_unique)

# Data for second widget
grouped_data <- vaers %>%
  group_by(STATE) %>%
  dplyr::summarize(count = n())
count_range <- range(grouped_data$count)

# Second widget sliderInput
count_slider <- sliderInput(inputId = "State_count",
                            label = "Location by State Value Range",
                            min = count_range[1],
                            max = count_range[2],
                            value = count_range,
                            step = 1)

# Answering the relation of Age affected and Location/State
age_range <- range(vaers$AGE_YRS, na.rm = T)
unique_age <- unique(vaers$AGE_YRS)

# Third widget selectInput
state_age <- checkboxGroupInput(inputId = "Age",
                                label = "Location by State",
                                choices = state_unique,
                                selected = state_unique)

# Last widget sliderInput
age_slider <- sliderInput(inputId = "age_affected",
                          label = "Affected Ages by State",
                          min = age_range[1],
                          max = age_range[2],
                          value = age_range[2],
                          step = 1)

introduction_page <- tabPanel(
  ("Introduction"),
  img(src = "https://city.milwaukee.gov/ImageLibrary/MKE-Health1/COVID-19/Images/imgCoronavirus.jpg", width = 700, height = 650),
  h2(p("Authors: Daniel Choi, Grace McGuire, Renee Wong, Nathaniel Lee")),
  h3(p("The questions we hope to answer are:")),
  h4(p(
  p(
  "1. How does gender impact the adverse effects of the vaccine?"), br(),
  p(
  "2. How do the adverse effects of the vaccine differ by age?"), br(),
  p(
  "3. How do the adverse effects of the vaccine differ by location?"), br(),
  p(
    "To answer these questions, we will be using the VAERSDATASET from Kaggle",
))))

# page_one <- tabPanel(
#   "Bar Chart", # label for the tab in the navbar
#   titlePanel("Page 1"), # show with a displayed title
#   
#   # This content uses a sidebar layout
#   sidebarLayout(
#     sidebarPanel(
#       textInput(inputId = "username", label = "What is your name?")
#     ),
#     mainPanel(
#       h3("Primary Content"),
#       p("Plots, data tables, etc. would go here")
#     )
#   )
# )
# 
# # Define content for the second page
# page_two <- tabPanel(
#   "Pie chart", # label for the tab in the navbar
#   ui <- fluidPage(
#     h1("Demo Page"),
#     p(
#       "this is a paragraph with",
#       strong("bold"),
#       "text."
#     )
#   )
# )
# 
# # Define content for the third page
# page_three <- tabPanel(
#   "Scatterplot" # label for the tab in the navbar
#   # ...more content would go here...
# )
# 
# summary_page <- tabPanel(
#   "Summary Page" # label for the tab in the navbar
#   # ...more content would go here...
# )

# Pass each page to a multi-page layout (`fluidPage`)
ui <- fluidPage(tabsetPanel(
  tabPanel("Page 1",
           sidebarLayout(sidebarPanel(state_check,
                                      count_slider), mainPanel(plotOutput(bar_chart)))),
  tabPanel("Page 2",
           sidebarLayout(sidebarPanel(state_age,
                                      age_slider), mainPanel(plotOutput(scatter_plot))))
))

