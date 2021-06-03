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
  "This Bar Chart shows the number of individuals affected due to the COVID-19
  vaccine. From the top to the bottom of the chart, it is ordered from most to
  least affected. The genders are listed as F (Female), M (Male), and U
  (Unknown), each with a different color for clarification . On the side, the
  drop down menu gives access to view the individual genders, including the
  respective population and gender of each group. According to the chart, it
  displays that most adverse effect individuals are female compared to male and
  unknown, which shows the impact of gender on adverse effects."
  )
)

pie_chart <- mainPanel(
  plotlyOutput("pie")
)

introduction_page <- tabPanel(
  "Introduction", #title of page/tab

  sidebarLayout(
    sidebarPanel(
  img(src = "https://city.milwaukee.gov/ImageLibrary/MKE-Health1/COVID-19/Images/imgCoronavirus.jpg", width = 250, height = 230
      )), #image insertion & scale

  mainPanel(
  h2(p("Age, gender, and location's impact on the adverse reactions experienes
  by the COVID-19 vaccine."),
  h4(p("Authors: Daniel Choi, Grace McGuire, Renee Wong, Nathaniel Lee")),
  #adds authors")),
  h5(p("As millions of people in America get vaccinated against the COVID-19
  virus, it is integral that adverse reactions are being tracked in order to
  ensure the vaccine is safe. An adverse reaction can be defined as, “any
  unexpected or dangerous reaction to a drug or vaccine” according to the World
  Health Organization. The Vaccine Adverse Event Reporting System (VAERS), which
  is the dataset that we chose to investigate, is an early warning system used
  to monitor adverse events that happen after vaccination. This dataset is used
  by the CDC, FDA and others to ensure that they can address any possible safety
  concerns as vaccines continue to be administered at a rapid rate. Not all
  reactions that are listed in the dataset are directly related to the vaccine,
  but it is important that they are reported.
")),
  h4(p(strong("The questions we hope to answer are:")), #top/large header
  h5(p(
  p(
  "1. Is one region of the United States impacted more heavily by adverse
  reactions to the COVID-19 vaccine?"), br(),
  #question 1, break
  p(
  "2.
  How do the adverse reactions to the COVID-19 vaccine differ by age group?"),
  br(),
  #question 2, break
  p(
  "3. How does gender impact the adverse reactions to the COVID-19 vaccine?"),
  br(),
  #question 3, break
  br(),
  p(
    "In order to analyze these 3 questions, we used a bar chart for the
    first interactive page, which investigates our first question of how the
    adverse reactions to the COVID-19 vaccine affects individuals by location.
    For the second question, we decided that a scatter plot would best
    answer and display the answer to the second question as we chose to find the
    adverse reactions to the COVID-19 vaccine by age. For our final question,
    we decided that a bar chart that contains all the genders would give an
    accurate representations of the distribution of individuals who were
    impacted by the adverse reactions to the COVID-19 vaccine.
    To answer these questions, we will be using the VAERSDATASET, COVID-19
    World Vaccine Adverse Reactions, from Kaggle.) The source of
    this data set can be found", tags$a(href = "https://www.kaggle.com/ayushggarg/covid19-vaccine-adverse-reactions?fbclid=IwAR2aQKWsmC7TMTk3TJ-hVX0Hnpl-ajPINOqKOU5wcDmxsgx8EeQXzIQ8smw", "here!")
    ))
))

))))

ui <- fluidPage(tabsetPanel(
  introduction_page,
  tabPanel("Adverse Events by Location",
           sidebarLayout(sidebarPanel(state_check,
            count_slider,
            p("The first bar graph displays the number of people reporting
            adverse vaccine effects in different states. This answers our
            question of how the adverse effects of the vaccine differ by the
            location. In addition, each state can be selected or deselected for
            focusing on a the selected states. The slide above can change the
            range of the x-axis representing the number of cases on the plot.
            From the graph, it can be inferred that states including California,
            New York, Florida, and Texas have higher rates of adverse vaccine
            affects, for they have higher number of COVID-19 cases. In
            comparison, states such as Wyoming and Virginia have a low number
            of cases, meaning that the adversed effects may be lower. ")),
                          mainPanel(plotlyOutput("bar_chart")))),
  tabPanel("Adverse Reactions by Age",
           sidebarLayout(sidebarPanel(state_age,
            age_slider,
         p("This scatter plot represents the age of each individual who reported
          adverse reactions to the COVID-19 vaccine. The ages are categorized by
              the state from which the person lives. The color of each dot on
              the scatter plot represents the person’s gender (male, female, or
              unknown). On the side, each state can be selected or deselected in
            order to focus on states of interest. There is also a slide that can
              change the range of the x-axis (which represents age) on the plot.
              The goal of the scatter plot is to answer the question of how
              the adverse reactions to the vaccine differ by age. Based on the
              scatter plot, adverse reactions seem to be rare in children. The
              dots become more concentrated after the age of 15. Until the age
              of 90, this concentration remains consistent, revealing that
              adverse reactions are much more common between the ages of 15 and
              90. AFter that, the concentration disperses and less dots are
              found, though this can be attributed to life expectancy; since on
              average most people do not live past 80 years old, it would make
              sense that there would be less data at such high ages.")),
                         mainPanel(plotlyOutput("scatter_plot")))),
  tabPanel("Adverse Reactions by Gender",
           sidebarLayout(gender_affected, pie_chart)),

  tabPanel("Key Takeaways",
          p(h3("Takeaway #1")),
          p(h4("1. Is one region of the United States impacted more heavily by
               adverse reactions to the COVID-19 vaccine?")),
          p(h6("As demonstrated in the Number of Deaths in Each State plot,
               California, Texas, and New York have much higher rates of death
               than the rest of the United States. A potential answer to why
               this may be is because CA, TX, and NY are much more populous
               than most states, meaning that their vaccination rates are
               higher, thus having higher chances of adverse reactions to the
               vaccine. This was a major takeaway as the more population there
               is within a location, there has been more adverse effects whether
               it was due to the higher population or being more prone to
               interacting with others.")), br(),
          p(h3("Takeaway #2")),
          p(h4("2. How do the adverse reactions to the COVID-19 vaccine differ
               by age group?")),
          p(h6("The Ages Effected in Each State Due to COVID Vaccine plot
               indicates that between ages 20 and 90 the adverse reactions to
               the COVID-19 vaccine occur fairly evenly, while above and below
               that age range, the occurences of adverse events are very
               sparse. This was interesting as many news media had claimed that
               the younger aged chldren and teens weren't as affected, while the
               middle age and seniors were more prone. A major takeaway from
               this was that the real data is different from what we are told my
               from either the news or websites.")), br(),
          p(h3("Takeaway #3")),
          p(h4("3. How does gender impact the adverse reactions to the COVID-19
               vaccine?")),
          p(h6("The Adverse COVID-19 Vaccine Effect by Gender plot clearly shows
               that females have been hit much harder by adverse events than
               males have been. Another major finding was that the participants
               of all the genders ranked from greatest to least in the order of
               female, male, and then unknown. It was interesting to see that
               the females had worse adverse effects")), br(),

)))
