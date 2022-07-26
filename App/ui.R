library(shiny)
library(dplyr)


# Define UI for slider demo app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Reductions in Hospitalizations and Mortality due to Paxlovid Rollout"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar to demonstrate various slider options ----
    sidebarPanel(
      
      
      sliderInput("prop_tested.5.days", "Probability patient is tested within 5 days of symptoms:",
                  min = 0, max = 1,
                  value = 0.78, step = 0.01),
      
      
      sliderInput("prob_covid_like_symptoms", "Probability of COVID-like symptoms in population:",
                  min = 0, max = 0.1,
                  value = 0.03, step = 0.01),
      
      sliderInput("prob_high_risk", "Proportion of high risk individuals in population:",
                  min = 0, max = 1,
                  value = 0.38, step = 0.01),
      
      sliderInput("duration_symp_episode", "Duration of symptom episode:",
                  min = 0, max = 10,
                  value = 7, step = 1),
      
      sliderInput("avg_num_covid_tests", "Average number of COVID tests per symptomatic individual:",
                  min = 0, max = 5,
                  value = 1.95, step = 0.05),
      
      sliderInput("reduc_hosp_pax", "Reductions in overall hospitalization due to Paxlovid:",
                  min = 0, max = 1,
                  value = 0.67, step = 0.01),
      
      sliderInput("reduc_death_pax", "Reductions in overall mortality due to Paxlovid:",
                  min = 0, max = 1,
                  value = 0.81, step = 0.01),
      
      sliderInput("prop_pax_uptake", "Proportion of Paxlovid uptake in eligible population:",
                  min = 0, max = 1,
                  value = 0.05, step = 0.01),
      
    ),
    
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      textOutput("Num_Symp_Tests"),
      textOutput("Number_Pax_Courses"),
      textOutput("Reduc_in_Hospitalizations"),
      textOutput("Reduc_in_Mortality"),
      plotOutput("plot1", click = "plot_click"),
      plotOutput("plot2", click = "plot_click")
      
    )
  )
)