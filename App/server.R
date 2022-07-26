
function(input, output) {
  # Reactive expression to create data frame of all input values ----
  
  output$Num_Symp_Tests <- renderText({
    
    US_pop <- 333000000
    num_symp_tests1 <- input$prob_covid_like_symptoms * input$prob_high_risk * input$avg_num_covid_tests * US_pop * input$prop_pax_uptake * 90/input$duration_symp_episode
    print(paste("Number of Symptomatic Tests during WOW: ", round(num_symp_tests1 / 1e6, 1), "M", sep = ""))
    
    })
  
  
  output$Number_Pax_Courses <- renderText({
    
    est_num_inf_wow <- 169841049
    num_pax_courses <- est_num_inf_wow * input$prop_tested.5.days * input$prob_high_risk * input$prop_pax_uptake
    print(paste("Number of Paxlovid Courses during WOW: ", round(num_pax_courses / 1e6, 1), "M", sep = ""))
    
  })
  
  output$Reduc_in_Hospitalizations <- renderText({
    
    reduc_hosp <- 100*round(input$prop_tested.5.days * input$reduc_hosp_pax * input$prop_pax_uptake, 3)
    print(paste("Reduction in Hospitalization via Paxlovid rollout: ", reduc_hosp, "%", sep = ""))
    
  })
  
  output$Reduc_in_Mortality <- renderText({
    
    reduc_death <- 100*round(input$prop_tested.5.days * input$reduc_death_pax * input$prop_pax_uptake, 3)
    print(paste("Reduction in Mortality via Paxlovid rollout: ", reduc_death, "%", sep = ""))
    
  })
  
  #percent_inf_w_5_days <- c(10, 20, 30, 40, 50, 60, 70, 80, 90, 1)
  
  percent_inf_w_5_days <- c(0, 1)
  
  perc_reduc_mortality <- reactive(percent_inf_w_5_days*input$reduc_death_pax * input$prop_pax_uptake)
  
  perc_reduc_mortality_user <- reactive(input$prop_tested.5.days*input$reduc_death_pax * input$prop_pax_uptake)
  
  output$plot1 <- renderPlot({
    
    test = c(78,	55,	85,	55,	85,	78,	78,	78,	78,	78, input$prop_tested.5.days*100)
    mort = c(3.22,	0.61,	7.48,	0.61,	6.89,	8.11,	0.00,	3.50,	25.27,	50.54, 100*perc_reduc_mortality_user())
    models = c("Model 1", "Model 2", "Model 3", "Model 4", "Model 5", "Model 6", "Model 7", "Model 8", "Model 9", "Model 10", "User Model")
    models1 = c("", "", "", "", "", "", "", "", "", "", "")
    models2 = c("Models 1,8", "Models 2,4", "", "", "", "Model 6", "Model 7", "", "", "Model 10", "")
    models3 = c("", "", "Model 3", "", "", "", "", "", "Model 9", "", "")
    models4 = c("", "", "", "", "Model 5", "", "", "", "", "", "User Model")
    
    plot(mort ~ test, bty="n", col = c(rep("black",10), "red"), ylab="Percent reduction in mortality (%)", 
         xlab="Percent infections detected within 5 days of symptoms (%)", 
         main="Reduction in mortality via Paxlovid rollout",xlim=c(3,100),ylim=c(0,60))
    
    axis(1, at = seq(0,100,10))
    abline(lm(perc_reduc_mortality() ~ percent_inf_w_5_days), col="blue",lwd = 0.4)
    
    text(test, mort, models1,pos=1, offset = 1, cex=0.8)
    text(test, mort, models2,pos=2,cex=0.8)
    text(test, mort, models3,pos=3,cex=0.8)
    text(test, mort, models4,pos=4,cex=0.8)
    
    #plot(percent_inf_w_5_days, perc_reduc_mortality(), col = "blue", main = "Reduction in Mortality via Paxlovid Rollout", 
     #    xlab = "Percent Infections Detected within 5 days of Symptoms", ylab = "Percent Reduction in Mortality", type = "l")
  })
  
  perc_reduc_hosp <- reactive(percent_inf_w_5_days*input$reduc_hosp_pax * input$prop_pax_uptake)
  perc_reduc_hosp_user <- reactive(input$prop_tested.5.days*input$reduc_hosp_pax * input$prop_pax_uptake)
  
  output$plot2 <- renderPlot({
    
    test = c(78,	55,	85,	55,	85,	78,	78,	78,	78,	78, input$prop_tested.5.days*100)
    hosp = c(2.66,	0.50,	7.48,	0.5,	5.70,	6.71,	2.78,	3.50,	20.90,	41.81, 100*perc_reduc_hosp_user())
    models = c("Model 1", "Model 2", "Model 3", "Model 4", "Model 5", "Model 6", "Model 7", "Model 8", "Model 9", "Model 10", "User Model")
    models2 = c("Models 1,7", "Models 2,4", "", "", "", "Model 6", "", "", "", "Model 10", "")
    models3 = c("", "", "", "", "", "", "", "Model 8", "Model 9", "", "")
    models4 = c("", "", "Model 3", "", "Model 5", "", "", "", "", "", "User Model")
    
    plot(hosp ~ test, bty="n", col = c(rep("black",10), "red"), ylab="Percent reduction in hospitalizations (%)", 
         xlab="Percent infections detected within 5 days of symptoms (%)", 
         main="Reduction in hospitalization via Paxlovid rollout",xlim=c(3,100),ylim=c(0,60))
    
    axis(1, at = seq(0,100,10))
    abline(lm(perc_reduc_hosp() ~ percent_inf_w_5_days), col="green",lwd = 1)
    text(test, hosp, models2,pos=2,cex=0.8)
    text(test, hosp, models3,pos=3,cex=0.8)
    text(test, hosp, models4,pos=4,cex=0.8)
    
    #plot(percent_inf_w_5_days, perc_reduc_hosp(), col = "black", main = "Reduction in Hospitalization via Paxlovid Rollout", 
         #xlab = "Percent Infections Detected within 5 days of Symptoms", ylab = "Percent Reduction in Hospitalization", type = "l")
  })
  
  
  
}