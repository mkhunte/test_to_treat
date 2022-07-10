data <- read.csv("COVID-19_Case_Surveillance_Public_Use_Data.csv")

data$onset_dt <- as.Date(data$onset_dt)
data$pos_spec_dt <- as.Date(data$pos_spec_dt)

data$symptom_to_test <- data$pos_spec_dt - data$onset_dt
mean(data[data$symptom_to_test >= 0, ]$symptom_to_test <= 5)

