vaers <- read.csv("data/2021VAERSDATA.csv")

# Answers the Location and Death count
# Data for first widget, gets rid of state XB and blanks.
filter_error_data <- vaers %>%
  filter(!STATE %in% c("XB", ""))
state_unique <- unique(filter_error_data$STATE)

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

gender_affected <- sidebarPanel(
  selectInput(
    "x",
    label = "Genders",
    choices = list("Male" = "M", "Female" = "F", "Unknown" = "U", "All"),
    selected = "All"
  ),
  p(
  "This Bar Chart shows the number of people affected due to COVID.
    The gender most affected are by order in: Female, Male, and then Unknown.
    This drop down also gives access to view the individual genders, including
    the respective Population and Gender of each group."
  )
)

pie_chart <- mainPanel(
  plotlyOutput("pie")
)


introduction_page <- tabPanel(
  ("Introduction"), #title of page/tab
  img(src = "https://city.milwaukee.gov/ImageLibrary/MKE-Health1/COVID-19/Images/imgCoronavirus.jpg", width = 800, height = 550), #image insertion & scale
  h2(p("Authors: Daniel Choi, Grace McGuire, Renee Wong, Nathaniel Lee")),
  #adds authors
  h4(p("This project explores how age, gender, and location have impacted the
       way that American's have been experiencing adverse effects caused by
       the COVID-19 vaccine.")),
  h5(p("The questions we hope to answer are:")), #top/large header
  h6(p(
  p(
  "1. How do the adverse effects of the vaccine differ by location?"), br(),
  #question 1, break
  p(
  "2. How do the adverse effects of the vaccine differ by age?"), br(),
  #question 2, break
  p(
  "3. How does gender impact the adverse effects of the vaccine?"), br(),
  #question 3, break
  p(
    "To answer these questions, we will be using the VAERSDATASET from Kaggle"),
  br(),
  p(
    "To answer these 3 quesitons, we will be using a Bar chart for the first
    interactive page, which answers our first question of how the adverse
    effects of the COVID vaccine affects individuals by location.
    For the second question,we decided that a scatter plot would be best, to
    answer the second question as we chose to find the adverse effects of the
    COVID vaccine by age. For our last question, we decided that a Bar chart
    that contains all the genders would give an accurate representations of the
    distribution of individuals who were impacted by the adverse effects of the
    COVID vaccine."
  )
)))

ui <- fluidPage(tabsetPanel(
  introduction_page,
  tabPanel("Page 1",
           sidebarLayout(sidebarPanel(state_check,
            count_slider,
            p("asd")),
                         mainPanel(plotlyOutput("bar_chart")))),
  tabPanel("Page 2",
           sidebarLayout(sidebarPanel(state_age,
            age_slider,
            p("asda")),
                         mainPanel(plotlyOutput("scatter_plot")))),
  tabPanel("Page 3",
           sidebarLayout(gender_affected, pie_chart))

))
