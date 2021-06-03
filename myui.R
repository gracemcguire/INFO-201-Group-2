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
  "This Bar Chart shows the number of people affected due to the COVID
  vaccine.From most to least affected, the genders go by Female, Male, and then
    Unknown. This drop down also gives access to view the individual genders,
    including the respective Population and Gender of each group."
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
    "To answer these 3 questions, we will be using a Bar chart for the
    first interactive page, which answers our first question of how the adverse
    effects of the COVID vaccine affects individuals by location.
    For the second question,we decided that a scatter plot would be best, to
    answer the second question as we chose to find the adverse effects of the
    COVID vaccine by age. For our last question, we decided that a Bar chart
    that contains all the genders would give an accurate representations of the
    distribution of individuals who were impacted by the adverse effects of the
    COVID vaccine. The source of this data set can be found", tags$a(href = "https://www.kaggle.com/ayushggarg/covid19-vaccine-adverse-reactions?fbclid=IwAR2aQKWsmC7TMTk3TJ-hVX0Hnpl-ajPINOqKOU5wcDmxsgx8EeQXzIQ8smw", "here!")
    ))
))

ui <- fluidPage(tabsetPanel(
  introduction_page,
  tabPanel("Adverse Effects of the COVID Vaccine by Location",
           sidebarLayout(sidebarPanel(state_check,
            count_slider,
            p("asd")),
                         mainPanel(plotlyOutput("bar_chart")))),
  tabPanel("Adverse Effects of the COVID Vaccine by Age",
           sidebarLayout(sidebarPanel(state_age,
            age_slider,
            p("This scatter plot represents the age of each person who reported
              adverse effects of the COVID vaccine. The ages are categorized by
              the state from which the person lives. The color of each dot on
              the scatter plot represents the person’s gender (male, female, or
              unknown). On the side, each state can be selected or deselected in
              order to focus on specific states. There is also a slide that can
              change the range of the x-axis (which represents age) on the plot.
              The point of this scatter plot is to answer the question of how
              the adverse effects of the vaccine differ by age. Based on the
              scatter plot, adverse effects seem to be rare in children. The
              dots become more concentrated after the age of 15. Until the age
              of 90, this concentration remains consistent, revealing that
              adverse effects are much more common between the ages of 15 and
              90. AFter that, the concentration disperses and less dots are
              found, though this can be attributed to life expectancy; since on
              average most people do not live past 80 years old, it would make
              sense that there would be less data at such high ages.")),
                         mainPanel(plotlyOutput("scatter_plot")))),
  tabPanel("Adverse Effects of the COVID Vaccine by Gender",
           sidebarLayout(gender_affected, pie_chart)),
  tabPanel("Conclusion Insights of Adverse Effects of COVID",
           p("lkadmkadmlksd
             "))

))
