library(shiny)
library(dplyr)


# Define UI for slider demo app ----
ui <- fluidPage(
  
  # App title ----
  titlePanel("Reductions in Hospitalizations and Mortality due to Paxlovid"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar to demonstrate various slider options ----
    sidebarPanel(
      
      
      sliderInput("prop_tested.5.days", "Probability Patient is Tested within 5 days of Symptoms:",
                  min = 0, max = 1,
                  value = 0.78, step = 0.01),
      
      
      sliderInput("prob_covid_like_symptoms", "Probability of COVID-Like Symptoms in Population:",
                  min = 0, max = 0.1,
                  value = 0.03, step = 0.01),
      
      sliderInput("prob_high_risk", "Proportion of High Risk Individuals in Population:",
                  min = 0, max = 1,
                  value = 0.38, step = 0.01),
      
      sliderInput("duration_symp_episode", "Duration of Symptom Episode:",
                  min = 0, max = 10,
                  value = 7, step = 1),
      
      sliderInput("avg_num_covid_tests", "Average Number of COVID Tests per Symptomatic Individual:",
                  min = 0, max = 5,
                  value = 1.95, step = 0.05),
      
      sliderInput("reduc_hosp_pax", "Reductions in Overall Hospitalization due to Paxlovid:",
                  min = 0, max = 1,
                  value = 0.67, step = 0.01),
      
      sliderInput("reduc_death_pax", "Reductions in Overall Mortality due to Paxlovid:",
                  min = 0, max = 1,
                  value = 0.81, step = 0.01),
      
      sliderInput("prop_pax_uptake", "Proportion of Paxlovid Uptake in Eligible Population:",
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