
function(input, output) {
  # Reactive expression to create data frame of all input values ----
  
  output$Num_Symp_Tests <- renderText({
    
    US_pop <- 333000000
    num_symp_tests1 <- round(input$prob_covid_like_symptoms * input$prob_high_risk * input$avg_num_covid_tests * US_pop * 90/input$duration_symp_episode)
    print(paste("Number of Symptomatic Tests during WOW: ", toString(num_symp_tests1)))
    
    })
  
  
  output$Number_Pax_Courses <- renderText({
    
    est_num_inf_wow <- 169841049
    num_pax_courses <- round(est_num_inf_wow * input$prop_tested.5.days * input$prob_high_risk)
    print(paste("Number of Paxlovid Courses during WOW: ", toString(num_pax_courses)))
    
  })
  
  output$Reduc_in_Hospitalizations <- renderText({
    
    reduc_hosp <- 100*round(input$prop_tested.5.days * input$reduc_hosp_pax * input$prop_pax_uptake, 3)
    print(paste("Reduction in Hospitalization via Test-to-Treat Initiative: ", toString(reduc_hosp), "%"))
    
  })
  
  output$Reduc_in_Mortality <- renderText({
    
    reduc_death <- 100*round(input$prop_tested.5.days * input$reduc_death_pax * input$prop_pax_uptake, 3)
    print(paste("Reduction in Mortality via Test-to-Treat Initiative: ", toString(reduc_death), "%"))
    
  })
  
  percent_inf_w_5_days <- c(10, 20, 30, 40, 50, 60, 70, 80, 90, 1)
  perc_reduc_mortality <- reactive(percent_inf_w_5_days*input$reduc_death_pax * input$prop_pax_uptake)
  
  output$plot1 <- renderPlot({
    plot(percent_inf_w_5_days, perc_reduc_mortality(), col = "blue", main = "Reduction in Mortality via Test-to-Treat Initiative", 
         xlab = "Percent Infections Detected within 5 days of Symptoms", ylab = "Percent Reduction in Mortality", type = "l")
  })
  
  perc_reduc_hosp <- reactive(percent_inf_w_5_days*input$reduc_hosp_pax * input$prop_pax_uptake)
  
  output$plot2 <- renderPlot({
    plot(percent_inf_w_5_days, perc_reduc_hosp(), col = "black", main = "Reduction in Hospitalization via Test-to-Treat Initiative", 
         xlab = "Percent Infections Detected within 5 days of Symptoms", ylab = "Percent Reduction in Hospitalization", type = "l")
  })
  
  
  
}